"
Move Low Packed Double-Precision Floating-Point Quadwords Value
"
Class {
	#name : #AJx86MOVLPD,
	#superclass : #AJx86MmuMovInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE2'
}

{ #category : #accessing }
AJx86MOVLPD class >> description [
	^ #(#movlpd #mmuMov "op1" 2r1100000 "op2" 2r1100000 "R" 0 "C1" 16r66000F12 "C2" 16r66000F13 )
]

{ #category : #accessing }
AJx86MOVLPD class >> mnemonic [
	^ #movlpd
]
