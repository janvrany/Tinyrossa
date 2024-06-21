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

{ #category : #'accessing - config - compilation' }
TRTarget >> systemLinkageClass [
	^ self subclassResponsibility
]
