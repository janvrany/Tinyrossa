Extension { #name : #AJInstruction }

{ #category : #'*Tinyrossa-AMD64' }
AJInstruction >> isLeaveInstruction [
	^ false
]

{ #category : #'*Tinyrossa-AMD64' }
AJInstruction >> isPseudoInstruction [
	^ true

	"Created: / 18-11-2022 / 16:04:50 / Jan Vrany <jan.vrany@labware.com>"
]
