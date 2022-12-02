"
Convert Doubleword Integer to Scalar Double-Precision Floating-Point Value
"
Class {
	#name : #AJx86CVTSI2SD,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE2'
}

{ #category : #accessing }
AJx86CVTSI2SD class >> description [
	^ #(#cvtsi2sd #mmurmi "op1" 2r100000 "op2" 2r1001100 "R" 0 "C1" 16rF2000F2A 0 )
]

{ #category : #accessing }
AJx86CVTSI2SD class >> mnemonic [
	^ #cvtsi2sd
]
