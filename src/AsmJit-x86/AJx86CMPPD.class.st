"
Compare Packed Double-Precision Floating-Point Values
"
Class {
	#name : #AJx86CMPPD,
	#superclass : #AJx86MmuRmiImmediate8BitInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE2'
}

{ #category : #accessing }
AJx86CMPPD class >> description [
	^ #(#cmppd #mmuRmImm8 "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r66000FC2 0 )
]

{ #category : #accessing }
AJx86CMPPD class >> mnemonic [
	^ #cmppd
]
