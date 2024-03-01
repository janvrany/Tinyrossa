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

{ #category : #'tests - examples' }
TRSymbolicCompilationTests >> test_mul2_01 [
	| bldr spec code verf prog safe |

	compilation config optimizationPasses: { }.

	bldr := compilation builder.
	bldr defineName: 'mul2' type: Int32.
	bldr defineParameter: 'x' type: Int32.
	bldr ireturn:
		{ bldr imul:
			{ bldr iload: 'x' .
			  bldr iconst: 2 } }.

	compilation optimize.
	compilation compile.

	spec := TRILSpecification new prog.
	code := compilation codegen prog.
	verf := TRILSpecificationParser parse:'
	/*@ val verify : bool[b|b] */
	    let verify = {
				let exp = bvmul32(bv32(10),bv32(2));
				let got = mul2(bv32(10));
				got == exp
	    };
	'.

	prog := spec , code, verf.

	safe := prog solve.
	self assert: safe isSafe.

	self yourself.


	"
	verf := ΛκParser parse:'
	/*@ val verify : bv32 => bool[b|b] */
	    let verify = (x) => {
				let exp = bvadd32(x, bv32(2));
				let got = add2(x);
				got == exp
	    };
	'.

	"
]

{ #category : #'tests - examples' }
TRSymbolicCompilationTests >> test_mul2_02 [
	| bldr spec code verf prog safe |

	compilation config optimizationPasses: { TRILXmul2Xshl }.

	bldr := compilation builder.
	bldr defineName: 'mul2' type: Int32.
	bldr defineParameter: 'x' type: Int32.
	bldr ireturn:
		{ bldr imul:
			{ bldr iload: 'x' .
			  bldr iconst: 2 } }.

	compilation optimize.
	compilation compile.

	spec := TRILSpecification new prog.
	code := compilation codegen prog.
	verf := TRILSpecificationParser parse:'
	/*@ val verify : bool[b|b] */
	    let verify = {
				let exp = bvmul32(bv32(10),bv32(2));
				let got = mul2(bv32(10));
				got == exp
	    };
	'.

	prog := spec , code, verf.

	safe := prog solve.
	self assert: safe isSafe.

	self yourself.
]

{ #category : #'tests - examples' }
TRSymbolicCompilationTests >> test_mul4_01 [
	| comp bldr spec code verf prog safe |

	comp := TRCompilation forTarget: TRSymbolic default.
	comp config optimizationPasses: { TRILXmul2Xshl }.

	bldr := comp builder.
	bldr defineName: 'mul4' type: Int32.
	bldr defineParameter: 'x' type: Int32.
	bldr ireturn:
		{ bldr imul:
			{ bldr iload: 'x' .
			  bldr iconst: 4 } }.

	comp optimize.
	comp compile.
	code := comp codegen prog.

	"== verify ================="

	spec := TRILSpecification new prog.

	verf := TRILSpecificationParser parse:'
	/*@ val verify : Int32 => bool[b|b] */
	    let verify = (x) => {
				let orig = bvmul32(x, bv32(4));
				let opt = mul4(x);
				orig == opt
	    };
	'.

	prog := spec , "code1," code , verf.

	safe := prog solve.
	self assert: safe isSafe.



]

{ #category : #'tests - examples' }
TRSymbolicCompilationTests >> test_shl2_01 [
	| bldr spec code verf prog safe |

	bldr := compilation builder.
	bldr defineName: 'shl2' type: Int32.
	bldr defineParameter: 'x' type: Int32.
	bldr ireturn:
		{ bldr ishl:
			{ bldr iload: 'x' .
			  bldr iconst: 2 } }.

	compilation optimize.
	compilation compile.

	spec := TRILSpecification new prog.
	code := compilation codegen prog.
	verf := TRILSpecificationParser parse:'
	/*@ val verify : Int32 => bool[b|b] */
	    let verify = (x) => {
				let exp = bvshl32(x,bv32(2));
				let got = shl2(x);
				got == exp
	    };
	'.

	prog := spec , code, verf.

	safe := prog solve.
	self assert: safe isSafe.

	self yourself.
]
