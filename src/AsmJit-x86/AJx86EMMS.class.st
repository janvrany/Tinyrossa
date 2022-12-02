"
Empty MMX State
"
Class {
	#name : #AJx86EMMS,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-MMX'
}

{ #category : #accessing }
AJx86EMMS class >> description [
	^ #(#emms #emit 0 0 "R" 0 "C1" 16r00000F77 0 )
]

{ #category : #accessing }
AJx86EMMS class >> mnemonic [
	^ #emms
]

{ #category : #accessing }
AJx86EMMS >> is32BitOnly [
	^ false
]

{ #category : #accessing }
AJx86EMMS >> is64BitOnly [
	^ false
]

{ #category : #accessing }
AJx86EMMS >> opCode [
	^ 16rF77
]
