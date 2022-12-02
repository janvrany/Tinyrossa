"
Jump if Less or Equal (ZF=1 or SF~~OF)
"
Class {
	#name : #AJx86JLE,
	#superclass : #AJx86ConditionalJumpInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86JLE class >> description [
	^ #(#jle #cjmp 0 0 "R" 0 "C1" 16r0000000E 0 )
]

{ #category : #accessing }
AJx86JLE class >> mnemonic [
	^ #jle
]
