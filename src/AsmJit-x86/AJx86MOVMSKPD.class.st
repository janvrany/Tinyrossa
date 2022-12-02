"
Extract Packed Double-Precision Floating-Point Sign Mask
"
Class {
	#name : #AJx86MOVMSKPD,
	#superclass : #AJx86MmuMovInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE2'
}

{ #category : #accessing }
AJx86MOVMSKPD class >> description [
	^ #(#movmskpd #mmuMov "op1" 2r1101 "op2" 2r100000 "R" 0 "C1" 16r66000F50 0 )
]

{ #category : #accessing }
AJx86MOVMSKPD class >> mnemonic [
	^ #movmskpd
]
