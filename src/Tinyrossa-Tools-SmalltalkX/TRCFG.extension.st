Extension { #name : #TRCFG }

{ #category : #'*Tinyrossa-Tools-SmalltalkX' }
TRCFG >> inspector2TabExplorer [
	<inspector2Tab>

	^ (self newInspector2Tab)
		label: 'CFG';
		priority: 65;
		application: [ TRCFGExplorerApp new cfg: self ];
		yourself
]
