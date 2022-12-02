"
Floating-Point Store x87 Status Word
"
Class {
	#name : #AJx86FSTSW,
	#superclass : #AJx87FstswInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FSTSW class >> description [
	^ #(#fstsw #x87fstsw "op1" 2r1000000 0 "R" 7 "C1" 16r9B0000DD "C2" 16r9B00DFE0 )
]

{ #category : #accessing }
AJx86FSTSW class >> mnemonic [
	^ #fstsw
]
