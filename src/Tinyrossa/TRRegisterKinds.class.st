Class {
	#name : #TRRegisterKinds,
	#superclass : #SharedPool,
	#classVars : [
		'FPR',
		'GPR'
	],
	#category : #'Tinyrossa-Codegen'
}

{ #category : #initialization }
TRRegisterKinds class >> initialize [
	GPR := TRRegisterKind named: 'GPR'.
	FPR := TRRegisterKind named: 'FPR'.
]
