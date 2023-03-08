Class {
	#name : #TRCompilationExamples,
	#superclass : #TestCase,
	#instVars : [
		'compilation'
	],
	#classVars : [
		'Shell'
	],
	#pools : [
		'TRDataTypes'
	],
	#category : #'Tinyrossa-Compile-Examples'
}

{ #category : #accessing }
TRCompilationExamples class >> testSelectors [
	^ self selectors select: [ :each | each beginsWith:'example' ]
]

{ #category : #examples }
TRCompilationExamples >> example01_meaningOfLife [
	| builder |

	"Compilation object (an instance of TRCompilation) is
	 an entry point to the while compilation pipeline.
	 Compilation objects are not to be reused, create
	 new one for each function (method) you compile.

	 The compilation object is created in #setUp, but if
	 you want to try different targets and/or configs,
	 just uncomment and modify the following line.
	"
	"
	compilation := TRCompilation forConfig: TRCompilationConfig forRV64G.
	"

	builder := compilation builder.
	builder defineName: 'MeaningOfLife' type: Int32.
	builder ireturn: 
		{ builder iadd: 
			{ builder iconst: 31 .
			  builder iconst: 11 } }.

	compilation optimize.

	compilation compile.

	compilation codeBuffer. "Only convenience inspection."
]

{ #category : #examples }
TRCompilationExamples >> example02_add2 [
	| builder |

	builder := compilation builder.
	builder defineName: 'add2' type: Int32.
	builder defineParameter: 'x' type: Int32.
	builder ireturn: 
		{ builder iadd: 
			{ builder iload: 'x' .
			  builder iconst: 2 } }.

	compilation optimize.

	compilation compile.

	compilation codeBuffer. "Only convenience inspection."
]

{ #category : #examples }
TRCompilationExamples >> example03_signum [
	| builder |

	builder := compilation builder.
	builder defineName: 'signum' type: Int32.
	builder defineParameter: 'x' type: Int32.   
	builder 
		if: (builder icmplt: 
			 {  builder iload: 'x' .
				builder iconst: 0  })
		then:[ :builder | 
				builder ireturn: 
					{ builder iconst: -1 } ]
		else:[ :builder |
				builder if: (builder icmpgt: 
							 {  builder iload: 'x' .
								builder iconst: 0  })
						then:[ :builder |
								builder ireturn: 
									{ builder iconst: 1 } ]
						else:[ :builder |
								builder ireturn: 
									{ builder iconst: 0 } ] ].

	compilation optimize.

	compilation compile.

	compilation codeBuffer. "Only convenience inspection."
]

{ #category : #examples }
TRCompilationExamples >> example04_factorial_i [
	| builder |

	builder := compilation builder.
	builder defineName: 'factorial_i' type: Int32.
	builder defineParameter: 'x' type: Int32.   
	builder defineAutomatic: 'r' type: Int32.

	"
	def factorial_i(x):
		r = 1
		while x > 0:
			r = r * x
			x = x - 1
		return r
	"

	builder 
		"r = 1"
		istore: { 
			builder iconst: 1 . 
			'r' };

		"while x > 0:"
		while: (builder icmpgt: { builder iload: 'x' . builder iconst: 0  }) do: [:builder |
			"r = r * x"
			builder istore: {
				(builder imul: { builder iload: 'r' . builder iload: 'x' }) .
				'r' }.
			"x = x - 1"
			builder istore: {
				(builder isub: { builder iload: 'x' . builder iconst: 1 }) .
				'x' }
		];
		"return r"
		ireturn: { builder iload: 'r' }.

	compilation optimize.

	compilation compile.

	compilation codeBuffer. "Only convenience inspection."
]

{ #category : #examples }
TRCompilationExamples >> example05_factorial_r [
	| builder |

	builder := compilation builder.
	builder defineName: 'factorial_r' type: Int32.
	builder defineParameter: 'x' type: Int32.   

	"
	def factorial_r(x):
		if x == 0:
			return 1
		else:
			return x * factorial_r(x - 1)
	"

	builder 
		"if x == 0:"
		if: (builder icmpeq: { builder iload: 'x' . builder iconst: 0  })
		then: [ :builder |
			"return 1"
			builder ireturn: 
				{ builder iconst: 1 }
		] else: [ :builder |
			"return x * factorial_r(x - 1)"
			builder ireturn: 
				{ builder imul: 
					{ builder iload: 'x' .
					  builder icall: 
						{ builder isub: 
							{ builder iload: 'x' .
							  builder iconst: 1 } .
						'factorial_r' } } }
		].

	compilation optimize.

	compilation compile.

	compilation codeBuffer. "Only convenience inspection."
]

{ #category : #examples }
TRCompilationExamples >> example06_factorial_aot [

	compilation config 
		aot: true;
		objectFile: 'factorial.o'.

	self example05_factorial_r.

	self assert: 'factorial.o' asFileReference exists
]

{ #category : #examples }
TRCompilationExamples >> example08_bytecode_compiler [
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
	|

	"
	Source:

	factorial_r: x
		| i r |
		i := x.
		r := 1.
		[ i > 0 ] whileTrue: [
			r := r * i.
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
		44: send *
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
						sym == #* ifTrue: [ builder push: (builder imul: { recv . arg1 }) ].
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
	bytecodeBuilder bci: 44. send         value: bytecodeBuilder value: #*.
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

	compilation codeBuffer. "Only convenience inspection."
]

{ #category : #examples }
TRCompilationExamples >> example09_signum_2 [
	| builder then1 else1 then2 else2 |

	"
	This example demonstrates how to use orphan builders to
	defer building of control-flow branches. This is an alternative
	to using (smalltalk) blocks - see #example03_signum
	"

	builder := compilation builder.
	builder defineName: 'signum' type: Int32.
	builder defineParameter: 'x' type: Int32.   
	builder defineAutomatic: 'r' type: Int32.   

	then1 := builder orphan.
	else1 := builder orphan.

	builder 
		if: (builder icmplt: 
			 {  builder iload: 'x' .
				builder iconst: 0  })
		then: then1
		else: else1;
		ireturn: { builder iload: 'r' }.

	then2 := builder orphan.
	else2 := builder orphan.

	then1 istore: { then1 iconst: -1 . 'r'}.
	else1 if: (builder icmpgt: 
				{  builder iload: 'x' .
				   builder iconst: 0  }) 
		  then: then2
		  else: else2.


	then2 istore: { then1 iconst: 1 . 'r' }.
	else2 istore: { then1 iconst: 0 . 'r' }.

	compilation optimize.

	compilation compile.

	compilation codeBuffer. "Only convenience inspection."
]

{ #category : #running }
TRCompilationExamples >> setUp [
	super setUp.
	compilation := TRCompilation forConfig: TRCompilationConfig forRV64GLinux
]