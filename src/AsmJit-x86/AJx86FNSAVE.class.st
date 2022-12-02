"
Restore X87 FPU State
"
Class {
	#name : #AJx86FNSAVE,
	#superclass : #AJx86MemoryInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FNSAVE class >> description [
	^ #(#fnsave #mem "op1" 2r1000000 0 "R" 6 "C1" 16r000000DD 0 )
]

{ #category : #accessing }
AJx86FNSAVE class >> mnemonic [
	^ #fnsave
]

{ #category : #accessing }
AJx86FNSAVE >> opCode1 [
	^ 16rDD
]

{ #category : #accessing }
AJx86FNSAVE >> opCode2 [
	^ 16r0
]

{ #category : #accessing }
AJx86FNSAVE >> opCodeR [
	^ 16r6
]
