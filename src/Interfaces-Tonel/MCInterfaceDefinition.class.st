Class {
	#name : #MCInterfaceDefinition,
	#superclass : #MCClassDefinition,
	#instVars : [
		'interfaceComposition'
	],
	#category : #'Interfaces-Tonel'
}

{ #category : #'instance creation' }
MCInterfaceDefinition class >> name: nameString interfaceComposition: interfaceCompositionString category: categoryString comment: commentString [
	^ self basicNew 
		initializeWithName: nameString 
		interfaceComposition: interfaceCompositionString 
		category: categoryString 
		comment: commentString
]

{ #category : #'instance creation' }
MCInterfaceDefinition class >> name: nameString
superclassName: superclassString
category: categoryString 
instVarNames: ivarArray
classVarNames: cvarArray
poolDictionaryNames: poolArray
classInstVarNames: civarArray
type: typeSymbol
comment: commentString
commentStamp: stampString [
	self shouldNotImplement
]

{ #category : #'instance creation' }
MCInterfaceDefinition class >> name: nameString
superclassName: superclassString
traitComposition: traitCompositionString
classTraitComposition: classTraitCompositionString
category: categoryString 
instVarNames: ivarArray
classVarNames: cvarArray
poolDictionaryNames: poolArray
classInstVarNames: civarArray
type: typeSymbol
comment: commentString
commentStamp: stampString [
	self shouldNotImplement
]

{ #category : #installing }
MCInterfaceDefinition >> createClass [
	| interface |

	((Smalltalk respondsTo: #isSmalltalkX) and: [ Smalltalk isSmalltalkX ]) ifTrue: [ 
		interface := Interface named: name asSymbol implements: self interfaceCompositionCompiled category: category 
	] ifFalse: [ 
		interface := Interface named: name asSymbol implements: self interfaceCompositionCompiled package: category 
	].

	^ interface
]

{ #category : #testing }
MCInterfaceDefinition >> hasInterfaceComposition [
		^self interfaceCompositionString ~= ''
]

{ #category : #initialization }
MCInterfaceDefinition >> initializeWithName: nameString interfaceComposition: interfaceCompositionString category: categoryString comment: commentString [ 

	name := nameString asSymbol.
	superclassName := Interface name.
	traitComposition := '{}'.
	classTraitComposition := '{}'.
	category := categoryString.
	type := Interface typeOfClass.
	comment := commentString.
	comment notNil ifTrue: [ 
		"Sigh, on Smalltalk/X we should convert string to use 'Squeak' ('Pharo') line endings.
		 Moreover, this code is intended to work on both, hence the ugly check."
		((Smalltalk respondsTo: #isSmalltalkX) and: [ Smalltalk isSmalltalkX ]) ifTrue: [ 
			comment := comment asStringWithSqueakLineEndings
		].
	].
	commentStamp := self defaultCommentStamp.
	variables := OrderedCollection  new.   

	interfaceComposition := interfaceCompositionString
]

{ #category : #accessing }
MCInterfaceDefinition >> interfaceComposition [
	^ interfaceComposition
]

{ #category : #accessing }
MCInterfaceDefinition >> interfaceCompositionCompiled [
	| names composition |

	names := interfaceComposition substrings.
	composition := InterfaceComposition new: names size.
	1 to: names size do: [:i | 
		| interface |

		interface := Smalltalk at: (names at: i) asSymbol ifAbsent: [ self error:'No such interface: ', (names at:i) ].
		composition at: i put: interface.
	].
	^ composition
]

{ #category : #accessing }
MCInterfaceDefinition >> interfaceCompositionString [
		^self interfaceComposition ifNil: [''].
]
