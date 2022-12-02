"
Store Packed Single-Precision Floating-Point Values Using Non-Temporal Hint
"
Class {
	#name : #AJx86MOVNTPS,
	#superclass : #AJx86MmuMovInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE'
}

{ #category : #accessing }
AJx86MOVNTPS class >> description [
	^ #(#movntps #mmuMov "op1" 2r1000000 "op2" 2r100000 "R" 0 0 "C2" 16r00000F2B )
]

{ #category : #accessing }
AJx86MOVNTPS class >> mnemonic [
	^ #movntps
]
