"
Conditional Move if Above (CF = 0 and ZF = 0)
"
Class {
	#name : #AJx86CMOVA,
	#superclass : #AJx86RrmInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86CMOVA class >> description [
	^ #(#cmova #rrm 0 0 "R" 0 "C1" 16r00000F47 0 )
]

{ #category : #accessing }
AJx86CMOVA class >> mnemonic [
	^ #cmova
]

{ #category : #accessing }
AJx86CMOVA >> opCode1 [
	^ 16rF47
]
