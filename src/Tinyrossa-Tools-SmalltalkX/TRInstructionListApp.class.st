Class {
	#name : #TRInstructionListApp,
	#superclass : #VDBInstructionListApplication,
	#instVars : [
		'selectedNodeHolder',
		'highlightedNodeHolder'
	],
	#category : #'Tinyrossa-Tools-SmalltalkX'
}

{ #category : #'plugIn spec' }
TRInstructionListApp class >> aspectSelectors [
	^ super aspectSelectors ,
	  #(
		#selectedNodeHolder
	  ).

	"Created: / 20-10-2019 / 23:35:35 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 10-08-2022 / 16:02:10 / Jan Vrany <jan.vrany@labware.com>"
]

{ #category : #'change & update-delayed' }
TRInstructionListApp >> delayedUpdateHighlight [
	| nodeP |

	nodeP := self internalHighlightHolder value.
	(nodeP notNil and:[nodeP instruction dissection notNil]) ifTrue: [
		self highlightedNodeHolder value: nodeP instruction dissection node
	] ifFalse: [ 
		self highlightedNodeHolder value: nil
	].
]

{ #category : #'change & update-delayed' }
TRInstructionListApp >> delayedUpdateInternalHighlight [
	| highlighted |

	highlighted := self highlightedNodeHolder value.
	highlighted notNil ifTrue: [
		| highlightedPs |

		highlightedPs := OrderedCollection new: 3.
		self instructionPresentersDo: [:insnP | 
			| dissection |

			dissection := insnP instruction dissection.
			dissection notNil ifTrue: [ 
				dissection node == highlighted ifTrue: [ 
					highlightedPs add: insnP.
				].
			].
		].
		internalHighlightHolder value: highlightedPs.
		^ self
	].
	internalHighlightHolder value: nil.


	"Created: / 26-06-2018 / 11:33:06 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 03-07-2018 / 14:56:10 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #'change & update-delayed' }
TRInstructionListApp >> delayedUpdateSelection [
	| insn node |

	super delayedUpdateSelection.
	insn := self selectedInstructionHolder value.
	(insn notNil and:[insn dissection isPseudoInstruction not and:[insn dissection node notNil]]) ifTrue: [ 
		node := insn dissection node.
	].
	self selectedNodeHolder value: node.

	"Modified: / 22-06-2018 / 15:08:26 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #aspects }
TRInstructionListApp >> highlightedNodeHolder [
	highlightedNodeHolder isNil ifTrue: [
		highlightedNodeHolder := ValueHolder new.
		highlightedNodeHolder addDependent:self.
	].
	^ highlightedNodeHolder
]

{ #category : #aspects }
TRInstructionListApp >> highlightedNodeHolder: aValueModel [
	|oldValue newValue|

	highlightedNodeHolder notNil ifTrue: [
		oldValue := highlightedNodeHolder value.
		highlightedNodeHolder removeDependent: self.
	].
	highlightedNodeHolder := aValueModel.
	highlightedNodeHolder notNil ifTrue: [
		highlightedNodeHolder addDependent: self.
	].
	newValue := highlightedNodeHolder value.
	oldValue ~~ newValue ifTrue: [
		self update: #value with: newValue from: highlightedNodeHolder.
	].
]

{ #category : #aspects }
TRInstructionListApp >> selectedNodeHolder [
	"return/create the 'selectedNodeHolder' value holder (automatically generated)"

	selectedNodeHolder isNil ifTrue:[
		selectedNodeHolder := ValueHolder new.
		selectedNodeHolder addDependent:self.
	].
	^ selectedNodeHolder
]

{ #category : #aspects }
TRInstructionListApp >> selectedNodeHolder:aValueModel [
	"set the 'selectedNodeHolder' value holder (automatically generated)"

	|oldValue newValue|

	selectedNodeHolder notNil ifTrue:[
		oldValue := selectedNodeHolder value.
		selectedNodeHolder removeDependent:self.
	].
	selectedNodeHolder := aValueModel.
	selectedNodeHolder notNil ifTrue:[
		selectedNodeHolder addDependent:self.
	].
	newValue := selectedNodeHolder value.
	oldValue ~~ newValue ifTrue:[
		self update:#value with:newValue from:selectedNodeHolder.
	].
]

{ #category : #'change & update' }
TRInstructionListApp >> update:aspect with:param from:sender [
	sender == selectedNodeHolder ifTrue:[ 
		self enqueueDelayedInvalidateInternalList.
		^ self.
	].

	sender == highlightedNodeHolder ifTrue: [ 
		self enqueueDelayedUpdateInternalHighlight.
	].
	super update:aspect with:param from:sender

	"Modified: / 23-01-2019 / 16:37:11 / jv"
	"Modified: / 10-06-2019 / 12:43:11 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]
