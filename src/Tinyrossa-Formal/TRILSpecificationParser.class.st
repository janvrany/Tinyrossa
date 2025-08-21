Class {
	#name : #TRILSpecificationParser,
	#superclass : #'ΛοParser',
	#pools : [
		'TRDataTypes'
	],
	#category : #'Tinyrossa-Formal-Specification'
}

{ #category : #grammar }
TRILSpecificationParser >> ann [
	^ super ann
	/ (('/*@' asParser trim , annBody , '*/' asParser trim) ==> #second)
	
	"
	TRILSpecificationParser new ann parse:'⟦val main : int => Int8[v|v === (127///8)]⟧'	
	TRILSpecificationParser new ann parse:'  ⟦val main : int => Int8[v|v === (127///8)]⟧  '	
	TRILSpecificationParser new ann parse:'  /*@ val main : int => Int8[v|v === (127///8)] */  '
	TRILSpecificationParser new ann parse:'⟦reflect ificmplt : BitVec(Size32) => BitVec(Size32) => bool⟧'
	TRILSpecificationParser new ann parse:'⟦reflect ificmplt : Int32 => Int32 => bool⟧'
	ΛκParser new ann parse:'⟦reflect ificmplt : BitVec(Size32) => BitVec(Size32) => bool⟧'
	
	"
]

{ #category : #grammar }
TRILSpecificationParser >> prog [ 	
	^super prog end
]

{ #category : #grammar }
TRILSpecificationParser >> rbase [
	^ ('Int8'  asParser , refTop    ==> [:_ | Int8    asRType: _ second ])
	/ ('Int16' asParser , refTop    ==> [:_ | Int16   asRType: _ second ])
	/ ('Int32' asParser , refTop    ==> [:_ | Int32   asRType: _ second ])
	/ ('Int64' asParser , refTop    ==> [:_ | Int64   asRType: _ second ])
	/ ('Address' asParser , refTop  ==> [:_ | Address asRType: _ second ])
	/ super rbase

	"
	TRILSpecificationParser new rbase parse:'int'
	TRILSpecificationParser new rbase parse:'Int32'
	
	TRILSpecificationParser new rtype parse:'Int32'
	TRILSpecificationParser new rtype parse:'Int32[r|r === (0 /// 32)]'
	TRILSpecificationParser new rtype parse:'BitVec(Size32)[r|r === (0 /// 32)]'
	ΛκParser new rtype parse:'BitVec(Size32)[r|r === (0 /// 32)]'
	TRILSpecificationParser new rtype parse:'c1:Int32 => c2:Int32 => Int32[r|r === (c1 + c2)]'
	"
]
