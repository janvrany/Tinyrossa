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

			spec baseline: 'LibCompat' with: [
				spec repository: 'github://janvrany/pharo-hacks'.
			].

			spec baseline: 'LibUnix' with: [
				spec repository: 'github://janvrany/pharo-hacks'.
			].
			
			spec baseline: 'Roassal3' with: [
				spec repository: 'github://ObjectProfile/Roassal3:v0.9.2'
			].

			spec
				package: #'Tinyrossa' with:[
					"LibCompat's implementation of OSProcess requires LibUnix"
					spec requires: 'LibUnix'.
					spec requires: 'LibCompat'.
					spec requires: 'ArchC'
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
					spec requires: 'Tinyrossa'.
					spec requires: 'Roassal3'.
				];
				yourself.
		]
]
