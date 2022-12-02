"
Unordered Compare Scalar Single-Precision Floating-Point Values and Set EFLAGS
"
Class {
	#name : #AJx86UCOMISS,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE'
}

{ #category : #accessing }
AJx86UCOMISS class >> description [
	^ #(#ucomiss #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r00000F2E 0 )
]

{ #category : #accessing }
AJx86UCOMISS class >> mnemonic [
	^ #ucomiss
]
