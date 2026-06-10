Extension { #name : #TRFunctionSymbol }

{ #category : #'*Tinyrossa-Formal' }
TRFunctionSymbol >> asΛEApp: arguments [
	"Return ΛEApp representing call to given function"

	| cont args |

	cont := EImm imm: (EVar of: name).
	args := arguments collect:#asExpr.

	^ ΛEApp mkEApp: cont args: args

]
