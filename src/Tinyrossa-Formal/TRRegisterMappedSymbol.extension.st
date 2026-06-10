Extension { #name : #TRRegisterMappedSymbol }

{ #category : #'*Tinyrossa-Formal' }
TRRegisterMappedSymbol >> asExpr [
	"Return symbol's value as Refinement's `EVar`."

	^EVar of: name.

]
