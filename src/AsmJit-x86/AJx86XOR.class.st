"
Logical Exclusive OR
"
Class {
	#name : #AJx86XOR,
	#superclass : #AJx86AluInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86XOR class >> description [
	^ #(#xor #alu 0 0 "R" 6 "C1" 16r00000030 "C2" 16r00000080 )
]

{ #category : #accessing }
AJx86XOR class >> mnemonic [
	^ #xor
]

{ #category : #accessing }
AJx86XOR >> opCode [
	^ 16r30
]

{ #category : #accessing }
AJx86XOR >> opCode2 [
	^ 16r80
]
