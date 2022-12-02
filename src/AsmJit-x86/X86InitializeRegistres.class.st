"
studid class to force register initialization when loading with monticello
"
Class {
	#name : #X86InitializeRegistres,
	#superclass : #Object,
	#category : #'AsmJit-x86'
}

{ #category : #'class initialization' }
X86InitializeRegistres class >> initialize [
	self inform: 'Resetting all registers'.
	(Smalltalk at: #AJx86Registers) initialize.
	AJAssembler allSubInstances do: #reset.
]
