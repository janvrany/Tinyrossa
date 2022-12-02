"
Conditional Move if Signed (SF=1)
"
Class {
	#name : #AJx86CMOVS,
	#superclass : #AJx86RrmInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete'
}

{ #category : #accessing }
AJx86CMOVS class >> description [
	^ #(#cmovs #rrm 0 0 "R" 0 "C1" 16r00000F48 0 )
]

{ #category : #accessing }
AJx86CMOVS class >> mnemonic [
	^ #cmovs
]

{ #category : #accessing }
AJx86CMOVS >> opCode1 [
	^ 16rF48
]
