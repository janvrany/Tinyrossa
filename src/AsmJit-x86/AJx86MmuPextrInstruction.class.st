Class {
	#name : #AJx86MmuPextrInstruction,
	#superclass : #AJx86MmuInstruction,
	#category : #'AsmJit-x86-Instructions'
}

{ #category : #accessing }
AJx86MmuPextrInstruction class >> arity [
	^ 3 to: 3
]

{ #category : #accessing }
AJx86MmuPextrInstruction class >> group [
	^ #mmuPextr
]

{ #category : #testing }
AJx86MmuPextrInstruction class >> isAbstract [
	^ self == AJx86MmuPextrInstruction
]
