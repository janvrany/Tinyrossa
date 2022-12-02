"
Compare Scalar Ordered Single-Precision Floating-Point Values and Set EFLAGS
"
Class {
	#name : #AJx86COMISS,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE'
}

{ #category : #accessing }
AJx86COMISS class >> description [
	^ #(#comiss #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r00000F2F 0 )
]

{ #category : #accessing }
AJx86COMISS class >> mnemonic [
	^ #comiss
]
