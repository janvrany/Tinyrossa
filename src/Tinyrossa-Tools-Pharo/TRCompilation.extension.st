Extension { #name : #TRCompilation }

{ #category : #'*Tinyrossa-Tools-Pharo' }
TRCompilation >> gtInspectorTRILIn: composite [
	<gtInspectorPresentationOrder: 35>

	| printer |

	composite tree
		title: 'TRIL';
		rootsExpanded;
		display: [ :comp | printer := TRILNodePrinter new. comp cfg treetops ];
		children: [ :node | node children ];
		format: [ :node | printer print: node ];
		yourself.

]
