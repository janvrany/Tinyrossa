Class {
	#name : #TRCompilationTestCase,
	#superclass : #TestCaseParametrized,
	#instVars : [
		'compilation',
		'shell'
	],
	#pools : [
		'TRDataTypes'
	],
	#category : #'Tinyrossa-Tests'
}

{ #category : #accessing }
TRCompilationTestCase class >> compiler [
	Smalltalk isPharo ifTrue:[
		^super compiler options: #(+ optionSkipSemanticWarnings)
	].
	^super compiler
]

{ #category : #testing }
TRCompilationTestCase class >> isAbstract [
	^ self == TRCompilationTestCase
]

{ #category : #'accessing - parameters' }
TRCompilationTestCase >> int32Values [
	^ { -16r80000000 .
		-16r7FEDCBA9 .
			-16rCBA9 .
			  -16rA9 .
				  -1 .
				   0 .
			   16rA9 .
			 16rCBA9 .
		 16r7FEDCBA9 .
		 16r7FFFFFFF }
]

{ #category : #'accessing - parameters' }
TRCompilationTestCase >> int64Values [
	^ { -16r8000000000000000 .
		-16r7AFEAFFECAFEAFFE .
				-16r7FEDCBA9 .
					-16rCBA9 .
					  -16rA9 .
						  -1 .
						   0 .
					   16rA9 .
					 16rCBA9 .
				 16r7FEDCBA9 .
		 16r7AFEAFFECAFEAFFE .
		 16r7FFFFFFFFFFFFFFF }
]

{ #category : #accessing }
TRCompilationTestCase >> parametersIterator [
	^ super parametersIterator ,
		(self parameter: #target values: { self target }),
		(self parameter: #stressRA values: { true . false })
]

{ #category : #running }
TRCompilationTestCase >> setUp [
	| target |

	target := testParameters at:#target.

	compilation := TRCompilation forTarget: target.
	compilation config stressRA: (testParameters at: #stressRA).

	shell := TRCompilationTestShell forTarget: target.
]

{ #category : #accessing }
TRCompilationTestCase >> target [
	^ self subclassResponsibility
]

{ #category : #running }
TRCompilationTestCase >> tearDown [
	super tearDown.
	shell notNil ifTrue: [ 
		shell tearDown.
		shell := nil.
	].
]

{ #category : #tests }
TRCompilationTestCase >> test01_bytecode_abs [
	| builder
	  bytecodeBuilders
	  bytecodeBuilder
	  temps
	  "bytecode evaluators"
	  pushTemp
	  pushConstant
	  send
	  jumpFalse
	  jumpTo
	  returnTop
	|

	"
	Source:

	abs:x
		^ x * (x < 0 ifTrue: [ -1 ] ifFalse: [ 1 ])

	Bytecode (Squeak):
		33: pushTemp: 0
		34: pushTemp: 0
		35: pushConstant: 0
		36: send >
		37: jumpFalse: 40
		38: pushConstant: 1
		39: jumpTo: 41
		40: pushConstant: -1
		41: send: *
		42: returnTop

	Used bytecodes:
		pushTemp:
		pushConstant:
		send: #>, #*
		jumpFalse:
		jumpTo:
		returnTop
	"


	pushTemp :=     [ :builder :index | builder push: (builder iload: (temps at: index + 1)) ].
	pushConstant:=  [ :builder :const | builder push: (builder iconst: const) ].
	send :=         [ :builder :sym   | 
						| arg1 recv |

						arg1 := builder pop.
						recv := builder pop.
						sym == #> ifTrue: [ builder push: (builder icmpgt: { recv . arg1 }) ].
						sym == #* ifTrue: [ builder push: (builder imul: { recv . arg1 }) ].
					].
	jumpFalse :=    [ :builder  :target | builder if: (builder icmpeq: { builder pop . builder iconst: 0 }) then:[ :builder | builder goto: (bytecodeBuilders at: target - 32) ] ].
	jumpTo :=       [ :builder  :target | builder goto: (bytecodeBuilders at: target - 32) ].
	returnTop :=    [ :builder          | builder ireturn: { builder pop }].


	builder := TRILBytecodeFunctionBuilder forCompilation: compilation.
	builder defineName: 'abs' type: Int32.
	builder defineParameter: 'x' type: Int32.
	builder defineState: TRVMOperandStack new.

	temps := #('x').

	bytecodeBuilders := (33 to: 42) collect: [ :i | builder orphan ].

	"Pass control to first bytecode!"
	builder fallThroughTo: (bytecodeBuilders at: 1).  

	bytecodeBuilder := bytecodeBuilders at: 1.
	bytecodeBuilder bci: 33. pushTemp     value: bytecodeBuilder value: 0.
	bytecodeBuilder fallThroughTo: (bytecodeBuilders at: 1+1).  

	bytecodeBuilder := bytecodeBuilders at: 2.
	bytecodeBuilder bci: 34. pushTemp     value: bytecodeBuilder value: 0.
	bytecodeBuilder fallThroughTo: (bytecodeBuilders at: 2+1).

	bytecodeBuilder := bytecodeBuilders at: 3.
	bytecodeBuilder bci: 35. pushConstant value: bytecodeBuilder value: 0.
	bytecodeBuilder fallThroughTo: (bytecodeBuilders at: 3+1).

	bytecodeBuilder := bytecodeBuilders at: 4.
	bytecodeBuilder bci: 36. send         value: bytecodeBuilder value: #>.
	bytecodeBuilder fallThroughTo: (bytecodeBuilders at: 4+1).

	bytecodeBuilder := bytecodeBuilders at: 5.
	bytecodeBuilder bci: 37. jumpFalse    value: bytecodeBuilder value: 40.
	bytecodeBuilder fallThroughTo: (bytecodeBuilders at: 5+1).

	bytecodeBuilder := bytecodeBuilders at: 6.
	bytecodeBuilder bci: 38. pushConstant value: bytecodeBuilder value: 1.
	bytecodeBuilder fallThroughTo: (bytecodeBuilders at: 6+1).

	bytecodeBuilder := bytecodeBuilders at: 7.
	bytecodeBuilder bci: 39. jumpTo       value: bytecodeBuilder value: 41.
	"Since the above is unconditional goto, there's no fall-through builder!"

	bytecodeBuilder := bytecodeBuilders at: 8.
	bytecodeBuilder bci: 40. pushConstant value: bytecodeBuilder value: -1.
	bytecodeBuilder fallThroughTo: (bytecodeBuilders at: 8+1).

	bytecodeBuilder := bytecodeBuilders at: 9.
	bytecodeBuilder bci: 41. send         value: bytecodeBuilder value: #*.
	bytecodeBuilder fallThroughTo: (bytecodeBuilders at: 9+1).

	bytecodeBuilder := bytecodeBuilders at: 10.
	bytecodeBuilder bci: 42. returnTop    value: bytecodeBuilder.
	"Since the above is last bytecode, there's no fall-through builder!"

	compilation optimize.

	compilation compile.

	self assert: (shell inject: compilation andInvokeWith: { 2 }) equals: 2 abs.
]

{ #category : #tests }
TRCompilationTestCase >> test02_iconst [
	<parameter: #x values: #int32Values>

	| x builder |

	x := testParameters at: #x.
	builder := compilation builder.
	builder defineName: testSelector type: Int32.
	builder ireturn: {
				builder iconst: x
			}.
	compilation optimize.
	compilation compile.

	self assert: (shell inject: compilation andInvokeWith: #()) equals: x.

	"
	 TRRV64GCompilationTests debug: #test02_iconst_p
	 TRPPC64CompilationTests debug: #test02_iconst_p"
]

{ #category : #tests }
TRCompilationTestCase >> test03_lconst [
	<parameter: #x values: #int64Values>

	| x builder |

	self target name = 'powerpc64le-linux' ifTrue: [
		self skip: 'Skipped since #loadConstant64:into: is not implemented for POWER (see issue #43)'.
	].

	x := testParameters at: #x.
	builder := compilation builder.
	builder defineName: testSelector type: Int64.
	builder lreturn: 
		{ builder lconst: x }.

	compilation optimize.
	compilation compile.

	self assert: (shell inject: compilation andInvokeWith: #()) equals: x.

	"
	TRRV64GCompilationTests debug: #test03_lconst_n 
	TRPPC64CompilationTests debug: #test03_lconst_n 
	"
]

{ #category : #tests }
TRCompilationTestCase >> test04_call_resolved [
	| comp1 bldr1 comp2 bldr2 |

	self target name = 'powerpc64le-linux' ifTrue: [
		self skip: 'Skipped since calls are not implemented for POWER (see issue #45)'.
	].

	" ### CALLEE ### "
	comp1 := TRCompilation forConfig: compilation config.
	bldr1 := comp1 builder.
	bldr1 defineName: 'callee' type: Int32.
	bldr1 defineParameter: 'x' type: Int32.
	bldr1 ireturn:
		{ bldr1 iadd:
			{ bldr1 iload: 'x'.
			  bldr1 iconst: 1 } }.
	comp1 optimize.
	comp1 compile.

	" ### CALLER ### "
	comp2 := TRCompilation forConfig: compilation config.
	bldr2 := comp2 builder.
	bldr2 defineName: 'caller' type: Int32.
	bldr2 defineParameter: 'x' type: Int32.
	bldr2 defineFunction: 'callee' type: Int32.
	bldr2 ireturn:
		{ bldr2 iadd:
			{ bldr2 iload: 'x'.
			  bldr2 icall: { bldr2 iload: 'x' . 'callee' } } }.
	comp2 optimize.
	comp2 compile.

	" ### ######### ### "

	shell inject: comp1.
	shell inject: comp2.

	self assert: (shell invoke: comp2 functionSymbol with: { 10 } types: { Int32 })
		 equals: 21

	"
	TRRV64GCompilationTests debug: #test03_lconst_n
	TRPPC64CompilationTests debug: #test03_lconst_n
	"
]

{ #category : #tests }
TRCompilationTestCase >> test05_increment_static_symbol_b [
	"
	This is pretty much same as #test_example18_increment_static_symbol
	but we add counter symbol after the function itself.

	Moreover it inserts static symbol into different sections
	to test access via GOT.

	This, together with test_example18_increment_static_symbol tests
	that it does not matter in what order we link objects / define symbols
	and that they can be located anywhere in address space.
	"

	<parameter: #section values: #(nzone heap1 heap2)>

	| ctr asm |

	self target name = 'powerpc64le-linux' ifTrue: [
		self skip: 'Skipped since Xload/Xstore evaluator does not support statics for POWER (see issue #52)'.
	].

	"Compile function"
	TRCompilationExamples new
		compilation: compilation;
		example18_increment_static_symbol.

	shell inject: compilation.

	"Create static variable `counter`"
	ctr := TRStaticSymbol name: 'counter' type: Int32.
	asm := AcDSLRV64GAssembler new.
	asm globl: ctr.
	asm label: ctr.
	asm int32: 42.
	(shell perform: (testParameters at: #section)) add: asm object.

	"Invoke function and test"
	self assert: (shell invoke: compilation functionSymbol with: { } types: { })equals: 43.
]

{ #category : #tests }
TRCompilationTestCase >> test06_iadd_discarding_value [
	| x builder |

	<parameter: #x values: #(0 10)>

	x := testParameters at: #x.

	builder := compilation builder.
	builder defineName: testSelector asString type: Int32.
	builder defineParameter: 'x' type: Int32.
	builder treetop: {
		builder iadd: {
			builder iload: 'x'.
			builder iconst: 1 } }.
	builder ireturn:
		{ builder iconst: -1 }.

	compilation optimize.
	compilation compile.

	self assert: (shell inject: compilation andInvokeWith: { x }) equals: -1.

	"
	TRRV64GCompilationTests debug: #test06_iadd_discarding_value
	TRPPC64CompilationTests debug: #test06_iadd_discarding_value
	"
]

{ #category : #tests }
TRCompilationTestCase >> test07_call_discarding_value [
	| x builder |

	<parameter: #x values: #(0 10)>

	self target name = 'powerpc64le-linux' ifTrue: [
		self skip: 'Skipped since Xload/Xstore evaluator does not support statics for POWER (see issue #52)'.
	].

	x := testParameters at: #x.

	builder := compilation builder.
	builder defineName: testSelector asString type: Int32.
	builder defineParameter: 'x' type: Int32.
	builder
		if: (builder icmpeq:
			 {  builder iload: 'x' .
				builder iconst: 0  })
		then:[ :builder |
				builder ireturn:
					{ builder iconst: -1 } ]
		else:[ :builder |
				builder icall: {
					builder isub:
						{ builder iload: 'x' .
						  builder iconst: 1 } .
					testSelector }.
				builder ireturn:
						{ builder iload: 'x' } ].

	compilation optimize.
	compilation compile.


	self assert: (shell inject: compilation andInvokeWith: {x }) equals: ((x == 0) ifTrue:[ -1 ] ifFalse:[ x ]).

	"
	TRRV64GCompilationTests debug: #test07_call_discarding_value
	TRPPC64CompilationTests debug: #test07_call_discarding_value
	"
]

{ #category : #tests }
TRCompilationTestCase >> test19_abs [
	| x builder |

	<parameter: #x values: #(-10 0 10)>

	self target name = 'powerpc64le-linux' ifTrue: [
		self skip: 'Skipped since Xload/Xstore evaluator does not support statics for POWER (see issue #52)'.
	].

	x := testParameters at: #x.

	builder := compilation builder.
	builder defineName: testSelector asString type: Int64.
	builder defineParameter: 'x' type: Int64.
	builder
		if: (builder lcmpgt:
			 {  builder lload: 'x' .
				builder lconst: 0  })
		then:[ :builder |
				builder lreturn:
					{ builder lload: 'x' } ]
		else:[ :builder |
				builder lreturn: {
					builder lsub:
						{ builder lconst: 0 .
						  builder lload: 'x' } } ].

	compilation optimize.
	compilation compile.


	self assert: (shell inject: compilation andInvokeWith: {x }) equals: x abs

	"
	TRRV64GCompilationTests debug: #test19_abs
	TRPPC64CompilationTests debug: #test19_abs
	"
]

{ #category : #'tests - examples' }
TRCompilationTestCase >> test_example01_meaningOfLife [
	TRCompilationExamples new
		compilation: compilation;
		example01_meaningOfLife.

	self assert: (shell inject: compilation andInvokeWith: #()) equals: 42.
]

{ #category : #'tests - examples' }
TRCompilationTestCase >> test_example03_signum [
	TRCompilationExamples new
		compilation: compilation;
		example03_signum.

	self assert: (shell inject: compilation andInvokeWith: { -5 }) equals: -5 sign.
]

{ #category : #'tests - examples' }
TRCompilationTestCase >> test_example04_factorial_i [
	TRCompilationExamples new
		compilation: compilation;
		example04_factorial_i.

	self assert: (shell inject: compilation andInvokeWith: { 5 }) equals: 5 factorial.
]

{ #category : #'tests - examples' }
TRCompilationTestCase >> test_example05_factorial_r [
	self target name = 'powerpc64le-linux' ifTrue: [
		self skip: 'Skipped since calls are not implemented for POWER (see issue #45)'.
	].
	TRCompilationExamples new
		compilation: compilation;
		example05_factorial_r.

	self assert: (shell inject: compilation andInvokeWith: { 5 }) equals:  5 factorial.
]

{ #category : #'tests - examples' }
TRCompilationTestCase >> test_example08_bytecode_compiler [
	TRCompilationExamples new
		compilation: compilation;
		example08_bytecode_compiler.
	self assert: (shell inject: compilation andInvokeWith: { 2 }) equals: 2 factorial.
]

{ #category : #'tests - examples' }
TRCompilationTestCase >> test_example09_signum_2 [
	self target name = 'powerpc64le-linux' ifTrue: [
		self skip: 'Known failure (see issue #46)'.
	].

	TRCompilationExamples new
		compilation: compilation;
		example09_signum_2.

	self assert: (shell inject: compilation andInvokeWith: { -1 }) equals: -1 sign.
]

{ #category : #'tests - examples' }
TRCompilationTestCase >> test_example10_sum_first_n_numbers [
	TRCompilationExamples new
		compilation: compilation;
		example10_sum_first_n_numbers.

	self assert: (shell inject: compilation andInvokeWith: { 10 }) equals: ((0 to: 9) inject: 0 into:[ :s :i | s + i ]).
]

{ #category : #'tests - examples' }
TRCompilationTestCase >> test_example15_add_with_overflow_check [
	self target name = 'powerpc64le-linux' ifTrue: [
		self skip: 'Skipped since overflowchk evaluator is not implemented for POWER (see issue #44)'.
	].

	TRCompilationExamples new
		compilation: compilation;
		example15_add_with_overflow_check.
	self assert: (shell inject: compilation andInvokeWith: { 16r7FFFFFFE . 2 }) equals: 0.
]

{ #category : #'tests - examples' }
TRCompilationTestCase >> test_example16_factorial_i_with_overflow [
	self target name = 'powerpc64le-linux' ifTrue: [
		self skip: 'Skipped since overflowchk evaluator is not implemented for POWER (see issue #44)'.
	].

	TRCompilationExamples new
		compilation: compilation;
		example16_factorial_i_with_overflow.
	self assert: (shell inject: compilation andInvokeWith: { 13 })equals: -1.


	"
	13 factorial > 0x7FFFFFFF
	22 factorial > 0x7FFFFFFFFFFFFFFF
	"
]

{ #category : #'tests - examples' }
TRCompilationTestCase >> test_example18_increment_static_symbol [
	| ctr asm |

	self target name = 'powerpc64le-linux' ifTrue: [
		self skip: 'Skipped since Xload/Xstore evaluator does not support statics for POWER (see issue #52)'.
	].

	"Create and add static counter"
	ctr := TRStaticSymbol name: 'counter' type: Int32.
	asm := AcDSLRV64GAssembler new.
	asm globl: ctr.
	asm label: ctr.
	asm int32: 42.

	shell nzone add: asm object.

	TRCompilationExamples new
		compilation: compilation;
		example18_increment_static_symbol.
	self assert: (shell inject: compilation andInvokeWith: { })equals: 43.


	"
	shell debugger cli
	"
]
