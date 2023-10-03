Class {
	#name : #TRRV64GRegisters,
	#superclass : #TRSharedPool,
	#classVars : [
		'a0',
		'a1',
		'a2',
		'a3',
		'a4',
		'a5',
		'a6',
		'a7',
		'gp',
		'ra',
		's0',
		's1',
		's10',
		's11',
		's2',
		's3',
		's4',
		's5',
		's6',
		's7',
		's8',
		's9',
		'sp',
		't0',
		't1',
		't2',
		't3',
		't4',
		't5',
		't6',
		'tp',
		'zero'
	],
	#pools : [
		'TRRegisterKinds'
	],
	#category : #'Tinyrossa-RISCV-Codegen'
}

{ #category : #initialization }
TRRV64GRegisters class >> initialize [
	| gprs |

	gprs := AcProcessorDescriptions riscv64 maps at: 'gpr'. 
	zero := TRRealRegister value: (gprs lookup: 'zero') kind: GPR.
	ra := TRRealRegister value: (gprs lookup: 'ra') kind: GPR.
	sp := TRRealRegister value: (gprs lookup: 'sp') kind: GPR.
	gp := TRRealRegister value: (gprs lookup: 'gp') kind: GPR.
	tp := TRRealRegister value: (gprs lookup: 'tp') kind: GPR.
	t0 := TRRealRegister value: (gprs lookup: 't0') kind: GPR.
	t1 := TRRealRegister value: (gprs lookup: 't1') kind: GPR.
	t2 := TRRealRegister value: (gprs lookup: 't2') kind: GPR.
	s0 := TRRealRegister value: (gprs lookup: 's0') kind: GPR.
	s1 := TRRealRegister value: (gprs lookup: 's1') kind: GPR.
	a0 := TRRealRegister value: (gprs lookup: 'a0') kind: GPR.
	a1 := TRRealRegister value: (gprs lookup: 'a1') kind: GPR.
	a2 := TRRealRegister value: (gprs lookup: 'a2') kind: GPR.
	a3 := TRRealRegister value: (gprs lookup: 'a3') kind: GPR.
	a4 := TRRealRegister value: (gprs lookup: 'a4') kind: GPR.
	a5 := TRRealRegister value: (gprs lookup: 'a5') kind: GPR.
	a6 := TRRealRegister value: (gprs lookup: 'a6') kind: GPR.
	a7 := TRRealRegister value: (gprs lookup: 'a7') kind: GPR.
	s2 := TRRealRegister value: (gprs lookup: 's2') kind: GPR.
	s3 := TRRealRegister value: (gprs lookup: 's3') kind: GPR.
	s4 := TRRealRegister value: (gprs lookup: 's4') kind: GPR.
	s5 := TRRealRegister value: (gprs lookup: 's5') kind: GPR.
	s6 := TRRealRegister value: (gprs lookup: 's6') kind: GPR.
	s7 := TRRealRegister value: (gprs lookup: 's7') kind: GPR.
	s8 := TRRealRegister value: (gprs lookup: 's8') kind: GPR.
	s9 := TRRealRegister value: (gprs lookup: 's9') kind: GPR.
	s10 := TRRealRegister value: (gprs lookup: 's10') kind: GPR.
	s11 := TRRealRegister value: (gprs lookup: 's11') kind: GPR.
	t3 := TRRealRegister value: (gprs lookup: 't3') kind: GPR.
	t4 := TRRealRegister value: (gprs lookup: 't4') kind: GPR.
	t5 := TRRealRegister value: (gprs lookup: 't5') kind: GPR.
	t6 := TRRealRegister value: (gprs lookup: 't6') kind: GPR.

	"
	String streamContents: [ :s |
		self bindingsDo: [ :binding | 
			s nextPutAll: '    '; nextPutAll: binding key;
			  nextPutAll: ' := TRRealRegister value: (gprs lookup: '; nextPutAll: binding key asString storeString;
			  nextPutAll: ') kind: GPR.'; cr.
		].
	].
	"
]
