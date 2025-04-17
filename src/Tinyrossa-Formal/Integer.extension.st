Extension { #name : #Integer }

{ #category : #'*Tinyrossa-Formal' }
Integer >> asExpr: base [
	"Return receiver as Refinement's `ECon` of given `base` type."

	^base makeExpr: self

]

{ #category : #'*Tinyrossa-Formal' }
Integer >> asΛExpr: base [
	"Return receiver as Sprite's `ΛExpression` of given `base` type."

	^EImm imm: (self asExpr:base)
]
