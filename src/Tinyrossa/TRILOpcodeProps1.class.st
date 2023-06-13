Class {
	#name : #TRILOpcodeProps1,
	#superclass : #TRSharedPool,
	#classVars : [
		'Add',
		'And',
		'Associative',
		'BooleanCompare',
		'Branch',
		'Call',
		'Commutative',
		'CompBranchOnly',
		'Conversion',
		'Div',
		'HasSymbolRef',
		'Indirect',
		'LeftShift',
		'Load',
		'LoadConst',
		'LoadReg',
		'LoadVar',
		'Mul',
		'Neg',
		'Or',
		'Rem',
		'Return',
		'RightShift',
		'ShiftLogical',
		'Store',
		'StoreReg',
		'StrBranch',
		'Sub',
		'Switch',
		'TreeTop',
		'Xor'
	],
	#category : #'Tinyrossa-IL'
}

{ #category : #initialization }
TRILOpcodeProps1 class >> initialize [
	"
	See https://github.com/eclipse/omr/blob/master/compiler/il/OMRILProps.hpp#L159
	"

	Commutative          := 16r00000001.
	Associative          := 16r00000002.
	Conversion           := 16r00000004.
	Add                  := 16r00000008.
	Sub                  := 16r00000010.
	Mul                  := 16r00000020.
	Div                  := 16r00000040.
	Rem                  := 16r00000080.
	LeftShift            := 16r00000100.
	RightShift           := 16r00000200.
	ShiftLogical         := 16r00000400.
	BooleanCompare       := 16r00000800.
	Branch               := 16r00001000.
	StrBranch            := 16r00002000.
	CompBranchOnly       := 16r00004000.
	Indirect             := 16r00008000.
	LoadVar              := 16r00010000.
	LoadConst            := 16r00020000.
	Load                 := (LoadVar | LoadConst).
	Store                := 16r00040000.
	LoadReg              := 16r00080000.
	StoreReg             := 16r00100000.
	And                  := 16r00200000.
	Or                   := 16r00400000.
	Xor                  := 16r00800000.
	Neg                  := 16r01000000.
	Return               := 16r02000000.
	Call                 := 16r04000000.
	TreeTop              := 16r08000000.
	HasSymbolRef         := 16r10000000.
	Switch               := 16r20000000.
	"Available         := 16r40000000."
	"Available         := 16r80000000."
]
