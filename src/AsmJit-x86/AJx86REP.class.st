"
Repea String Operation Prefix
"
Class {
	#name : #AJx86REP,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86REP class >> description [
	^ #(#rep #emit 0 0 "R" 0 "C1" 16r000000F3 0 )
]

{ #category : #accessing }
AJx86REP class >> mnemonic [
	^ #rep
]

{ #category : #accessing }
AJx86REP >> is32BitOnly [
	^ false
]

{ #category : #accessing }
AJx86REP >> is64BitOnly [
	^ false
]

{ #category : #accessing }
AJx86REP >> opCode [
	^ 16rF3
]
