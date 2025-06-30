Class {
	#name : #TypingExamples,
	#superclass : #TestCase,
	#category : #'Typing-Examples'
}

{ #category : #accessing }
TypingExamples class >> testSelectors [
	^ self selectors select: [ :each | each beginsWith:'example' ]
]

{ #category : #examples }
TypingExamples >> example_01 [
	"Below is the simplest possible example.
	 Here we check that 1 is indeed of 'type' SmallInteger: "
	self assert: 1 is: SmallInteger.

	"Since classes are nominally-typed, following check
	 passes too:"
	self assert: 1 is: Integer.

	"But not following one because float is not an Integer:"
	self should: [ self assert: 1.0 is: Integer ] raise: Exception.
]

{ #category : #examples }
TypingExamples >> example_02 [
	"One can also ensure arbitrary property on the value
	 using 'refinement', for example the following check
	 ensures the value is an integer greater then zero:"
	self assert: 1 is: Integer | [ :v | v > 0 ].

	"Of course, -10 is not 'an integer greater than zero':"
	self should: [ self assert: -10 is: Integer | [ :v | v > 0 ] ] raise: Exception.

	"Nor is positive float or arbitrary object:"
	self should: [ self assert: 10.0       is: Integer | [ :v | v > 0 ] ] raise: Exception.
	self should: [ self assert: Object new is: Integer | [ :v | v > 0 ] ] raise: Exception.
]

{ #category : #examples }
TypingExamples >> example_03 [
	"One may also want to check for specific value:"
	self assert: 42 is: 42.

	"This is in fact just a shortcut to:"
	self assert: 42 is: Integer | [ :v | v = 42 ].
]

{ #category : #examples }
TypingExamples >> example_04 [
	"Sometimes a given value may be one of two (or more) 'types',
	 like either Integer or Float (but not Fraction):"
	self assert: 1   is: Integer | Float.
	self assert: 1.0 is: Integer | Float.

	"Of course, 1/2 is not 'eother integer or float:"
	self should: [ self assert: 1/3 is: Integer | Float ] raise: Exception.
]

{ #category : #examples }
TypingExamples >> example_05 [
	"Of course, it is possible to combine all these together.
	 Following checks that the value is either positive integer or float or nil"

	self assert: 1 is: (Integer | [:v | v > 0])
						| (Float | [:v | v > 0])
						| nil.

	self assert: 1.0 is: (Integer | [:v | v > 0])
						| (Float | [:v | v > 0])
						| nil.

	self assert: nil is: (Integer | [:v | v > 0])
						| (Float | [:v | v > 0])
						| nil.
]

{ #category : #examples }
TypingExamples >> example_06 [
	| Nat Int32 |

	"Since 'type' is an object, one can create custom 'type aliases
	 and then use these aliases:"

	Nat := Integer | [ :v | v >= 0 ].
	Int32 := Integer | [ :v | v between: -16r80000000 and: 16r7FFFFFFF ].

	self assert: 1 is: Nat.
	self assert: 1 is: Int32.
]
