"
Floating-Point Load Constant Lb(e) / log_2(e)
"
Class {
	#name : #AJx86FLDL2E,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FLDL2E class >> description [
	^ #(#fldl2e #emit 0 0 "R" 0 "C1" 16r0000D9EA 0 )
]

{ #category : #accessing }
AJx86FLDL2E class >> mnemonic [
	^ #fldl2e
]

{ #category : #accessing }
AJx86FLDL2E >> is32BitOnly [
	^ false
]

{ #category : #accessing }
AJx86FLDL2E >> is64BitOnly [
	^ false
]

{ #category : #accessing }
AJx86FLDL2E >> opCode [
	^ 16rD9EA
]
