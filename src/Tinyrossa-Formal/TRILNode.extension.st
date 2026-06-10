Extension { #name : #TRILNode }

{ #category : #'*Tinyrossa-Formal' }
TRILNode >> asExpr [
	"Return node's value (result) as Refinement's `EVar`.

   Caller must ensure node has been evaluated and `let`ed prior
   use of returned `EVar`."

	self assert: opcode type ~~ Void.
	self assert: result notNil.
	self assert:(result isKindOf: ELet).

	^EVar of: result decl bind id.
]

{ #category : #'*Tinyrossa-Formal' }
TRILNode >> setResultUnchecked: anELet [
	result := anELet.
]
