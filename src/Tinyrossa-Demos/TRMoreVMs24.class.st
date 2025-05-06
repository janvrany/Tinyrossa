Class {
	#name : #TRMoreVMs24,
	#superclass : #TestCase,
	#instVars : [
		'debugging',
		'shell'
	],
	#pools : [
		'TRDataTypes'
	],
	#category : #'Tinyrossa-Demos'
}

{ #category : #accessing }
TRMoreVMs24 class >> testSelectors [
	^ self selectors select: [ :each | each beginsWith:'example' ]
]

{ #category : #running }
TRMoreVMs24 >> debug [
	^[
		debugging := true.
		super debug.
	] ensure:[
		debugging := false.
	]
]

{ #category : #examples }
TRMoreVMs24 >> example01_add2_riscv64 [
	| comp bldr spec code verf prog safe dbg |

	comp := TRCompilation forTarget: TRRV64GLinux default"TRPPC64Linux default".

	bldr := comp builder.
	bldr defineName: 'add2' type: Int32.
	bldr defineParameter: 'x' type: Int32.
	bldr ireturn:
		{ bldr iadd:
			{ bldr iload: 'x' .
			  bldr iconst: 2 } }.

	comp optimize.
	comp compile.

	Halt if: debugging.

	"
	shell := 	TRCompilationTestShell forTarget: comp config target.
	dbg := shell debugger.
	dbg memoryAt: shell nzone put: comp codeBuffer bytes.
	dbg setRegister: 'a0' to: -3.

	dbg c.
	self assert: (dbg getRegister: 'a0') equals: 0 abs.
	"


]

{ #category : #examples }
TRMoreVMs24 >> example02_add2 [
	| comp bldr spec code verf prog safe |

	comp := TRCompilation forTarget: TRSymbolic default.

	bldr := comp builder.
	bldr defineName: 'add2' type: Int32.
	bldr defineParameter: 'x' type: Int32.
	bldr ireturn:
		{ bldr iadd:
			{ bldr iload: 'x' .
			  bldr iconst: 2 } }.

	comp optimize.
	comp compile.

	spec := TRILSpecification new prog.
	code := comp codegen prog.
	verf := TRILSpecificationParser parse:'
	/*@ val test : bool[b|b] */
	    let test = {
				let x = bv32(4);
				let exp = bv32(6);
				let got = add2(x);
				got == exp
	    };
	
	/*@ val verify : Int32 => bool[b|b] */
	    let verify = (x) => {
				let exp = bvadd32(x,bv32(2));
				let got = add2(x);
				got == exp
	    };
	'.

	prog := spec , code, verf.

	safe := prog solve.
	self assert: safe isSafe.

	Halt if: debugging

]

{ #category : #examples }
TRMoreVMs24 >> example03_add2_again [
	| comp bldr spec code verf prog safe |

	comp := TRCompilation forTarget: TRSymbolic default.

	"add2(x) { t = (x * 2) + 20; return t - x - 18; }"
	bldr := comp builder.
	bldr defineName: 'add2' type: Int32.
	bldr defineParameter: 'x' type: Int32.
	bldr defineAutomatic: 't' type: Int32.
	bldr istore: {
		bldr iadd: {
			bldr imul: {
				bldr iload: 'x' .
				bldr iconst: 2 }.
			  bldr iconst: 20 }.
		"=>" 't'}.

	bldr ireturn: {
		bldr isub: {
			bldr isub: {
				bldr iload: 't' .
				bldr iload: 'x' }.
			bldr iconst: 18 } }.

	comp optimize.
	comp compile.

	spec := TRILSpecification new prog.
	code := comp codegen prog.
	verf := TRILSpecificationParser parse:'
	/*@ val verify : Int32 => bool[b|b] */
	    let verify = (x) => {
				let exp = bvadd32(x,bv32(2));
				let got = add2(x);
				got == exp
	    };
	'.

	prog := spec , code, verf.

	safe := prog solve.
	self assert: safe isSafe.

	Halt if: debugging

]

{ #category : #examples }
TRMoreVMs24 >> example03_add2_again_no_opt [
	| comp bldr spec code verf prog safe |

	comp := TRCompilation forTarget: TRSymbolic default.
	comp config optimizationPasses: { }.

	"add2(x) { t = (x * 2) + 20; return t - x - 18; }"
	bldr := comp builder.
	bldr defineName: 'add2' type: Int32.
	bldr defineParameter: 'x' type: Int32.
	bldr defineAutomatic: 't' type: Int32.
	bldr istore: {
		bldr iadd: {
			bldr imul: {
				bldr iload: 'x' .
				bldr iconst: 2 }.
			  bldr iconst: 20 }.
		"=>" 't'}.

	bldr ireturn: {
		bldr isub: {
			bldr isub: {
				bldr iload: 't' .
				bldr iload: 'x' }.
			bldr iconst: 18 } }.

	comp optimize.
	comp compile.

	spec := TRILSpecification new prog.
	code := comp codegen prog.
	verf := TRILSpecificationParser parse:'
	/*@ val verify : Int32 => bool[b|b] */
	    let verify = (x) => {
				let exp = bvadd32(x,bv32(2));
				let got = add2(x);
				got == exp
	    };
	'.

	prog := spec , code, verf.

	safe := prog solve.
	self assert: safe isSafe.

	Halt if: debugging

]

{ #category : #examples }
TRMoreVMs24 >> example04_abs [
	| comp bldr spec code verf prog safe  |

	comp := TRCompilation forTarget: TRSymbolic default.

	bldr := comp builder.
	bldr defineName: 'abs' type: Int32.
	bldr defineParameter: 'x' type: Int32.
	"if (x < 0) {"
	bldr if: (bldr icmplt: { bldr iload:'x' . bldr iconst: 0 } )
		then: [:then |
			"return 0 - x;"
			then ireturn: {
				then isub: {
					then iconst: 0.
					then iload: 'x' }}
		"} else {"
		] else:[:else|
			"return x;"
			else ireturn: {
				else iload: 'x' }
		].

	comp optimize.
	comp compile.

	spec := TRILSpecification new prog.
	code := comp codegen prog.
	verf := TRILSpecificationParser parse:'
	/*@ val verify : Int32 => bool[b|b] */
	    let verify = (x) => {
				let got = abs(x);
				bvge32(got, bv32(0))
	    };
	'.

	prog := spec , code, verf.

	safe := prog solve.
	self assert: safe isSafe.

	self yourself.
]

{ #category : #examples }
TRMoreVMs24 >> example05_mul4_shlopt [
	"
	Example of strength reduction.
	"
	| comp1 comp2 bldr spec code1 code2 verf prog safe |

	"== without any optimization =="

	comp1 := TRCompilation forTarget: TRSymbolic default.
	comp1 config optimizationPasses: {}.

	bldr := comp1 builder.
	bldr defineName: 'mul4_orig' type: Int32.
	bldr defineParameter: 'x' type: Int32.
	bldr ireturn:
		{ bldr imul:
			{ bldr iload: 'x' .
			  bldr iconst: 4 } }.

	comp1 optimize.
	comp1 compile.
	code1 := comp1 codegen prog.

	"== with mul-to-shl opt ======"

	comp2 := TRCompilation forTarget: TRSymbolic default.
	comp2 config optimizationPasses: { TRILXmul2Xshl }.

	bldr := comp2 builder.
	bldr defineName: 'mul4_opt' type: Int32.
	bldr defineParameter: 'x' type: Int32.
	bldr ireturn:
		{ bldr imul:
			{ bldr iload: 'x' .
			  bldr iconst: 4 } }.

	comp2 optimize.
	comp2 compile.
	code2 := comp2 codegen prog.

	"== verify ================="

	spec := TRILSpecification new prog.

	verf := TRILSpecificationParser parse:'
	/*@ val verify : Int32 => bool[b|b] */
	    let verify = (x) => {
				let orig = mul4_orig(x);
				let opt = mul4_opt(x);
				orig == opt
	    };
	'.

	prog := spec , code1, code2 , verf.

	safe := prog solve.
	self assert: safe isSafe.

	Halt if: debugging

]

{ #category : #running }
TRMoreVMs24 >> runCaseManaged [
	debugging == nil ifTrue:[debugging := false].
	^super runCaseManaged
]

{ #category : #running }
TRMoreVMs24 >> tearDown [
	super tearDown.
	shell notNil ifTrue: [
		shell tearDown.
		shell := nil.
	].
]
