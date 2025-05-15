Class {
	#name : #TRILNodePrinter,
	#superclass : #Object,
	#instVars : [
		'printed'
	],
	#category : #'Tinyrossa-IL-Utils'
}

{ #category : #'instance creation' }
TRILNodePrinter class >> new [
	"return an initialized instance"

	^ self basicNew initialize.
]

{ #category : #queries }
TRILNodePrinter >> hasPrinted: node [
	"Return true, if this printer has already printed given node"
	
	^printed includes: node
	
]

{ #category : #initialization }
TRILNodePrinter >> initialize [
	printed := Set new.
]

{ #category : #printing }
TRILNodePrinter >> print: node [
	^ String streamContents: [ :s | self print: node on: s ]
]

{ #category : #printing }
TRILNodePrinter >> print: node on: aStream [
	| opcode |

	opcode := node opcode.
	
	(self hasPrinted: node) ifTrue:[
		aStream nextPutAll: '==> '.
	].
	

	aStream nextPutAll: opcode name.
	aStream space.
	(opcode name = 'bbstart' or: [ opcode name = 'bbend' ]) ifTrue:[
		| block |

		block := node block.
		block notNil ifTrue: [
			aStream nextPut:$<.
			opcode name = 'bbend' ifTrue: [ aStream nextPut:$/ ].
			aStream nextPutAll: block name;
					nextPut:$>.
		].
		(opcode name = 'bbend') ifTrue: [
			(block isTerminated not and: [ block successor1 notNil and:[block next isNil]]) ifTrue: [ 
				aStream nextPutAll: '  <!-- pass through to '; nextPutAll: block successor1 name; nextPutAll: ' -->'
			].
		]
	] ifFalse: [ 
		(opcode hasSymbolRef or:[opcode isBranching]) ifTrue: [ 
			aStream nextPutAll: node symbol name
		] ifFalse: [ 
			opcode isLoadConst ifTrue: [
				node type == 1 ifTrue: [
					aStream 
						nextPutAll: '0x';
						nextPutAll: ( node constant printPaddedWith: $0 to: 16 base: 16).
				] ifFalse: [
					node constant printOn: aStream.
				]
			].
		].
	].
	printed add: node.
]

{ #category : #printing }
TRILNodePrinter >> printId: node [
	^String streamContents:[ :s | self printId: node on: s]
]

{ #category : #printing }
TRILNodePrinter >> printId: node on: aStream [
	aStream nextPut: $N.
	aStream nextPutAll: (node id printPaddedWith: $0 to: 3 base: 10).
]
