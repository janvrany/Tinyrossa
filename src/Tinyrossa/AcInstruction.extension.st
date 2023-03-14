Extension { #name : #AcInstruction }

{ #category : #'*Tinyrossa' }
AcInstruction >> isLeaveInstruction [
	^ false
]

{ #category : #'*Tinyrossa' }
AcInstruction >> node [
	^ self annotationAt: TRILNode
]

{ #category : #'*Tinyrossa' }
AcInstruction >> node: aTRILNode [
	^ self annotationAddOrReplace: aTRILNode
]
