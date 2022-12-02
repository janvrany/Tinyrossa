"
Logical AMD
"
Class {
	#name : #AJx86AND,
	#superclass : #AJx86AluInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86AND class >> description [
	^ #(#and #alu 0 0 "R" 4 "C1" 16r00000020 "C2" 16r00000080 )
]

{ #category : #accessing }
AJx86AND class >> mnemonic [
	^ #and
]

{ #category : #accessing }
AJx86AND >> opCode [
	^ 16r20
]

{ #category : #accessing }
AJx86AND >> opCode2 [
	^ 16r80
]
