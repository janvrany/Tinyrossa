"
Conditional Move if not Greater (ZF=1 or SF~~OF)
"
Class {
	#name : #AJx86CMOVNG,
	#superclass : #AJx86RrmInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86CMOVNG class >> description [
	^ #(#cmovng #rrm 0 0 "R" 0 "C1" 16r00000F4E 0 )
]

{ #category : #accessing }
AJx86CMOVNG class >> mnemonic [
	^ #cmovng
]

{ #category : #accessing }
AJx86CMOVNG >> opCode1 [
	^ 16rF4E
]
