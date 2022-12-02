"
Subtract Scalar Double-Precision Floating-Point Values
"
Class {
	#name : #AJx86SUBSD,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE2'
}

{ #category : #accessing }
AJx86SUBSD class >> description [
	^ #(#subsd #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16rF2000F5C 0 )
]

{ #category : #accessing }
AJx86SUBSD class >> mnemonic [
	^ #subsd
]
