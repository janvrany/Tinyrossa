Extension { #name : #TRLabelSymbol }

{ #category : #'*Tinyrossa-Formal' }
TRLabelSymbol >> asΛEApp: arguments [
	"Return ΛEApp representing continuation given label"

	| cont args |

	(block notNil and:[block == block cfg entry]) ifTrue:[
		cont := EImm imm: (EVar of: block compilation functionSymbol name).
	] ifFalse: [
		cont := EImm imm: (EVar of: name).
	].
	args := arguments collect:#asExpr.

	^ ΛEApp mkEApp: cont args: args

]
