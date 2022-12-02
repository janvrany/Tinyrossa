Class {
	#name : #AJx86MmuRmiInstruction,
	#superclass : #AJx86MmuInstruction,
	#category : #'AsmJit-x86-Instructions'
}

{ #category : #accessing }
AJx86MmuRmiInstruction class >> arity [
	^ 2 to: 3
]

{ #category : #accessing }
AJx86MmuRmiInstruction class >> group [
	^ #mmurmi
]

{ #category : #testing }
AJx86MmuRmiInstruction class >> isAbstract [
	^ self == AJx86MmuRmiInstruction
]
