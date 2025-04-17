Extension { #name : #'ΛBase' }

{ #category : #'*Tinyrossa-Formal' }
ΛBase >> makeExpr: value [
	"Return value as Refinement's `ECon` of the same (base) type as receiver"

	^self subclassResponsibility

]
