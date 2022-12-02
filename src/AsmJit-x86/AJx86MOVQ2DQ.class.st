"
Move Quadword from MMX to XMM
"
Class {
	#name : #AJx86MOVQ2DQ,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE2'
}

{ #category : #accessing }
AJx86MOVQ2DQ class >> description [
	^ #(#movq2dq #mmurmi "op1" 2r100000 "op2" 2r10000 "R" 0 "C1" 16rF3000FD6 0 )
]

{ #category : #accessing }
AJx86MOVQ2DQ class >> mnemonic [
	^ #movq2dq
]
