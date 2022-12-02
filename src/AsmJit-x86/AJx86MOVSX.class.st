"
Move with Sign-Extension
"
Class {
	#name : #AJx86MOVSX,
	#superclass : #AJx86MovSignOrZeroExtendedInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86MOVSX class >> description [
	^ #(#movsx #movSxZx 0 0 "R" 0 "C1" 16r00000FBE 0 )
]

{ #category : #accessing }
AJx86MOVSX class >> mnemonic [
	^ #movsx
]

{ #category : #accessing }
AJx86MOVSX >> opCode1 [
	^ 16rFBE
]
