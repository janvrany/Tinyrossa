Class {
	#name : #AJx86MmuRm3DNowInstruction,
	#superclass : #AJx86MmuInstruction,
	#category : #'AsmJit-x86-Instructions'
}

{ #category : #accessing }
AJx86MmuRm3DNowInstruction class >> arity [
	self flag: 'TODO'.
	^ 0 to: 0
]

{ #category : #accessing }
AJx86MmuRm3DNowInstruction class >> group [
	^ #mmuRm3DNow
]

{ #category : #testing }
AJx86MmuRm3DNowInstruction class >> isAbstract [
	^ self == AJx86MmuRm3DNowInstruction
]
