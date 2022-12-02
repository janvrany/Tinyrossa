"
Roudn Packed Single-Precision Floating-Point Values
"
Class {
	#name : #AJx86ROUNDPS,
	#superclass : #AJx86MmuRmiImmediate8BitInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE4.1'
}

{ #category : #accessing }
AJx86ROUNDPS class >> description [
	^ #(#roundps #mmuRmImm8 "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r660F3A08 0 )
]

{ #category : #accessing }
AJx86ROUNDPS class >> mnemonic [
	^ #roundps
]
