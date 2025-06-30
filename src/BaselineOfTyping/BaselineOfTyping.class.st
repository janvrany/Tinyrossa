Class {
	#name : #BaselineOfTyping,
	#superclass : #BaselineOf,
	#category : #BaselineOfTyping
}

{ #category : #baselines }
BaselineOfTyping >> baseline: spec [
	<baseline>
	spec
		for: #pharo
		do: [
			spec
				package: #'Typing';
				package: #'Typing-Examples' with:[spec requires: 'Typing'].
		]
]
