"
Floating-Point Load Binary Coded Decimal
"
Class {
	#name : #AJx86FBLD,
	#superclass : #AJx86MemoryInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FBLD class >> description [
	^ #(#fbld #mem "op1" 2r1000000 0 "R" 4 "C1" 16r000000DF 0 )
]

{ #category : #accessing }
AJx86FBLD class >> mnemonic [
	^ #fbld
]

{ #category : #accessing }
AJx86FBLD >> opCode1 [
	^ 16rDF
]

{ #category : #accessing }
AJx86FBLD >> opCode2 [
	^ 16r0
]

{ #category : #accessing }
AJx86FBLD >> opCodeR [
	^ 16r4
]
