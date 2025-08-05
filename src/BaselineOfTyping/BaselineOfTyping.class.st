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
			spec baseline: 'Interfaces' with: [
				| myRepo |

				myRepo := #IceRepository asClass registry detect:[ :each | each loadedPackages contains: [ :icep | icep name = self class package name ] ].
				spec repository: 'tonel://' , myRepo location pathString , '/src'
			].

			spec
				package: #'Typing' with:[spec requires: 'Interfaces'];
				package: #'Typing-Examples' with:[spec requires: 'Typing'].
		]
]
