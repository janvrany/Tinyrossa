"
`TRCodeCacheManager` ties multiple code caches (here referred as 
'segments') together. An (exported) symbol added to any of the segments
is automatically made visible (and linked to) by all other segments managed
by this manager.

As with `TRCodeCache`, downstream project may need to provide customized 
implementations of code cache manager fitting the needs of particular runtime. 
This class serves example implementation and it is used in tests (see
class `TRCompilationTestShell`)

Downstream projects may also add new functionality such as automatically choosing
the best segment to put new code object and/or invalidating/flushing of code
objects.

"
Class {
	#name : #TRCodeCacheManager,
	#superclass : #Object,
	#instVars : [
		'runtime',
		'segments'
	],
	#pools : [
		'TRDataTypes'
	],
	#category : #'Tinyrossa-Runtime-Code Cache'
}

{ #category : #'instance creation' }
TRCodeCacheManager class >> new [
	self shouldNotImplement. "Use #runtime: instead"
]

{ #category : #'instance creation' }
TRCodeCacheManager class >> runtime: aTRRuntime [
	^ self basicNew initializeWithRuntime: aTRRuntime
]

{ #category : #'adding & removing' }
TRCodeCacheManager >> addSegment: aTRCodeCache [
	self assume: runtime == aTRCodeCache runtime.
	self assume:(segments includes: aTRCodeCache) not.


	aTRCodeCache manager: self.

	"Add all exported symbols from current segments to new segment:"
	segments do: [:segment | 
		segment exports keys do:[:export |
			aTRCodeCache addSymbol: export.
		]
	].

	"Add all export symbols new segments to current segments:"
	aTRCodeCache exports keys do:[:export |
		self addSymbol: export segment: aTRCodeCache.
	].

	"Finally, add new segment to the list."
	segments add: aTRCodeCache.
]

{ #category : #'adding & removing' }
TRCodeCacheManager >> addSymbol: aTRSymbol segment: aTRCodeCache [
	"To be called whenever a new exported symbol has beem added to
	 the cache. Internal use only."

	segments do: [:segment | 
		segment ~~ aTRCodeCache ifTrue: [ 
			segment addSymbol: aTRSymbol
		].
	].
]

{ #category : #initialization }
TRCodeCacheManager >> initializeWithRuntime: runtimeArg [ 
	runtime := runtimeArg.
	segments := Set new.
]

{ #category : #'adding & removing' }
TRCodeCacheManager >> removeSegment: aTRCodeCache [
	self error: 'Not implemented by this manager'
]

{ #category : #accessing }
TRCodeCacheManager >> runtime [
	^ runtime
]
