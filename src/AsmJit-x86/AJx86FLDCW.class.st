"
Load x87 FPU Control Word
"
Class {
	#name : #AJx86FLDCW,
	#superclass : #AJx86MemoryInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FLDCW class >> description [
	^ #(#fldcw #mem "op1" 2r1000000 0 "R" 5 "C1" 16r000000D9 0 )
]

{ #category : #accessing }
AJx86FLDCW class >> mnemonic [
	^ #fldcw
]

{ #category : #accessing }
AJx86FLDCW >> opCode1 [
	^ 16rD9
]

{ #category : #accessing }
AJx86FLDCW >> opCode2 [
	^ 16r0
]

{ #category : #accessing }
AJx86FLDCW >> opCodeR [
	^ 16r5
]
