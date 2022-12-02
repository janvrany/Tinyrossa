"
Convert Scalar Double-Precision Floating-Point Value to Scalar Single-Precision Floating-Point Value
"
Class {
	#name : #AJx86CVTSD2SS,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE'
}

{ #category : #accessing }
AJx86CVTSD2SS class >> description [
	^ #(#cvtsd2ss #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16rF2000F5A 0 )
]

{ #category : #accessing }
AJx86CVTSD2SS class >> mnemonic [
	^ #cvtsd2ss
]
