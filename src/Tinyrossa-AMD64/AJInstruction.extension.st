Extension { #name : #AJInstruction }

{ #category : #'*Tinyrossa-AMD64' }
AJInstruction >> dependencies [
	^ self annotationAt: TRRegisterDependencies
]

{ #category : #'*Tinyrossa-AMD64' }
AJInstruction >> dependencies: aTRRegisterDependencies [
	self annotationAddOrReplace: aTRRegisterDependencies
]

{ #category : #'*Tinyrossa-AMD64' }
AJInstruction >> fixupOperands [
	operands notNil ifTrue: [
		operands := operands collect: [ :each | each fixupOperands ]
	].
]

{ #category : #'*Tinyrossa-AMD64' }
AJInstruction >> isLeaveInstruction [
	^ false
]

{ #category : #'*Tinyrossa-AMD64' }
AJInstruction >> isPseudoInstruction [
	^ true

	"Created: / 18-11-2022 / 16:04:50 / Jan Vrany <jan.vrany@labware.com>"
]

{ #category : #'*Tinyrossa-AMD64' }
AJInstruction >> location [
	| node loc |

	node := self node.
	node notNil ifTrue: [
		loc := node location.
	].
	^ loc
]

{ #category : #'*Tinyrossa-AMD64' }
AJInstruction >> node [
	^ self annotationAt: TRILNode
]

{ #category : #'*Tinyrossa-AMD64' }
AJInstruction >> node: aTRILNode [
	^ self annotationAddOrReplace: aTRILNode
]

{ #category : #'*Tinyrossa-AMD64' }
AJInstruction >> virtualRegistersAssignedDo: block [
	self subclassResponsibility
]

{ #category : #'*Tinyrossa-AMD64' }
AJInstruction >> virtualRegistersReadDo: block [
	self subclassResponsibility
]
