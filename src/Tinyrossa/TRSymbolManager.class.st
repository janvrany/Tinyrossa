Class {
	#name : #TRSymbolManager,
	#superclass : #Object,
	#instVars : [
		'symbols'
	],
	#category : #'Tinyrossa-IL'
}

{ #category : #'instance creation' }
TRSymbolManager class >> new [
	"return an initialized instance"

	^ self basicNew initialize.
]

{ #category : #defining }
TRSymbolManager >> define: aTRSymbol [
	self assert: aTRSymbol isTRSymbol.
	self assert: (self hasSymbolNamed: aTRSymbol name) not.

	symbols add: aTRSymbol.
	^ aTRSymbol
]

{ #category : #defining }
TRSymbolManager >> defineLabel: block [
	^ self define: (self newLabel: block)
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
	^ symbols 
		detect: [:symbol | symbol isTRLabelSymbol and:[symbol block == aTRILBlock ] ]
		ifNone: [ nil ]
]

{ #category : #lookup }
TRSymbolManager >> lookupSymbolByName: aString [ 
	^ symbols 
		detect: [:symbol | symbol name = aString ]
		ifNone: [ self error: 'No such symbol: ' , aString ]
]

{ #category : #lookup }
TRSymbolManager >> lookupSymbolsByType: symbolClass [
	^ symbols select: [ :symbol | symbol isKindOf: symbolClass ].
]

{ #category : #creating }
TRSymbolManager >> newLabel: block [ 
	^ TRLabelSymbol block: block
]

{ #category : #creating }
TRSymbolManager >> newParameter: name type: type index: index [
	^ TRParameterSymbol name: name type: type index: index
]
