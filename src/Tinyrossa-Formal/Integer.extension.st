Extension { #name : #Integer }

{ #category : #'*Tinyrossa-Formal' }
Integer >> asExpr: rtype [
	"Return receiver as Sprite's ΛExpression of given type."

	^rtype makeExpr: self

]

{ #category : #'*Tinyrossa-Formal' }
Integer >> asΛExpr: base [
	"Return receiver as Sprite's `ΛExpression` of given `base` type."

	^EImm imm: (self asExpr:base)
]
