Class {
	#name : #TRIntLimits,
	#superclass : #TRSharedPool,
	#classVars : [
		'INT16_MAX',
		'INT16_MIN',
		'INT32_MAX',
		'INT32_MIN',
		'INT64_MAX',
		'INT64_MIN',
		'UINT16_MAX',
		'UINT16_MIN',
		'UINT32_MAX',
		'UINT32_MIN',
		'UINT64_MAX',
		'UINT64_MIN'
	],
	#category : #'Tinyrossa-Infra'
}

{ #category : #initialization }
TRIntLimits class >> initialize [
	INT16_MIN := -16r8000.
	INT16_MAX :=  16r7FFF.
	INT32_MIN := -16r80000000.
	INT32_MAX :=  16r7FFFFFFF.
	INT64_MIN := -16r8000000000000000.
	INT64_MAX :=  16r7FFFFFFFFFFFFFFF.      

	UINT16_MIN := 0.
	UINT16_MAX := 16rFFFF.
	UINT32_MIN := 0.
	UINT32_MAX := 16rFFFFFFFF.
	UINT64_MIN := 0.
	UINT64_MAX := 16rFFFFFFFFFFFFFFFF.
]
