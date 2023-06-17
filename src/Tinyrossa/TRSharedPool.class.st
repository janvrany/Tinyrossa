Class {
	#name : #TRSharedPool,
	#superclass : #SharedPool,
	#category : #'Tinyrossa-Infra'
}

{ #category : #initialization }
TRSharedPool class >> initializeIfNotAlready [
	"Initialize the pool if it has not been initialized yet.

	 Caveat: this assumes that all pool variables should be initialized
			 to non-nil value!

	 This method is needed for Pharo because Pharo does not guarantee
	 pool is initialized before any class that uses it is initialized.
	 This is recurring problem but nobody seems to bother fixing this.
	 Sigh.
	"

	self isInitialized ifTrue: [ ^ self ].
	self initialize.
	self assert: self isInitialized
]

{ #category : #testing }
TRSharedPool class >> isInitialized [
	self bindingsDo: [ :binding |
		^ binding value notNil
	].
	^ true "No pool variables so consider it initialized."
]
