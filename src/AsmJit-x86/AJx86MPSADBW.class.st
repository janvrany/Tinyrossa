"
Compute Multiple Packed Sums of Absolute Difference
"
Class {
	#name : #AJx86MPSADBW,
	#superclass : #AJx86MmuRmiImmediate8BitInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE4.1'
}

{ #category : #accessing }
AJx86MPSADBW class >> description [
	^ #(#mpsadbw #mmuRmImm8 "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r660F3A42 0 )
]

{ #category : #accessing }
AJx86MPSADBW class >> mnemonic [
	^ #mpsadbw
]
