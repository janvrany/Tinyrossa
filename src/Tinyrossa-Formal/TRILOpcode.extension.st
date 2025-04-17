Extension { #name : #TRILOpcode }

{ #category : #'*Tinyrossa-Formal' }
TRILOpcode >> asΛEApp: arguments [
	"Return ΛEApp computing the value of this opcode given `arguments`"

	| spec args |

	spec := EImm imm: (EVar of: name).
	args := arguments collect:#asExpr.

	^ ΛEApp mkEApp: spec args: args



]
