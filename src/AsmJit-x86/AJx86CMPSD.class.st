"
Compare String Doubleword
"
Class {
	#name : #AJx86CMPSD,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE2'
}

{ #category : #accessing }
AJx86CMPSD class >> description [
	^ #(#cmpsd #emit 0 0 "R" 0 "C1" 16r000000A7 0 )
]

{ #category : #accessing }
AJx86CMPSD class >> mnemonic [
	^ #cmpsd
]

{ #category : #accessing }
AJx86CMPSD >> is32BitOnly [
	^ false
]

{ #category : #accessing }
AJx86CMPSD >> is64BitOnly [
	^ false
]

{ #category : #accessing }
AJx86CMPSD >> opCode [
	^ 16rA7
]
