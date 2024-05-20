Class {
	#name : #TRRV64GCompilationTests,
	#superclass : #TRCompilationTestCase,
	#category : #'Tinyrossa-Tests-RISCV'
}

{ #category : #accessing }
TRRV64GCompilationTests >> target [
	^ TRRV64GLinux default
]

{ #category : #tests }
TRRV64GCompilationTests >> test01_bytecode_abs [
	super test01_bytecode_abs.
	self assert: (shell call: 2) equals: 2 abs.
]

{ #category : #tests }
TRRV64GCompilationTests >> test02_iconst_n [
	super test02_iconst_n.
	self assert: (shell call) equals: -16r7FEDCBA9.
]

{ #category : #tests }
TRRV64GCompilationTests >> test02_iconst_p [
	super test02_iconst_p.
	self assert: (shell call) equals: 16r7FEDCBA9.
]

{ #category : #tests }
TRRV64GCompilationTests >> test03_lconst_n [
	super test03_lconst_n.
	self assert: (shell call) equals: -16r7AFEAFFECAFEAFFE.
]

{ #category : #tests }
TRRV64GCompilationTests >> test03_lconst_p [
	super test03_lconst_p.
	self assert: (shell call) equals: 16r7AFEAFFECAFEAFFE.
]

{ #category : #'tests - examples' }
TRRV64GCompilationTests >> test_example01_meaningOfLife [
	TRCompilationExamples new
		compilation: compilation;
		example01_meaningOfLife.

	self assert: (shell call) equals: 42.
]

{ #category : #'tests - examples' }
TRRV64GCompilationTests >> test_example03_signum [
	TRCompilationExamples new
		compilation: compilation;
		example03_signum.

	self assert: (shell call:-5) equals: -5 sign.
]

{ #category : #'tests - examples' }
TRRV64GCompilationTests >> test_example04_factorial_i [
	TRCompilationExamples new
		compilation: compilation;
		example04_factorial_i.

	self assert: (shell call:5) equals: 5 factorial.
]

{ #category : #'tests - examples' }
TRRV64GCompilationTests >> test_example05_factorial_r [
	TRCompilationExamples new
		compilation: compilation;
		example05_factorial_r.

	self assert: (shell call:5) equals:  5 factorial.
]

{ #category : #'tests - examples' }
TRRV64GCompilationTests >> test_example08_bytecode_compiler [
	TRCompilationExamples new
		compilation: compilation;
		example08_bytecode_compiler.
	self assert: (shell call:2) equals: 2 factorial.
]

{ #category : #'tests - examples' }
TRRV64GCompilationTests >> test_example09_signum_2 [
	TRCompilationExamples new
		compilation: compilation;
		example09_signum_2.

	self assert: (shell call:-1) equals: -1 sign.
]

{ #category : #'tests - examples' }
TRRV64GCompilationTests >> test_example15_add_with_overflow_check [
	TRCompilationExamples new
		compilation: compilation;
		example15_add_with_overflow_check.
	self assert: (shell call: 16r7FFFFFFE _: 2 ) equals: 0.
]

{ #category : #'tests - examples' }
TRRV64GCompilationTests >> test_example16_factorial_i_with_overflow [
	TRCompilationExamples new
		compilation: compilation;
		example16_factorial_i_with_overflow.
	self assert: (shell call:13)equals: -1.


	"
	13 factorial > 0x7FFFFFFF
	22 factorial > 0x7FFFFFFFFFFFFFFF
	"
]
