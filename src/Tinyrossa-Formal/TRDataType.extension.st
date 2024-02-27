Extension { #name : #TRDataType }

{ #category : #'*Tinyrossa-Formal' }
TRDataType >> asRType [
	"Return 'Sprite' refined type for this (Tinyrossa) datatype"

	^TBase b: self asΛBase r: Reft new known

	"
	Int32 asRType
	"
]

{ #category : #'*Tinyrossa-Formal' }
TRDataType >> asΛBase [
	"Return 'Sprite' type for this (Tinyrossa) datatype"

	self isIntegerType ifTrue:[
		^ TBitVector instance: self sizeInBytes * 8
	] ifFalse:[
		^ self subclassResponsibility
	]
]
