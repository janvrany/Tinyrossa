"
Unordered Compare Floating-Point Values, Set EFLAGS and Pop
"
Class {
	#name : #AJx86FUCOMIP,
	#superclass : #AJx87StiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FUCOMIP class >> description [
	^ #(#fucomip #x87sti 0 0 "R" 0 "C1" 16r0000DFE8 0 )
]

{ #category : #accessing }
AJx86FUCOMIP class >> mnemonic [
	^ #fucomip
]

{ #category : #accessing }
AJx86FUCOMIP >> opCode1 [
	^ 16rDFE8
]
