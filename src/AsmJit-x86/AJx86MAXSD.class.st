"
Return Maximum Scalar Double-Precision Floating-Point Value
"
Class {
	#name : #AJx86MAXSD,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE2'
}

{ #category : #accessing }
AJx86MAXSD class >> description [
	^ #(#maxsd #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16rF2000F5F 0 )
]

{ #category : #accessing }
AJx86MAXSD class >> mnemonic [
	^ #maxsd
]
