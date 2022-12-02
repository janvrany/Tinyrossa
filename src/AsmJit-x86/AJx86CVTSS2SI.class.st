"
Convert Scalar Single-Precision Floating-Point Value to Scalar Doubleword Integer
"
Class {
	#name : #AJx86CVTSS2SI,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE'
}

{ #category : #accessing }
AJx86CVTSS2SI class >> description [
	^ #(#cvtss2si #mmurmi "op1" 2r1100 "op2" 2r1100000 "R" 0 "C1" 16rF3000F2D 0 )
]

{ #category : #accessing }
AJx86CVTSS2SI class >> mnemonic [
	^ #cvtss2si
]
