Extension { #name : #TRILBlock }

{ #category : #'*Tinyrossa-Formal' }
TRILBlock >> asΛEApp: arguments [
	"Return ΛEApp representing continuation given label"

	| cont args |

	self == cfg entry ifTrue:[
		cont := EImm imm: (EVar of: self compilation functionSymbol name).
	] ifFalse:[
		cont := EImm imm: (EVar of: name).
	].

	args := arguments collect:#asExpr.

	^ ΛEApp mkEApp: cont args: args

]

{ #category : #'*Tinyrossa-Formal' }
TRILBlock >> isLetRec [
	self == cfg entry ifTrue:[
		^self compilation functionSymbol isUsed.
	].

	^ cfg loops anySatisfy: [ :loop | loop includes: self ].
]
