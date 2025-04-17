Class {
	#name : #TRILSpecificationTest,
	#superclass : #SpriteLangTest,
	#category : #'Tinyrossa-Tests-Formal'
}

{ #category : #asserting }
TRILSpecificationTest >> assertSafe: prog [
	[
		| safe |
		safe := prog solve.
		self assert: safe isSafe
	] runReader: #bvLengthInference initialState: BvLengthInference new

]

{ #category : #asserting }
TRILSpecificationTest >> assertUnsafe: prog [
	[
		| unsafe |
		unsafe := prog solve.
		self deny: unsafe isSafe.
		unsafe bads do:[ :bad | self assert: (bad value value isKindOf: Z3Model) ]
	] runReader: #bvLengthInference initialState: BvLengthInference new
]

{ #category : #doodles }
TRILSpecificationTest >> test_iadd [
	| spec test |

	spec := TRILSpecification new prog.
	test := TRILSpecificationParser parse:'
	/*@ val check01 : bool[b|b] */
	    let check01 = {
				let two = toBitVector(2);
				let got = iadd(two, two);
				let exp = toBitVector(4);
				got == exp
	};

	/*@ val check02 : Int32 => Int32 => bool[b|b] */
	    let check02 = (x , y) => {
				let got = iadd(x, y);
				let exp = bvadd(x,y);
				got == exp
	};

	'.

	self assertSafe: (spec , test)

]

{ #category : #doodles }
TRILSpecificationTest >> test_iload [
	| spec test |

	spec := TRILSpecification new prog.
	test := TRILSpecificationParser parse:'
	/*@ val check01 : bool[b|b] */
	    let check01 = {
				let two = toBitVector(2);

				let got = iload(two);
				let exp = toBitVector(2);
				got == exp
	};

	/*@ val check02 : Int32 => bool[b|b] */
	    let check02 = (x) => {
				let got = iload(x);
				let exp = x;
				got == exp
	};

	'.

	self assertSafe: (spec , test).

]

{ #category : #doodles }
TRILSpecificationTest >> test_imul [
	| spec test |

	spec := TRILSpecification new prog.
	test := TRILSpecificationParser parse:'
	/*@ val check01 : bool[b|b] */
	    let check01 = {
				let two = toBitVector(2);
				let got = imul(two, two);
				let exp = toBitVector(4);
				got == exp
	};

	/*@ val check02 : Int32 => Int32 => bool[b|b] */
	    let check02 = (x , y) => {
				let got = imul(x, y);
				let exp = bvmul(x,y);
				got == exp
	};

	'.

	self assertSafe: (spec , test).

]

{ #category : #doodles }
TRILSpecificationTest >> test_ireturn [
	| spec test |

	spec := TRILSpecification new prog.
	test := TRILSpecificationParser parse:'
	/*@ val check01 : bool[b|b] */
	    let check01 = {
				let two = toBitVector(2);
				let got = ireturn(two);
				let exp = toBitVector(2);
				got == exp
	};

	/*@ val check02 : Int32 => bool[b|b] */
	    let check02 = (x) => {
				let got = ireturn(x);
				let exp = x;
				got == exp
	};

	'.

	self assertSafe: (spec , test).

]

{ #category : #doodles }
TRILSpecificationTest >> test_ishl [
	| spec test |

	spec := TRILSpecification new prog.
	test := TRILSpecificationParser parse:'
	/*@ val check01 : bool[b|b] */
	    let check01 = {
				let one = toBitVector(1);
				let two = toBitVector(2);
				let got = ishl(two, one);
				let exp = toBitVector(4);
				got == exp
	};
	'.
	'

	/*@ val check02 : Int32 => Int32 => bool[b|b] */
	    let check02 = (x , y) => {
				let got = iadd(x, y);
				let exp = bvadd(x,y);
				got == exp
	};

	'.

	self assertSafe: (spec , test).

]

{ #category : #doodles }
TRILSpecificationTest >> test_istore [
	| spec test |

	spec := TRILSpecification new prog.
	test := TRILSpecificationParser parse:'
	/*@ val check01 : bool[b|b] */
	    let check01 = {
				let two = toBitVector(2);
				let got = istore(two);
				let exp = toBitVector(2);
				got == exp
	};

	/*@ val check02 : Int32 => bool[b|b] */
	    let check02 = (x) => {
				let got = istore(x);
				let exp = x;
				got == exp
	};

	'.

	self assertSafe: (spec , test).

]
