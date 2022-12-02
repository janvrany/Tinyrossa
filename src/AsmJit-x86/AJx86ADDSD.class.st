"
Add Scalar Double-Precision Floating-Point Values
"
Class {
	#name : #AJx86ADDSD,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE2'
}

{ #category : #accessing }
AJx86ADDSD class >> description [
	^ #(#addsd #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16rF2000F58 0 )
]

{ #category : #accessing }
AJx86ADDSD class >> mnemonic [
	^ #addsd
]
