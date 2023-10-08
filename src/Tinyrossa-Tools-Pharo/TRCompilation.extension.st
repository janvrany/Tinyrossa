Extension { #name : #TRCompilation }

{ #category : #'*Tinyrossa-Tools-Pharo' }
TRCompilation >> gtInspectorANFIn: composite [
	<gtInspectorPresentationOrder: 90>

	| printer |

	composite tree
		title: 'ANF';
		rootsExpanded;
		display: [ :comp |
			| nodes |

			printer := TRANFNodePrinter new.
			nodes := OrderedCollection new.
			comp cfg treetops do:[:treetop |
				treetop postorderDo: [ :node |
					(nodes includes: node) ifFalse:[
						nodes add: node
					]
				]
			].
			nodes.
		];
		children: [ :node | #() ];
		format: [ :node | printer print: node ];
		yourself.

]

{ #category : #'*Tinyrossa-Tools-Pharo' }
TRCompilation >> gtInspectorCFGIn: composite [
	<gtInspectorPresentationOrder: 80>

	cfg gtInspectorCFGIn: composite.
]

{ #category : #'*Tinyrossa-Tools-Pharo' }
TRCompilation >> gtInspectorInstructionsIn: composite [
	<gtInspectorPresentationOrder: 60>
	
	codegen isNil ifTrue:[
		"Not yet compiled"
		^self.
	].

	^ composite fastTable
		title: 'Instructions';
		display: [ 
			| pc instructions insnsWithAddrs |
			
			pc := self codeBuffer address.
			instructions := self codeBuffer instructions.
			insnsWithAddrs := OrderedCollection new: instructions size.
			instructions collect:[:insn |
				insn isPseudoInstruction ifTrue:[
					insnsWithAddrs add: { insn . nil }
				] ifFalse:[
					insnsWithAddrs add: { insn . pc }.
				].
				pc := pc + (insn bitWidth // 8)
			].
			insnsWithAddrs
		];
		column: 'Address' evaluated: [ :insnAndAddr | insnAndAddr second ifNil:[''] ifNotNil:[insnAndAddr second printPaddedWith: $0 to: 6 base: 16 ] ];
		column: 'Instruction' evaluated: [ :insnAndAddr | insnAndAddr first disassemble ];
		column: 'Node' evaluated: [ :insnAndAddr | 
			| node |
			
			node := insnAndAddr first annotationAt: TRILNode.
			node notNil ifTrue:[
				TRILNodePrinter new printId: node	
			] ifFalse:[
				''
			]];
		column: 'Location' evaluated: [ :insnAndAddr |
			| node |
			
			node := insnAndAddr first annotationAt: TRILNode.
			(node notNil and:[node location notNil]) ifTrue:[
				node	location gtDisplayString 
			] ifFalse:[
				''
			]];
		yourself
		"
		selectionPopulate: #selection
			entitled: 'Open key'
			with: [ :table | ( table rawSelection collect: #key ) gtInspectorInterestingObject ];
		beMultiple;
		send: [ :selection | 
			selection
				ifNil: [ nil ]
				ifNotNil: [ selection size = 1
						ifTrue: [ selection anyOne value ]
						ifFalse: [ selection collect: #value ]
					]
			]
		"
]

{ #category : #'*Tinyrossa-Tools-Pharo' }
TRCompilation >> gtInspectorSymbolsIn: composite [
	<gtInspectorPresentationOrder: 40>

	composite fastTable 
		title: 'Symbols';
		display: [ :comp | comp symbolManager symbols asArray ];
		column: 'Name' evaluated: [ :sym | sym name ];
		column: 'Type' evaluated: [ :sym | sym type name ];
		column: 'Uses' evaluated: [ :sym | sym useCount ];
		column: 'Kind' evaluated: [ :sym | sym class name ];		
		yourself.

]

{ #category : #'*Tinyrossa-Tools-Pharo' }
TRCompilation >> gtInspectorTRILIn: composite [
	<gtInspectorPresentationOrder: 35>

	| printer builder |
	
	builder := [ :node | 
		| printed |
		
		printed := printer hasPrinted: node.
		{ node. 
			printer print: node.
			printed ifTrue:[ #() ] ifFalse: [ node children collect: builder ] }
	].

	composite fastTreeTable 
		title: 'TRIL';
		rootsExpanded;
		display: [ :comp | printer := TRILNodePrinter new. comp cfg treetops collect: builder ];
		children: [ :item | item third ];		
		column: 'Node' evaluated: [ :item | item second ];
		column: 'ID' evaluated: [ :item | printer printId: item first ];
		column: 'Location' evaluated: [ :item |
			| node |
			
			node := item first.
			node location notNil ifTrue:[
				node	location gtDisplayString 
			] ifFalse:[
				''
			]];
		yourself.

]
