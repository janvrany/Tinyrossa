"
Compare Scalar Ordered Double-Precision Floating-Point Values and Set EFLAGS
"
Class {
	#name : #AJx86COMISD,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE2'
}

{ #category : #accessing }
AJx86COMISD class >> description [
	^ #(#comisd #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r66000F2F 0 )
]

{ #category : #accessing }
AJx86COMISD class >> mnemonic [
	^ #comisd
]
