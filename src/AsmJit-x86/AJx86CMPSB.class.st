"
Compare String Byte
"
Class {
	#name : #AJx86CMPSB,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86CMPSB class >> description [
	^ #(#cmpsb #emit 0 0 "R" 0 "C1" 16r000000A6 0 )
]

{ #category : #accessing }
AJx86CMPSB class >> mnemonic [
	^ #cmpsb
]

{ #category : #accessing }
AJx86CMPSB >> is32BitOnly [
	^ false
]

{ #category : #accessing }
AJx86CMPSB >> is64BitOnly [
	^ false
]

{ #category : #accessing }
AJx86CMPSB >> opCode [
	^ 16rA6
]
