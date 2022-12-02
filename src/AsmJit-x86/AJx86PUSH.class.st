"
Push a Value onto the Stack
"
Class {
	#name : #AJx86PUSH,
	#superclass : #AJx86PopInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86PUSH class >> description [
	^ #(#push #push 0 0 "R" 6 "C1" 16r00000050 "C2" 16r000000FF )
]

{ #category : #accessing }
AJx86PUSH class >> group [
	^ #push
]

{ #category : #accessing }
AJx86PUSH class >> mnemonic [
	^ #push
]

{ #category : #'code generation' }
AJx86PUSH >> emitImmediate: immediate [

	immediate isInt8 & immediate isNoRelocation ifTrue: [
		self emitByte: 16r6A.
		^ self emitImmediate: immediate size: 1 ].

	self
		emitByte: 16r68;
		emitImmediate: immediate size: 4
]

{ #category : #accessing }
AJx86PUSH >> opCode1 [
	^ 16r50
]

{ #category : #accessing }
AJx86PUSH >> opCode2 [
	^ 16rFF
]

{ #category : #accessing }
AJx86PUSH >> opCodeR [
	^ 16r6
]
