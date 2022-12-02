"
Fast System Call
"
Class {
	#name : #AJx86SYSCALL,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86SYSCALL class >> description [
	^ #(#syscall #emit "op1" 2r100000000 0 "R" 0 "C1" 16r00000F05 0 )
]

{ #category : #accessing }
AJx86SYSCALL class >> mnemonic [
	^ #syscall
]

{ #category : #testing }
AJx86SYSCALL >> is32BitOnly [
	^ false
]

{ #category : #testing }
AJx86SYSCALL >> is64BitOnly [
	^ true
]

{ #category : #accessing }
AJx86SYSCALL >> opCode [
	^ 16r0F05
]
