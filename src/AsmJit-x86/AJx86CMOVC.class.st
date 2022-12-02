"
Conditional Move if Carry (CF=1)
"
Class {
	#name : #AJx86CMOVC,
	#superclass : #AJx86RrmInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86CMOVC class >> description [
	^ #(#cmovc #rrm 0 0 "R" 0 "C1" 16r00000F42 0 )
]

{ #category : #accessing }
AJx86CMOVC class >> mnemonic [
	^ #cmovc
]

{ #category : #accessing }
AJx86CMOVC >> opCode1 [
	^ 16rF42
]
