"
Packed Shuffle High Words
"
Class {
	#name : #AJx86PSHUFHW,
	#superclass : #AJx86MmuRmiImmediate8BitInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE2'
}

{ #category : #accessing }
AJx86PSHUFHW class >> description [
	^ #(#pshufhw #mmuRmImm8 "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16rF3000F70 0 )
]

{ #category : #accessing }
AJx86PSHUFHW class >> mnemonic [
	^ #pshufhw
]
