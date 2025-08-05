Class {
	#name : #TRCompilationExplorer2App,
	#superclass : #TRColumnContainer,
	#instVars : [
		'compilationHolder',
		'highlightedNodeHolder'
	],
	#category : #'Tinyrossa-Tools-SmalltalkX'
}

{ #category : #'accessing - defaults' }
TRCompilationExplorer2App class >> defaultWindowTitle [
	^ 'Compilation Explorer 2'

	"Created: / 03-10-2018 / 15:36:31 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #'adding & removing components' }
TRCompilationExplorer2App >> addComponent: aView labeled: aString beforeIndex: anInteger [
	super addComponent: aView labeled: aString beforeIndex: anInteger.

	aView isApplicationSubView ifTrue:[
		| app |

		app :=  aView application.
		app commonPostBuild.
		app nodeHighlightHolder: self highlightedNodeHolder
	].


	"Created: / 10-06-2014 / 16:37:44 / Jan Vrany <jan.vrany@fit.cvut.cz>"
	"Modified: / 17-09-2014 / 22:44:04 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #accessing }
TRCompilationExplorer2App >> compilation [
	^ self compilationHolder value.
]

{ #category : #accessing }
TRCompilationExplorer2App >> compilation: aTRCompilation [
	self compilationHolder value: aTRCompilation
]

{ #category : #aspects }
TRCompilationExplorer2App >> compilationHolder [
	"return/create the 'compilationHolder' value holder (automatically generated)"

	compilationHolder isNil ifTrue:[
		compilationHolder := ValueHolder new.
		compilationHolder addDependent:self.
	].
	^ compilationHolder
]

{ #category : #aspects }
TRCompilationExplorer2App >> compilationHolder:aValueModel [
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

{ #category : #private }
TRCompilationExplorer2App >> createInsnView [
	| instructionList |

	instructionList := PluggableAdaptor
		on: self compilationHolder
		getter:[ :compilationHolder |
			| instructions codeBuffer |

			instructions := #().
			compilationHolder value notNil ifTrue: [
				codeBuffer := compilationHolder value codeBuffer.
				(codeBuffer notNil and:[codeBuffer instructions notEmpty]) ifTrue:[
					instructions := codeBuffer instructions collect: #asGDBInstruction.
					instructions first propertyAt: #address put: codeBuffer base.
				].
			].
			instructions
		].

	^ TRInstructionListApp new
		instructionListHolder: instructionList;
		nodeHighlightHolder: self highlightedNodeHolder;
		yourself.
]

{ #category : #private }
TRCompilationExplorer2App >> createSourceView [
	| sourceFileHolder |

	sourceFileHolder := PluggableAdaptor
		on: self highlightedNodeHolder
		getter:[ :highlightedNodeHolderhighlightedNodeHolder |
			| sourceFile |

			highlightedNodeHolder value notNil ifTrue: [
				| loc |

				loc := highlightedNodeHolder value location.
				loc notNil ifTrue: [
					loc := loc locationAtStratum: TRSourceLocation.
					loc notNil ifTrue: [
						sourceFile := loc file asFilename.
					].
				].
			].
			sourceFile
		].

	^ TRSourceApp new
		sourceFileHolder: sourceFileHolder
		yourself.
]

{ #category : #private }
TRCompilationExplorer2App >> createTRILView [
	| nodeList |

	nodeList := BlockValue with: [ :comp | comp value cfg treetops ] argument: self compilationHolder.

	^ TRILTreeApp new
		nodeListHolder: nodeList;
		nodeHighlightHolder: self highlightedNodeHolder;
		yourself.
]

{ #category : #aspects }
TRCompilationExplorer2App >> highlightedNodeHolder [
	highlightedNodeHolder isNil ifTrue: [
		highlightedNodeHolder := ValueHolder new.
	].
	^ highlightedNodeHolder
]

{ #category : #aspects }
TRCompilationExplorer2App >> highlightedNodeHolder: aValueModel [
	highlightedNodeHolder := aValueModel.
]

{ #category : #'change & update' }
TRCompilationExplorer2App >> update: aspect with: param from: sender [

	sender == compilationHolder ifTrue: [
		self updateColumns.
		^ self.
	].

	super update: aspect with: param from: sender
]

{ #category : #'change & update' }
TRCompilationExplorer2App >> updateColumns [
	| comp |

	components removeAll.
	labels removeAll.

	comp := self compilation.
	comp notNil ifTrue: [
		| strata |

		strata := Set new.
		comp codeBuffer instructions notEmpty ifTrue: [
			comp codeBuffer instructions do: [:insn |
				| loc |

				loc := insn location.
				loc notNil ifTrue: [ strata addAll: loc locationStrata ]
			].
			self addApplication: self createInsnView.
		] ifFalse: [
			comp value cfg treetops do: [:node |
				| loc |

				loc := node location.
				loc notNil ifTrue: [ strata addAll: loc locationStrata ]
			].
		].
		self addApplication: self createTRILView labeled: 'TRIL' beforeIndex: 1.

		(strata includes: TRSourceLocation) ifTrue: [
			self addApplication: self createSourceView labeled: 'Source' beforeIndex: 1.
		].
	].
]
