"
Floating-Point Load Constant
"
Class {
	#name : #AJx86FLD1,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FLD1 class >> description [
	^ #(#fld1 #emit 0 0 "R" 0 "C1" 16r0000D9E8 0 )
]

{ #category : #accessing }
AJx86FLD1 class >> mnemonic [
	^ #fld1
]

{ #category : #accessing }
AJx86FLD1 >> is32BitOnly [
	^ false
]

{ #category : #accessing }
AJx86FLD1 >> is64BitOnly [
	^ false
]

{ #category : #accessing }
AJx86FLD1 >> opCode [
	^ 16rD9E8
]
