"
Store Fence
"
Class {
	#name : #AJx86SFENCE,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86SFENCE class >> description [
	^ #(#sfence #emit 0 0 "R" 0 "C1" 16r000FAEF8 0 )
]

{ #category : #accessing }
AJx86SFENCE class >> mnemonic [
	^ #sfence
]

{ #category : #accessing }
AJx86SFENCE >> is32BitOnly [
	^ false
]

{ #category : #accessing }
AJx86SFENCE >> is64BitOnly [
	^ false
]

{ #category : #accessing }
AJx86SFENCE >> opCode [
	^ 16rFAEF8
]
