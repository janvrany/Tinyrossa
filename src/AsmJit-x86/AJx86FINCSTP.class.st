"
Floating-Point Increment Stack-Top Pointer
"
Class {
	#name : #AJx86FINCSTP,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FINCSTP class >> description [
	^ #(#fincstp #emit 0 0 "R" 0 "C1" 16r0000D9F7 0 )
]

{ #category : #accessing }
AJx86FINCSTP class >> mnemonic [
	^ #fincstp
]

{ #category : #accessing }
AJx86FINCSTP >> is32BitOnly [
	^ false
]

{ #category : #accessing }
AJx86FINCSTP >> is64BitOnly [
	^ false
]

{ #category : #accessing }
AJx86FINCSTP >> opCode [
	^ 16rD9F7
]
