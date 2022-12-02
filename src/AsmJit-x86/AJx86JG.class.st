"
Jump if Greater (ZF=0 and SF=OF)
"
Class {
	#name : #AJx86JG,
	#superclass : #AJx86ConditionalJumpInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86JG class >> description [
	^ #(#jg #cjmp 0 0 "R" 0 "C1" 16r0000000F 0 )
]

{ #category : #accessing }
AJx86JG class >> mnemonic [
	^ #jg
]
