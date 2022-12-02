"
Conditional Move if not Parity (PF=0)
"
Class {
	#name : #AJx86CMOVNP,
	#superclass : #AJx86RrmInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86CMOVNP class >> description [
	^ #(#cmovnp #rrm 0 0 "R" 0 "C1" 16r00000F4B 0 )
]

{ #category : #accessing }
AJx86CMOVNP class >> mnemonic [
	^ #cmovnp
]

{ #category : #accessing }
AJx86CMOVNP >> opCode1 [
	^ 16rF4B
]
