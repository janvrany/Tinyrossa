Class {
	#name : #AJConstants,
	#superclass : #SharedPool,
	#classVars : [
		'CcA',
		'CcABOVE',
		'CcABOVEEQUAL',
		'CcAE',
		'CcB',
		'CcBE',
		'CcBELOW',
		'CcBELOWEQUAL',
		'CcC',
		'CcE',
		'CcEQUAL',
		'CcFPNOTUNORDERED',
		'CcFPUNORDERED',
		'CcG',
		'CcGE',
		'CcGREATER',
		'CcGREATEREQUAL',
		'CcL',
		'CcLE',
		'CcLESS',
		'CcLESSEQUAL',
		'CcNA',
		'CcNAE',
		'CcNB',
		'CcNBE',
		'CcNC',
		'CcNE',
		'CcNEGATIVE',
		'CcNG',
		'CcNGE',
		'CcNL',
		'CcNLE',
		'CcNO',
		'CcNOCONDITION',
		'CcNOOVERFLOW',
		'CcNOTEQUAL',
		'CcNOTSIGN',
		'CcNOTZERO',
		'CcNP',
		'CcNS',
		'CcNZ',
		'CcO',
		'CcOVERFLOW',
		'CcP',
		'CcPARITYEVEN',
		'CcPARITYODD',
		'CcPE',
		'CcPO',
		'CcPOSITIVE',
		'CcS',
		'CcSIGN',
		'CcZ',
		'CcZERO',
		'InstCMOVA',
		'InstJA',
		'O64Only',
		'OFM1',
		'OFM10',
		'OFM2',
		'OFM24',
		'OFM248',
		'OFM4',
		'OFM48',
		'OFM4810',
		'OFM8',
		'OG16',
		'OG163264',
		'OG32',
		'OG3264',
		'OG64',
		'OG8',
		'OG8163264',
		'OIMM',
		'OMEM',
		'OMM',
		'OMMMEM',
		'OMMXMM',
		'OMMXMMMEM',
		'ONOREX',
		'OXMM',
		'OXMMMEM',
		'OpImm',
		'OpLabel',
		'OpMem',
		'OpNONE',
		'OpREG',
		'PrefetchNTA',
		'PrefetchT0',
		'PrefetchT1',
		'PrefetchT2',
		'RIDEAX',
		'RIDEBP',
		'RIDEBX',
		'RIDECX',
		'RIDEDI',
		'RIDEDX',
		'RIDESI',
		'RIDESP',
		'RegCodeMask',
		'RegGPB',
		'RegGPD',
		'RegGPQ',
		'RegGPW',
		'RegHighByteMask',
		'RegMM',
		'RegProhibitsRexMask',
		'RegRequiresRexMask',
		'RegTypeMask',
		'RegX87',
		'RegXMM',
		'SegmentCS',
		'SegmentDS',
		'SegmentES',
		'SegmentFS',
		'SegmentGS',
		'SegmentNONE',
		'SegmentSS',
		'SizeByte',
		'SizeDQWord',
		'SizeDWord',
		'SizeQWord',
		'SizeTWord',
		'SizeWord'
	],
	#category : #'AsmJit-Core'
}

{ #category : #initialization }
AJConstants class >> initOpCodes [


  " x86 "
  OG8          := 16r01.
  OG16         := 16r02.
  OG32         := 16r04.
  OG64         := 16r08.
  OMEM         := 16r40.
  OIMM         := 16r80.

  O64Only      := 16r100.

  OG8163264    := OG64  + OG32  + OG16  + OG8.
  OG163264     := OG64  + OG32  + OG16.
  OG3264       := OG64  + OG32.

  " x87"
  OFM1        := 16r01.
  OFM2        := 16r02.
  OFM4        := 16r04.
  OFM8        := 16r08.
  OFM10       := 16r10.

  OFM24       := OFM2 + OFM4.
  OFM248      := OFM2 + OFM4 + OFM8.
  OFM48       := OFM4 + OFM8.
  OFM4810     := OFM4 + OFM8 + OFM10.

  " mm|xmm"
  ONOREX      := 16r01. " Used by MMX/SSE instructions. OG8 is never used for them "
  OMM         := 16r10.
  OXMM        := 16r20.

  OMMMEM      := OMM   + OMEM.
  OXMMMEM     := OXMM  + OMEM.
  OMMXMM      := OMM   + OXMM.
  OMMXMMMEM   := OMM   + OXMM  + OMEM.
]

{ #category : #initialization }
AJConstants class >> initialize [

	"AJConstants initialize"

	"Operand is none, used only internally."
	OpNONE := 0.
	"Operand is register"
	OpREG := 1.
	"Operand is memory"
	OpMem := 2.
	"Operand is immediate."
	OpImm := 3.
	"Operand is label. "
	OpLabel := 4.

	RegTypeMask := 16rF0.
	RegCodeMask := 16r0F.
	RegRequiresRexMask := 16r100.
	RegProhibitsRexMask := 16r200.
	RegHighByteMask := 2r111100.

	"1 byte size."
	SizeByte := 1.
	"2 bytes size."
	SizeWord := 2.
	"4 bytes size."
	SizeDWord := 4.
	"8 bytes size."
	SizeQWord := 8.
	"10 bytes size."
	SizeTWord := 10.
	"16 bytes size."
	SizeDQWord := 16.


	"ID for AX/EAX/RAX registers."
	RIDEAX := 0.
	"ID for CX/ECX/RCX registers."
	RIDECX := 1.
	"ID for DX/EDX/RDX registers."
	RIDEDX := 2.
	"ID for BX/EBX/RBX registers."
	RIDEBX := 3.
	"ID for SP/ESP/RSP registers."
	RIDESP := 4.
	"ID for BP/EBP/RBP registers."
	RIDEBP := 5.
	"ID for SI/ESI/RSI registers."
	RIDESI := 6.
	"ID for DI/EDI/RDI registers."
	RIDEDI := 7.

	"8 bit general purpose register type."
	RegGPB := 16r00.
	"16 bit general purpose register type."
	RegGPW := 16r10.
	"32 bit general purpose register type."
	RegGPD := 16r20.
	"64 bit general purpose register type. "
	RegGPQ := 16r30.
	"X87 (FPU) register type. "
	RegX87 := 16r50.
	"64 bit mmx register type."
	RegMM := 16r60.
	"128 bit sse register type."
	RegXMM := 16r70.

	"Segment override prefixes."

	"No segment override prefix."
	SegmentNONE := 0.
	"Use 'cs' segment override prefix."
	SegmentCS := 1.
	"Use 'ss' segment override prefix."
	SegmentSS := 2.
	"Use 'ds' segment override prefix."
	SegmentDS := 3.
	"Use 'es' segment override prefix."
	SegmentES := 4.
	"Use 'fs' segment override prefix."
	SegmentFS := 5.
	"Use 'gs' segment override prefix."
	SegmentGS := 6.

	self initializePrefetchHints.
	self initializeConditionCodes.
	self initOpCodes.


]

{ #category : #initialization }
AJConstants class >> initializeConditionCodes [

	"Condition codes."

	"No condition code."
	CcNOCONDITION  := -1.

	"Condition codes from processor manuals."
	CcA             := 16r7.
	CcAE            := 16r3.
	CcB             := 16r2.
	CcBE            := 16r6.
	CcC             := 16r2.
	CcE             := 16r4.
	CcG             := 16rF.
	CcGE            := 16rD.
	CcL             := 16rC.
	CcLE            := 16rE.
	CcNA            := 16r6.
	CcNAE           := 16r2.
	CcNB            := 16r3.
	CcNBE           := 16r7.
	CcNC            := 16r3.
	CcNE            := 16r5.
	CcNG            := 16rE.
	CcNGE           := 16rC.
	CcNL            := 16rD.
	CcNLE           := 16rF.
	CcNO            := 16r1.
	CcNP            := 16rB.
	CcNS            := 16r9.
	CcNZ            := 16r5.
	CcO             := 16r0.
	CcP             := 16rA.
	CcPE            := 16rA.
	CcPO            := 16rB.
	CcS             := 16r8.
	CcZ             := 16r4.

	" Simplified condition codes"
	CcOVERFLOW      := 16r0.
	CcNOOVERFLOW   := 16r1.
	CcBELOW         := 16r2.
	CcABOVEEQUAL   := 16r3.
	CcEQUAL         := 16r4.
	CcNOTEQUAL     := 16r5.
	CcBELOWEQUAL   := 16r6.
	CcABOVE         := 16r7.
	CcSIGN          := 16r8.
	CcNOTSIGN      := 16r9.
	CcPARITYEVEN   := 16rA.
	CcPARITYODD    := 16rB.
	CcLESS          := 16rC.
	CcGREATEREQUAL := 16rD.
	CcLESSEQUAL    := 16rE.
	CcGREATER       := 16rF.

	"aliases"
	CcZERO          := 16r4.
	CcNOTZERO      := 16r5.
	CcNEGATIVE      := 16r8.
	CcPOSITIVE      := 16r9.

	"x87 floating point only"
	CcFPUNORDERED  := 16.
	CcFPNOTUNORDERED := 17.



]

{ #category : #initialization }
AJConstants class >> initializePrefetchHints [

	"Prefetch hints."

	"Prefetch to L0 cache."
	PrefetchT0 := 1.
	"Prefetch to L1 cache."
	PrefetchT1 := 2.
	"Prefetch to L2 cache."
	PrefetchT2  := 3.
	"Prefetch using NT hint."
	PrefetchNTA := 0.

]
