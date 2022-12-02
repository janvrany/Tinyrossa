"
Integer Subtraction with Borrow
"
Class {
	#name : #AJx86SBB,
	#superclass : #AJx86AluInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86SBB class >> description [
	^ #(#sbb #alu 0 0 "R" 3 "C1" 16r00000018 "C2" 16r00000080 )
]

{ #category : #accessing }
AJx86SBB class >> mnemonic [
	^ #sbb
]

{ #category : #accessing }
AJx86SBB >> opCode [
	^ 16r18
]

{ #category : #accessing }
AJx86SBB >> opCode2 [
	^ 16r80
]
