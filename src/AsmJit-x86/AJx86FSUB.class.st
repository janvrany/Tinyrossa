"
Floating-Point Subtract
"
Class {
	#name : #AJx86FSUB,
	#superclass : #AJx87FpuInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FSUB class >> description [
	^ #(#fsub #x87fpu 0 0 "R" 4 "C1" 16rD8DCE0E8 0 )
]

{ #category : #accessing }
AJx86FSUB class >> mnemonic [
	^ #fsub
]

{ #category : #accessing }
AJx86FSUB >> opCode1 [
	^ 16rD8DCE0E8
]

{ #category : #accessing }
AJx86FSUB >> opCodeR [
	^ 16r4
]
