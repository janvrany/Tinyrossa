"
Double-Precision Shift Left
"
Class {
	#name : #AJx86SHLD,
	#superclass : #AJx86ShiftDoubleInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86SHLD class >> description [
	^ #(#shld #shldShrd 0 0 "R" 0 "C1" 16r00000FA4 0 )
]

{ #category : #accessing }
AJx86SHLD class >> mnemonic [
	^ #shld
]

{ #category : #accessing }
AJx86SHLD >> opCode1 [
	^ 16rFA4
]
