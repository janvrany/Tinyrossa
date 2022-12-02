"
Convert to Sign-Extended
"
Class {
	#name : #AJx86CDQE,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86CDQE class >> description [
	^ #(#cdqe #emit "op1" 2r100000000 0 "R" 0 "C1" 16r48000098 0 )
]

{ #category : #accessing }
AJx86CDQE class >> mnemonic [
	^ #cdqe
]

{ #category : #accessing }
AJx86CDQE >> is32BitOnly [
	^ false
]

{ #category : #accessing }
AJx86CDQE >> is64BitOnly [
	^ true
]

{ #category : #accessing }
AJx86CDQE >> opCode [
	^ 16r48000098
]
