Class {
	#name : #TRPPC64Registers,
	#superclass : #TRSharedPool,
	#classVars : [
		'cr0',
		'cr1',
		'cr2',
		'cr3',
		'cr4',
		'cr5',
		'cr6',
		'cr7',
		'gr0',
		'gr1',
		'gr10',
		'gr11',
		'gr12',
		'gr13',
		'gr14',
		'gr15',
		'gr16',
		'gr17',
		'gr18',
		'gr19',
		'gr2',
		'gr20',
		'gr21',
		'gr22',
		'gr23',
		'gr24',
		'gr25',
		'gr26',
		'gr27',
		'gr28',
		'gr29',
		'gr3',
		'gr30',
		'gr31',
		'gr4',
		'gr5',
		'gr6',
		'gr7',
		'gr8',
		'gr9'
	],
	#pools : [
		'TRPPC64RegisterKinds'
	],
	#category : #'Tinyrossa-POWER-Codegen'
}

{ #category : #initialization }
TRPPC64Registers class >> initialize [
	| gprs ccrs |

	gprs := AcProcessorDescriptions powerpc64 maps at: 'reg'.
	gr0 := TRPPCRegister value: (gprs lookup: '0') kind: GPR.
	gr1 := TRPPCRegister value: (gprs lookup: '1') kind: GPR.
	gr2 := TRPPCRegister value: (gprs lookup: '2') kind: GPR.
	gr3 := TRPPCRegister value: (gprs lookup: '3') kind: GPR.
	gr4 := TRPPCRegister value: (gprs lookup: '4') kind: GPR.
	gr5 := TRPPCRegister value: (gprs lookup: '5') kind: GPR.
	gr6 := TRPPCRegister value: (gprs lookup: '6') kind: GPR.
	gr7 := TRPPCRegister value: (gprs lookup: '7') kind: GPR.
	gr8 := TRPPCRegister value: (gprs lookup: '8') kind: GPR.
	gr9 := TRPPCRegister value: (gprs lookup: '9') kind: GPR.
	gr10 := TRPPCRegister value: (gprs lookup: '10') kind: GPR.
	gr11 := TRPPCRegister value: (gprs lookup: '11') kind: GPR.
	gr12 := TRPPCRegister value: (gprs lookup: '12') kind: GPR.
	gr13 := TRPPCRegister value: (gprs lookup: '13') kind: GPR.
	gr14 := TRPPCRegister value: (gprs lookup: '14') kind: GPR.
	gr15 := TRPPCRegister value: (gprs lookup: '15') kind: GPR.
	gr16 := TRPPCRegister value: (gprs lookup: '16') kind: GPR.
	gr17 := TRPPCRegister value: (gprs lookup: '17') kind: GPR.
	gr18 := TRPPCRegister value: (gprs lookup: '18') kind: GPR.
	gr19 := TRPPCRegister value: (gprs lookup: '19') kind: GPR.
	gr20 := TRPPCRegister value: (gprs lookup: '20') kind: GPR.
	gr21 := TRPPCRegister value: (gprs lookup: '21') kind: GPR.
	gr22 := TRPPCRegister value: (gprs lookup: '22') kind: GPR.
	gr23 := TRPPCRegister value: (gprs lookup: '23') kind: GPR.
	gr24 := TRPPCRegister value: (gprs lookup: '24') kind: GPR.
	gr25 := TRPPCRegister value: (gprs lookup: '25') kind: GPR.
	gr26 := TRPPCRegister value: (gprs lookup: '26') kind: GPR.
	gr27 := TRPPCRegister value: (gprs lookup: '27') kind: GPR.
	gr28 := TRPPCRegister value: (gprs lookup: '28') kind: GPR.
	gr29 := TRPPCRegister value: (gprs lookup: '29') kind: GPR.
	gr30 := TRPPCRegister value: (gprs lookup: '30') kind: GPR.
	gr31 := TRPPCRegister value: (gprs lookup: '31') kind: GPR.

	ccrs := AcProcessorDescriptions powerpc64 maps at: 'ccr'.
	cr0 := TRPPCRegister value: (ccrs lookup: 'cr0')  kind: CCR.
	cr1 := TRPPCRegister value: (ccrs lookup: 'cr1') kind: CCR.
	cr2 := TRPPCRegister value: (ccrs lookup: 'cr2') kind: CCR.
	cr3 := TRPPCRegister value: (ccrs lookup: 'cr3') kind: CCR.
	cr4 := TRPPCRegister value: (ccrs lookup: 'cr4') kind: CCR.
	cr5 := TRPPCRegister value: (ccrs lookup: 'cr5') kind: CCR.
	cr6 := TRPPCRegister value: (ccrs lookup: 'cr6') kind: CCR.
	cr7 := TRPPCRegister value: (ccrs lookup: 'cr7') kind: CCR.


	"
	String streamContents: [ :s |
		self bindingsDo: [ :binding |
			(binding key startsWith:'gr') ifTrue: [
				s nextPutAll: '    '; nextPutAll: binding key;
				  nextPutAll: ' := TRPPCRegister value: (gprs lookup: '; nextPutAll: (binding key asString copyFrom:3) storeString;
				  nextPutAll: ') kind: GPR.'; cr.
			]
		].
	].
	"
]
