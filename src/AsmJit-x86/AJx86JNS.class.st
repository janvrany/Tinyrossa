"
Jump if no Signed (SF=0)
"
Class {
	#name : #AJx86JNS,
	#superclass : #AJx86ConditionalJumpInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86JNS class >> description [
	^ #(#jns #cjmp 0 0 "R" 0 "C1" 16r00000009 0 )
]

{ #category : #accessing }
AJx86JNS class >> mnemonic [
	^ #jns
]
