Extension { #name : #TRLabelSymbol }

{ #category : #'*Tinyrossa-Formal' }
TRLabelSymbol >> asΛEApp: arguments [
	"Return ΛEApp representing continuation given label"

	| cont args |

	cont := EImm imm: (EVar of: name).
	args := arguments collect:#asExpr.

	^ ΛEApp mkEApp: cont args: args

]
