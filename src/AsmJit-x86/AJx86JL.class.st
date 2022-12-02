"
Jump if Less (SF~~OF)
"
Class {
	#name : #AJx86JL,
	#superclass : #AJx86ConditionalJumpInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86JL class >> description [
	^ #(#jl #cjmp 0 0 "R" 0 "C1" 16r0000000C 0 )
]

{ #category : #accessing }
AJx86JL class >> mnemonic [
	^ #jl
]
