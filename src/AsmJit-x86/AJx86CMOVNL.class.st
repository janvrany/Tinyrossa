"
Conditional Move if not Less (SF=OF)
"
Class {
	#name : #AJx86CMOVNL,
	#superclass : #AJx86RrmInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86CMOVNL class >> description [
	^ #(#cmovnl #rrm 0 0 "R" 0 "C1" 16r00000F4D 0 )
]

{ #category : #accessing }
AJx86CMOVNL class >> mnemonic [
	^ #cmovnl
]

{ #category : #accessing }
AJx86CMOVNL >> opCode1 [
	^ 16rF4D
]
