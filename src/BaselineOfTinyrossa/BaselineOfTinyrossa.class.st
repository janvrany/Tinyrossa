Class {
	#name : #BaselineOfTinyrossa,
	#superclass : #BaselineOf,
	#category : #BaselineOfTinyrossa
}

{ #category : #baselines }
BaselineOfTinyrossa >> baseline: spec [
	<baseline>
	spec
		for: #pharo
		do: [
			spec baseline: 'ArchC' with: [
				spec repository: 'github://shingarov/Pharo-ArchC:pure-z3'
			].

			spec baseline: 'SmallRSP' with: [
				spec repository: 'github://shingarov/SmallRSP:microwatt'
			].

			spec baseline: 'OSSubprocess' with: [
				spec repository: 'github://pharo-contributions/OSSubprocess:v1.3.0'
			].

			spec
				package: #'Tinyrossa-Compat-Pharo' with:[
					spec requires: 'OSSubprocess'.
				];
				package: #'Tinyrossa' with:[
					spec requires: 'Tinyrossa-Compat-Pharo';
						 requires: 'ArchC'
				];
				package: #'Tinyrossa-Tests' with: [
					spec requires: 'SmallRSP'.
				];
				package: #'Tinyrossa-RISCV' with: [
					spec requires: 'Tinyrossa'
				];
				package: #'Tinyrossa-Tests-RISCV' with: [
					spec requires: 'Tinyrossa-Tests'
				];
				package: #'Tinyrossa-POWER' with: [
					spec requires: 'Tinyrossa'
				];
				package: #'Tinyrossa-Tests-POWER' with: [
					spec requires: 'Tinyrossa-Tests'
				];
				package: #'Tinyrossa-Tools-Pharo' with: [
					spec requires: 'Tinyrossa'
				];
				yourself.
		]
]
