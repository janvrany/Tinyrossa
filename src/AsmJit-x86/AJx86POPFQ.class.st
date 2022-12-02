"
Pop Top of Stack Zero Extended into EFLAGS Register
"
Class {
	#name : #AJx86POPFQ,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86POPFQ class >> description [
	^ #(#popfq #emit 0 0 "R" 0 "C1" 16r4800009D 0 )
]

{ #category : #accessing }
AJx86POPFQ class >> mnemonic [
	^ #popfq
]

{ #category : #accessing }
AJx86POPFQ >> is32BitOnly [
	^ false
]

{ #category : #accessing }
AJx86POPFQ >> is64BitOnly [
	^ false
]

{ #category : #accessing }
AJx86POPFQ >> opCode [
	^ 16r4800009D
]
