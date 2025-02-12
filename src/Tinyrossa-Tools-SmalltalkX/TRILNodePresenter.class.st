Class {
	#name : #TRILNodePresenter,
	#superclass : #VDBAbstractPresenter,
	#instVars : [
		'node',
		'label'
	],
	#category : #'Tinyrossa-Tools-SmalltalkX'
}

{ #category : #accessing }
TRILNodePresenter >> label [
	^ label
]

{ #category : #accessing }
TRILNodePresenter >> node [
	^ node
]

{ #category : #initialization }
TRILNodePresenter >> setNode: aTRILNode label: aString [
	node := aTRILNode.
	label := aString
]

{ #category : #accessing }
TRILNodePresenter >> subject [
	^ node
]
