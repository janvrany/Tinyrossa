"
Conditional Move if Greater (ZF=0 and SF=OF)
"
Class {
	#name : #AJx86CMOVG,
	#superclass : #AJx86RrmInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86CMOVG class >> description [
	^ #(#cmovg #rrm 0 0 "R" 0 "C1" 16r00000F4F 0 )
]

{ #category : #accessing }
AJx86CMOVG class >> mnemonic [
	^ #cmovg
]

{ #category : #accessing }
AJx86CMOVG >> opCode1 [
	^ 16rF4F
]
