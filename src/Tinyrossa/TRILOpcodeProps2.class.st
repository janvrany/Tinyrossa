Class {
	#name : #TRILOpcodeProps2,
	#superclass : #TRSharedPool,
	#classVars : [
		'BndCheck',
		'ByteSwap',
		'CanRaiseException',
		'Check',
		'CheckCast',
		'CondCodeComputation',
		'JumpWithMultipleTargets',
		'LeftRotate',
		'LoadAddress',
		'Max',
		'MayUseSystemStack',
		'Min',
		'MustBeLowered',
		'New',
		'NullCheck',
		'OverflowCompare',
		'ReadBarrierLoad',
		'ResolveCheck',
		'Select',
		'SelectAdd',
		'SelectSub',
		'SignExtension',
		'SupportedForPRE',
		'UnsignedCompare',
		'ValueNumberShare',
		'WriteBarrierStore',
		'ZeroExtension'
	],
	#category : #'Tinyrossa-IL'
}

{ #category : #initialization }
TRILOpcodeProps2 class >> initialize [
	"
	See https://github.com/eclipse/omr/blob/master/compiler/il/OMRILProps.hpp#L200
	"
	MustBeLowered                := 16r00000001.
	ValueNumberShare             := 16r00000002.
	WriteBarrierStore            := 16r00000004.
	CanRaiseException            := 16r00000008.
	Check                        := 16r00000010.
	NullCheck                    := 16r00000020.
	ResolveCheck                 := 16r00000040.
	BndCheck                     := 16r00000080.
	CheckCast                    := 16r00000100.
	ReadBarrierLoad              := 16r00000200.
	MayUseSystemStack            := 16r00000400.
	SupportedForPRE              := 16r00000800.
	LeftRotate                   := 16r00001000.
	UnsignedCompare              := 16r00002000.
	OverflowCompare              := 16r00004000.
	Select                       := 16r00008000.
	SelectAdd                    := 16r00010000.
	SelectSub                    := 16r00020000.
	CondCodeComputation          := 16r00040000.
	JumpWithMultipleTargets      := 16r00080000.
	LoadAddress                  := 16r00100000.
	Max                          := 16r00200000.
	Min                          := 16r00400000.
	New                          := 16r00800000.
	ZeroExtension                := 16r01000000.
	SignExtension                := 16r02000000.
	ByteSwap                     := 16r04000000.
	" Available                 := 16r08000000."
	" Available                 := 16r10000000."
	" Available                 := 16r20000000."
	" Available                 := 16r40000000."
	":Available                 := 16r80000000."
]
