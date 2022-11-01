Class {
	#name : #TRInstructionListApp,
	#superclass : #VDBInstructionListApplication,
	#instVars : [
		'selectedNodeHolder'
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

{ #category : #aspects }
TRInstructionListApp >> backgroundColorFor: aVDBPresenter [
	| color node |

	color := super backgroundColorFor: aVDBPresenter.
	color notNil ifTrue: [ ^ color ].

	node := self selectedNodeHolder value.
	node notNil ifTrue: [ 
		|  insn |

		insn := aVDBPresenter instruction dissection.
		(insn notNil and: [ insn isPseudoInstruction not and:[insn node = node ]]) ifTrue: [
			^ (View styleSheet colorAt: #grey_bg_color default:[ Color rgbValue: 16r555555 ])
		].
	].

	^ nil

	"Created: / 26-06-2018 / 11:26:25 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 21-10-2019 / 01:10:45 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 29-07-2022 / 16:18:29 / Jan Vrany <jan.vrany@labware.com>"
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
	super update:aspect with:param from:sender

	"Modified: / 23-01-2019 / 16:37:11 / jv"
	"Modified: / 10-06-2019 / 12:43:11 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]
