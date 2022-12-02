"
Convert with Truncation Scalar Double-Precision Floating-Point Values to Signed Doubleword Integers
"
Class {
	#name : #AJx86CVTTSD2SI,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE2'
}

{ #category : #accessing }
AJx86CVTTSD2SI class >> description [
	^ #(#cvttsd2si #mmurmi "op1" 2r1100 "op2" 2r1100000 "R" 0 "C1" 16rF2000F2C 0 )
]

{ #category : #accessing }
AJx86CVTTSD2SI class >> mnemonic [
	^ #cvttsd2si
]
