Extension { #name : #TRCompilation }

{ #category : #'*Tinyrossa-Tools-Pharo' }
TRCompilation >> gtInspectorTRILIn: composite [
	<gtInspectorPresentationOrder: 35> 
	composite tree 
		title: 'TRIL';
		rootsExpanded;
		display: [ :anObject | printer := TRILNodePrinter new. anObject il ];
		children: [ :node | node children ];
		format: [ :node | printer print: node ];
		yourself.

]

{ #category : #'*Tinyrossa-Tools-Pharo' }
TRCompilation >> il [
	| il |

	il := OrderedCollection new.
	cfg entry next notNil ifTrue:[
		| block |
		
		block := cfg entry.
		[ block notNil ] whileTrue:[
			il add: block treetops.
			block := block next.
		].		
	] ifFalse:[
  		cfg preorderDo: [:block |
	  		il addAll: block treetops
		].
	].
	^ il     
]
