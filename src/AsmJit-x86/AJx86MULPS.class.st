"
Multiply Packed Single-Precision Floating-Point Values
"
Class {
	#name : #AJx86MULPS,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE'
}

{ #category : #accessing }
AJx86MULPS class >> description [
	^ #(#mulps #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16rF3000F59 0 )
]

{ #category : #accessing }
AJx86MULPS class >> mnemonic [
	^ #mulps
]
