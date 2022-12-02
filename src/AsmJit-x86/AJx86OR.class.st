"
Logical Inclusive OR
"
Class {
	#name : #AJx86OR,
	#superclass : #AJx86AluInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86OR class >> description [
	^ #(#or #alu 0 0 "R" 1 "C1" 16r00000008 "C2" 16r00000080 )
]

{ #category : #accessing }
AJx86OR class >> mnemonic [
	^ #or
]

{ #category : #accessing }
AJx86OR >> opCode [
	^ 16r8
]

{ #category : #accessing }
AJx86OR >> opCode2 [
	^ 16r80
]
