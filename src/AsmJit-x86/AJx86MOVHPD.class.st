"
Move High Packed Double-Precision Flaoting-Point Value Quadwords
"
Class {
	#name : #AJx86MOVHPD,
	#superclass : #AJx86MmuMovInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE2'
}

{ #category : #accessing }
AJx86MOVHPD class >> description [
	^ #(#movhpd #mmuMov "op1" 2r1100000 "op2" 2r1100000 "R" 0 "C1" 16r66000F16 "C2" 16r66000F17 )
]

{ #category : #accessing }
AJx86MOVHPD class >> mnemonic [
	^ #movhpd
]
