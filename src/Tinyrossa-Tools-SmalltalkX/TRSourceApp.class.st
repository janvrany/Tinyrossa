Class {
	#name : #TRSourceApp,
	#superclass : #VDBSourceApplication,
	#instVars : [
		'nodeHighlightHolder'
	],
	#category : #'Tinyrossa-Tools-SmalltalkX'
}

{ #category : #'change & update-delayed' }
TRSourceApp >> delayedUpdateInternalHighlight [
	| node line |

	node := self nodeHighlightHolder value.
	node notNil ifTrue: [
		| loc |
		loc := node location.
		loc notNil ifTrue: [
			loc := loc locationAtStratum: TRSourceLocation.
			loc notNil ifTrue: [
				line := loc line.
			].
		].
	].
	line notNil ifTrue:[
		sourceView selectLine:line.
		sourceView makeSelectionVisible.
	] ifFalse: [
		sourceView unselect
	].
]

{ #category : #'change & update' }
TRSourceApp >> enqueueDelayedUpdateInternalHighlight [
	self enqueueMessage: #delayedUpdateInternalHighlight

	"Created: / 10-02-2025 / 15:15:36 / Jan Vrany <jan.vrany@labware.com>"
]

{ #category : #aspects }
TRSourceApp >> nodeHighlightHolder [
	nodeHighlightHolder isNil ifTrue: [
		nodeHighlightHolder := ValueHolder new.
		nodeHighlightHolder addDependent:self.
	].
	^ nodeHighlightHolder
]

{ #category : #aspects }
TRSourceApp >> nodeHighlightHolder: something [
	|oldValue newValue|

	nodeHighlightHolder notNil ifTrue: [
		oldValue := nodeHighlightHolder value.
		nodeHighlightHolder removeDependent: self.
	].
	nodeHighlightHolder := something.
	nodeHighlightHolder notNil ifTrue: [
		nodeHighlightHolder addDependent: self.
	].
	newValue := nodeHighlightHolder value.
	oldValue ~~ newValue ifTrue: [
		self update: #value with: newValue from: nodeHighlightHolder.
	].
]

{ #category : #'change & update' }
TRSourceApp >> update:aspect with:parameter from:sender [
	sender == nodeHighlightHolder ifTrue: [
		self enqueueDelayedUpdateInternalHighlight.
		^ self
	].
	super update:aspect with:parameter from:sender
]
