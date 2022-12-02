"
Shuffle Packed Double-Precision Floating-Point Values
"
Class {
	#name : #AJx86SHUFPD,
	#superclass : #AJx86MmuRmiImmediate8BitInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE'
}

{ #category : #accessing }
AJx86SHUFPD class >> mnemonic [
	^ #shufpd
]
