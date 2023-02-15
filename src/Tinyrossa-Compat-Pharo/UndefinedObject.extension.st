Extension { #name : #UndefinedObject }

{ #category : #'*Tinyrossa-Compat-Pharo' }
UndefinedObject >> notEmptyOrNil [
	"Return true if receiver is neither `nil` nor an empty collection."
	^ false
]

{ #category : #'*Tinyrossa-Compat-Pharo' }
UndefinedObject >> size [
	^ 0
]
