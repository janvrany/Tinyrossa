"
Undefined Instruction
"
Class {
	#name : #AJx86UD2,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86UD2 class >> description [
	^ #(#ud2 #emit 0 0 "R" 0 "C1" 16r00000F0B 0 )
]

{ #category : #accessing }
AJx86UD2 class >> mnemonic [
	^ #ud2
]

{ #category : #accessing }
AJx86UD2 >> is32BitOnly [
	^ false
]

{ #category : #accessing }
AJx86UD2 >> is64BitOnly [
	^ false
]

{ #category : #accessing }
AJx86UD2 >> opCode [
	^ 16rF0B
]
