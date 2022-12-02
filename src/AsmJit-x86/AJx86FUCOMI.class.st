"
Unordered Compare Floating-Point Values and Set EFLAGS
"
Class {
	#name : #AJx86FUCOMI,
	#superclass : #AJx87StiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FUCOMI class >> description [
	^ #(#fucomi #x87sti 0 0 "R" 0 "C1" 16r0000DBE8 0 )
]

{ #category : #accessing }
AJx86FUCOMI class >> mnemonic [
	^ #fucomi
]

{ #category : #accessing }
AJx86FUCOMI >> opCode1 [
	^ 16rDBE8
]
