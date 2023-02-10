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
	self assert: aTRILBlock isTRILBlock.

	^ symbols 
		detect: [:symbol | symbol isTRLabelSymbol and:[symbol block == aTRILBlock ] ]
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
	^ symbols 
		detect: [:symbol | symbol name = aString ]
		ifNone: [ self error: 'No such symbol: ' , aString ]
]

{ #category : #lookup }
TRSymbolManager >> lookupSymbolsByType: symbolClass [
	self assert: (symbolClass inheritsFrom: TRSymbol).

	^ symbols select: [ :symbol | symbol isKindOf: symbolClass ].
]

{ #category : #creating }
TRSymbolManager >> newAutomatic: name type: type index: index [
	^ TRAutomaticSymbol name: name type: type index: index
]

{ #category : #creating }
TRSymbolManager >> newFunction: name type: type linkage: linkageClass [
	^ TRFunctionSymbol name: name type: type linkage: linkageClass
]

{ #category : #creating }
TRSymbolManager >> newLabel: block [
	self assert: block isTRILBlock.

	^ TRLabelSymbol block: block
]

{ #category : #creating }
TRSymbolManager >> newParameter: name type: type index: index [
	^ TRParameterSymbol name: name type: type index: index
]
