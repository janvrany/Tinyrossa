"
Floating-Point Compare
"
Class {
	#name : #AJx86FCOM,
	#superclass : #AJx87FpuInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FCOM class >> description [
	^ #(#fcom #x87fpu 0 0 "R" 2 "C1" 16rD8DCD0D0 0 )
]

{ #category : #accessing }
AJx86FCOM class >> mnemonic [
	^ #fcom
]

{ #category : #accessing }
AJx86FCOM >> opCode1 [
	^ 16rD8DCD0D0
]

{ #category : #accessing }
AJx86FCOM >> opCodeR [
	^ 16r2
]
