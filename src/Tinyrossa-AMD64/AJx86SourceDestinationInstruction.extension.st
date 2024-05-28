Extension { #name : #AJx86SourceDestinationInstruction }

{ #category : #'*Tinyrossa-AMD64' }
AJx86SourceDestinationInstruction >> fixupOperands [
	super fixupOperands.
	source := source fixupOperands.
	destination := destination fixupOperands.
]

{ #category : #'*Tinyrossa-AMD64' }
AJx86SourceDestinationInstruction >> virtualRegistersAssignedDo: block [
	destination isTRVirtualRegister ifTrue:[
		block value: destination.
		^ self
	].
	self notYetImplemented.
]

{ #category : #'*Tinyrossa-AMD64' }
AJx86SourceDestinationInstruction >> virtualRegistersReadDo: block [
	source isTRVirtualRegister ifTrue:[
		block value: source
	]
]
