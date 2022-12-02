"
Move Packed Single-Precision Floating-Point Values High Quadwords to Low Quadwords
"
Class {
	#name : #AJx86MOVHLPS,
	#superclass : #AJx86MmuMovInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE'
}

{ #category : #accessing }
AJx86MOVHLPS class >> description [
	^ #(#movhlps #mmuMov "op1" 2r100000 "op2" 2r100000 "R" 0 "C1" 16r00000F12 0 )
]

{ #category : #accessing }
AJx86MOVHLPS class >> mnemonic [
	^ #movhlps
]
