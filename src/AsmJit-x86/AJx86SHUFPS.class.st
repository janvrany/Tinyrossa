"
Shuffle Packed Double-Precision Floating-Point Values
"
Class {
	#name : #AJx86SHUFPS,
	#superclass : #AJx86MmuRmiImmediate8BitInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE'
}

{ #category : #accessing }
AJx86SHUFPS class >> description [
	^ #(#shufps #mmuRmImm8 "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r00000FC6 0 )
]

{ #category : #accessing }
AJx86SHUFPS class >> mnemonic [
	^ #shufps
]

{ #category : #accessing }
AJx86SHUFPS >> opCode [
	^ 16r660FC6
]
