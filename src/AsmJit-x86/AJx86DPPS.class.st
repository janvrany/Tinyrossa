"
Dot Product of Packed Single-Precision Floating-Point Values
"
Class {
	#name : #AJx86DPPS,
	#superclass : #AJx86MmuRmiImmediate8BitInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE4.1'
}

{ #category : #accessing }
AJx86DPPS class >> description [
	^ #(#dpps #mmuRmImm8 "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r660F3A40 0 )
]

{ #category : #accessing }
AJx86DPPS class >> mnemonic [
	^ #dpps
]
