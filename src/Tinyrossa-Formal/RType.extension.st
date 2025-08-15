Extension { #name : #RType }

{ #category : #'*Tinyrossa-Formal' }
RType >> makeExpr: value [
	"Return the value as Sprite's ΛExpression of receiver's type."

	^ self subclassResponsibility
]
