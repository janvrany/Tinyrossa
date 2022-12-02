"
Store x87 FPU Environment
"
Class {
	#name : #AJx86FNSTENV,
	#superclass : #AJx86MemoryInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FNSTENV class >> description [
	^ #(#fnstenv #mem "op1" 2r1000000 0 "R" 6 "C1" 16r000000D9 0 )
]

{ #category : #accessing }
AJx86FNSTENV class >> mnemonic [
	^ #fnstenv
]

{ #category : #accessing }
AJx86FNSTENV >> opCode1 [
	^ 16rD9
]

{ #category : #accessing }
AJx86FNSTENV >> opCode2 [
	^ 16r0
]

{ #category : #accessing }
AJx86FNSTENV >> opCodeR [
	^ 16r6
]
