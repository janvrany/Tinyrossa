"
Subtract
"
Class {
	#name : #AJx86SUB,
	#superclass : #AJx86AluInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86SUB class >> description [
	^ #(#sub #alu 0 0 "R" 5 "C1" 16r00000028 "C2" 16r00000080 )
]

{ #category : #accessing }
AJx86SUB class >> mnemonic [
	^ #sub
]

{ #category : #accessing }
AJx86SUB >> opCode [
	^ 16r28
]

{ #category : #accessing }
AJx86SUB >> opCode2 [
	^ 16r80
]
