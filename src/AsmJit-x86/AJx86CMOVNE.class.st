"
Conditional Move if not Equal (ZF=0)
"
Class {
	#name : #AJx86CMOVNE,
	#superclass : #AJx86RrmInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86CMOVNE class >> description [
	^ #(#cmovne #rrm 0 0 "R" 0 "C1" 16r00000F45 0 )
]

{ #category : #accessing }
AJx86CMOVNE class >> mnemonic [
	^ #cmovne
]

{ #category : #accessing }
AJx86CMOVNE >> opCode1 [
	^ 16rF45
]
