"
Packed Multiply Hihgh with Round and Scale
"
Class {
	#name : #AJx86PMULHRSW,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSSE3'
}

{ #category : #accessing }
AJx86PMULHRSW class >> description [
	^ #(#pmulhrsw #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r000F380B 0 )
]

{ #category : #accessing }
AJx86PMULHRSW class >> mnemonic [
	^ #pmulhrsw
]
