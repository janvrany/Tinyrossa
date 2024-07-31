Class {
	#name : #TRSymbolManager,
	#superclass : #Object,
	#instVars : [
		'symbols'
	],
	#category : #'Tinyrossa-IL-Symbols'
}

{ #category : #'instance creation' }
TRSymbolManager class >> new [
	"return an initialized instance"

	^ self basicNew initialize.
]

{ #category : #counting }
TRSymbolManager >> countSymbolsByType: symbolClass [
	self assert: (symbolClass inheritsFrom: TRSymbol).

	^ symbols count: [ :symbol | symbol isKindOf: symbolClass ].
]

{ #category : #defining }
TRSymbolManager >> define: aTRSymbol [
	self assert: aTRSymbol isTRSymbol.
	self assert: (self hasSymbolNamed: aTRSymbol name) not.

	symbols add: aTRSymbol.
	^ aTRSymbol
]

{ #category : #defining }
TRSymbolManager >> defineAutomatic: name type: type [
	| index |

	index := (symbols count: [ :symbol | symbol isTRAutomaticSymbol ]) + 1.
	^ self define: (self newAutomatic: name type: type index: index)
]

{ #category : #defining }
TRSymbolManager >> defineFunction: name type: type linkage: linkageClass [
	^ self define: (self newFunction: name type: type linkage: linkageClass)
]

{ #category : #defining }
TRSymbolManager >> defineLabel [
	^ self defineLabel: nil
]

{ #category : #defining }
TRSymbolManager >> defineLabel: nameOrBlock [
	| label |

	nameOrBlock isTRILBlock ifTrue: [
		label := self lookupLabelByBlock: nameOrBlock.
		label isNil ifTrue: [
			label := self defineLabel: nameOrBlock name.
			label setBlock: nameOrBlock.
		].
		self assert: (label instVarNamed:#block) == nameOrBlock.
		^ label.
	].
	^ self define: (self newLabel: nameOrBlock)
]

{ #category : #defining }
TRSymbolManager >> defineParameter: name type: type [
	| index |

	index := (symbols count: [ :symbol | symbol isTRParameterSymbol ]) + 1.
	^ self define: (self newParameter: name type: type index: index)
]

{ #category : #queries }
TRSymbolManager >> hasSymbolNamed: aString [ 
	^ symbols contains: [:symbol | symbol name = aString ]
]

{ #category : #initialization }
TRSymbolManager >> initialize [
	super initialize.
	symbols := Set new.
]

{ #category : #lookup }
TRSymbolManager >> lookupLabelByBlock: aTRILBlock [
	self assert: aTRILBlock isTRILBlock.

	^ symbols 
		detect: [:symbol | symbol isTRLabelSymbol and:[symbol name == aTRILBlock name] ]
		ifNone: [ nil ]
]

{ #category : #lookup }
TRSymbolManager >> lookupLabelByName: aString [    
	^ symbols 
		detect: [:symbol | symbol isTRLabelSymbol and:[symbol name = aString ] ]
		ifNone: [ nil ]
]

{ #category : #lookup }
TRSymbolManager >> lookupSymbolByName: aString [ 
	^ self lookupSymbolByName: aString ifAbsent: [ self error: 'No such symbol: ' , aString ]
]

{ #category : #lookup }
TRSymbolManager >> lookupSymbolByName: aString ifAbsent: aBlock [
	^ symbols detect: [:symbol | symbol name = aString ] ifNone: aBlock
]

{ #category : #lookup }
TRSymbolManager >> lookupSymbolsByType: symbolClass [
	self assert: (symbolClass inheritsFrom: TRSymbol).

	^ symbols select: [ :symbol | symbol isKindOf: symbolClass ].
]

{ #category : #creating }
TRSymbolManager >> newAutomatic: nameOrNil type: type index: index [
	| name |

	nameOrNil notNil ifTrue: [ 
		name := nameOrNil
	] ifFalse: [ 
		name := '_auto' , (index printLeftPaddedWith: $0 to: 3 base: 10)
	].
	^ TRAutomaticSymbol name: name type: type index: index
]

{ #category : #creating }
TRSymbolManager >> newFunction: name type: type linkage: linkageClass [
	^ TRFunctionSymbol name: name type: type linkage: linkageClass
]

{ #category : #creating }
TRSymbolManager >> newLabel: nameOrNil [
	| name |

	name := nameOrNil.
	name isNil ifTrue: [
		| index  |

		index := (symbols count: [ :symbol | symbol isTRLabelSymbol ]) + 1.
		name := '.LL_' , (index printLeftPaddedWith: $0 to: 3 base: 10).
	].

	^ TRLabelSymbol name: name
]

{ #category : #creating }
TRSymbolManager >> newParameter: name type: type index: index [
	^ TRParameterSymbol name: name type: type index: index
]

{ #category : #creating }
TRSymbolManager >> newStatic: name type: type [
	^ TRStaticSymbol name: name type: type
]

{ #category : #accessing }
TRSymbolManager >> symbols [
	"Return all defined symbols"
	^symbols 
]
