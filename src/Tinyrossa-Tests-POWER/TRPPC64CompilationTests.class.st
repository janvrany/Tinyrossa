Class {
	#name : #TRPPC64CompilationTests,
	#superclass : #TRCompilationTestCase,
	#category : #'Tinyrossa-Tests-POWER'
}

{ #category : #running }
TRPPC64CompilationTests >> setUp [
	self setUpForTarget: TRPPC64Linux default
]

{ #category : #tests }
TRPPC64CompilationTests >> test01_bytecode_abs [
	| debugger |

	(TRPPC64CodeEvaluator >> #evaluate_icmpgt:) isNil ifTrue: [
		self skip: 'Skipped since #evaluate_icmpgt: is not implemented for POWER'
	].

	super test01_bytecode_abs.
	"
	VDBDebuggerAp
	"
	debugger := shell debugger.
	debugger memoryAt: shell nzone put: compilation codeBuffer bytes.
	debugger setRegister: 'r4' to: -12.

	"
	VDBDebuggerApplication openFor: debugger
	"

	debugger c.
	self assert: (debugger getRegister: 'r4') equals: -12 abs.
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
TRPPC64CompilationTests >> test_example08_bytecode_compiler [
	| debugger |

	(TRPPC64CodeEvaluator >> #evaluate_icmpgt:) isNil ifTrue: [
		self skip: 'Skipped since #evaluate_icmpgt: is not implemented for POWER'
	].

	TRCompilationExamples new
		compilation: compilation;
		example08_bytecode_compiler.
	"
	VDBDebuggerAp
	"
	debugger := shell debugger.
	debugger memoryAt: shell nzone put: compilation codeBuffer bytes.
	debugger setRegister: 'r4' to: 6.

	"
	VDBDebuggerApplication openFor: debugger
	"

	debugger c.
	self assert: (debugger getRegister: 'r4') equals: 6 factorial.
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
