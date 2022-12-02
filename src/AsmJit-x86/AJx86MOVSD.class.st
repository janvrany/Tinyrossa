"
Move Scalar Double-Precision Floating-Point Value
"
Class {
	#name : #AJx86MOVSD,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE2'
}

{ #category : #accessing }
AJx86MOVSD class >> description [
	^ #(#movsd #emit 0 0 "R" 0 "C1" 16r000000A5 0 )
]

{ #category : #accessing }
AJx86MOVSD class >> mnemonic [
	^ #movsd
]

{ #category : #emitting }
AJx86MOVSD >> emitMemory: anAJMem register: register [
	^ self emitX86RM: self opCode size: register size registerOrCode: register rm: anAJMem
]

{ #category : #emitting }
AJx86MOVSD >> emitRegister: register memory: anAJMem [
	^ self emitX86RM: (self opCode + 1) size: register size registerOrCode: register rm: anAJMem
]

{ #category : #accessing }
AJx86MOVSD >> is32BitOnly [
	^ false
]

{ #category : #accessing }
AJx86MOVSD >> is64BitOnly [
	^ false
]

{ #category : #accessing }
AJx86MOVSD >> opCode [
	^ 16rF20F10
]
