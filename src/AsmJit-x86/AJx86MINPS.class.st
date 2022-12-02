"
Return Minimum Packed Single-Precision Floating-Point Values
"
Class {
	#name : #AJx86MINPS,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE'
}

{ #category : #accessing }
AJx86MINPS class >> description [
	^ #(#minps #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r00000F5D 0 )
]

{ #category : #accessing }
AJx86MINPS class >> mnemonic [
	^ #minps
]
