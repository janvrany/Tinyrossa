"
Read Time-Stamp Counter
"
Class {
	#name : #AJx86RDTSC,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86RDTSC class >> description [
	^ #(#rdtsc #emit 0 0 "R" 0 "C1" 16r00000F31 0 )
]

{ #category : #accessing }
AJx86RDTSC class >> mnemonic [
	^ #rdtsc
]

{ #category : #accessing }
AJx86RDTSC >> is32BitOnly [
	^ false
]

{ #category : #accessing }
AJx86RDTSC >> is64BitOnly [
	^ false
]

{ #category : #accessing }
AJx86RDTSC >> opCode [
	^ 16rF31
]
