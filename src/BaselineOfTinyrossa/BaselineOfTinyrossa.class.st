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

			spec
				package: #'Tinyrossa-Compat-Pharo';
				package: #'Tinyrossa' with:[
					spec requires: 'Tinyrossa-Compat-Pharo';
						 requires: 'ArchC'
				];
				package: #'Tinyrossa-Tests';
				package: #'Tinyrossa-RISCV' with: [
					spec requires: 'Tinyrossa'
				].
		]
]
