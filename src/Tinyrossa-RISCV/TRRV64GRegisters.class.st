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
	self classVarNames do:[ :abiName |
		| reg |

		reg := AcDSLRegister value: (gprs lookup: abiName).
		self classVarAt: abiName put: reg.
	]
]
