"
Memory Fence
"
Class {
	#name : #AJx86MFENCE,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE2'
}

{ #category : #accessing }
AJx86MFENCE class >> description [
	^ #(#mfence #emit 0 0 "R" 0 "C1" 16r000FAEF0 0 )
]

{ #category : #accessing }
AJx86MFENCE class >> mnemonic [
	^ #mfence
]

{ #category : #accessing }
AJx86MFENCE >> is32BitOnly [
	^ false
]

{ #category : #accessing }
AJx86MFENCE >> is64BitOnly [
	^ false
]

{ #category : #accessing }
AJx86MFENCE >> opCode [
	^ 16rFAEF0
]
