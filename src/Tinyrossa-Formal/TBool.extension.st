Extension { #name : #TBool }

{ #category : #'*Tinyrossa-Formal' }
TBool >> makeExpr: value [
	^ECon prim: (PBool bool: value)
]
