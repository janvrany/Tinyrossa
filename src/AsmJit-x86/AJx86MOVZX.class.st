"
Move with Zero-Extension
"
Class {
	#name : #AJx86MOVZX,
	#superclass : #AJx86MovSignOrZeroExtendedInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86MOVZX class >> description [
	^ #(#movzx #movSxZx 0 0 "R" 0 "C1" 16r00000FB6 0 )
]

{ #category : #accessing }
AJx86MOVZX class >> mnemonic [
	^ #movzx
]

{ #category : #accessing }
AJx86MOVZX >> opCode1 [
	^ 16rFB6
]
