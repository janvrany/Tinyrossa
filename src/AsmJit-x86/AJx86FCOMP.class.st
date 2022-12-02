"
Floating-Point Compare and Pop Register Stack
"
Class {
	#name : #AJx86FCOMP,
	#superclass : #AJx87FpuInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FCOMP class >> description [
	^ #(#fcomp #x87fpu 0 0 "R" 3 "C1" 16rD8DCD8D8 0 )
]

{ #category : #accessing }
AJx86FCOMP class >> mnemonic [
	^ #fcomp
]

{ #category : #accessing }
AJx86FCOMP >> opCode1 [
	^ 16rD8DCD8D8
]

{ #category : #accessing }
AJx86FCOMP >> opCodeR [
	^ 16r3
]
