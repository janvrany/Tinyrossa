"
Conditional Move if Less or Equal (ZF=1 or SF ~~ OF)
"
Class {
	#name : #AJx86CMOVLE,
	#superclass : #AJx86RrmInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86CMOVLE class >> description [
	^ #(#cmovle #rrm 0 0 "R" 0 "C1" 16r00000F4E 0 )
]

{ #category : #accessing }
AJx86CMOVLE class >> mnemonic [
	^ #cmovle
]

{ #category : #accessing }
AJx86CMOVLE >> opCode1 [
	^ 16rF4E
]
