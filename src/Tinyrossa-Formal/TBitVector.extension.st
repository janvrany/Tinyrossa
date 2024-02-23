Extension { #name : #TBitVector }

{ #category : #'*Tinyrossa-Formal' }
TBitVector >> makeExpr: value [
	^ECon prim: (PBitVector length: length value: value)
]
