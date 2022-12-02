"
Convert Scalar Single-Precision Floating-Point Value to Scalar Double-Precision Floating-Point Value
"
Class {
	#name : #AJx86CVTSS2SD,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE2'
}

{ #category : #accessing }
AJx86CVTSS2SD class >> description [
	^ #(#cvtss2sd #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16rF3000F5A 0 )
]

{ #category : #accessing }
AJx86CVTSS2SD class >> mnemonic [
	^ #cvtss2sd
]
