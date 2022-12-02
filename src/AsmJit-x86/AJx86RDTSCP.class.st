"
Read Time-Stamp Counter and Processor ID
"
Class {
	#name : #AJx86RDTSCP,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86RDTSCP class >> description [
	^ #(#rdtscp #emit 0 0 "R" 0 "C1" 16r000F01F9 0 )
]

{ #category : #accessing }
AJx86RDTSCP class >> mnemonic [
	^ #rdtscp
]

{ #category : #accessing }
AJx86RDTSCP >> is32BitOnly [
	^ false
]

{ #category : #accessing }
AJx86RDTSCP >> is64BitOnly [
	^ false
]

{ #category : #accessing }
AJx86RDTSCP >> opCode [
	^ 16rF01F9
]
