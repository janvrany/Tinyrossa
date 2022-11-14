Class {
	#name : #TRRegisterKinds,
	#superclass : #SharedPool,
	#classVars : [
		'GPR',
		'FPR'
	],
	#category : #'Tinyrossa-Codegen'
}

{ #category : #initialization }
TRRegisterKinds class >> initialize [
	GPR := TRRegisterKind named: 'GPR'.
	FPR := TRRegisterKind named: 'FPR'.
]
