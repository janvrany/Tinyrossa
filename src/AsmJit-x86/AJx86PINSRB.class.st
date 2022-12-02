"
Insert Byte
"
Class {
	#name : #AJx86PINSRB,
	#superclass : #AJx86MmuRmiImmediate8BitInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE4.1'
}

{ #category : #accessing }
AJx86PINSRB class >> description [
	^ #(#pinsrb #mmuRmImm8 "op1" 2r100000 "op2" 2r1000100 "R" 0 "C1" 16r660F3A20 0 )
]

{ #category : #accessing }
AJx86PINSRB class >> mnemonic [
	^ #pinsrb
]
