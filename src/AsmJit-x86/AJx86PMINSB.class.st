"
Minimum of Packed Signed Byte Integers
"
Class {
	#name : #AJx86PMINSB,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE4.1'
}

{ #category : #accessing }
AJx86PMINSB class >> description [
	^ #(#pminsb #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r660F3838 0 )
]

{ #category : #accessing }
AJx86PMINSB class >> mnemonic [
	^ #pminsb
]
