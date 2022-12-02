"
Set Carry Flag
"
Class {
	#name : #AJx86STC,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86STC class >> description [
	^ #(#stc #emit 0 0 "R" 0 "C1" 16r000000F9 0 )
]

{ #category : #accessing }
AJx86STC class >> mnemonic [
	^ #stc
]

{ #category : #accessing }
AJx86STC >> is32BitOnly [
	^ false
]

{ #category : #accessing }
AJx86STC >> is64BitOnly [
	^ false
]

{ #category : #accessing }
AJx86STC >> opCode [
	^ 16rF9
]
