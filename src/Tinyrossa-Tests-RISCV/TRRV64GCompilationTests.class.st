Class {
	#name : #TRRV64GCompilationTests,
	#superclass : #TRCompilationTestCase,
	#category : #'Tinyrossa-Tests-RISCV'
}

{ #category : #running }
TRRV64GCompilationTests >> setUp [
	self setUpForTarget: TRRV64GLinux default
]

{ #category : #tests }
TRRV64GCompilationTests >> test01_bytecode_abs [
	| debugger |

	super test01_bytecode_abs.
	"
	VDBDebuggerAp
	"
	debugger := shell debugger.
	debugger memoryAt: shell nzone put: compilation codeBuffer bytes.
	debugger setRegister: 'a0' to: 2.

	"
	VDBDebuggerApplication openFor: debugger
	"

	debugger c.
	self assert: (debugger getRegister: 'a0') equals: 2 abs.
]

{ #category : #tests }
TRRV64GCompilationTests >> test02_iconst_n [
	| debugger |

	super test02_iconst_n.
	debugger := shell debugger.
	debugger memoryAt: shell nzone put: compilation codeBuffer bytes.
	 "
	 VDBDebuggerApplication openFor: debugger
	"
	debugger c.
	self assert: (debugger getRegister: 'a0') equals: -16r7FEDCBA9.
]

{ #category : #tests }
TRRV64GCompilationTests >> test02_iconst_p [
	| debugger |

	super test02_iconst_p.
	debugger := shell debugger.
	debugger memoryAt: shell nzone put: compilation codeBuffer bytes.
	 "
	 VDBDebuggerApplication openFor: debugger
	"
	debugger c.
	self assert: (debugger getRegister: 'a0') equals: 16r7FEDCBA9.
]

{ #category : #tests }
TRRV64GCompilationTests >> test03_lconst_n [
	| debugger |

	super test03_lconst_n.
	debugger := shell debugger.
	debugger memoryAt: shell nzone put: compilation codeBuffer bytes.
	 "
	 VDBDebuggerApplication openFor: debugger
	"
	debugger c.
	self assert: (debugger getRegister: 'a0') hex equals: '-7AFEAFFECAFEAFFE'.
]

{ #category : #tests }
TRRV64GCompilationTests >> test03_lconst_p [
	| debugger |

	super test03_lconst_p.
	debugger := shell debugger.
	debugger memoryAt: shell nzone put: compilation codeBuffer bytes.
	 "
	 VDBDebuggerApplication openFor: debugger
	"
	debugger c.
	self assert: (debugger getRegister: 'a0') equals: 16r7AFEAFFECAFEAFFE.
]

{ #category : #'tests - examples' }
TRRV64GCompilationTests >> test_example01_meaningOfLife [
	| debugger |

	TRCompilationExamples new
		compilation: compilation;
		example01_meaningOfLife.

	debugger := shell debugger.
	debugger memoryAt: shell nzone put: compilation codeBuffer bytes.
	debugger c.
	self assert: (debugger getRegister: 'a0') equals: 42.
]

{ #category : #'tests - examples' }
TRRV64GCompilationTests >> test_example03_signum [
	| debugger |

	TRCompilationExamples new
		compilation: compilation;
		example03_signum.

	debugger := shell debugger.
	debugger memoryAt: shell nzone put: compilation codeBuffer bytes.
	debugger setRegister: 'a0' to: -5.
	debugger c.
	self assert: (debugger getRegister: 'a0') equals: -1.
]

{ #category : #'tests - examples' }
TRRV64GCompilationTests >> test_example04_factorial_i [
	| debugger |

	TRCompilationExamples new
		compilation: compilation;
		example04_factorial_i.

	debugger := shell debugger.
	debugger memoryAt: shell nzone put: compilation codeBuffer bytes.
	debugger setRegister: 'a0' to: 5.
	debugger c.
	self assert: (debugger getRegister: 'a0') equals: 5 factorial.
]

{ #category : #'tests - examples' }
TRRV64GCompilationTests >> test_example05_factorial_r [
	| debugger |

	TRCompilationExamples new
		compilation: compilation;
		example05_factorial_r.

	debugger := shell debugger.
	debugger memoryAt: shell nzone put: compilation codeBuffer bytes.
	debugger setRegister: 'a0' to: 5.
	debugger c.
	self assert: (debugger getRegister: 'a0') equals: 5 factorial.
]

{ #category : #'tests - examples' }
TRRV64GCompilationTests >> test_example08_bytecode_compiler [
	| debugger |

	TRCompilationExamples new
		compilation: compilation;
		example08_bytecode_compiler.
	"
	VDBDebuggerAp
	"
	debugger := shell debugger.
	debugger memoryAt: shell nzone put: compilation codeBuffer bytes.
	debugger setRegister: 'a0' to: 2.

	"
	VDBDebuggerApplication openFor: debugger
	"

	debugger c.
	self assert: (debugger getRegister: 'a0') equals: 2 factorial.
]

{ #category : #'tests - examples' }
TRRV64GCompilationTests >> test_example09_signum_2 [
	| debugger |

	TRCompilationExamples new
		compilation: compilation;
		example09_signum_2.

	debugger := shell debugger.
	debugger memoryAt: shell nzone put: compilation codeBuffer bytes.
	debugger setRegister: 'a0' to: -5.
	debugger c.
	self assert: (debugger getRegister: 'a0') equals: -1.
]

{ #category : #'tests - examples' }
TRRV64GCompilationTests >> test_example15_add_with_overflow_check [
	| debugger |

	TRCompilationExamples new
		compilation: compilation;
		example15_add_with_overflow_check.

	debugger := shell debugger.
	debugger memoryAt: shell nzone put: compilation codeBuffer bytes.
	debugger setRegister: 'a0' to: 16r7FFFFFFE.
	debugger setRegister: 'a1' to:          2.
	debugger c.
	self assert: (debugger getRegister: 'a0') equals: 0.
]

{ #category : #'tests - examples' }
TRRV64GCompilationTests >> test_example16_factorial_i_with_overflow [
	| debugger |

	TRCompilationExamples new
		compilation: compilation;
		example16_factorial_i_with_overflow.

	debugger := shell debugger.
	debugger memoryAt: shell nzone put: compilation codeBuffer bytes.
	debugger setRegister: 'a0' to: 13.
	debugger c.
	self assert: (debugger getRegister: 'a0') equals: -1.


	"
	13 factorial > 0x7FFFFFFF
	22 factorial > 0x7FFFFFFFFFFFFFFF
	"
]
