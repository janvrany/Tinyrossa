Class {
	#name : #TRRegisterLiveRange,
	#superclass : #Object,
	#instVars : [
		'start',
		'stop'
	],
	#category : #'Tinyrossa-Codegen-Register Allocation'
}

{ #category : #'instance creation' }
TRRegisterLiveRange class >> new [
	^ self basicNew initialize
]

{ #category : #initialization }
TRRegisterLiveRange >> initialize [
	start := SmallInteger maxVal.
	stop := 0.
]

{ #category : #accessing }
TRRegisterLiveRange >> start [
	^ start
]

{ #category : #accessing }
TRRegisterLiveRange >> stop [
	^ stop
]

{ #category : #utilities }
TRRegisterLiveRange >> used: anInteger [
	anInteger < start ifTrue:[
		start := anInteger.
	].
	anInteger > stop ifTrue: [ 
		stop := anInteger.
	].
]
