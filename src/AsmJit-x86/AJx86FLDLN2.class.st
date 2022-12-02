"
Floating-Point Load Constant Ln(2) / log_e(2)
"
Class {
	#name : #AJx86FLDLN2,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FLDLN2 class >> description [
	^ #(#fldln2 #emit 0 0 "R" 0 "C1" 16r0000D9ED 0 )
]

{ #category : #accessing }
AJx86FLDLN2 class >> mnemonic [
	^ #fldln2
]

{ #category : #accessing }
AJx86FLDLN2 >> is32BitOnly [
	^ false
]

{ #category : #accessing }
AJx86FLDLN2 >> is64BitOnly [
	^ false
]

{ #category : #accessing }
AJx86FLDLN2 >> opCode [
	^ 16rD9ED
]
