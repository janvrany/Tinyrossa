"
Floating-Point Store BCD Integer and Pop
"
Class {
	#name : #AJx86FBSTP,
	#superclass : #AJx86MemoryInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FBSTP class >> description [
	^ #(#fbstp #mem "op1" 2r1000000 0 "R" 6 "C1" 16r000000DF 0 )
]

{ #category : #accessing }
AJx86FBSTP class >> mnemonic [
	^ #fbstp
]

{ #category : #accessing }
AJx86FBSTP >> opCode1 [
	^ 16rDF
]

{ #category : #accessing }
AJx86FBSTP >> opCode2 [
	^ 16r0
]

{ #category : #accessing }
AJx86FBSTP >> opCodeR [
	^ 16r6
]
