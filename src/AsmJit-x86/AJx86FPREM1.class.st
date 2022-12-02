"
Floating-Point Partial IEEE Remainder
"
Class {
	#name : #AJx86FPREM1,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FPREM1 class >> description [
	^ #(#fprem1 #emit 0 0 "R" 0 "C1" 16r0000D9F5 0 )
]

{ #category : #accessing }
AJx86FPREM1 class >> mnemonic [
	^ #fprem1
]

{ #category : #accessing }
AJx86FPREM1 >> is32BitOnly [
	^ false
]

{ #category : #accessing }
AJx86FPREM1 >> is64BitOnly [
	^ false
]

{ #category : #accessing }
AJx86FPREM1 >> opCode [
	^ 16rD9F5
]
