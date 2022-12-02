"
Divide Scalar Double-Precision Floating-Point Values
"
Class {
	#name : #AJx86DIVSD,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE2'
}

{ #category : #accessing }
AJx86DIVSD class >> description [
	^ #(#divsd #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16rF2000F5E 0 )
]

{ #category : #accessing }
AJx86DIVSD class >> mnemonic [
	^ #divsd
]
