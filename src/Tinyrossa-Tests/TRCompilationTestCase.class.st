Class {
	#name : #TRCompilationTestCase,
	#superclass : #TestCase,
	#instVars : [
		'compilation',
		'shell'
	],
	#pools : [
		'TRDataTypes'
	],
	#category : #'Tinyrossa-Tests'
}

{ #category : #testing }
TRCompilationTestCase class >> isAbstract [
	^ self == TRCompilationTestCase
]

{ #category : #running }
TRCompilationTestCase >> setUpForTarget: aTRCompilationTarget [
	compilation := TRCompilation forTarget: aTRCompilationTarget.
	shell := TRCompilationTestShell forTarget: aTRCompilationTarget.
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

	compilation codeBuffer. "Only convenience inspection."
]

{ #category : #tests }
TRCompilationTestCase >> test02_iconst_n [
	| builder |

	builder := compilation builder.
	builder defineName: testSelector type: Int32.
	builder ireturn: {
				builder iconst: -16r7FEDCBA9
			}.
	compilation optimize.
	compilation compile.
	compilation codeBuffer.

	"
	 TRRV64GCompilationTests debug: #test02_iconst_p
	 TRPPC64CompilationTests debug: #test02_iconst_p"
]

{ #category : #tests }
TRCompilationTestCase >> test02_iconst_p [
	| builder |

	builder := compilation builder.
	builder defineName: testSelector type: Int32.
	builder ireturn: {
				builder iconst: 16r7FEDCBA9
			}.
	compilation optimize.
	compilation compile.
	compilation codeBuffer.

	"
	 TRRV64GCompilationTests debug: #test02_iconst_p
	 TRPPC64CompilationTests debug: #test02_iconst_p"
]

{ #category : #tests }
TRCompilationTestCase >> test03_lconst_n [
	| builder |

	builder := compilation builder.
	builder defineName: testSelector type: Int64.
	builder lreturn: 
		{ builder lconst: -16r7AFEAFFECAFEAFFE }.

	compilation optimize.

	compilation compile.

	compilation codeBuffer. 

	"
	TRRV64GCompilationTests debug: #test03_lconst_n 
	TRPPC64CompilationTests debug: #test03_lconst_n 
	"
]

{ #category : #tests }
TRCompilationTestCase >> test03_lconst_p [
	| builder |

	builder := compilation builder.
	builder defineName: testSelector type: Int64.
	builder lreturn: 
		{ builder lconst: 16r7AFEAFFECAFEAFFE }.

	compilation optimize.

	compilation compile.

	compilation codeBuffer. 

	"
	TRRV64GCompilationTests debug: #test03_lconst_p 
	TRPPC64CompilationTests debug: #test03_lconst_p 
	"
]
