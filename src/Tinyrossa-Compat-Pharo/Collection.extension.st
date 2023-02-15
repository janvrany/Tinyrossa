Extension { #name : #Collection }

{ #category : #'*Tinyrossa-Compat-Pharo' }
Collection >> notEmptyOrNil [
	"Return true if receiver is neither `nil` nor an empty collection."
	^ self notEmpty
]
