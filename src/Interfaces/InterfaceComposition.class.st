Class {
	#name : #InterfaceComposition,
	#superclass : #Object,
	#type : #variable,
	#category : #Interfaces
}

{ #category : #composing }
InterfaceComposition >> + another [
	| anotherAsComposition result |

	anotherAsComposition := another asInterfaceComposition.
	result := self class new: self size + anotherAsComposition size.
	1 to: self size do: [:i | 
		result at: i put: (self at: i).
	].
	1 to: anotherAsComposition size do: [:i | 
		result at: self size + i put: (anotherAsComposition at: i).
	].
	^ result
]

{ #category : #converting }
InterfaceComposition >> asInterfaceComposition [
	^ self
]

{ #category : #converting }
InterfaceComposition >> asString [
	self size = 0 ifTrue: [ 
		^ ''
	] ifFalse: [
		^ String streamContents:[:s |
			s nextPutAll: (self at: 1) name.
			2 to: self size do: [:i |
				s nextPutAll: ' '.
				s nextPutAll: (self at: i) name.
			].
		].  
	].
]

{ #category : #printing }
InterfaceComposition >> interfaceCompositionExpressionOn: aStream [
	"Print (smalltalk) composition expression on given stream"

	self size == 0 ifTrue: [ 
		aStream nextPutAll: '{}'
	] ifFalse: [ 
		aStream nextPutAll: (self at: 1) name.
		2 to: self size do: [:i |
			aStream nextPutAll: ' + '.
			aStream nextPutAll: (self at: i) name.
		].
	].
]

{ #category : #printing }
InterfaceComposition >> printOn: aStream [
	self interfaceCompositionExpressionOn: aStream
]
