Extension { #name : #TInt }

{ #category : #'*Tinyrossa-Formal' }
TInt >> makeExpr: value [
	^ECon prim: (PInt integer: value)
]
