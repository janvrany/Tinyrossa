Class {
	#name : #TRPPC64RegisterKinds,
	#superclass : #TRSharedPool,
	#classVars : [
		'CCR',
		'FPR',
		'GPR'
	],
	#category : #'Tinyrossa-POWER-Codegen'
}

{ #category : #initialization }
TRPPC64RegisterKinds class >> initialize [
	GPR := (TRRegisterKinds bindingOf: #GPR) value.
	FPR := (TRRegisterKinds bindingOf: #FPR) value.
	CCR := TRRegisterKind named: 'CCR'
]
