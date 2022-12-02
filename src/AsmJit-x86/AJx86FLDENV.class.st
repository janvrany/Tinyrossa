"
Load x87 FPU Environment
"
Class {
	#name : #AJx86FLDENV,
	#superclass : #AJx86MemoryInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FLDENV class >> description [
	^ #(#fldenv #mem "op1" 2r1000000 0 "R" 4 "C1" 16r000000D9 0 )
]

{ #category : #accessing }
AJx86FLDENV class >> mnemonic [
	^ #fldenv
]

{ #category : #accessing }
AJx86FLDENV >> opCode1 [
	^ 16rD9
]

{ #category : #accessing }
AJx86FLDENV >> opCode2 [
	^ 16r0
]

{ #category : #accessing }
AJx86FLDENV >> opCodeR [
	^ 16r4
]
