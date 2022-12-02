Extension { #name : #AJGeneratedCode }

{ #category : #'*AsmJit-x86-debugging' }
AJGeneratedCode >> disassemblex64 [
	^ AJx64Assembler gccDisassemble: self bytes
]

{ #category : #'*AsmJit-x86-debugging' }
AJGeneratedCode >> disassemblex86 [
	^ AJx86Assembler gccDisassemble: self bytes
]
