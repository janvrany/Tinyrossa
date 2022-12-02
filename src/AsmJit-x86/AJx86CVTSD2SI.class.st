"
Convert Scalar Double-Precision Floating-Point Value to Packed Doubleword Integer

"
Class {
	#name : #AJx86CVTSD2SI,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE2'
}

{ #category : #accessing }
AJx86CVTSD2SI class >> description [
	^ #(#cvtsd2si #mmurmi "op1" 2r1100 "op2" 2r1100000 "R" 0 "C1" 16rF2000F2D 0 )
]

{ #category : #accessing }
AJx86CVTSD2SI class >> mnemonic [
	^ #cvtsd2si
]
