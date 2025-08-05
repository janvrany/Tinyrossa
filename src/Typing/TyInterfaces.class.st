Class {
	#name : #TyInterfaces,
	#superclass : #Typing,
	#instVars : [
		'interfaces'
	],
	#category : #Typing
}

{ #category : #'instance creation' }
TyInterfaces class >> interfaces: interfaceComposition [
	^ self basicNew initializeWithInterfaces: interfaceComposition
]

{ #category : #checks }
TyInterfaces >> check: value [
	"Return true if `value` is of 'type' specified by receiver."

	^ self check: value implementsAll: interfaces
]

{ #category : #checks }
TyInterfaces >> check: value implements: interface [
	"Return true, if value conforms to given single interface,
	 false otherwise."

	| sentinel |

	"Check if value responds to all messages defined by this interface.
	 Note, that if message is implemented all the way up in Object (and not
	 overriden), it is considered as not implemented."

	sentinel := value class isMeta ifTrue: [ Object class ] ifFalse: [ Object ].

	interface methodDictionary keysAndValuesDo: [ :sel :mth |
		| cls found |

		found := false.
		cls := value class.
		[ cls ~~ sentinel and:[found not]] whileTrue: [
			(cls methodDictionary includesKey: sel) ifTrue: [
				"Good, value's class implements selector, no need
				 to search any further."
				found := true.
				cls := sentinel.
			] ifFalse: [
				cls := cls superclass.
			].
		].
		"If selector is not implemented by value's class,
		 report false immediately. Otherwise, continue with
		 next selector."
		found ifFalse: [ ^ false ].
	].

	"Second, check if value implements all interfaces from this
	 interface's composition. If not, return false immediately"
	(self check: value implementsAll: interface interfaceComposition) ifFalse: [
		^ false.
	].

	"Finally, if we get this far, value indeed implements the interface:"
	^ true
]

{ #category : #checks }
TyInterfaces >> check: value implementsAll: composition [
	1 to: composition size do: [:i |
		(self check: value implements: (composition at: i)) ifFalse: [ ^ false ].
	].
	^ true
]

{ #category : #initialization }
TyInterfaces >> initializeWithInterfaces: interfaceComposition [
	self assume: interfaceComposition class == InterfaceComposition.
	self assume: interfaces  isNil.

	interfaces := interfaceComposition
]

{ #category : #'printing & storing' }
TyInterfaces >> storeOn: aStream parenthesised: aBoolean [
	(aBoolean and:[interfaces size > 1]) ifTrue: [ aStream nextPut: $( ].
	interfaces interfaceCompositionExpressionOn: aStream.
	(aBoolean and:[interfaces size > 1]) ifTrue: [ aStream nextPut: $) ].
]

{ #category : #'instance creation' }
TyInterfaces >> | typeishOrRefinement [
   self shouldNotImplement.
]
