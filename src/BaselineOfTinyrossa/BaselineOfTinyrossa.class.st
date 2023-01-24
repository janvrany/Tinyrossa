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
				package: #'Tinyrossa-Tests';
				package: #'Tinyrossa-RISCV' with: [
					spec requires: 'Tinyrossa'
				];
				package: #'Tinyrossa-POWER' with: [
					spec requires: 'Tinyrossa'
				].
		]
]
