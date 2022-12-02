"
Rotate Left
"
Class {
	#name : #AJx86RCL,
	#superclass : #AJx86RotInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86RCL class >> description [
	^ #(#rcl #rot 0 0 "R" 2 0 0 )
]

{ #category : #accessing }
AJx86RCL class >> mnemonic [
	^ #rcl
]

{ #category : #accessing }
AJx86RCL >> opCodeR [
	^ 16r2
]
