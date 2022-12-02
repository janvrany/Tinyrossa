Class {
	#name : #AJx86MmuRmiImmediate8BitInstruction,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions'
}

{ #category : #accessing }
AJx86MmuRmiImmediate8BitInstruction class >> arity [
	^ 3 to: 4
]

{ #category : #accessing }
AJx86MmuRmiImmediate8BitInstruction class >> group [
	^ #mmuRmImm8
]

{ #category : #testing }
AJx86MmuRmiImmediate8BitInstruction class >> isAbstract [
	^ self == AJx86MmuRmiImmediate8BitInstruction
]
