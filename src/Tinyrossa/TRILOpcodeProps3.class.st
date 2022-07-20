Class {
	#name : #TRILOpcodeProps3,
	#superclass : #SharedPool,
	#classVars : [
		'Abs',
		'ArrayLength',
		'CanUseStoreAsAnAccumulator',
		'CompareTrueIfEqual',
		'CompareTrueIfGreater',
		'CompareTrueIfLess',
		'CompareTrueIfUnordered',
		'ExceptionRangeFence',
		'Fence',
		'HasBranchChild',
		'LikeDef',
		'LikeUse',
		'SignedExponentiation',
		'Signum',
		'SkipDynamicLitPoolOnInts',
		'SpineCheck',
		'UnsignedExponentiation',
		'VectorReduction'
	],
	#category : #'Tinyrossa-IL'
}

{ #category : #initialization }
TRILOpcodeProps3 class >> initialize [
	"
	See https://github.com/eclipse/omr/blob/master/compiler/il/OMRILProps.hpp#L240
	"
	Fence                       := 16r00000001.
	ExceptionRangeFence         := 16r00000002.
	LikeUse                     := 16r00000004.
	LikeDef                     := 16r00000008.
	SpineCheck                  := 16r00000010.
	ArrayLength                 := 16r00000020.
	SignedExponentiation        := 16r00000040. " signed/unsigned base with signed exponent "
	UnsignedExponentiation      := 16r00000080. " signed/unsigned base with unsigned exponent "
	CompareTrueIfLess           := 16r00000100. " Result is true if left   right.  Set for  = != "
	CompareTrueIfGreater        := 16r00000200. " Result is true if left >  right.  Set for > >= != "
	CompareTrueIfEqual          := 16r00000400. " Result is true if left == right.  Set for = >= == "
	CompareTrueIfUnordered      := 16r00000800. " Result is true if left and right are incomparable.  (NaN) "
	CanUseStoreAsAnAccumulator  := 16r00001000.
	HasBranchChild              := 16r00002000. " used in conjunction with jumpwithmultipletargets "
	SkipDynamicLitPoolOnInts    := 16r00004000. " do not perform dynamicLiteralPool on any integral constant children of this node (used for lengths of array ops) "
	Abs                         := 16r00008000.
	VectorReduction             := 16r00010000. " Indicates if opcode performs vector reduction that produces scalar result "
	Signum                      := 16r00020000. " For Xcmp opcodes "
]
