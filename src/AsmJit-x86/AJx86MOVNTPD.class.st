"
Store Packed Double-Precision Floating-Point Values Using Non-Temporal Hint
"
Class {
	#name : #AJx86MOVNTPD,
	#superclass : #AJx86MmuMovInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE2'
}

{ #category : #accessing }
AJx86MOVNTPD class >> description [
	^ #(#movntpd #mmuMov "op1" 2r1000000 "op2" 2r100000 "R" 0 0 "C2" 16r66000F2B )
]

{ #category : #accessing }
AJx86MOVNTPD class >> mnemonic [
	^ #movntpd
]
