Class {
	#name : #ManifestBaselineOfTinyrossa,
	#superclass : #PackageManifest,
	#category : #'BaselineOfTinyrossa-Manifest'
}

{ #category : #'stx - description' }
ManifestBaselineOfTinyrossa class >> includedInPreRequisites [
	"list packages which are to be implicitely included in the prerequisites list,
	 even if not found by the automatic search.
	 Redefine this, if classes from other packages are referred to via reflection
	 or by constructing names dynamically (i.e. the search cannot find it)"

	| included |

	included := #(
		#'BaselineOfArchC'
		#'BaselineOfAsmJit'
		#'Tinyrossa'
		#'Tinyrossa-RISCV'
		#'Tinyrossa-POWER'
		#'Tinyrossa-AMD64'
		#'Tinyrossa-Tests'
		#'Tinyrossa-Tests-RISCV'
		#'Tinyrossa-Tests-POWER'
		#'Tinyrossa-Tests-AMD64'
	).

	(Smalltalk getPackageDirectoryForPackage:#'jv:vdb') notNil ifTrue:[
		included := included , #(#'Tinyrossa-Tools-SmalltalkX' #'Tinyrossa-Tools-SmalltalkX-AMD64')
	].

	^included
]

{ #category : #'stx - description' }
ManifestBaselineOfTinyrossa class >> mandatoryPreRequisites [
	"list packages which are mandatory as a prerequisite.
	 This are packages containing superclasses of my classes and classes which
	 are extended by myself.
	 They are mandatory, because we need these packages as a prerequisite for loading and compiling.
	 This method is generated automatically,
	 by searching along the inheritance chain of all of my classes.
	 Please take a look at the #referencedPreRequisites method as well."

	^ #(
		#'stx:libbasic'    "Object - superclass of ManifestBaselineOfTinyrossa"
		#'stx:libcompat'    "PackageManifest - superclass of ManifestBaselineOfTinyrossa"
	)
]
