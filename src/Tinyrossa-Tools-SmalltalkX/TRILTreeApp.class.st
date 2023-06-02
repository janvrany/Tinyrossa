Class {
	#name : #TRILTreeApp,
	#superclass : #VDBAbstractTreeApplication,
	#instVars : [
		'nodeListHolder',
		'nodeList',
		'nodeSelectionHolder',
		'nodePrinter'
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
TRILTreeApp >> delayedUpdateInternalList [
	nodePrinter := TRILNodePrinter new.
	self internalListHolder roots: self nodeListHolder value ? #().
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

{ #category : #'aspects-private' }
TRILTreeApp >> internalListHolder [
	"return/create the 'listHolder' value holder (automatically generated)"

	internalListHolder isNil ifTrue:[
		internalListHolder := PluggableHierarchicalList new. 
		internalListHolder application: self.
		internalListHolder showRoot: false.
		internalListHolder childBlock: [ :node | node children ].
		internalListHolder labelBlock: [ :node | node notNil ifTrue: [ nodePrinter print: node ] ifFalse:['nil']].
		internalListHolder root: nil.
	].
	^ internalListHolder

	"Created: / 20-09-2014 / 23:03:07 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 06-06-2017 / 23:33:07 / Jan Vrany <jan.vrany@fit.cvut.cz>"
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
	super update:aspect with:parameter from:sender
]
