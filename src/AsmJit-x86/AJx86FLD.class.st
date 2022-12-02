"
Loading Floating-Point Value
"
Class {
	#name : #AJx86FLD,
	#superclass : #AJx87MemoryStiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FLD class >> description [
	^ #(#fld #x87memSti "op1" 2r11100 0 "R" 0 "C1" 16r00D9DD00 "C2" 16rD9C0DB05 )
]

{ #category : #accessing }
AJx86FLD class >> mnemonic [
	^ #fld
]

{ #category : #accessing }
AJx86FLD >> o1Flags [
	^ 16r1C
]

{ #category : #accessing }
AJx86FLD >> opCode1 [
	^ 16rD9DD00
]

{ #category : #accessing }
AJx86FLD >> opCode2 [
	^ 16rD9C0DB05
]

{ #category : #accessing }
AJx86FLD >> opCodeR [
	^ 16r0
]
