Class {
	#name : #TRSymbolicCompilationTests,
	#superclass : #TRCompilationTestCase,
	#category : #'Tinyrossa-Tests-Formal'
}

{ #category : #running }
TRSymbolicCompilationTests >> setUp [
	self setUpForTarget: TRSymbolic default
]

{ #category : #running }
TRSymbolicCompilationTests >> setUpForTarget: aTRCompilationTarget [
	compilation := TRCompilation forTarget: aTRCompilationTarget.
]

{ #category : #'tests - examples' }
TRSymbolicCompilationTests >> test_example01_meaningOfLife [
	| builder spec code prog safeness |

	builder := compilation builder.
	builder defineName: 'MeaningOfLife' type: Int32.
	builder ireturn:
		{ builder iadd:
			{ builder iconst: 31 .
			  builder iconst: 11 } }.

	compilation optimize.
	compilation compile.

	spec := TRILSpecification new prog.
	code := compilation codegen prog.
	prog := spec , code.

	safeness := prog solve.
	self assert: safeness isSafe.

	self halt.
]

{ #category : #'tests - examples' }
TRSymbolicCompilationTests >> test_example02_add2 [
	| spec code prog safeness |

	TRCompilationExamples new
		compilation: compilation;
		example02_add2.

	spec := TRILSpecification new prog.
	code := compilation codegen prog.
	prog := spec , code.

	safeness := prog solve.
	self assert: safeness isSafe.

	self halt.
]

{ #category : #'tests - examples' }
TRSymbolicCompilationTests >> test_example03_signum [
	| spec code prog safeness |

	TRCompilationExamples new
		compilation: compilation;
		example03_signum.

	spec := TRILSpecification new prog.
	code := compilation codegen prog.
	prog := spec , code.

	safeness := prog solve.
	self assert: safeness isSafe.

	self halt.
]
