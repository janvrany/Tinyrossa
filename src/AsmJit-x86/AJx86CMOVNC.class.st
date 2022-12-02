"
Conditional Move if not Carry (CF=0)
"
Class {
	#name : #AJx86CMOVNC,
	#superclass : #AJx86RrmInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86CMOVNC class >> description [
	^ #(#cmovnc #rrm 0 0 "R" 0 "C1" 16r00000F43 0 )
]

{ #category : #accessing }
AJx86CMOVNC class >> mnemonic [
	^ #cmovnc
]

{ #category : #accessing }
AJx86CMOVNC >> opCode1 [
	^ 16rF43
]
