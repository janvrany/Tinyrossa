"
Move Scalar Single-Precisiton Floating-Point Values
"
Class {
	#name : #AJx86MOVSS,
	#superclass : #AJx86MmuMovInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE'
}

{ #category : #accessing }
AJx86MOVSS class >> description [
	^ #(#movss #mmuMov "op1" 2r1100000 "op2" 2r1100000 "R" 0 "C1" 16rF3000F10 "C2" 16rF3000F11 )
]

{ #category : #accessing }
AJx86MOVSS class >> mnemonic [
	^ #movss
]
