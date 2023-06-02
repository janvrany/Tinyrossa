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

	aStream nextPutAll: opcode name.
	aStream space.
	(opcode name = 'bbstart' or: [ opcode name = 'bbend' ]) ifTrue:[
		| block |

		block := node block.
		aStream nextPut:$<.
		opcode name = 'bbend' ifTrue: [ aStream nextPut:$/ ].
		aStream nextPutAll: block name; 
				nextPut:$>.
		(opcode name = 'bbend') ifTrue: [
			(block isTerminated not and: [ block successor1 notNil and:[block next isNil]]) ifTrue: [ 
				aStream nextPutAll: '  <!-- pass through to '; nextPutAll: block successor1 name; nextPutAll: ' -->'
			].
		]
	] ifFalse: [ 
		(opcode hasSymbolRef or:[opcode isBranch]) ifTrue: [ 
			aStream nextPutAll: node symbol name
		] ifFalse: [ 
		   opcode isLoadConst ifTrue: [ 
				node constant printOn: aStream.
			].
		].
	].
	printed add: node.
]
