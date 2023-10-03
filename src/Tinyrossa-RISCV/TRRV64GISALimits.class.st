Class {
	#name : #TRRV64GISALimits,
	#superclass : #TRSharedPool,
	#classVars : [
		'RISCV_IMM_BITS',
		'RISCV_IMM_MAX',
		'RISCV_IMM_MIN'
	],
	#category : #'Tinyrossa-RISCV-Codegen'
}

{ #category : #initialization }
TRRV64GISALimits class >> initialize [
	RISCV_IMM_BITS := 12.
	RISCV_IMM_MIN := -16r800.
	RISCV_IMM_MAX :=  16r7FF.

]
