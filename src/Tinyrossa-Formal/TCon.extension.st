Extension { #name : #TCon }

{ #category : #'*Tinyrossa-Formal' }
TCon >> makeExpr: value [
	c = 'BitVec' ifTrue:[
		^ ΛEApp expr: (EImm imm: (EVar of: 'toBitVector'))
		         imm: (ECon prim: (PInt integer: value))
	].

	self shouldBeImplemented
]
