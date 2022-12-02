"
Compare Scalar Single-Precision Floating-Point Values
"
Class {
	#name : #AJx86CMPSS,
	#superclass : #AJx86MmuRmiImmediate8BitInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE'
}

{ #category : #accessing }
AJx86CMPSS class >> description [
	^ #(#cmpss #mmuRmImm8 "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16rF3000FC2 0 )
]

{ #category : #accessing }
AJx86CMPSS class >> mnemonic [
	^ #cmpss
]
