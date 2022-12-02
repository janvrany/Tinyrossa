"
Return Maximum Scalar Single-Precision Floating-Point Value
"
Class {
	#name : #AJx86MAXSS,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE'
}

{ #category : #accessing }
AJx86MAXSS class >> description [
	^ #(#maxss #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16rF3000F5F 0 )
]

{ #category : #accessing }
AJx86MAXSS class >> mnemonic [
	^ #maxss
]
