"
Conditional Move if not Above (CF = 1 or ZF = 1)
"
Class {
	#name : #AJx86CMOVNA,
	#superclass : #AJx86RrmInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86CMOVNA class >> description [
	^ #(#cmovna #rrm 0 0 "R" 0 "C1" 16r00000F46 0 )
]

{ #category : #accessing }
AJx86CMOVNA class >> mnemonic [
	^ #cmovna
]

{ #category : #accessing }
AJx86CMOVNA >> opCode1 [
	^ 16rF46
]
