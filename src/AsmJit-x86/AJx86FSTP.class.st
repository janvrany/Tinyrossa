"
Floating-Point Store Floating-Point Value and Pop Register Stack
"
Class {
	#name : #AJx86FSTP,
	#superclass : #AJx87MemoryStiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FSTP class >> description [
	^ #(#fstp #x87memSti "op1" 2r11100 0 "R" 3 "C1" 16r00D9DD03 "C2" 16rDDD8DB07 )
]

{ #category : #accessing }
AJx86FSTP class >> mnemonic [
	^ #fstp
]

{ #category : #accessing }
AJx86FSTP >> o1Flags [
	^ 16r1C
]

{ #category : #accessing }
AJx86FSTP >> opCode1 [
	^ 16rD9DD03
]

{ #category : #accessing }
AJx86FSTP >> opCode2 [
	^ 16rDDD8DB07
]

{ #category : #accessing }
AJx86FSTP >> opCodeR [
	^ 16r3
]
