Class {
	#name : #TRPPCRegister,
	#superclass : #TRRealRegister,
	#pools : [
		'TRPPC64RegisterKinds'
	],
	#category : #'Tinyrossa-POWER-Codegen'
}

{ #category : #accessing }
TRPPCRegister >> name [
	kind == GPR ifTrue: [
		^ 'gr', value name
	].
	kind == FPR ifTrue: [
		^ 'fp', value name
	].
	kind == CCR ifTrue: [
		^ 'cr', value name
	].
	^ super name
]
