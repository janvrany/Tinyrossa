Class {
	#name : #TRCompilationExplorerApp,
	#superclass : #ApplicationModel,
	#instVars : [
		'compilationHolder',
		'selectedNodeHolder',
		'selectedInstructionHolder'
	],
	#category : #'Tinyrossa-Tools-SmalltalkX'
}

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
	#(FullSpec
	   name: windowSpec
	   window: 
	  (WindowSpec
		 label: 'Compilation Explorer'
		 name: 'Compilation Explorer'
		 uuid: 'ea129330-18b0-11ed-8d2c-0021ccd5e3d3'
		 min: (Point 10 10)
		 bounds: (Rectangle 0 0 856 598)
		
	  ) component: 
	  (SpecCollection
		 collection: (
		  (VariableHorizontalPanelSpec
			 name: 'VariableHorizontalPanel1'
			 layout: (LayoutFrame 0 0 0 0 0 1 0 1)
			 component: 
			(SpecCollection
			   collection: (
				(SubCanvasSpec
				   name: 'IL'
				   hasHorizontalScrollBar: false
				   hasVerticalScrollBar: false
				   majorKey: TRILTreeApp
				   subAspectHolders: 
				  (Array 
					(SubChannelInfoSpec
					   subAspect: nodeListHolder
					   aspect: nodeListHolder
					) 
					(SubChannelInfoSpec
					   subAspect: nodeSelectionHolder
					   aspect: selectedNodeHolder
					)
				  ) createNewApplication: true
				   createNewBuilder: false
				)
				(SubCanvasSpec
				   name: 'Instructions'
				   hasHorizontalScrollBar: false
				   hasVerticalScrollBar: false
				   miniScrollerHorizontal: false
				   miniScrollerVertical: false
				   majorKey: TRInstructionListApp
				   subAspectHolders: 
				  (Array 
					(SubChannelInfoSpec
					   subAspect: instructionListHolder
					   aspect: instructionListHolder
					) 
					(SubChannelInfoSpec
					   subAspect: selectedInstructionHolder
					   aspect: selectedInstructionHolder
					)
					(SubChannelInfoSpec
					   subAspect: selectedNodeHolder
					   aspect: selectedNodeHolder
					)
				  ) createNewApplication: true
				   createNewBuilder: false
				)
			  )
			) handles: 
			('Any'
			   0.5 1.0
			)
		  )
		)
	  )
	)
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
TRCompilationExplorerApp >> nodeListHolder [
	^ AspectAdaptor forAspect: #il subjectChannel: self compilationHolder
]

{ #category : #aspects }
TRCompilationExplorerApp >> selectedInstructionHolder [
	"return/create the 'selectedInstructionHolder' value holder (automatically generated)"

	selectedInstructionHolder isNil ifTrue:[
		selectedInstructionHolder := ValueHolder new.
		selectedInstructionHolder addDependent:self.
	].
	^ selectedInstructionHolder
]

{ #category : #aspects }
TRCompilationExplorerApp >> selectedInstructionHolder:something [
	"set the 'selectedInstructionHolder' value holder (automatically generated)"

	|oldValue newValue|

	selectedInstructionHolder notNil ifTrue:[
		oldValue := selectedInstructionHolder value.
		selectedInstructionHolder removeDependent:self.
	].
	selectedInstructionHolder := something.
	selectedInstructionHolder notNil ifTrue:[
		selectedInstructionHolder addDependent:self.
	].
	newValue := selectedInstructionHolder value.
	oldValue ~~ newValue ifTrue:[
		self update:#value with:newValue from:selectedInstructionHolder.
	].
]

{ #category : #aspects }
TRCompilationExplorerApp >> selectedNodeHolder [
	"return/create the 'selectedNodeHolder' value holder (automatically generated)"

	selectedNodeHolder isNil ifTrue:[
		selectedNodeHolder := ValueHolder new.
		selectedNodeHolder addDependent:self.
	].
	^ selectedNodeHolder
]

{ #category : #aspects }
TRCompilationExplorerApp >> selectedNodeHolder:something [
	"set the 'selectedNodeHolder' value holder (automatically generated)"

	|oldValue newValue|

	selectedNodeHolder notNil ifTrue:[
		oldValue := selectedNodeHolder value.
		selectedNodeHolder removeDependent:self.
	].
	selectedNodeHolder := something.
	selectedNodeHolder notNil ifTrue:[
		selectedNodeHolder addDependent:self.
	].
	newValue := selectedNodeHolder value.
	oldValue ~~ newValue ifTrue:[
		self update:#value with:newValue from:selectedNodeHolder.
	].
]
