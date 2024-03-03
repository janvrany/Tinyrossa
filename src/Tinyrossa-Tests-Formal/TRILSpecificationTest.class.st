Class {
	#name : #TRILSpecificationTest,
	#superclass : #SpriteLangTest,
	#category : #'Tinyrossa-Tests-Formal'
}

{ #category : #doodles }
TRILSpecificationTest >> test_iadd [
	| spec test |
	
	spec := TRILSpecification new prog.
	test := TRILSpecificationParser parse:'
	/*@ val check01 : bool[b|b] */
	    let check01 = { 
				let got = iadd(bv32(2), bv32(2));
				let exp = bv32(4);
				got == exp
	};
	
	/*@ val check02 : Int32 => Int32 => bool[b|b] */
	    let check02 = (x , y) => { 
				let got = iadd(x, y);
				let exp = bvadd32(x,y);
				got == exp
	};
	
	'.
	
	self assert: (spec , test) solve isSafe.
	
]

{ #category : #doodles }
TRILSpecificationTest >> test_iload [
	| spec test |
	
	spec := TRILSpecification new prog.
	test := TRILSpecificationParser parse:'
	/*@ val check01 : bool[b|b] */
	    let check01 = { 
				let got = iload(bv32(2));
				let exp = bv32(2);
				got == exp
	};
	
	/*@ val check02 : Int32 => bool[b|b] */
	    let check02 = (x) => { 
				let got = iload(x);
				let exp = x;
				got == exp
	};
	
	'.
	
	self assert: (spec , test) solve isSafe.
	
]

{ #category : #doodles }
TRILSpecificationTest >> test_imul [
	| spec test |

	spec := TRILSpecification new prog.
	test := TRILSpecificationParser parse:'
	/*@ val check01 : bool[b|b] */
	    let check01 = {
				let got = imul(bv32(2), bv32(2));
				let exp = bv32(4);
				got == exp
	};

	/*@ val check02 : Int32 => Int32 => bool[b|b] */
	    let check02 = (x , y) => {
				let got = imul(x, y);
				let exp = bvmul32(x,y);
				got == exp
	};

	'.

	self assert: (spec , test) solve isSafe.

]

{ #category : #doodles }
TRILSpecificationTest >> test_ireturn [
	| spec test |
	
	spec := TRILSpecification new prog.
	test := TRILSpecificationParser parse:'
	/*@ val check01 : bool[b|b] */
	    let check01 = { 
				let got = ireturn(bv32(2));
				let exp = bv32(2);
				got == exp
	};
	
	/*@ val check02 : Int32 => bool[b|b] */
	    let check02 = (x) => { 
				let got = ireturn(x);
				let exp = x;
				got == exp
	};
	
	'.
	
	self assert: (spec , test) solve isSafe.
	
]

{ #category : #doodles }
TRILSpecificationTest >> test_ishl [
	| spec test |

	spec := TRILSpecification new prog.
	test := TRILSpecificationParser parse:'
	/*@ val check01 : bool[b|b] */
	    let check01 = {
				let got = ishl(bv32(2), bv32(1));
				let exp = bv32(4);
				got == exp
	};
	'.
	'

	/*@ val check02 : Int32 => Int32 => bool[b|b] */
	    let check02 = (x , y) => {
				let got = iadd(x, y);
				let exp = bvadd32(x,y);
				got == exp
	};

	'.

	self assert: (spec , test) solve isSafe.

]

{ #category : #doodles }
TRILSpecificationTest >> test_istore [
	| spec test |
	
	spec := TRILSpecification new prog.
	test := TRILSpecificationParser parse:'
	/*@ val check01 : bool[b|b] */
	    let check01 = { 
				let got = istore(bv32(2));
				let exp = bv32(2);
				got == exp
	};
	
	/*@ val check02 : Int32 => bool[b|b] */
	    let check02 = (x) => { 
				let got = istore(x);
				let exp = x;
				got == exp
	};
	
	'.
	
	self assert: (spec , test) solve isSafe.
	
]
