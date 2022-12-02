"
Signed or Unsigned Add
"
Class {
	#name : #AJx86ADD,
	#superclass : #AJx86AluInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86ADD class >> description [
	^ #(#add #alu 0 0 "R" 0 0 "C2" 16r00000080 )
]

{ #category : #accessing }
AJx86ADD class >> mnemonic [
	^ #add
]

{ #category : #accessing }
AJx86ADD >> opCode [
	^ 16r0
]

{ #category : #accessing }
AJx86ADD >> opCode2 [
	^ 16r80
]
