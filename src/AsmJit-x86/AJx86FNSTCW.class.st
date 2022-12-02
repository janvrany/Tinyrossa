"
Store x87 FPU Control Word
"
Class {
	#name : #AJx86FNSTCW,
	#superclass : #AJx86MemoryInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FNSTCW class >> description [
	^ #(#fnstcw #mem "op1" 2r1000000 0 "R" 7 "C1" 16r000000D9 0 )
]

{ #category : #accessing }
AJx86FNSTCW class >> mnemonic [
	^ #fnstcw
]

{ #category : #accessing }
AJx86FNSTCW >> opCode1 [
	^ 16rD9
]

{ #category : #accessing }
AJx86FNSTCW >> opCode2 [
	^ 16r0
]

{ #category : #accessing }
AJx86FNSTCW >> opCodeR [
	^ 16r7
]
