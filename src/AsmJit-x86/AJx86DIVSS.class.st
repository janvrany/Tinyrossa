"
Divide Scalar Single-Precision Floating-Point Values
"
Class {
	#name : #AJx86DIVSS,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE'
}

{ #category : #accessing }
AJx86DIVSS class >> description [
	^ #(#divss #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16rF3000F5E 0 )
]

{ #category : #accessing }
AJx86DIVSS class >> mnemonic [
	^ #divss
]
