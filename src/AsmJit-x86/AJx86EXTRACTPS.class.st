"
Extract Packed Single-Precision Floating-Point Value
"
Class {
	#name : #AJx86EXTRACTPS,
	#superclass : #AJx86MmuRmiImmediate8BitInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE4.1'
}

{ #category : #accessing }
AJx86EXTRACTPS class >> description [
	^ #(#extractps #mmuRmImm8 "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r660F3A17 0 )
]

{ #category : #accessing }
AJx86EXTRACTPS class >> mnemonic [
	^ #extractps
]
