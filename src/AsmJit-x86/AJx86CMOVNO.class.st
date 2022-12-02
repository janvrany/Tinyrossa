"
Conditional Move if not Overflow (OF=0)
"
Class {
	#name : #AJx86CMOVNO,
	#superclass : #AJx86RrmInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86CMOVNO class >> description [
	^ #(#cmovno #rrm 0 0 "R" 0 "C1" 16r00000F41 0 )
]

{ #category : #accessing }
AJx86CMOVNO class >> mnemonic [
	^ #cmovno
]

{ #category : #accessing }
AJx86CMOVNO >> opCode1 [
	^ 16rF41
]
