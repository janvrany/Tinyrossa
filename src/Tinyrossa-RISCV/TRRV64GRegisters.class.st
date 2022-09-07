Class {
	#name : #TRRV64GRegisters,
	#superclass : #SharedPool,
	#classVars : [
		'zero',
		'ra',
		'sp',
		'gp',
		'tp',
		't0',
		't1',
		't2',
		's0',
		's1',
		'a0',
		'a1',
		'a2',
		'a3',
		'a4',
		'a5',
		'a6',
		'a7',
		's2',
		's3',
		's4',
		's5',
		's6',
		's7',
		's8',
		's9',
		's10',
		's11',
		't3',
		't4',
		't5',
		't6'
	],
	#category : #'Tinyrossa-RISCV-Codegen'
}

{ #category : #initialization }
TRRV64GRegisters class >> initialize [
	| gprs |

	gprs := AcProcessorDescriptions riscv64 maps at: 'gpr'. 
	zero := AcDSLRegister value: (gprs lookup: 'zero').
	ra := AcDSLRegister value: (gprs lookup: 'ra').
	sp := AcDSLRegister value: (gprs lookup: 'sp').
	gp := AcDSLRegister value: (gprs lookup: 'gp').
	tp := AcDSLRegister value: (gprs lookup: 'tp').
	t0 := AcDSLRegister value: (gprs lookup: 't0').
	t1 := AcDSLRegister value: (gprs lookup: 't1').
	t2 := AcDSLRegister value: (gprs lookup: 't2').
	s0 := AcDSLRegister value: (gprs lookup: 's0').
	s1 := AcDSLRegister value: (gprs lookup: 's1').
	a0 := AcDSLRegister value: (gprs lookup: 'a0').
	a1 := AcDSLRegister value: (gprs lookup: 'a1').
	a2 := AcDSLRegister value: (gprs lookup: 'a2').
	a3 := AcDSLRegister value: (gprs lookup: 'a3').
	a4 := AcDSLRegister value: (gprs lookup: 'a4').
	a5 := AcDSLRegister value: (gprs lookup: 'a5').
	a6 := AcDSLRegister value: (gprs lookup: 'a6').
	a7 := AcDSLRegister value: (gprs lookup: 'a7').
	s2 := AcDSLRegister value: (gprs lookup: 's2').
	s3 := AcDSLRegister value: (gprs lookup: 's3').
	s4 := AcDSLRegister value: (gprs lookup: 's4').
	s5 := AcDSLRegister value: (gprs lookup: 's5').
	s6 := AcDSLRegister value: (gprs lookup: 's6').
	s7 := AcDSLRegister value: (gprs lookup: 's7').
	s8 := AcDSLRegister value: (gprs lookup: 's8').
	s9 := AcDSLRegister value: (gprs lookup: 's9').
	s10 := AcDSLRegister value: (gprs lookup: 's10').
	s11 := AcDSLRegister value: (gprs lookup: 's11').
	t3 := AcDSLRegister value: (gprs lookup: 't3').
	t4 := AcDSLRegister value: (gprs lookup: 't4').
	t5 := AcDSLRegister value: (gprs lookup: 't5').
	t6 := AcDSLRegister value: (gprs lookup: 't6').

	"
	String streamContents: [ :s |
		self bindingsDo: [ :binding | 
			s nextPutAll: '    '; nextPutAll: binding key;
			  nextPutAll: ' := AcDSLRegister value: (gprs lookup: '; nextPutAll: binding key asString storeString;
			  nextPutAll: ').'; cr.
		].
	].
	"
]
