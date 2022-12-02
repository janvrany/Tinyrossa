"
Double-Precision Shift Right
"
Class {
	#name : #AJx86SHRD,
	#superclass : #AJx86ShiftDoubleInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86SHRD class >> description [
	^ #(#shrd #shldShrd 0 0 "R" 0 "C1" 16r00000FAC 0 )
]

{ #category : #accessing }
AJx86SHRD class >> mnemonic [
	^ #shrd
]

{ #category : #accessing }
AJx86SHRD >> opCode1 [
	^ 16rFAC
]
