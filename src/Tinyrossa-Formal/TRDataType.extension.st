Extension { #name : #TRDataType }

{ #category : #'*Tinyrossa-Formal' }
TRDataType >> asRType [
	"Return 'Sprite' refined type for this (Tinyrossa) datatype"

	^self asRType: Reft new known

	"
	Int32 asRType
	"
]

{ #category : #'*Tinyrossa-Formal' }
TRDataType >> asRType: reft [
	"Return 'Sprite' refined type for this (Tinyrossa) datatype"

	self isIntegerType ifTrue:[
		^ TCon c: 'BitVec'
		      ts: { TBvSize length: self sizeInBytes * 8 }
		     ars: #()
		       r: reft
	].

	self shouldBeImplemented. 

	"
	Int32 asRType
	"
]
