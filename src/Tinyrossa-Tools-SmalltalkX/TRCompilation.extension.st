Extension { #name : #TRCompilation }

{ #category : #'*Tinyrossa-Tools-SmalltalkX' }
TRCompilation >> il [
	"Return linearized sequence of `TRILNode`s"

	| il |

	il := OrderedCollection new.
	cfg preorderDo: [:block |
		il addAll: block treetops.
	].
	^ il
]

{ #category : #'*Tinyrossa-Tools-SmalltalkX' }
TRCompilation >> inspector2TabExplorer [
	<inspector2Tab>

	^ (self newInspector2Tab)
		label:'Explorer';
		priority:70;
		application: [ TRCompilationExplorerApp new compilation: self];
		yourself
]
