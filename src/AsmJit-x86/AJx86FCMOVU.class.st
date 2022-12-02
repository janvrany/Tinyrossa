"
Floating-Point Move if Unordered (PF=1)
"
Class {
	#name : #AJx86FCMOVU,
	#superclass : #AJx87StiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FCMOVU class >> description [
	^ #(#fcmovu #x87sti 0 0 "R" 0 "C1" 16r0000DAD8 0 )
]

{ #category : #accessing }
AJx86FCMOVU class >> mnemonic [
	^ #fcmovu
]

{ #category : #accessing }
AJx86FCMOVU >> opCode1 [
	^ 16rDAD8
]
