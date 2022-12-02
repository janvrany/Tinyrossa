"
Extract Byte
"
Class {
	#name : #AJx86PEXTRB,
	#superclass : #AJx86MmuPextrInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE4.1'
}

{ #category : #accessing }
AJx86PEXTRB class >> description [
	^ #(#pextrb #mmuPextr "op1" 2r1000101 "op2" 2r100000 "R" 0 "C1" 16r000F3A14 0 )
]

{ #category : #accessing }
AJx86PEXTRB class >> mnemonic [
	^ #pextrb
]
