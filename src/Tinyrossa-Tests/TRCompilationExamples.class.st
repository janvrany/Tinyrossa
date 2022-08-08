Class {
	#name : #TRCompilationExamples,
	#superclass : #TestCase,
	#pools : [
		'TRDataTypes'
	],
	#category : #'Tinyrossa-Compile-Examples'
}

{ #category : #documentation }
TRCompilationExamples class >> documentation [
"
	documentation to be added.

	[author:]
		Jan Vrany <jan.vrany@labware.com>

	[instance variables:]

	[class variables:]

	[see also:]

"
]

{ #category : #accessing }
TRCompilationExamples class >> isTestSelector:aSelector [
	^ (super isTestSelector: aSelector)
		or:[aSelector notNil and:[aSelector startsWith:'example']]

	"Created: / 06-08-2006 / 11:46:17 / cg"
	"Modified: / 05-12-2009 / 18:50:57 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 02-08-2011 / 17:46:51 / cg"
]

{ #category : #examples }
TRCompilationExamples >> example01_meaningOfLife [
	| compilation builder |

	"Compilation object (an instance of TRCompilation) is
	 an entry point to the while compilation pipeline.
	 Compilation objects are not to be reused, create
	 new one for each function (method) you compile."

	compilation := TRCompilation new.

	builder := compilation builder.
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

	self halt.
]

{ #category : #examples }
TRCompilationExamples >> example02_add2 [
	| compilation builder |

	compilation := TRCompilation new.

	builder := compilation builder.
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

	self halt.
]

{ #category : #examples }
TRCompilationExamples >> example03_signum [
	| compilation builder |

	compilation := TRCompilation new.

	builder := compilation builder.
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

	self halt.
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
