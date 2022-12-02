"
Compute Reciprocals of Square Roots of Scalar Single-Precision Floating-Point Values
"
Class {
	#name : #AJx86RSQRTSS,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE'
}

{ #category : #accessing }
AJx86RSQRTSS class >> description [
	^ #(#rsqrtss #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16rF3000F52 0 )
]

{ #category : #accessing }
AJx86RSQRTSS class >> mnemonic [
	^ #rsqrtss
]
