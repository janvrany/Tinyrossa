"
Exchange and Add
"
Class {
	#name : #AJx86XADD,
	#superclass : #AJx86RmrInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86XADD class >> description [
	^ #(#xadd #rmr 0 0 "R" 0 "C1" 16r00000FC0 0 )
]

{ #category : #accessing }
AJx86XADD class >> mnemonic [
	^ #xadd
]

{ #category : #accessing }
AJx86XADD >> opCode1 [
	^ 16rFC0
]
