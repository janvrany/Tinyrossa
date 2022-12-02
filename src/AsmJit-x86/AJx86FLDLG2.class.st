"
Floating-Point Load Constant Log(2) / log_10(2)
"
Class {
	#name : #AJx86FLDLG2,
	#superclass : #AJx86DirectInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-x87'
}

{ #category : #accessing }
AJx86FLDLG2 class >> description [
	^ #(#fldlg2 #emit 0 0 "R" 0 "C1" 16r0000D9EC 0 )
]

{ #category : #accessing }
AJx86FLDLG2 class >> mnemonic [
	^ #fldlg2
]

{ #category : #accessing }
AJx86FLDLG2 >> is32BitOnly [
	^ false
]

{ #category : #accessing }
AJx86FLDLG2 >> is64BitOnly [
	^ false
]

{ #category : #accessing }
AJx86FLDLG2 >> opCode [
	^ 16rD9EC
]
