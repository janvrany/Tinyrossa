"
Conditional Move if not Zero (ZF=0)
"
Class {
	#name : #AJx86CMOVNZ,
	#superclass : #AJx86RrmInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86CMOVNZ class >> description [
	^ #(#cmovnz #rrm 0 0 "R" 0 "C1" 16r00000F45 0 )
]

{ #category : #accessing }
AJx86CMOVNZ class >> mnemonic [
	^ #cmovnz
]

{ #category : #accessing }
AJx86CMOVNZ >> opCode1 [
	^ 16rF45
]
