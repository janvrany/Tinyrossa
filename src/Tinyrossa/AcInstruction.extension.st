Extension { #name : #AcInstruction }

{ #category : #'*Tinyrossa' }
AcInstruction >> isLeaveInstruction [
	^ false
]

{ #category : #'*Tinyrossa' }
AcInstruction >> location [
	| node loc |

	node := self node.
	node notNil ifTrue: [
		loc := node location.
	].
	^ loc
]

{ #category : #'*Tinyrossa' }
AcInstruction >> node [
	^ self annotationAt: TRILNode
]

{ #category : #'*Tinyrossa' }
AcInstruction >> node: aTRILNode [
	^ self annotationAddOrReplace: aTRILNode
]
