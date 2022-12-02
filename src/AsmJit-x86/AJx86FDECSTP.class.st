"
Floating-Point Decrement Stack-Top Pointer
"
Class {
	#name : #AJx86FDECSTP,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FDECSTP class >> description [
	^ #(#fdecstp #emit 0 0 "R" 0 "C1" 16r0000D9F6 0 )
]

{ #category : #accessing }
AJx86FDECSTP class >> mnemonic [
	^ #fdecstp
]

{ #category : #accessing }
AJx86FDECSTP >> is32BitOnly [
	^ false
]

{ #category : #accessing }
AJx86FDECSTP >> is64BitOnly [
	^ false
]

{ #category : #accessing }
AJx86FDECSTP >> opCode [
	^ 16rD9F6
]
