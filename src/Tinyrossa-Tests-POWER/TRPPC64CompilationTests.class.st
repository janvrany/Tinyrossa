Class {
	#name : #TRPPC64CompilationTests,
	#superclass : #TRCompilationTestCase,
	#category : #'Tinyrossa-Tests-POWER'
}

{ #category : #running }
TRPPC64CompilationTests >> setUp [
	self setUpForTarget: TRPPC64Linux default
]

{ #category : #'tests - examples' }
TRPPC64CompilationTests >> test_example01_meaningOfLife [
	| debugger |

	TRCompilationExamples new
		compilation: compilation;
		example01_meaningOfLife.

	debugger := shell debugger.
	debugger memoryAt: shell nzone put: compilation codeBuffer bytes.
	debugger c.
	self assert: (debugger getRegister: 'r4') equals: 42.
]

{ #category : #'tests - examples' }
TRPPC64CompilationTests >> test_example04_factorial_i [
	| debugger |

	TRCompilationExamples new
		compilation: compilation;
		example04_factorial_i.

	debugger := shell debugger.
	debugger memoryAt: shell nzone put: compilation codeBuffer bytes.
	debugger setRegister: 'r4' to: 5.
	debugger c.
	self assert: (debugger getRegister: 'r4') equals: 5 factorial.
]

