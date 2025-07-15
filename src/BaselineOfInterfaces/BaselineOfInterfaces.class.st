Class {
	#name : #BaselineOfInterfaces,
	#superclass : #BaselineOf,
	#category : #BaselineOfInterfaces
}

{ #category : #baselines }
BaselineOfInterfaces >> baseline: spec [
	<baseline>
	spec
		for: #pharo
		do: [
			spec
				package: #'Interfaces';
				package: #'Interfaces-Tonel' with:[spec requires: 'Interfaces'];
				package: #'Interfaces-Examples' with:[spec requires: 'Interfaces'].
		]
]
