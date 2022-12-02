"
Store x87 FPU Status Word
"
Class {
	#name : #AJx86FNSTSW,
	#superclass : #AJx87FstswInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FNSTSW class >> description [
	^ #(#fnstsw #x87fstsw "op1" 2r1000000 0 "R" 7 "C1" 16r000000DD "C2" 16r0000DFE0 )
]

{ #category : #accessing }
AJx86FNSTSW class >> mnemonic [
	^ #fnstsw
]
