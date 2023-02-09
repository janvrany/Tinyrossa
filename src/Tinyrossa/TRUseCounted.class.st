Class {
	#name : #TRUseCounted,
	#superclass : #Object,
	#instVars : [
		'useCount'
	],
	#category : #'Tinyrossa-Infra'
}

{ #category : #'ref-counting' }
TRUseCounted >> decUseCount [
	self assert: (useCount notNil and:[useCount > 0]) description: 'Use count already zero'.
	useCount := useCount - 1
]

{ #category : #'ref-counting' }
TRUseCounted >> incUseCount [
	useCount isNil ifTrue: [ 
		useCount := 1.
	] ifFalse: [
		useCount := useCount + 1
	].
]

{ #category : #queries }
TRUseCounted >> isUsed [
	^ useCount notNil and: [ useCount > 0 ].
]

{ #category : #accessing }
TRUseCounted >> useCount [
	useCount isNil ifTrue: [ 
		useCount := 0.
	].
	^ useCount
]
