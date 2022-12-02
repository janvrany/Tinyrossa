"
Processor Identification
"
Class {
	#name : #AJx86CPUID,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86CPUID class >> description [
	^ #(#cpuid #emit 0 0 "R" 0 "C1" 16r00000FA2 0 )
]

{ #category : #accessing }
AJx86CPUID class >> mnemonic [
	^ #cpuid
]

{ #category : #accessing }
AJx86CPUID >> is32BitOnly [
	^ false
]

{ #category : #accessing }
AJx86CPUID >> is64BitOnly [
	^ false
]

{ #category : #accessing }
AJx86CPUID >> opCode [
	^ 16rFA2
]
