Class {
	#name : #TRColumnContainer,
	#superclass : #VDBAbstractContainer,
	#instVars : [
		'columnsView'
	],
	#category : #'Tinyrossa-Tools-SmalltalkX'
}

{ #category : #'plugIn spec' }
TRColumnContainer class >> aspectSelectors [
	"This resource specification was automatically generated
	 by the UIPainter of ST/X."

	"Do not manually edit this. If it is corrupted,
	 the UIPainter may not be able to read the specification."

	"Return a description of exported aspects;
	 these can be connected to aspects of an embedding application
	 (if this app is embedded in a subCanvas)."

	^ #(
		#debuggerHolder
	  ).
]

{ #category : #queries }
TRColumnContainer class >> isAbstract [
	"Return if this class is an abstract class.
	 True is returned here for myself only; false for subclasses.
	 Abstract subclasses must redefine this again."

	^ self == TRColumnContainer.
]

{ #category : #'interface specs' }
TRColumnContainer class >> windowSpec [
	"This resource specification was automatically generated
	 by the UIPainter of ST/X."

	"Do not manually edit this! If it is corrupted,
	 the UIPainter may not be able to read the specification."

	"
	 UIPainter new openOnClass:TRColumnContainer andSelector:#windowSpec
	 TRColumnContainer new openInterface:#windowSpec
	 TRColumnContainer open
	"

	<resource: #canvas>

	^
	#(#FullSpec
	   #name: #windowSpec
	   #window:
	  (#WindowSpec
		 #label: 'TRColumnContainer'
		 #name: 'TRColumnContainer'
		 #uuid: 'e8374210-e48a-11ef-9889-387c761bbb1b'
		 #min: (#Point 10 10)
		 #bounds: (#Rectangle 0 0 300 300)

	  ) #component:
	  (#SpecCollection
		 #collection: (
		  (#VariableHorizontalPanelSpec
			 #name: 'Columns'
			 #layout: (#LayoutFrame 0 0 0 0 0 1 0 1)
			 #postBuildCallback: #postBuildColumns:
		  )
		)
	  )
	)
]

{ #category : #hooks }
TRColumnContainer >> postBuildAsSubcanvasWith: anUIBuilder [
	 super postBuildAsSubcanvasWith: anUIBuilder.

	 columnsView setupSubviews.
	 columnsView resizeSubviews.
]

{ #category : #hooks }
TRColumnContainer >> postBuildColumns: aHorizontalPanelView [
	columnsView := aHorizontalPanelView.
	columnsView notNil ifTrue: [
		components do: [:each |
			columnsView addSubView: each.
		].
	].
]

{ #category : #hooks }
TRColumnContainer >> postBuildWith: anUIBuilder [
	super postBuildWith: anUIBuilder.

	columnsView setupSubviews.
	columnsView resizeSubviews.
]

{ #category : #'change & update' }
TRColumnContainer >> update: aspect with: param from: sender [

	sender == components ifTrue: [
		self updateColumns: aspect with: param.
		^ self.
	].

	super update: aspect with: param from: sender
]

{ #category : #'change & update' }
TRColumnContainer >> updateColumns: what with: param [

	columnsView isNil ifTrue: [
		"UI is not yet fully built"
		^ self
	].

	(what == #insert:) ifTrue: [
		| i |

		i := param.
		i == 1 ifTrue: [
			columnsView addSubViewFirst: (components at: i)
		] ifFalse: [
			columnsView addSubView: (components at: i) after: (components at: i - 1).
		].
		^ self.
	].
	(what == #insertCollection:) ifTrue: [
		| first  last |

		first := param first.
		last := param first + param second - 1.
		first to: last do: [:i |
			i == 1 ifTrue: [
				columnsView addSubViewFirst: (components at: i)
			] ifFalse: [
				columnsView addSubView: (components at: i) after: (components at: i - 1).
			]
		].
		^ self
	].
	self notYetImplemented
]
