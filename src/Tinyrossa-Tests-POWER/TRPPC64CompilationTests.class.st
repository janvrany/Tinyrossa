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
TRPPC64CompilationTests >> test_example03_signum [
	| debugger |

	TRCompilationExamples new
		compilation: compilation;
		example03_signum.     

	debugger := shell debugger.
	debugger memoryAt: shell nzone put: compilation codeBuffer bytes.
	debugger setRegister: 'r4' to: 0.
	debugger c.
	self assert: (debugger getRegister: 'r4') equals: 0.
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

{ #category : #'tests - examples' }
TRPPC64CompilationTests >> test_example09_signum_2 [
	| debugger |

	TRCompilationExamples new
		compilation: compilation;
		example09_signum_2.     

	debugger := shell debugger.
	debugger memoryAt: shell nzone put: compilation codeBuffer bytes.
	debugger setRegister: 'r4' to: 0.
	debugger c.
	self assert: (debugger getRegister: 'r4') equals: 0.
]
