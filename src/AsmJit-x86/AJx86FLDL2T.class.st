"
Floating-Point Load Constant Lb(10) / log_2(10)
"
Class {
	#name : #AJx86FLDL2T,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FLDL2T class >> description [
	^ #(#fldl2t #emit 0 0 "R" 0 "C1" 16r0000D9E9 0 )
]

{ #category : #accessing }
AJx86FLDL2T class >> mnemonic [
	^ #fldl2t
]

{ #category : #accessing }
AJx86FLDL2T >> is32BitOnly [
	^ false
]

{ #category : #accessing }
AJx86FLDL2T >> is64BitOnly [
	^ false
]

{ #category : #accessing }
AJx86FLDL2T >> opCode [
	^ 16rD9E9
]
