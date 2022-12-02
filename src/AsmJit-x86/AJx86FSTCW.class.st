"
Floating-Point Store x87 FPU Control Word
"
Class {
	#name : #AJx86FSTCW,
	#superclass : #AJx86MemoryInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FSTCW class >> description [
	^ #(#fstcw #mem "op1" 2r1000000 0 "R" 7 "C1" 16r9B0000D9 0 )
]

{ #category : #accessing }
AJx86FSTCW class >> mnemonic [
	^ #fstcw
]

{ #category : #accessing }
AJx86FSTCW >> opCode1 [
	^ 16r9B0000D9
]

{ #category : #accessing }
AJx86FSTCW >> opCode2 [
	^ 16r0
]

{ #category : #accessing }
AJx86FSTCW >> opCodeR [
	^ 16r7
]
