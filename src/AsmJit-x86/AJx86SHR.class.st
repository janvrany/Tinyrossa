"
Shift Logical Right
"
Class {
	#name : #AJx86SHR,
	#superclass : #AJx86RotInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86SHR class >> description [
	^ #(#shr #rot 0 0 "R" 5 0 0 )
]

{ #category : #accessing }
AJx86SHR class >> mnemonic [
	^ #shr
]

{ #category : #accessing }
AJx86SHR >> opCodeR [
	^ 16r5
]
