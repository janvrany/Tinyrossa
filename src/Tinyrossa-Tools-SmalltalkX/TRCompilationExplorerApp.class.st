Class {
	#name : #TRCompilationExplorerApp,
	#superclass : #ApplicationModel,
	#instVars : [
		'compilationHolder',
		'highlightedNodeHolder'
	],
	#category : #'Tinyrossa-Tools-SmalltalkX'
}

{ #category : #'list specs' }
TRCompilationExplorerApp class >> leftColumnTabs [
	"This resource specification was automatically generated
	 by the TabListEditor of ST/X."

	"Do not manually edit this! If it is corrupted,
	 the TabListEditor may not be able to read the specification."

	"
	 TabListEditor new openOnClass: self andSelector:#leftColumnTabs
	"

	<resource: #tabList>

	^     #(
	   (TabItem
		  label: 'Tree'
		  translateLabel: true
		  majorKey: treeApp
	   )
	   (TabItem
		  label: 'ANF'
		  translateLabel: true
		  majorKey: anfApp
	   )
	 )
	  collect:[:aTab| TabItem new fromLiteralArrayEncoding:aTab ]
]

{ #category : #'list specs' }
TRCompilationExplorerApp class >> rightColumnTabs [
	"This resource specification was automatically generated
	 by the TabListEditor of ST/X."

	"Do not manually edit this! If it is corrupted,
	 the TabListEditor may not be able to read the specification."

	"
	 TabListEditor new openOnClass: self andSelector:#rightColumnTabs
	"

	<resource: #tabList>

	^     #(
	   (TabItem
		  label: 'Instructions'
		  translateLabel: true
		  majorKey: instructionListApp
	   )
	 )
	  collect:[:aTab| TabItem new fromLiteralArrayEncoding:aTab ]
]

{ #category : #'interface specs' }
TRCompilationExplorerApp class >> windowSpec [
	"This resource specification was automatically generated
	 by the UIPainter of ST/X."

	"Do not manually edit this! If it is corrupted,
	 the UIPainter may not be able to read the specification."

	"
	 UIPainter new openOnClass:TRCompilationExplorerApp andSelector:#windowSpec
	 TRCompilationExplorerApp new openInterface:#windowSpec
	 TRCompilationExplorerApp open
	"

	<resource: #canvas>

	^ 
	#(#FullSpec
	   #name: #windowSpec
	   #window: 
	  (#WindowSpec
		 #label: 'Compilation Explorer'
		 #name: 'Compilation Explorer'
		 #uuid: 'ea129330-18b0-11ed-8d2c-0021ccd5e3d3'
		 #min: (#Point 10 10)
		 #bounds: (#Rectangle 0 0 856 598)
		
	  ) #component: 
	  (#SpecCollection
		 #collection: (
		  (#VariableHorizontalPanelSpec
			 #name: 'VariableHorizontalPanel1'
			 #layout: (#LayoutFrame 0 0 0 0 0 1 0 1)
			 #component: 
			(#SpecCollection
			   #collection: (
				(#SubCanvasSpec
				   #name: 'IL'
				   #hasHorizontalScrollBar: false
				   #hasVerticalScrollBar: false
				   #clientKey: #treeApp
				   #subAspectHolders: 
				  (#Array 
					(#SubChannelInfoSpec
					   #subAspect: #nodeListHolder
					   #aspect: #nodeListHolder
					) 
					(#SubChannelInfoSpec
					   #subAspect: #nodeSelectionHolder
					   #aspect: #selectedNodeHolder
					)
				  ) #createNewApplication: true
				   #createNewBuilder: false
				)
				(#SubCanvasSpec
				   #name: 'Instructions'
				   #hasHorizontalScrollBar: false
				   #hasVerticalScrollBar: false
				   #miniScrollerHorizontal: false
				   #miniScrollerVertical: false
				   #clientKey: #instructionListApp
				   #subAspectHolders: 
				  (#Array 
					(#SubChannelInfoSpec
					   #subAspect: #instructionListHolder
					   #aspect: #instructionListHolder
					) 
					(#SubChannelInfoSpec
					   #subAspect: #selectedInstructionHolder
					   #aspect: #selectedInstructionHolder
					) 
					(#SubChannelInfoSpec
					   #subAspect: #selectedNodeHolder
					   #aspect: #selectedNodeHolder
					)
				  ) #createNewApplication: true
				   #createNewBuilder: false
				)
			  )
			)
		  )
		)
	  )
	)
]

{ #category : #'aspects - apps' }
TRCompilationExplorerApp >> anfApp [
	^ TRANFApp new
		nodeListHolder: self nodeListHolder;
		nodeHighlightHolder: self highlightedNodeHolder;
		yourself.
]

{ #category : #accessing }
TRCompilationExplorerApp >> compilation [
	^ self compilationHolder value.
]

{ #category : #accessing }
TRCompilationExplorerApp >> compilation: aTRCompilation [
	self compilationHolder value: aTRCompilation
]

{ #category : #aspects }
TRCompilationExplorerApp >> compilationHolder [
	"return/create the 'compilationHolder' value holder (automatically generated)"

	compilationHolder isNil ifTrue:[
		compilationHolder := ValueHolder new.
		compilationHolder addDependent:self.
	].
	^ compilationHolder
]

{ #category : #aspects }
TRCompilationExplorerApp >> compilationHolder:aValueModel [
	"set the 'compilationHolder' value holder (automatically generated)"

	|oldValue newValue|

	compilationHolder notNil ifTrue:[
		oldValue := compilationHolder value.
		compilationHolder removeDependent:self.
	].
	compilationHolder := aValueModel.
	compilationHolder notNil ifTrue:[
		compilationHolder addDependent:self.
	].
	newValue := compilationHolder value.
	oldValue ~~ newValue ifTrue:[
		self update:#value with:newValue from:compilationHolder.
	].
]

{ #category : #aspects }
TRCompilationExplorerApp >> highlightedNodeHolder [
	highlightedNodeHolder isNil ifTrue: [
		highlightedNodeHolder := ValueHolder new.
	].
	^ highlightedNodeHolder
]

{ #category : #aspects }
TRCompilationExplorerApp >> highlightedNodeHolder: aValueModel [ 
	highlightedNodeHolder := aValueModel.
]

{ #category : #'aspects - apps' }
TRCompilationExplorerApp >> instructionListApp [
   ^ TRInstructionListApp new
		instructionListHolder: self instructionListHolder;
		highlightedNodeHolder: self highlightedNodeHolder;
		yourself.
]

{ #category : #aspects }
TRCompilationExplorerApp >> instructionListHolder [
	^ PluggableAdaptor 
		on: self compilationHolder
		getter:[ :compilationHolder |
			| instructions codeBuffer |

			instructions := #().
			compilationHolder value notNil ifTrue: [
				codeBuffer := compilationHolder value codeBuffer.
				codeBuffer notNil ifTrue:[
					| address |

					address := codeBuffer address.
					instructions := codeBuffer instructions collect: [ :trInsn |
						| gdbInsn |

						gdbInsn := trInsn asGDBInstruction.
						gdbInsn propertyAt: #address put: address.
						address := address + gdbInsn opcodes size.   
						gdbInsn.
					].
				].
			].
			instructions
		].
]

{ #category : #aspects }
TRCompilationExplorerApp >> leftColumnTabs [
	"Generated by the TabListEditor"
	
	| list |

	(list := builder bindingAt: #leftColumnTabs) isNil ifTrue: [
		builder aspectAt: #leftColumnTabs put: (list := self class leftColumnTabs).
	].
	^ list
]

{ #category : #aspects }
TRCompilationExplorerApp >> nodeListHolder [
	^ BlockValue with: [ :comp | comp value cfg treetops ] argument: self compilationHolder.
]

{ #category : #aspects }
TRCompilationExplorerApp >> rightColumnTabs [
	"Generated by the TabListEditor"

	|list|

	(list := builder bindingAt:#rightColumnTabs) isNil ifTrue:[
		builder aspectAt:#rightColumnTabs put:(list := self class rightColumnTabs).
	].
	^ list
]

{ #category : #'aspects - apps' }
TRCompilationExplorerApp >> treeApp [
	^ TRILTreeApp new
		nodeListHolder: self nodeListHolder;
		nodeHighlightHolder: self highlightedNodeHolder;
		yourself.
]
