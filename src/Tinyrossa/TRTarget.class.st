"
`TRTarget` - or rather concrete subclasses - represent a
compilation target, a combination of target architecture
(ISA) and operating system.

It provides various ""configuration"" values that are specific
to particular target.

Targets are singletons, use `#default` to get singleton instance.

"
Class {
	#name : #TRTarget,
	#superclass : #Object,
	#pools : [
		'TRDataTypes'
	],
	#classInstVars : [
		'default'
	],
	#category : #'Tinyrossa-Target'
}

{ #category : #accessing }
TRTarget class >> default [
	default isNil ifTrue: [
		default := self new
	].
	^ default
]

{ #category : #'accessing - config - compilation' }
TRTarget >> codeGeneratorClass [
	^ self subclassResponsibility
]

{ #category : #accessing }
TRTarget >> name [
	^ self subclassResponsibility
]

{ #category : #queries }
TRTarget >> sizeInBytesOf: aTRDatyType [
	"Given a datatype, return it size in memory in bytes."

	aTRDatyType == Int8     ifTrue: [ ^ 1].
	aTRDatyType == Int16    ifTrue: [ ^ 1].
	aTRDatyType == Int32    ifTrue: [ ^ 4].
	aTRDatyType == Int64    ifTrue: [ ^ 8].
	aTRDatyType == Address  ifTrue: [ ^ self sizeInBytesOfAddress ].
	aTRDatyType == Float    ifTrue: [ ^ 4].
	aTRDatyType == Double   ifTrue: [ ^ 8].
	aTRDatyType == Void     ifTrue: [ ^ 0].

	self error: 'Unsupported datatype'
]

{ #category : #'queries - private' }
TRTarget >> sizeInBytesOfAddress [
	"Return size of address (pointer) in bytes"

	^ self subclassResponsibility
]

{ #category : #'accessing - config - compilation' }
TRTarget >> systemLinkageClass [
	^ self subclassResponsibility
]
