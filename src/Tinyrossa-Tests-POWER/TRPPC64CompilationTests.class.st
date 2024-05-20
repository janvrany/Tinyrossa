Class {
	#name : #TRPPC64CompilationTests,
	#superclass : #TRCompilationTestCase,
	#category : #'Tinyrossa-Tests-POWER'
}

{ #category : #accessing }
TRPPC64CompilationTests >> target [
	^ TRPPC64Linux default
]

{ #category : #tests }
TRPPC64CompilationTests >> test01_bytecode_abs [
	super test01_bytecode_abs.
	self assert: (shell call: 2) equals: 2 abs.
]

{ #category : #tests }
TRPPC64CompilationTests >> test02_iconst_n [
	super test02_iconst_n.
	self assert: (shell call) equals: -16r7FEDCBA9.
]

{ #category : #tests }
TRPPC64CompilationTests >> test02_iconst_p [
	super test02_iconst_p.
	self assert: (shell call) equals: 16r7FEDCBA9.
]

{ #category : #tests }
TRPPC64CompilationTests >> test03_lconst_n [
	self skip: 'Skipped since #loadConstant64:into: is not implemented for POWER (see issue #43)'.

	super test03_lconst_n.
	self assert: (shell call) equals: -16r7AFEAFFECAFEAFFE.
]

{ #category : #tests }
TRPPC64CompilationTests >> test03_lconst_p [
	self skip: 'Skipped since #loadConstant64:into: is not implemented for POWER (see issue #43)'.

	super test03_lconst_p.
	self assert: (shell call) equals: 16r7AFEAFFECAFEAFFE.
]

{ #category : #'tests - examples' }
TRPPC64CompilationTests >> test_example01_meaningOfLife [
	TRCompilationExamples new
		compilation: compilation;
		example01_meaningOfLife.

	self assert: (shell call) equals: 42.
]

{ #category : #'tests - examples' }
TRPPC64CompilationTests >> test_example03_signum [
	TRCompilationExamples new
		compilation: compilation;
		example03_signum.

	self assert: (shell call:-5) equals: -5 sign.
]

{ #category : #'tests - examples' }
TRPPC64CompilationTests >> test_example04_factorial_i [
	TRCompilationExamples new
		compilation: compilation;
		example04_factorial_i.

	self assert: (shell call:5) equals: 5 factorial.
]

{ #category : #'tests - examples' }
TRPPC64CompilationTests >> test_example08_bytecode_compiler [
	TRCompilationExamples new
		compilation: compilation;
		example08_bytecode_compiler.
	self assert: (shell call:6) equals: 6 factorial.
]

{ #category : #'tests - examples' }
TRPPC64CompilationTests >> test_example09_signum_2 [
	TRCompilationExamples new
		compilation: compilation;
		example09_signum_2.     
	self assert: (shell call:0) equals: 0 sign
]

{ #category : #'tests - examples' }
TRPPC64CompilationTests >> test_example15_add_with_overflow_check [
	(TRPPC64CodeEvaluator methodDictionary at: #evaluate_overflowchk: ifAbsent:[nil]) isNil ifTrue: [
		self skip: 'Skipped since #evaluate_overflowchk: is not implemented for POWER (see issue #44)'
	].

	TRCompilationExamples new
		compilation: compilation;
		example15_add_with_overflow_check.
	self assert: (shell call: 16r7FFFFFFE _: 2 ) equals: 0.
]

{ #category : #'tests - examples' }
TRPPC64CompilationTests >> test_example16_factorial_i_with_overflow [
	(TRPPC64CodeEvaluator methodDictionary at: #evaluate_overflowchk: ifAbsent:[nil]) isNil ifTrue: [
		self skip: 'Skipped since #evaluate_overflowchk: is not implemented for POWER (see issue #44)'
	].

	TRCompilationExamples new
		compilation: compilation;
		example16_factorial_i_with_overflow.
   self assert: (shell call: 13) equals: -1.


	"
	13 factorial > 0x7FFFFFFF
	22 factorial > 0x7FFFFFFFFFFFFFFF
	"
]
