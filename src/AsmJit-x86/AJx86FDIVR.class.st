"
Floating-Point Reverse Divide
"
Class {
	#name : #AJx86FDIVR,
	#superclass : #AJx87FpuInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FDIVR class >> description [
	^ #(#fdivr #x87fpu 0 0 "R" 7 "C1" 16rD8DCF8F0 0 )
]

{ #category : #accessing }
AJx86FDIVR class >> mnemonic [
	^ #fdivr
]

{ #category : #accessing }
AJx86FDIVR >> opCode1 [
	^ 16rD8DCF8F0
]

{ #category : #accessing }
AJx86FDIVR >> opCodeR [
	^ 16r7
]
