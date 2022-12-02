"
Compare Packed Single-Precision Floating-Point Values
"
Class {
	#name : #AJx86CMPPS,
	#superclass : #AJx86MmuRmiImmediate8BitInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE'
}

{ #category : #accessing }
AJx86CMPPS class >> description [
	^ #(#cmpps #mmuRmImm8 "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r00000FC2 0 )
]

{ #category : #accessing }
AJx86CMPPS class >> mnemonic [
	^ #cmpps
]
