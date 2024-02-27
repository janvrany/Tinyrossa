Class {
	#name : #TRILSpecificationParser,
	#superclass : #'ΛκParser',
	#pools : [
		'TRDataTypes'
	],
	#category : #'Tinyrossa-Formal-Specification'
}

{ #category : #grammar }
TRILSpecificationParser >> tbase [
	^ super tbase 
	/ ('Int8'  asParser ==> [:_ | Int8  asΛBase ])
	/ ('Int16' asParser ==> [:_ | Int16 asΛBase ])
	/ ('Int32' asParser ==> [:_ | Int32 asΛBase ])
	/ ('Int64' asParser ==> [:_ | Int64 asΛBase ])
	/ ('Address' asParser ==> [:_ | Address asΛBase ])

	"
	TRILSpecificationParser new tbase parse:'int'
	TRILSpecificationParser new tbase parse:'Int32'
	
	TRILSpecificationParser new rtype parse:'Int32'
	TRILSpecificationParser new rtype parse:'c1:Int32 => c2:Int32 => Int32[r|r === (c1 + c2)]'
	"
]
