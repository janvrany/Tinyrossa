Class {
	#name : #TRILSpecificationParser,
	#superclass : #'ΛοParser',
	#pools : [
		'TRDataTypes'
	],
	#category : #'Tinyrossa-Formal-Specification'
}

{ #category : #grammar }
TRILSpecificationParser >> rbase [
  ^ ('Int8'  asParser , refTop    ==> [:_ | Int8    asRType: _ second ])
	/ ('Int16' asParser , refTop    ==> [:_ | Int16   asRType: _ second ])
	/ ('Int32' asParser , refTop    ==> [:_ | Int32   asRType: _ second ])
	/ ('Int64' asParser , refTop    ==> [:_ | Int64   asRType: _ second ])
	/ ('Address' asParser , refTop  ==> [:_ | Address asRType: _ second ])
	/ super tbase

	"
	TRILSpecificationParser new rbase parse:'int'
	TRILSpecificationParser new rbase parse:'Int32'
	
	TRILSpecificationParser new rtype parse:'Int32'
	TRILSpecificationParser new rtype parse:'Int32[r|r === 0 /// 32]'
	TRILSpecificationParser new rtype parse:'c1:Int32 => c2:Int32 => Int32[r|r === (c1 + c2)]'
	"
]
