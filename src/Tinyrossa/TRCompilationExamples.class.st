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
