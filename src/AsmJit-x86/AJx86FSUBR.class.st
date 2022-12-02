"
Floating-Point Subtract Reverse Subtract
"
Class {
	#name : #AJx86FSUBR,
	#superclass : #AJx87FpuInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FSUBR class >> description [
	^ #(#fsubr #x87fpu 0 0 "R" 5 "C1" 16rD8DCE8E0 0 )
]

{ #category : #accessing }
AJx86FSUBR class >> mnemonic [
	^ #fsubr
]

{ #category : #accessing }
AJx86FSUBR >> opCode1 [
	^ 16rD8DCE8E0
]

{ #category : #accessing }
AJx86FSUBR >> opCodeR [
	^ 16r5
]
