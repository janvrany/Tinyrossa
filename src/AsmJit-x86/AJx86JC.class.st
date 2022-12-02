"
Jump if Carry (CF=1)
"
Class {
	#name : #AJx86JC,
	#superclass : #AJx86ConditionalJumpInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86JC class >> description [
	^ #(#jc #cjmp 0 0 "R" 0 "C1" 16r00000002 0 )
]

{ #category : #accessing }
AJx86JC class >> mnemonic [
	^ #jc
]
