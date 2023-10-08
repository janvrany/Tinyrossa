Extension { #name : #TRCFG }

{ #category : #'*Tinyrossa-Tools-Pharo' }
TRCFG >> gtInspectorCFGIn: composite [
	<gtInspectorPresentationOrder: -10>
 	composite roassal3 title: 'CFG'; initializeCanvas: [ 
		| canvas blocksG edges |
		
		canvas := RSCanvas new.
		blocksG := RSGroup new.
		blocks do:[:block | 
			| box label node |
			
			label := RSLabel new text: block name.
			box := RSShapeFactory box
							border: (RSBorder new width: 2; color: Color black);
							cornerRadius: 5;
							color: (Color gray: 0.9);
							width: label encompassingRectangle width + 16;
							height: label encompassingRectangle height + 16.	
			RSLocation new center; outer; stick: label on: box.
			node := (RSComposite new model: block; shapes: { box . label }) @ RSDraggable.
			
			blocksG add: node. 
			canvas add: node
		].

		edges := RSEdgeBuilder verticalBezier.
		
		"
		edges shape markerEnd:	((RSShapeFactory arrow
			size: 20;
			color: Color black;
			yourself) asMarker offsetRatio: 1.0).
		"
		edges
			canvas: canvas; moveBehind; width: 2;
		 	shapes: blocksG; connectToAll: #successors.

		RSSugiyamaLayout on: blocksG. 
		canvas @ RSCanvasController 
	]
]
