"
Conditional Move if not Less or Equal (ZF=0 SF=OF)
"
Class {
	#name : #AJx86CMOVNLE,
	#superclass : #AJx86RrmInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86CMOVNLE class >> description [
	^ #(#cmovnle #rrm 0 0 "R" 0 "C1" 16r00000F4F 0 )
]

{ #category : #accessing }
AJx86CMOVNLE class >> mnemonic [
	^ #cmovnle
]

{ #category : #accessing }
AJx86CMOVNLE >> opCode1 [
	^ 16rF4F
]
