"
Compare
"
Class {
	#name : #AJx86CMP,
	#superclass : #AJx86AluInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86CMP class >> description [
	^ #(#cmp #alu 0 0 "R" 7 "C1" 16r00000038 "C2" 16r00000080 )
]

{ #category : #accessing }
AJx86CMP class >> mnemonic [
	^ #cmp
]

{ #category : #accessing }
AJx86CMP >> opCode [
	^ 16r38
]

{ #category : #accessing }
AJx86CMP >> opCode2 [
	^ 16r80
]
