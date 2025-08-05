Class {
	#name : #Interface,
	#superclass : #ProtoObject,
	#classInstVars : [
		'composition'
	],
	#category : #Interfaces
}

{ #category : #composing }
Interface class >> + another [
	^ self asInterfaceComposition + another
]

{ #category : #converting }
Interface class >> asInterfaceComposition [
	"Return receiver as interface composition consisting of a single
	 interface - the receiver."

	| selfAsComposition |

	selfAsComposition := InterfaceComposition new: 1.
	selfAsComposition at: 1 put: self.
	^ selfAsComposition
]

{ #category : #'file in/out - Smalltalk/X' }
Interface class >> basicFileOutDefinitionOn:aStream withNameSpace:forceNameSpace withPackage:showPackage [

	|owner namespace nsName fullName pkg|

	self == Interface ifTrue: [
		super basicFileOutDefinitionOn:aStream withNameSpace:forceNameSpace withPackage:showPackage.
		^ self
	].

	fullName := Metaclass fileOutNameSpaceQuerySignal query == true.
	owner := self owningClass.
	namespace := self topNameSpace.

	(showPackage and:[owner isNil]) ifTrue:[
		pkg := self  getPackage.
		(pkg notNil and:[pkg ~= PackageId noProjectID]) ifTrue:[
			aStream nextPutAll:'"{ Package: '''.
			aStream nextPutAll:self package asString.
			aStream nextPutAll:''' }"'; cr; cr.
		]
	].

	fullName ifFalse:[
		(owner isNil or:[forceNameSpace]) ifTrue:[
			(namespace notNil and:[namespace ~~ Smalltalk]) ifTrue:[
				nsName := namespace name.
				(nsName includes:$:) ifTrue:[
					nsName := '''' , nsName , ''''
				].
				aStream nextPutAll:'"{ NameSpace: '.
				aStream nextPutAll:nsName.
				aStream nextPutAll:' }"'; cr; cr.
			] ifFalse:[
				"  always write a namespace directive - even for smalltalk classes."
				"  reason: the fileout might go into a big file containing multiple classes"
				"  in different namespaces (otherwise, the smalltalk class would later be filed into"
				"  the previous class's namespace)"
				aStream nextPutAll:'"{ NameSpace: Smalltalk }"'; cr; cr.
			].
		].
	].

	aStream nextPutAll: 'Interface named:'.
	self name storeOn: aStream.

	aStream crtab.
	aStream nextPutAll: 'implements: '.
	self interfaceComposition interfaceCompositionExpressionOn: aStream.

	aStream crtab.
	aStream nextPutAll:'category:'.
	self category isNil ifTrue:[
		aStream nextPutAll:''''''
	] ifFalse: [
		self category asString storeOn: aStream.
	].
]

{ #category : #'file in/out - Pharo' }
Interface class >> definitionWithoutSlots [
	self == Interface ifTrue: [
		^ super definitionWithoutSlots
	].

	^String streamContents: [ :aStream |
		aStream nextPutAll: 'Interface named:'.
		self name storeOn: aStream.

		aStream crtab.
		aStream nextPutAll: 'implements: '.
		self interfaceComposition interfaceCompositionExpressionOn: aStream.  

		aStream crtab.
		aStream nextPutAll:'package:'.
		self category isNil ifTrue:[
			aStream nextPutAll:''''''
		] ifFalse: [
			self category asString storeOn: aStream.
		].
	]
]

{ #category : #accessing }
Interface class >> interfaceComposition [
	composition isNil ifTrue: [
		composition := InterfaceComposition new: 0
	].
	^ composition
]

{ #category : #'subclass creation - Smalltalk/X' }
Interface class >> named: nameString implements: compositionSpec category: categoryString [
	| interface | 

	self assume: self == Interface description: 'Interfaces may not have subclasses!'.

	interface := super
		subclass: nameString
		instanceVariableNames:''
		classVariableNames:''
		poolDictionaries:''
		category:categoryString.

	interface setComposition: compositionSpec asInterfaceComposition.

	^ interface
]

{ #category : #'subclass creation - Pharo' }
Interface class >> named: nameString implements: compositionSpec package: packageString [
	| interface |

	self assume: self == Interface description: 'Interfaces may not have subclasses!'.

	interface := super subclass: nameString
		instanceVariableNames: ''
		classVariableNames: ''
		poolDictionaries: ''
		package: packageString.
	interface setComposition: compositionSpec asInterfaceComposition.

	^ interface
]

{ #category : #initialization }
Interface class >> setComposition: interfaceOrComposition [
	composition := interfaceOrComposition asInterfaceComposition
]

{ #category : #'subclass creation - Pharo' }
Interface class >> subclass: aSubclassSymbol instanceVariableNames: instVarNameList classVariableNames: classVarNames package: aPackageSymbol [
	self shouldNotImplement "Use named:implements:package: instead"
]

{ #category : #'subclass creation - Smalltalk/X' }
Interface class >> subclass:nameSymbol instanceVariableNames:instVarNameString classVariableNames:classVarString poolDictionaries:pool category:cat [
	self shouldNotImplement "Use named:implements:category: instead"
]

{ #category : #'subclass creation - Pharo' }
Interface class >> subclass: t instanceVariableNames: f classVariableNames: d poolDictionaries: s package: cat [
	self shouldNotImplement "Use named:implements:package: instead"
]
