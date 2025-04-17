Extension { #name : #TBase }

{ #category : #'*Tinyrossa-Formal' }
TBase >> makeExpr: value [
	^ EImm imm: (b makeExpr: value)
]
