"
Jump if not Overflow (OF=0)
"
Class {
	#name : #AJx86JNO,
	#superclass : #AJx86ConditionalJumpInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86JNO class >> description [
	^ #(#jno #cjmp 0 0 "R" 0 "C1" 16r00000001 0 )
]

{ #category : #accessing }
AJx86JNO class >> mnemonic [
	^ #jno
]
