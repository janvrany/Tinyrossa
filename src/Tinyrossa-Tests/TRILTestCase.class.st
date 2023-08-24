Class {
	#name : #TRILTestCase,
	#superclass : #TestCase,
	#instVars : [
		'compilation'
	],
	#category : #'Tinyrossa-Tests'
}

{ #category : #documentation }
TRILTestCase class >> documentation [
"
	documentation to be added.

	[author:]
		Jan Vrany <jan.vrany@labware.com>

	[instance variables:]

	[class variables:]

	[see also:]

"
]

{ #category : #queries }
TRILTestCase class >> isAbstract [
	^self == TRILTestCase
]

{ #category : #running }
TRILTestCase >> setUp [
	compilation := TRCompilation forTarget: TRILTestTarget default
]
