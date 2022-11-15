Class {
	#name : #TRCompilationTarget,
	#superclass : #Object,
	#classInstVars : [
		'default'
	],
	#category : #'Tinyrossa-Compile'
}

{ #category : #accessing }
TRCompilationTarget class >> default [
	default isNil ifTrue: [ 
		default := self new
	].
	^ default
]

{ #category : #accessing }
TRCompilationTarget >> name [
	^ self subclassResponsibility
]
