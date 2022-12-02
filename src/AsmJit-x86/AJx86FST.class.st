"
Floating-Point Store Floating-Point Value
"
Class {
	#name : #AJx86FST,
	#superclass : #AJx87MemoryStiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FST class >> description [
	^ #(#fst #x87memSti "op1" 2r1100 0 "R" 2 "C1" 16r00D9DD02 "C2" 16rDDD00000 )
]

{ #category : #accessing }
AJx86FST class >> mnemonic [
	^ #fst
]

{ #category : #accessing }
AJx86FST >> o1Flags [
	^ 16rC
]

{ #category : #accessing }
AJx86FST >> opCode1 [
	^ 16rD9DD02
]

{ #category : #accessing }
AJx86FST >> opCode2 [
	^ 16rDDD00000
]

{ #category : #accessing }
AJx86FST >> opCodeR [
	^ 16r2
]
