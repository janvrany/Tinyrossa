"
Shift Arithmetic Right
"
Class {
	#name : #AJx86SAR,
	#superclass : #AJx86RotInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86SAR class >> description [
	^ #(#sar #rot 0 0 "R" 7 0 0 )
]

{ #category : #accessing }
AJx86SAR class >> mnemonic [
	^ #sar
]

{ #category : #accessing }
AJx86SAR >> opCodeR [
	^ 16r7
]
