"
Dot Product of Packed Double-Precision Floating-Point Values
"
Class {
	#name : #AJx86DPPD,
	#superclass : #AJx86MmuRmiImmediate8BitInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE4.1'
}

{ #category : #accessing }
AJx86DPPD class >> description [
	^ #(#dppd #mmuRmImm8 "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r660F3A41 0 )
]

{ #category : #accessing }
AJx86DPPD class >> mnemonic [
	^ #dppd
]
