"
Floating-Point Add
"
Class {
	#name : #AJx86FADD,
	#superclass : #AJx87FpuInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FADD class >> description [
	^ #(#fadd #x87fpu 0 0 "R" 0 "C1" 16rD8DCC0C0 0 )
]

{ #category : #accessing }
AJx86FADD class >> mnemonic [
	^ #fadd
]

{ #category : #accessing }
AJx86FADD >> opCode1 [
	^ 16rD8DCC0C0
]

{ #category : #accessing }
AJx86FADD >> opCodeR [
	^ 16r0
]
