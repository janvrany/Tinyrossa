Extension { #name : #TRILBlock }

{ #category : #'*Tinyrossa-Tools-Pharo' }
TRILBlock >> gtInspectorTRILIn: composite [
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
		display: [ :comp | printer := TRILNodePrinter new. treetops collect: builder ];
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
