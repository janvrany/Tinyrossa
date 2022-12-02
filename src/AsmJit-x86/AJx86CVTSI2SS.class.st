"
Convert Doubleword Integer to Scalar Single-Precision Floating-Point Value
"
Class {
	#name : #AJx86CVTSI2SS,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE'
}

{ #category : #accessing }
AJx86CVTSI2SS class >> description [
	^ #(#cvtsi2ss #mmurmi "op1" 2r100000 "op2" 2r1001100 "R" 0 "C1" 16rF3000F2A 0 )
]

{ #category : #accessing }
AJx86CVTSI2SS class >> mnemonic [
	^ #cvtsi2ss
]
