"
Floating-Point Divide
"
Class {
	#name : #AJx86FDIV,
	#superclass : #AJx87FpuInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FDIV class >> description [
	^ #(#fdiv #x87fpu 0 0 "R" 6 "C1" 16rD8DCF0F8 0 )
]

{ #category : #accessing }
AJx86FDIV class >> mnemonic [
	^ #fdiv
]

{ #category : #accessing }
AJx86FDIV >> opCode1 [
	^ 16rD8DCF0F8
]

{ #category : #accessing }
AJx86FDIV >> opCodeR [
	^ 16r6
]
