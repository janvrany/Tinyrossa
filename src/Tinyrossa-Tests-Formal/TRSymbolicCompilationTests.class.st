Class {
	#name : #TRSymbolicCompilationTests,
	#superclass : #TRCompilationTestCase,
	#category : #'Tinyrossa-Tests-Formal'
}

{ #category : #asserting }
TRSymbolicCompilationTests >> assertSafe: prog [
	[
		| safe |
		safe := prog solve.
		self assert: safe isSafe
	] runReader: #bvLengthInference initialState: BvLengthInference new

]

{ #category : #asserting }
TRSymbolicCompilationTests >> assertUnsafe: prog [
	[
		| unsafe |
		unsafe := prog solve.
		self deny: unsafe isSafe.
		unsafe bads do:[ :bad | self assert: (bad value value isKindOf: Z3Model) ]
	] runReader: #bvLengthInference initialState: BvLengthInference new
]

{ #category : #running }
TRSymbolicCompilationTests >> setUp [
	self setUpForTarget: self target
]

{ #category : #running }
TRSymbolicCompilationTests >> setUpForTarget: aTRCompilationTarget [
	compilation := TRCompilation forTarget: aTRCompilationTarget.
]

{ #category : #accessing }
TRSymbolicCompilationTests >> target [
	^ TRSymbolic default
]

{ #category : #'tests - examples' }
TRSymbolicCompilationTests >> test_abs_01 [
	| bldr spec code verf prog |

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
				let zer = toBitVector(0);
				bvge(got, zer)
	    };
	'.

	prog := spec , code, verf.

	self assertUnsafe: prog. "See comment L8PosTest >> test_ans_03"


]

{ #category : #'tests - examples' }
TRSymbolicCompilationTests >> test_add2_01 [
	| bldr spec code verf prog |

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

	self assertSafe: prog.




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
	| bldr spec code verf prog |

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

	self assertSafe: prog.


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
TRSymbolicCompilationTests >> test_id_01 [
	| bldr spec code verf prog |

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

	self assertSafe: prog.


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
	| bldr spec code verf prog |

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

	prog := spec, code, verf.
	
	self assertSafe: prog.

]

{ #category : #'tests - examples' }
TRSymbolicCompilationTests >> test_id_03 [
	| bldr spec code verf prog |

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

	self assertSafe: prog.


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
	| bldr spec code verf prog |

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

	self assertSafe: prog.


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
	| bldr spec code verf prog |

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

	self assertSafe: prog.
]

{ #category : #'tests - examples' }
TRSymbolicCompilationTests >> test_mul4_01 [
	| comp bldr spec code verf prog |

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

	self assertSafe: prog.



]

{ #category : #'tests - examples' }
TRSymbolicCompilationTests >> test_shl2_01 [
	| bldr spec code verf prog |

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

	self assertSafe: prog.
]

{ #category : #'tests - examples' }
TRSymbolicCompilationTests >> test_sum_01 [
	| bldr spec code verf prog |

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

	self assertSafe: prog.
]
