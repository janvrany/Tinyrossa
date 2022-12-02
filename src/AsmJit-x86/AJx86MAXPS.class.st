"
Return Maximum Packed Single-Precision Floating-Point Values
"
Class {
	#name : #AJx86MAXPS,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE'
}

{ #category : #accessing }
AJx86MAXPS class >> description [
	^ #(#maxps #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r00000F5F 0 )
]

{ #category : #accessing }
AJx86MAXPS class >> mnemonic [
	^ #maxps
]
