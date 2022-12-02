"
Floating-Point Compare and Set EFLAGS
"
Class {
	#name : #AJx86FCOMI,
	#superclass : #AJx87StiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FCOMI class >> description [
	^ #(#fcomi #x87sti 0 0 "R" 0 "C1" 16r0000DBF0 0 )
]

{ #category : #accessing }
AJx86FCOMI class >> mnemonic [
	^ #fcomi
]

{ #category : #accessing }
AJx86FCOMI >> opCode1 [
	^ 16rDBF0
]
