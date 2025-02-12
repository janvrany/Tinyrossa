Class {
	#name : #TRILTreeApp,
	#superclass : #VDBAbstractTreeApplication,
	#instVars : [
		'nodeListHolder',
		'nodeSelectionHolder',
		'nodeHighlightHolder'
	],
	#category : #'Tinyrossa-Tools-SmalltalkX'
}

{ #category : #'plugIn spec' }
TRILTreeApp class >> aspectSelectors [
	"This resource specification was automatically generated
	 by the UIPainter of ST/X."

	"Do not manually edit this. If it is corrupted,
	 the UIPainter may not be able to read the specification."

	"Return a description of exported aspects;
	 these can be connected to aspects of an embedding application
	 (if this app is embedded in a subCanvas)."

	^ #(
		#nodeListHolder
		#nodeSelectionHolder
	  ).

]

{ #category : #'accessing - defaults' }
TRILTreeApp class >> defaultWindowTitle [
	"Returns default window title for this application. By default,
	 extracts the title from #windowSpec.
	 
	 Subclasses may (must) override this method."

	^ 'TRIL Tree'
]

{ #category : #menu }
TRILTreeApp >> contextMenuItemSlice [
	^ Menu new

	"Created: / 16-01-2018 / 13:37:08 / jv"
	"Modified: / 16-01-2018 / 22:03:45 / jv"
]

{ #category : #'change & update-delayed' }
TRILTreeApp >> delayedUpdateHighlight [
	| nodeP |

	nodeP := self internalHighlightHolder value.
	nodeP notNil ifTrue: [
		self nodeHighlightHolder value: nodeP node
	] ifFalse: [ 
		self nodeHighlightHolder value: nil
	].
]

{ #category : #'change & update-delayed' }
TRILTreeApp >> delayedUpdateInternalHighlight [
	| highlighted |

	highlighted := self nodeHighlightHolder value.
	highlighted notNil ifTrue: [
		internalListHolder value do: [:nodeP | 
			nodeP node == highlighted ifTrue: [ 
				internalHighlightHolder value: nodeP.
				^ self.
			].
		].
	].
	internalHighlightHolder value: nil.

	"Created: / 26-06-2018 / 11:33:06 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 03-07-2018 / 14:56:10 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #'change & update-delayed' }
TRILTreeApp >> delayedUpdateInternalList [
	| printer builder root |

	printer := TRILNodePrinter new.
	builder := [ :node | 
		| printed item |

		printed := printer hasPrinted: node.
		item := TRILNodePresenter new.
		item setNode: node label: (printer print: node).
		printed ifFalse: [ 
			item children: (node children collect: builder).
		].
		item.
	].

	root := HierarchicalItem new.
	root children: ((self nodeListHolder value ? #()) collect: builder).

	self internalListHolder root: root.
	self internalListHolder root recursiveDo: [ :item | item expand ]
]

{ #category : #'change & update-delayed' }
TRILTreeApp >> delayedUpdateInternalSelection [
	| node nodeP |

	node := self nodeSelectionHolder value.
	node notNil ifTrue: [ 
		nodeP := self internalListHolder root recursiveDetect: [:eachP | eachP value = node ].
		nodeP notNil ifTrue: [ 
			nodeP parent expand.
		].
	].
	self internalSelectionHolder value: nodeP
]

{ #category : #'change & update-delayed' }
TRILTreeApp >> delayedUpdateSelection [
	| nodeP |

	nodeP := self internalSelectionHolder value.    
	self nodeSelectionHolder value: nodeP value
]

{ #category : #'menu actions' }
TRILTreeApp >> doInspectModel [
	| selection |

	selection := self internalSelectionHolder value.
	selection notEmptyOrNil ifTrue:[ 
		self doInspect: selection value
	].

	"Modified: / 05-02-2018 / 13:07:57 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 17-11-2021 / 13:08:52 / Jan Vrany <jan.vrany@labware.com>"
]

{ #category : #'help texts' }
TRILTreeApp >> flyByHelpTextFor:aView at: aPoint [
	^ nil

	"Created: / 29-07-2018 / 21:30:51 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #accessing }
TRILTreeApp >> il [
	^ self nodeListHolder value

]

{ #category : #accessing }
TRILTreeApp >> il: aCollection [
	self nodeListHolder value: aCollection.

]

{ #category : #aspects }
TRILTreeApp >> nodeHighlightHolder [
	nodeHighlightHolder isNil ifTrue: [
		nodeHighlightHolder := ValueHolder new.
		nodeHighlightHolder addDependent:self.
	].
	^ nodeHighlightHolder
]

{ #category : #aspects }
TRILTreeApp >> nodeHighlightHolder: aValueModel [
	|oldValue newValue|

	nodeHighlightHolder notNil ifTrue: [
		oldValue := nodeHighlightHolder value.
		nodeHighlightHolder removeDependent: self.
	].
	nodeHighlightHolder := aValueModel.
	nodeHighlightHolder notNil ifTrue: [
		nodeHighlightHolder addDependent: self.
	].
	newValue := nodeHighlightHolder value.
	oldValue ~~ newValue ifTrue: [
		self update: #value with: newValue from: nodeHighlightHolder.
	].
]

{ #category : #aspects }
TRILTreeApp >> nodeListHolder [
	"return/create the 'nodeListHolder' value holder (automatically generated)"

	nodeListHolder isNil ifTrue:[
		nodeListHolder := ValueHolder new.
		nodeListHolder addDependent:self.
	].
	^ nodeListHolder
]

{ #category : #aspects }
TRILTreeApp >> nodeListHolder:something [
	"set the 'nodeListHolder' value holder (automatically generated)"

	|oldValue newValue|

	nodeListHolder notNil ifTrue:[
		oldValue := nodeListHolder value.
		nodeListHolder removeDependent:self.
	].
	nodeListHolder := something.
	nodeListHolder notNil ifTrue:[
		nodeListHolder addDependent:self.
	].
	newValue := nodeListHolder value.
	oldValue ~~ newValue ifTrue:[
		self update:#value with:newValue from:nodeListHolder.
	].

]

{ #category : #aspects }
TRILTreeApp >> nodeSelectionHolder [
	"return/create the 'nodeSelectionHolder' value holder (automatically generated)"

	nodeSelectionHolder isNil ifTrue:[
		nodeSelectionHolder := ValueHolder new.
		nodeSelectionHolder addDependent:self.
	].
	^ nodeSelectionHolder
]

{ #category : #aspects }
TRILTreeApp >> nodeSelectionHolder:something [
	"set the 'nodeSelectionHolder' value holder (automatically generated)"

	|oldValue newValue|

	nodeSelectionHolder notNil ifTrue:[
		oldValue := nodeSelectionHolder value.
		nodeSelectionHolder removeDependent:self.
	].
	nodeSelectionHolder := something.
	nodeSelectionHolder notNil ifTrue:[
		nodeSelectionHolder addDependent:self.
	].
	newValue := nodeSelectionHolder value.
	oldValue ~~ newValue ifTrue:[
		self update:#value with:newValue from:nodeSelectionHolder.
	].

]

{ #category : #'change & update' }
TRILTreeApp >> update:aspect with:parameter from:sender [
	sender == nodeListHolder ifTrue:[
		self enqueueDelayedUpdateContents.
		^ self.
	].
	sender == nodeSelectionHolder ifTrue: [ 
		self enqueueDelayedUpdateInternalSelection.
		^ self
	].

	sender == nodeHighlightHolder ifTrue: [ 
		self enqueueDelayedUpdateInternalHighlight.
		^ self
	].
	super update:aspect with:parameter from:sender
]
