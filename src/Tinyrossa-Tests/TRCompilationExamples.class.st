Class {
	#name : #TRCompilationExamples,
	#superclass : #TestCase,
	#pools : [
		'TRDataTypes'
	],
	#category : #'Tinyrossa-Tests-Examples'
}

{ #category : #accessing }
TRCompilationExamples class >> testSelectors [
	^ self selectors select: [ :each | each beginsWith:'example' ]
]

{ #category : #examples }
TRCompilationExamples >> example01_meaningOfLife [
	| compilation builder |

	"Compilation object (an instance of TRCompilation) is
	 an entry point to the while compilation pipeline.
	 Compilation objects are not to be reused, create
	 new one for each function (method) you compile."

	compilation := TRCompilation forConfig: TRCompilationConfig forRV64G.

	builder := compilation builder.
	builder defineName: 'MeaningOfLife' type: Int32.
	builder ireturn: 
		{ builder iadd: 
			{ builder iconst: 31 .
			  builder iconst: 11 } }.

	compilation buildFinished. "Indicate we're done building/"

	compilation il. "Only convenience inspection."

	compilation optimize.
	compilation il. "Only convenience inspection."

	compilation compile.
	compilation codeBuffer. "Only convenience inspection."
]

{ #category : #examples }
TRCompilationExamples >> example02_add2 [
	| compilation builder |

	compilation := TRCompilation forConfig: TRCompilationConfig forRV64G.

	builder := compilation builder.
	builder defineName: 'add2' type: Int32.
	builder defineParameter: 'x' type: Int32.
	builder ireturn: 
		{ builder iadd: 
			{ builder iload: 'x' .
			  builder iconst: 2 } }.

	compilation buildFinished. "Indicate we're done building/"

	compilation il. "Only convenience inspection."

	compilation optimize.
	compilation il. "Only convenience inspection."

	compilation compile.
	compilation codeBuffer. "Only convenience inspection."
]

{ #category : #examples }
TRCompilationExamples >> example03_signum [
	| compilation builder |

	compilation := TRCompilation forConfig: TRCompilationConfig forRV64G.

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

	compilation buildFinished. "Indicate we're done building/"

	compilation il. "Only convenience inspection."

	compilation optimize.
	compilation il. "Only convenience inspection."

	compilation compile.
	compilation codeBuffer. "Only convenience inspection."
]

{ #category : #examples }
TRCompilationExamples >> example04_factorial_i [
	| compilation builder |

	compilation := TRCompilation forConfig: TRCompilationConfig forRV64G.

	builder := compilation builder.
	builder defineName: 'factorial_i' type: Int32.
	builder defineParameter: 'x' type: Int32.   
	builder defineAutomatic: 'r' type: Int32.

	builder 
		istore: { 
			builder iconst: 1 . 
			'r' };
		while: (builder icmple: 
				{  builder iload: 'x' .
				   builder iconst: 1  })
		do:[ :builder |
			builder istore: {
				(builder imul: { 
					builder iload: 'r' . 
					builder iload: 'x' }) .
				'r' }.
			builder istore: {
				(builder isub: { 
					builder iload: 'x' . 
					builder iconst: 1 }) .
				'x' }
		].

	compilation buildFinished. "Indicate we're done building/"

	compilation il. "Only convenience inspection."

	compilation optimize.
	compilation il. "Only convenience inspection."

	compilation compile.

	compilation codeBuffer. "Only convenience inspection."
]

{ #category : #running }
TRCompilationExamples >> setUp [
	"common setup - invoked before testing."

	super setUp
]

{ #category : #running }
TRCompilationExamples >> tearDown [
	"common cleanup - invoked after testing."

	super tearDown
]
