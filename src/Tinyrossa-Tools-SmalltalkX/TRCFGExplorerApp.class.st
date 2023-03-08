Class {
	#name : #TRCFGExplorerApp,
	#superclass : #ApplicationModel,
	#instVars : [
		'cfgHolder',
		'cfgView'
	],
	#category : #'Tinyrossa-Tools-SmalltalkX'
}

{ #category : #'interface specs' }
TRCFGExplorerApp class >> windowSpec [
	"This resource specification was automatically generated
	 by the UIPainter of ST/X."

	"Do not manually edit this! If it is corrupted,
	 the UIPainter may not be able to read the specification."

	"
	 UIPainter new openOnClass:TRCFGApp andSelector:#windowSpec
	 TRCFGApp new openInterface:#windowSpec
	 TRCFGApp open
	"

	<resource: #canvas>

	^ 
	#(FullSpec
	   name: windowSpec
	   window: 
	  (WindowSpec
		 label: 'CFGApp'
		 name: 'CFGApp'
		 uuid: '2fb92420-a886-11ed-baaf-0021ccd5e3d3'
		 min: (Point 10 10)
		 bounds: (Rectangle 0 0 300 300)
		
	  ) component: 
	  (SpecCollection
		 collection: (
		  (ArbitraryComponentSpec
			 name: 'CFG View'
			 layout: (LayoutFrame 0 0 0 0 0 1 0 1)
			 hasHorizontalScrollBar: true
			 hasVerticalScrollBar: true
			 hasBorder: false
			 component: cfgView
		  )
		)
	  )
	)
]

{ #category : #accessing }
TRCFGExplorerApp >> cfg [
	^ self cfgHolder value.
]

{ #category : #accessing }
TRCFGExplorerApp >> cfg: aTRCFG [
	self cfgHolder value: aTRCFG
]

{ #category : #aspects }
TRCFGExplorerApp >> cfgHolder [
	"return/create the 'cfgHolder' value holder (automatically generated)"

	cfgHolder isNil ifTrue:[
		cfgHolder := ValueHolder new.
		cfgHolder addDependent:self.
	].
	^ cfgHolder
]

{ #category : #aspects }
TRCFGExplorerApp >> cfgHolder:aValueModel [
	"set the 'cfgHolder' value holder (automatically generated)"

	|oldValue newValue|

	cfgHolder notNil ifTrue:[
		oldValue := cfgHolder value.
		cfgHolder removeDependent:self.
	].
	cfgHolder := aValueModel.
	cfgHolder notNil ifTrue:[
		cfgHolder addDependent:self.
	].
	newValue := cfgHolder value.
	oldValue ~~ newValue ifTrue:[
		self update:#value with:newValue from:cfgHolder.
	].
]

{ #category : #aspects }
TRCFGExplorerApp >> cfgView [
	cfgView isNil ifTrue: [ 
		cfgView := ObjectView new.
		cfgView pressAction: [:pressPoint | cfgView startSelectOrMove:pressPoint].

		self updateCFGView.
	].
	^ cfgView
]

{ #category : #'change & update' }
TRCFGExplorerApp >> update:aspect with:parameter from:sender [

	sender == cfgHolder ifTrue:[
		 self updateCFGView.
		 ^ self.
	].
	super update:aspect with:parameter from:sender
]

{ #category : #'change & update' }
TRCFGExplorerApp >> updateCFGView [
	| cfg  blocks stack nodes edges |

	cfgView isNil ifTrue: [
		^ self
	].
	cfg := self cfgHolder value.
	cfg isNil ifTrue: [
		cfgView removeAll.
		^ self.
	].
	blocks := OrderedCollection new.
	stack := Stack with: cfg entry.
	[ stack notEmpty ] whileTrue: [
		| block |

		block := stack pop.
		blocks add: block.
		(block successor2 notNil and: [ (blocks includes: block successor2) not ]) ifTrue: [
			stack push: block successor2.
		].
		(block successor1 notNil and: [ (blocks includes: block successor1) not ]) ifTrue: [
			stack push: block successor1.
		].
	].

	nodes := OrderedCollection new.
	edges := Set new.

	blocks 
		withIndexDo: [:block :index | 
			| node |

			node := TRCFGNodeObject new.
			node view: cfgView.
			node block: block.
			node origin: 50 @ (50 + ((index - 1) * 70)).
			nodes add: node.
		].

	blocks withIndexDo: [:block :index | 
		| src |

		src := nodes at: index.
		block successor1 notNil ifTrue: [ 
			| dst edge |

			dst := nodes detect: [ :e | e block == block successor1 ].

			edge := TRCFGEdgeObject new.
			edge view: cfgView.
			edge src: src dst: dst.
			edges add: edge.
		].
		block successor2 notNil ifTrue: [ 
			| dst edge |

			dst := nodes detect: [ :e | e block == block successor2 ].

			edge := TRCFGEdgeObject new.
			edge view: cfgView.
			edge src: src dst: dst.
			edges add: edge.
		].
	].

	nodes do: [:node | cfgView add: node ].
	edges do: [:edge | cfgView add: edge ].
]
