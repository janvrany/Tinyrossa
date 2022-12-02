Extension { #name : #ByteSymbol }

{ #category : #'*AsmJit-Extension' }
ByteSymbol >> asAJOperand [
	"Convert receiver into operand: a signed immediate"
	^ AJLabel new label: self
]
