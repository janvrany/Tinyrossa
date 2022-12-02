"
Load Fence
"
Class {
	#name : #AJx86LFENCE,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE2'
}

{ #category : #accessing }
AJx86LFENCE class >> description [
	^ #(#lfence #emit 0 0 "R" 0 "C1" 16r000FAEE8 0 )
]

{ #category : #accessing }
AJx86LFENCE class >> mnemonic [
	^ #lfence
]

{ #category : #accessing }
AJx86LFENCE >> is32BitOnly [
	^ false
]

{ #category : #accessing }
AJx86LFENCE >> is64BitOnly [
	^ false
]

{ #category : #accessing }
AJx86LFENCE >> opCode [
	^ 16rFAEE8
]
