Class {
	#name : #TRSymbolicCompilationTests,
	#superclass : #TRCompilationTestCase,
	#category : #'Tinyrossa-Tests-Formal'
}

{ #category : #running }
TRSymbolicCompilationTests >> setUp [
	self setUpForTarget: TRSymbolic default
]

{ #category : #running }
TRSymbolicCompilationTests >> setUpForTarget: aTRCompilationTarget [
	compilation := TRCompilation forTarget: aTRCompilationTarget.
]

{ #category : #'tests - examples' }
TRSymbolicCompilationTests >> test_abs_01 [
	| bldr spec code verf prog safe |


	bldr := compilation builder.
	bldr defineName: 'abs' type: Int32.
	bldr defineParameter: 'x' type: Int32.
	bldr if: (bldr icmplt: { bldr iload:'x' . bldr iconst: 0 } )
		then: [:then |
			then ireturn: {
				then isub: {
					then iconst: 0.
					then iload: 'x' }}
		] else:[:else|
			else ireturn: {
				else iload: 'x' }
		].

	compilation optimize.
	compilation compile.

	spec := TRILSpecification new prog.
	code := compilation codegen prog.
	verf := TRILSpecificationParser parse:'
	/*@ val verify : Int32 => bool[b|b] */
	    let verify = (x) => {
				let got = abs(x);
				bvge32(got, bv32(0))
	    };
	'.

	prog := spec , code, verf.

	safe := prog solve.
	self assert: safe isSafe not. "See comment L8PosTest >> test_ans_03"

	self yourself.
]

{ #category : #'tests - examples' }
TRSymbolicCompilationTests >> test_add2_01 [
	| bldr spec code verf prog safe |

	bldr := compilation builder.
	bldr defineName: 'add2' type: Int32.
	bldr defineParameter: 'x' type: Int32.
	bldr ireturn:
		{ bldr iadd:
			{ bldr iload: 'x' .
			  bldr iconst: 2 } }.

	compilation optimize.
	compilation compile.

	spec := TRILSpecification new prog.
	code := compilation codegen prog.
	verf := TRILSpecificationParser parse:'
	/*@ val verify : Int32 => bool[b|b] */
	    let verify = (x) => {
				let exp = bvadd32(x,bv32(2));
				let got = add2(x);
				got == exp
	    };
	'.

	prog := spec , code, verf.

	safe := prog solve.
	self assert: safe isSafe.

	self yourself.


	"
	verf := ΛκParser parse:'
	/*@ val verify : bv32 => bool[b|b] */
	    let verify = (x) => {
				let exp = bvadd32(x, bv32(2));
				let got = add2(x);
				got == exp
	    };
	'.

	"
]

{ #category : #'tests - examples' }
TRSymbolicCompilationTests >> test_add2_02 [
	| bldr spec code verf prog safeness |

	bldr := compilation builder.
	bldr defineName: 'add2' type: Int32.
	bldr defineParameter: 'x' type: Int32.
	bldr defineAutomatic: 't' type: Int32.
	bldr istore: {
		bldr imul:
			{ bldr iload: 'x' .
			  bldr iconst: 2 }.
		"=>" 't'}.

	bldr ireturn:
		{ bldr isub:
			{ bldr iload: 't' .
			  bldr isub: {
					bldr iload: 'x'.
					bldr iconst: 2 } } }.

	compilation optimize.
	compilation compile.

	spec := TRILSpecification new prog.
	code := compilation codegen prog.
	verf := TRILSpecificationParser parse:'
	/*@ val verify : Int32 => bool[b|b] */
	    let verify = (x) => {
				let exp = bvadd32(x,bv32(2));
				let got = add2(x);
				got == exp
	    };
	'.

	prog := spec , code, verf.

	safeness := prog solve.
	self assert: safeness isSafe.

	self yourself.


	"
	verf := ΛκParser parse:'
	/*@ val verify : bv32 => bool[b|b] */
	    let verify = (x) => {
				let exp = bvadd32(x, bv32(2));
				let got = add2(x);
				got == exp
	    };
	'.

	"
]

{ #category : #'tests - examples' }
TRSymbolicCompilationTests >> test_gauss_i_01 [
	| builder
	  bytecodeBuilders
	  bytecodeBuilder
	  temps
	  "bytecode evaluators"
	  pushTemp
	  popIntoTemp
	  pushConstant
	  send
	  jumpFalse
	  jumpTo
	  returnTop

	  sourceMap
	  currentPC
	|

	"
	Source:

	gauss_i: x
		| i r |
		i := x.
		r := 1.
		[ i > 0 ] whileTrue: [
			r := r + i.
			i := i - 1.
		].
		^ r

	Bytecode (Squeak):
		33: pushTemp: 0
		34: popIntoTemp: 1
		35: pushConstant: 1
		36: popIntoTemp: 2
		37: pushTemp: 1
		38: pushConstant: 0
		39: send: >
		40: jumpFalse: 52
		42: pushTemp: 2
		43: pushTemp: 1
		44: send +
		45: popIntoTemp: 2.
		46: pushTemp: 1
		47: pushConstant: 1
		48: send: -
		49: popIntoTemp: 1
		50: jumpTo: 37
		52: pushTemp: 2
		53: returnTop

	Used bytecodes:
		pushTemp:
		popIntoTemp:
		pushConstant:
		send: #>, #*, #-
		jumpFalse:
		jumpTo:
		returnTop
	"


	pushTemp :=     [ :builder :index | builder push: (builder iload: (temps at: index + 1)) ].
	popIntoTemp :=  [ :builder :index | builder istore: { builder pop . (temps at: index + 1) } ].
	pushConstant:=  [ :builder :const | builder push: (builder iconst: const) ].
	send :=         [ :builder :sym   | | arg1 recv |
						arg1 := builder pop.
						recv := builder pop.
						sym == #> ifTrue: [ builder push: (builder icmpgt: { recv . arg1 }) ].
						sym == #+ ifTrue: [ builder push: (builder iadd: { recv . arg1 }) ].
						sym == #- ifTrue: [ builder push: (builder isub: { recv . arg1 }) ].
					].
	jumpFalse :=    [ :builder :target | builder if: (builder icmpeq: { builder pop . builder iconst: 0 }) then:[ :builder | builder goto: (bytecodeBuilders at: target - 32) ] ].
	jumpTo :=       [ :builder :target | builder goto: (bytecodeBuilders at: target - 32) ].
	returnTop :=    [ :builder         | builder ireturn: { builder pop }].


	builder := TRILBytecodeFunctionBuilder forCompilation: compilation.
	builder defineName: 'factorial_r' type: Int32.
	builder defineParameter: 'x' type: Int32.
	builder defineAutomatic: 'i' type: Int32.
	builder defineAutomatic: 'r' type: Int32.
	builder defineState: TRVMOperandStack new.

	temps := #('x' 'i' 'r').
	bytecodeBuilders := (33 to: 53) collect: [ :i | builder orphan ].

	"Pass control to first bytecode!"
	builder fallThroughTo: (bytecodeBuilders at: 1).

	bytecodeBuilder := bytecodeBuilders at: 1.
	bytecodeBuilder bci: 33. pushTemp     value: bytecodeBuilder value: 0.
	bytecodeBuilder fallThroughTo: (bytecodeBuilders at: 1+1).

	bytecodeBuilder := bytecodeBuilders at: 2.
	bytecodeBuilder bci: 34. popIntoTemp  value: bytecodeBuilder value: 1.
	bytecodeBuilder fallThroughTo: (bytecodeBuilders at: 2+1).

	bytecodeBuilder := bytecodeBuilders at: 3.
	bytecodeBuilder bci: 35. pushConstant value: bytecodeBuilder value: 1.
	bytecodeBuilder fallThroughTo: (bytecodeBuilders at: 3+1).

	bytecodeBuilder := bytecodeBuilders at: 4.
	bytecodeBuilder bci: 36. popIntoTemp  value: bytecodeBuilder value: 2.
	bytecodeBuilder fallThroughTo: (bytecodeBuilders at: 4+1).

	bytecodeBuilder := bytecodeBuilders at: 5.
	bytecodeBuilder bci: 37. pushTemp     value: bytecodeBuilder value: 1.
	bytecodeBuilder fallThroughTo: (bytecodeBuilders at: 5+1).

	bytecodeBuilder := bytecodeBuilders at: 6.
	bytecodeBuilder bci: 38. pushConstant value: bytecodeBuilder value: 0.
	bytecodeBuilder fallThroughTo: (bytecodeBuilders at: 6+1).

	bytecodeBuilder := bytecodeBuilders at: 7.
	bytecodeBuilder bci: 39. send         value: bytecodeBuilder value: #>.
	bytecodeBuilder fallThroughTo: (bytecodeBuilders at: 7+1).

	bytecodeBuilder := bytecodeBuilders at: 8.
	bytecodeBuilder bci: 40. jumpFalse    value: bytecodeBuilder value: 52.
	bytecodeBuilder fallThroughTo: (bytecodeBuilders at: 8+1+1).

	bytecodeBuilder := bytecodeBuilders at: 10.
	bytecodeBuilder bci: 42. pushTemp     value: bytecodeBuilder value: 2.
	bytecodeBuilder fallThroughTo: (bytecodeBuilders at: 10+1).

	bytecodeBuilder := bytecodeBuilders at: 11.
	bytecodeBuilder bci: 43. pushTemp     value: bytecodeBuilder value: 1.
	bytecodeBuilder fallThroughTo: (bytecodeBuilders at: 11+1).

	bytecodeBuilder := bytecodeBuilders at: 12.
	bytecodeBuilder bci: 44. send         value: bytecodeBuilder value: #+.
	bytecodeBuilder fallThroughTo: (bytecodeBuilders at: 12+1).

	bytecodeBuilder := bytecodeBuilders at: 13.
	bytecodeBuilder bci: 45. popIntoTemp  value: bytecodeBuilder value: 2.
	bytecodeBuilder fallThroughTo: (bytecodeBuilders at: 13+1).

	bytecodeBuilder := bytecodeBuilders at: 14.
	bytecodeBuilder bci: 46. pushTemp     value: bytecodeBuilder value: 1.
	bytecodeBuilder fallThroughTo: (bytecodeBuilders at: 14+1).

	bytecodeBuilder := bytecodeBuilders at: 15.
	bytecodeBuilder bci: 47. pushConstant value: bytecodeBuilder value: 1.
	bytecodeBuilder fallThroughTo: (bytecodeBuilders at: 15+1).

	bytecodeBuilder := bytecodeBuilders at: 16.
	bytecodeBuilder bci: 48. send         value: bytecodeBuilder value: #-.
	bytecodeBuilder fallThroughTo: (bytecodeBuilders at: 16+1).

	bytecodeBuilder := bytecodeBuilders at: 17.
	bytecodeBuilder bci: 49. popIntoTemp  value: bytecodeBuilder value: 1.
	bytecodeBuilder fallThroughTo: (bytecodeBuilders at: 17+1).

	bytecodeBuilder := bytecodeBuilders at: 18.
	bytecodeBuilder bci: 50. jumpTo       value: bytecodeBuilder value: 37.
	"Since the 'jumpTo' is unconditional goto, there's no fall-through builder!"

	bytecodeBuilder := bytecodeBuilders at: 20.
	bytecodeBuilder bci: 52. pushTemp     value: bytecodeBuilder value: 2.
	bytecodeBuilder fallThroughTo: (bytecodeBuilders at: 20+1).

	bytecodeBuilder := bytecodeBuilders at: 21.
	bytecodeBuilder bci: 53. returnTop    value: bytecodeBuilder.
	"Since the above bytecode is last bytecode, there's no fall-through!"


	compilation optimize.
	compilation compile.


	self halt.


]

{ #category : #'tests - examples' }
TRSymbolicCompilationTests >> test_id_01 [
	| bldr spec code verf prog safe |

	bldr := compilation builder.
	bldr defineName: 'id' type: Int32.
	bldr defineParameter: 'x' type: Int32.
	bldr ireturn: { bldr iload: 'x' }.

	compilation optimize.
	compilation compile.

	spec := TRILSpecification new prog.
	code := compilation codegen prog.
	verf := TRILSpecificationParser parse:'
	/*@ val verify : Int32 => bool[b|b] */
	    let verify = (x) => {
				let exp = x;
				let got = id(x);
				got == exp
	    };
	'.

	prog := spec , code, verf.

	safe := prog solve.
	self assert: safe isSafe.

	self yourself.


	"
	verf := ΛκParser parse:'
	/*@ val verify : bv32 => bool[b|b] */
	    let verify = (x) => {
				let exp = bvadd32(x, bv32(2));
				let got = add2(x);
				got == exp
	    };
	'.

	"
]

{ #category : #'tests - examples' }
TRSymbolicCompilationTests >> test_id_02 [
	| bldr spec code verf prog safe |

	bldr := compilation builder.
	bldr defineName: 'id' type: Int32.
	bldr defineParameter: 'x' type: Int32.
	bldr ireturn: { bldr iconst: 42 }.

	compilation optimize.
	compilation compile.

	spec := TRILSpecification new prog.
	code := compilation codegen prog.
	verf := TRILSpecificationParser parse:'
	/*@ val verify : Int32 => bool[b|b] */
	    let verify = (x) => {
				let exp = x;
				let got = id(x);
				got == exp
	    };
	'.

	prog := spec , code, verf.

	safe := prog solve.
	self assert: safe isSafe not.

	self yourself.

]

{ #category : #'tests - examples' }
TRSymbolicCompilationTests >> test_id_03 [
	| bldr spec code verf prog safeness |

	bldr := compilation builder.
	bldr defineName: 'id' type: Int32.
	bldr defineParameter: 'x' type: Int32.
	bldr defineAutomatic: 't' type: Int32.
	bldr istore: {
		bldr imul:
			{ bldr iload: 'x' .
			  bldr iconst: 2 }.
		"=>" 't'}.

	bldr ireturn:
		{ bldr isub:
			{ bldr iload: 't' .
			  bldr iload: 'x' } }.

	compilation optimize.
	compilation compile.

	spec := TRILSpecification new prog.
	code := compilation codegen prog.
	verf := TRILSpecificationParser parse:'
	/*@ val verify : Int32 => bool[b|b] */
	    let verify = (x) => {
				let exp = x;
				let got = id(x);
				got == exp
	    };
	'.

	prog := spec , code, verf.

	safeness := prog solve.
	self assert: safeness isSafe.

	self yourself.


	"
	verf := ΛκParser parse:'
	/*@ val verify : bv32 => bool[b|b] */
	    let verify = (x) => {
				let exp = bvadd32(x, bv32(2));
				let got = add2(x);
				got == exp
	    };
	'.

	"
]

{ #category : #'tests - examples' }
TRSymbolicCompilationTests >> test_mul2_01 [
	| bldr spec code verf prog safe |

	compilation config optimizationPasses: { }.

	bldr := compilation builder.
	bldr defineName: 'mul2' type: Int32.
	bldr defineParameter: 'x' type: Int32.
	bldr ireturn:
		{ bldr imul:
			{ bldr iload: 'x' .
			  bldr iconst: 2 } }.

	compilation optimize.
	compilation compile.

	spec := TRILSpecification new prog.
	code := compilation codegen prog.
	verf := TRILSpecificationParser parse:'
	/*@ val verify : bool[b|b] */
	    let verify = {
				let exp = bvmul32(bv32(10),bv32(2));
				let got = mul2(bv32(10));
				got == exp
	    };
	'.

	prog := spec , code, verf.

	safe := prog solve.
	self assert: safe isSafe.

	self yourself.


	"
	verf := ΛκParser parse:'
	/*@ val verify : bv32 => bool[b|b] */
	    let verify = (x) => {
				let exp = bvadd32(x, bv32(2));
				let got = add2(x);
				got == exp
	    };
	'.

	"
]

{ #category : #'tests - examples' }
TRSymbolicCompilationTests >> test_mul2_02 [
	| bldr spec code verf prog safe |

	compilation config optimizationPasses: { TRILXmul2Xshl }.

	bldr := compilation builder.
	bldr defineName: 'mul2' type: Int32.
	bldr defineParameter: 'x' type: Int32.
	bldr ireturn:
		{ bldr imul:
			{ bldr iload: 'x' .
			  bldr iconst: 2 } }.

	compilation optimize.
	compilation compile.

	spec := TRILSpecification new prog.
	code := compilation codegen prog.
	verf := TRILSpecificationParser parse:'
	/*@ val verify : bool[b|b] */
	    let verify = {
				let exp = bvmul32(bv32(10),bv32(2));
				let got = mul2(bv32(10));
				got == exp
	    };
	'.

	prog := spec , code, verf.

	safe := prog solve.
	self assert: safe isSafe.

	self yourself.
]

{ #category : #'tests - examples' }
TRSymbolicCompilationTests >> test_mul4_01 [
	| comp bldr spec code verf prog safe |

	comp := TRCompilation forTarget: TRSymbolic default.
	comp config optimizationPasses: { TRILXmul2Xshl }.

	bldr := comp builder.
	bldr defineName: 'mul4' type: Int32.
	bldr defineParameter: 'x' type: Int32.
	bldr ireturn:
		{ bldr imul:
			{ bldr iload: 'x' .
			  bldr iconst: 4 } }.

	comp optimize.
	comp compile.
	code := comp codegen prog.

	"== verify ================="

	spec := TRILSpecification new prog.

	verf := TRILSpecificationParser parse:'
	/*@ val verify : Int32 => bool[b|b] */
	    let verify = (x) => {
				let orig = bvmul32(x, bv32(4));
				let opt = mul4(x);
				orig == opt
	    };
	'.

	prog := spec , "code1," code , verf.

	safe := prog solve.
	self assert: safe isSafe.



]

{ #category : #'tests - examples' }
TRSymbolicCompilationTests >> test_shl2_01 [
	| bldr spec code verf prog safe |

	bldr := compilation builder.
	bldr defineName: 'shl2' type: Int32.
	bldr defineParameter: 'x' type: Int32.
	bldr ireturn:
		{ bldr ishl:
			{ bldr iload: 'x' .
			  bldr iconst: 2 } }.

	compilation optimize.
	compilation compile.

	spec := TRILSpecification new prog.
	code := compilation codegen prog.
	verf := TRILSpecificationParser parse:'
	/*@ val verify : Int32 => bool[b|b] */
	    let verify = (x) => {
				let exp = bvshl32(x,bv32(2));
				let got = shl2(x);
				got == exp
	    };
	'.

	prog := spec , code, verf.

	safe := prog solve.
	self assert: safe isSafe.

	self yourself.
]

{ #category : #'tests - examples' }
TRSymbolicCompilationTests >> test_sum_01 [
	| bldr spec code verf prog safe |

	bldr := compilation builder.
	bldr defineName: 'sum' type: Int32.
	bldr defineParameter: 'x' type: Int32.
	bldr 
		"if x == 0:"
		if: (bldr icmple: { bldr iload: 'x' . bldr iconst: 0  })
		then: [ :then |
			"return 1"
			then ireturn: 
				{ then iconst: 0 }
		] else: [ :else |
			"return x + sum(x - 1)"
			else ireturn: 
				{ else iadd: 
					{ else iload: 'x' .
					  else icall: 
						{ else isub: 
							{ else iload: 'x' .
							  else iconst: 1 } .
						'sum' } } }
		].

	compilation optimize.
	compilation compile.
	
	self skip: 'Unfinished'.

	spec := TRILSpecification new prog.
	code := compilation codegen prog.
	verf := TRILSpecificationParser parse:'
	/*@ val verify : Int32 => bool[b|b] */
	    let verify = (x) => {
				let exp = bvshl32(x,bv32(2));
				let got = sum(x);
				got == exp
	    };
	'.

	self halt.

	prog := spec , code, verf.

	safe := prog solve.
	self assert: safe isSafe.

	self yourself.
]
