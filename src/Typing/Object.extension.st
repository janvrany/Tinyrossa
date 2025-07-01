Extension { #name : #Object }

{ #category : #'*Typing' }
Object >> asTyping [
	^ TyRefined base: TyAny instance refinement: [ :v | v = self ]

	"Created: / 24-06-2025 / 16:47:41 / Jan Vrany <jan.vrany@labware.com>"
]

{ #category : #'*Typing' }
Object class >> asTyping [
	^ TyClass klass: self

	"Created: / 24-06-2025 / 15:49:28 / Jan Vrany <jan.vrany@labware.com>"
]

{ #category : #'*Typing' }
Object >> assert: value is: typing [
	<resource: #skipInDebuggersWalkBack>

	self assert: (typing asTyping check: value)

	"Created: / 24-06-2025 / 15:47:10 / Jan Vrany <jan.vrany@labware.com>"
]

{ #category : #'*Typing' }
Object >> assume: value is: typing [
	<resource: #skipInDebuggersWalkBack>

	self assert: (typing asTyping check: value)

	"Modified (format): / 30-06-2025 / 15:22:45 / Jan Vrany <jan.vrany@labware.com>"
]

{ #category : #'*Typing' }
Object class >> | typeishOrRefinement [
	^ self asTyping | typeishOrRefinement

	"Created: / 24-06-2025 / 16:54:25 / Jan Vrany <jan.vrany@labware.com>"
]
