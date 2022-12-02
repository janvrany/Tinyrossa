Class {
	#name : #AJx87AddPInstruction,
	#superclass : #AJx87StiInstruction,
	#category : #'AsmJit-x86-Instructions'
}

{ #category : #accessing }
AJx87AddPInstruction class >> group [
	^ #addp
]

{ #category : #testing }
AJx87AddPInstruction class >> isAbstract [
	^ self == AJx87AddPInstruction
]

{ #category : #'code generation' }
AJx87AddPInstruction >> emit [
	^ self emitX87Register: (AJx87Register code: 1)
]

{ #category : #'code generation' }
AJx87AddPInstruction >> emitX87Register: register [

	self
		emitByte: (self opCode1 bitAnd: 16rFF00) >> 8;
		emitByte: (self opCode1 bitAnd: 16rFF)	+ register index
]
