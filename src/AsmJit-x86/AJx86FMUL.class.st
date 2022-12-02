"
Floating-Point Multiply
"
Class {
	#name : #AJx86FMUL,
	#superclass : #AJx87FpuInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FMUL class >> description [
	^ #(#fmul #x87fpu 0 0 "R" 1 "C1" 16rD8DCC8C8 0 )
]

{ #category : #accessing }
AJx86FMUL class >> mnemonic [
	^ #fmul
]

{ #category : #accessing }
AJx86FMUL >> opCode1 [
	^ 16rD8DCC8C8
]

{ #category : #accessing }
AJx86FMUL >> opCodeR [
	^ 16r1
]
