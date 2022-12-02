"
Insert Word
"
Class {
	#name : #AJx86PINSRW,
	#superclass : #AJx86MmuRmiImmediate8BitInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE'
}

{ #category : #accessing }
AJx86PINSRW class >> description [
	^ #(#pinsrw #mmuRmImm8 "op1" 2r110000 "op2" 2r1000100 "R" 0 "C1" 16r00000FC4 0 )
]

{ #category : #accessing }
AJx86PINSRW class >> mnemonic [
	^ #pinsrw
]
