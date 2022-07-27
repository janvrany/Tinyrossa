Class {
	#name : #TRCompilationExamples,
	#superclass : #TestCase,
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
