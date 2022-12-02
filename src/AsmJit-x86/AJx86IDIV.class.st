"
Signed Divide
"
Class {
	#name : #AJx86IDIV,
	#superclass : #AJx86RmInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86IDIV class >> description [
	^ #(#idiv #rm 0 0 "R" 7 "C1" 16r000000F6 0 )
]

{ #category : #accessing }
AJx86IDIV class >> mnemonic [
	^ #idiv
]

{ #category : #accessing }
AJx86IDIV >> opCode1 [
	^ 16rF6
]

{ #category : #accessing }
AJx86IDIV >> opCodeR [
	^ 16r7
]
