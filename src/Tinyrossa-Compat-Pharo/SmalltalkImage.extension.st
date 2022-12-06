Extension { #name : #SmalltalkImage }

{ #category : #'*Tinyrossa-Compat-Pharo' }
SmalltalkImage >> getPackageDirectoryForPackage: anRPackage [
	| repo dir |
	
	repo := IceRepository registry
						detect:[ :each | each loadedPackages contains: [:icep | icep name = anRPackage name ] ]
						ifNone:[ ^nil ].
	dir := repo location / repo subdirectory / anRPackage name.
	^ dir exists ifTrue: [ dir ] ifFalse: [ nil ]
	

	"
	Smalltalk getPackageDirectoryForPackage: TRCompilation package
	Smalltalk getPackageDirectoryForPackage: Class package
	"
]
