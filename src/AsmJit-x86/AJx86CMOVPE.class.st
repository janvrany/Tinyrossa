"
Conditional Move if Parity Even (PF=1)
"
Class {
	#name : #AJx86CMOVPE,
	#superclass : #AJx86RrmInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86CMOVPE class >> description [
	^ #(#cmovpe #rrm 0 0 "R" 0 "C1" 16r00000F4A 0 )
]

{ #category : #accessing }
AJx86CMOVPE class >> mnemonic [
	^ #cmovpe
]

{ #category : #accessing }
AJx86CMOVPE >> opCode1 [
	^ 16rF4A
]
