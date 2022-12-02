"
Move Data After Swapping Bytes
"
Class {
	#name : #AJx86MOVBE,
	#superclass : #AJx86MovInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86MOVBE class >> description [
	^ #(#movbe #movbe "op1" 2r1001110 "op2" 2r1001110 "R" 0 "C1" 16r000F38F0 "C2" 16r000F38F1 )
]

{ #category : #accessing }
AJx86MOVBE class >> group [
	^ #movbe
]

{ #category : #accessing }
AJx86MOVBE class >> mnemonic [
	^ #movbe
]
