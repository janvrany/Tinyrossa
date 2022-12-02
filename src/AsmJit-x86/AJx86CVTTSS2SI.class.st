"
Convert with Truncation Scalar Single-Precision Floating-Point Values to Signed Doubleword Integers
"
Class {
	#name : #AJx86CVTTSS2SI,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE'
}

{ #category : #accessing }
AJx86CVTTSS2SI class >> description [
	^ #(#cvttss2si #mmurmi "op1" 2r1100 "op2" 2r1100000 "R" 0 "C1" 16rF3000F2C 0 )
]

{ #category : #accessing }
AJx86CVTTSS2SI class >> mnemonic [
	^ #cvttss2si
]
