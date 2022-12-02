"
Conditional Move if Less (SF ~~ OF)
"
Class {
	#name : #AJx86CMOVL,
	#superclass : #AJx86RrmInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86CMOVL class >> description [
	^ #(#cmovl #rrm 0 0 "R" 0 "C1" 16r00000F4C 0 )
]

{ #category : #accessing }
AJx86CMOVL class >> mnemonic [
	^ #cmovl
]

{ #category : #accessing }
AJx86CMOVL >> opCode1 [
	^ 16rF4C
]
