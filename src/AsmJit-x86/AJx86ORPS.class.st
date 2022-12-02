"
Bitwise Logical OR of Single-Precision Floating-Point Values
"
Class {
	#name : #AJx86ORPS,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE'
}

{ #category : #accessing }
AJx86ORPS class >> description [
	^ #(#orps #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r00000F56 0 )
]

{ #category : #accessing }
AJx86ORPS class >> mnemonic [
	^ #orps
]
