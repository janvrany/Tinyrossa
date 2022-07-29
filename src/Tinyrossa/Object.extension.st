Extension { #name : #Object }

{ #category : '*Tinyrossa' }
Object >> isTRILBlock [
	"return false here; to be redefined in subclass(es)"

	^ false
]

{ #category : #'*Tinyrossa' }
Object >> isTRLabelSymbol [
	^ false
]

{ #category : #'*Tinyrossa' }
Object >> isTRParameterSymbol [
	^ false
]

{ #category : #'*Tinyrossa' }
Object >> isTRSymbol [
	"return false here; to be redefined in subclass(es)"

	^ false
]

{ #category : #'*Tinyrossa' }
Object >> isTRVirtualRegister [
	^ false
]
