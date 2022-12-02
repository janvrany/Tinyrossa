"
Conditional Move if Overflow (OF=1)
"
Class {
	#name : #AJx86CMOVO,
	#superclass : #AJx86RrmInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86CMOVO class >> description [
	^ #(#cmovo #rrm 0 0 "R" 0 "C1" 16r00000F40 0 )
]

{ #category : #accessing }
AJx86CMOVO class >> mnemonic [
	^ #cmovo
]

{ #category : #accessing }
AJx86CMOVO >> opCode1 [
	^ 16rF40
]
