"
This is a pseudo-instruction to indicate a place in native code for a routine prologue.
It is later replaced by real instructions which contain code for initializing stack frame & extra stack space required by routine.
"
Class {
	#name : #AJRoutinePrologue,
	#superclass : #AJInstruction,
	#category : #'AsmJit-Instructions'
}

{ #category : #visitor }
AJRoutinePrologue >> accept: anObject [
	^ anObject visitRoutinePrologue: self
]

{ #category : #'emitting code' }
AJRoutinePrologue >> emitCode: asm [
	machineCode := #[]
]

{ #category : #accessing }
AJRoutinePrologue >> name [
	^ 'prologue'
]

{ #category : #visitor }
AJRoutinePrologue >> setPrologue: anInstruction [
	"Hack to get the level of the children somehow correctly"
	level := level + 1.
	self insert: anInstruction.
	level := level - 1.
]
