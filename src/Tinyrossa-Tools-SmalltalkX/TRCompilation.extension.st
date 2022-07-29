Extension { #name : #TRCompilation }

{ #category : '*Tinyrossa-Tools-SmalltalkX' }
TRCompilation >> inspector2TabIL [
	<inspector2Tab>

	^ (self newInspector2Tab)
		label:'IL';
		priority:60;
		view: [ 
			| list expand view |

			list := PluggableHierarchicalList new.
			list childBlock: [ :node | node children ].
			list showRoot: false.
			list roots: self il.

			expand := [ :item | item children do: expand. item expand ].
			expand value: list root.

			view := ScrollableView for:HierarchicalListView.
			view list: list.
			view font: Workspace defaultFont.
			view useDefaultIcons: false.
			view showLines: false




		];    
		yourself
]

{ #category : '*Tinyrossa-Tools-SmalltalkX' }
TRCompilation >> inspector2TabMachineCode [
	<inspector2Tab>

	codeBuffer isNil ifTrue: [ 
		^ (self newInspector2Tab)
			label:'Machine Code';
			priority:50;
			view: [ Label new label: 'Code not yet compiled'];
			yourself       
	] ifFalse: [ 
		^ codeBuffer inspector2TabMachineCode
	].
]
