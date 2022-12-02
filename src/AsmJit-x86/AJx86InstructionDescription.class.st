"
name:		an instruction mnemonic
	group:		an instruction encoding group

	o1Flags:		operand1 flags
	o2Flags:		operand2 flags
	opCode1:		opcode 1
	opCode2:		opcode 2
	opCodeR:		code for inlining in MR field as register

Operand flags:

bit:	 9   |  8   |  7    |   6  |  5    |   4    |  3  |  2   |  1  | 0 |
______________________________________________
      *86| *64 | XMM | MM | IMM | MEM | 64 | 32 | 16 | 8|

- *64 , set on o1Flags, meaning that instruction available only for x64 processor mode
- *86 , set on o1Flags, meaning that instruction available only for x86 processor mode


"
Class {
	#name : #AJx86InstructionDescription,
	#superclass : #Object,
	#instVars : [
		'name',
		'group',
		'comment',
		'description',
		'o1Flags',
		'o2Flags',
		'opCodeR',
		'opCode1',
		'opCode2',
		'groupEmitSelector'
	],
	#pools : [
		'AJConstants',
		'AJx86Registers'
	],
	#classInstVars : [
		'instructions',
		'reference'
	],
	#category : #'AsmJit-x86-Instructions'
}

{ #category : #initialization }
AJx86InstructionDescription class >> allInstructionData [
	^ OrderedCollection new
		addAll: self instructionData;
		addAll: self instructionsCDQ;
		addAll: self instructionsOther;
		yourself
]

{ #category : #initialization }
AJx86InstructionDescription class >> at: instructionName [

	^ instructions
		at: instructionName
]

{ #category : #testing }
AJx86InstructionDescription class >> checkInstructionsIntegrity [

	" self checkInstructionsIntegrity"
	| data |

	data := self instructionData.

	data do: [:dt | | instr |

		instr := instructions at: dt first.

		self assert: [
			(instr name = (dt at: 1)) &
			(instr group = (dt at: 2)) &
			(instr o1Flags = (dt at:3)) &
			(instr o2Flags = (dt at:4)) &
			(instr opCodeR = (dt at:5)) &
			(instr opCode1 = (dt at:6)) &
			(instr opCode2 = (dt at:7))
		].
	].


]

{ #category : #'instance creation' }
AJx86InstructionDescription class >> fromArray: aSpecArray [
	^ self basicNew
		fromArray: aSpecArray
]

{ #category : #initialization }
AJx86InstructionDescription class >> initInstructions [
	" self initInstructions "
	| data |

	instructions := IdentityDictionary new.

	data := self allInstructionData.

	data do: [:dt |
		instructions at: dt first put: (self fromArray: dt) ].

	^ instructions
]

{ #category : #initialization }
AJx86InstructionDescription class >> initialize [

	self initInstructions.
]

{ #category : #initialization }
AJx86InstructionDescription class >> instructionData [
^ #(
(#adc #alu 0 0 "R" 2 "C1" 16r00000010 "C2" 16r00000080 )
(#add #alu 0 0 "R" 0 0 "C2" 16r00000080 )
(#addpd #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r66000F58 0 )
(#addps #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r00000F58 0 )
(#addsd #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16rF2000F58 0 )
(#addss #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16rF3000F58 0 )
(#addsubpd #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r66000FD0 0 )
(#addsubps #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16rF2000FD0 0 )
(#amdprefetch #mem "op1" 2r1000000 0 "R" 0 "C1" 16r00000F0D 0 )
(#amdprefetchw #mem "op1" 2r1000000 0 "R" 1 "C1" 16r00000F0D 0 )
(#and #alu 0 0 "R" 4 "C1" 16r00000020 "C2" 16r00000080 )
(#andnpd #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r66000F55 0 )
(#andnps #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r00000F55 0 )
(#andpd #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r66000F54 0 )
(#andps #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r00000F54 0 )
(#blendpd #mmuRmImm8 "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r660F3A0D 0 )
(#blendps #mmuRmImm8 "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r660F3A0C 0 )
(#blendvpd #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r660F3815 0 )
(#blendvps #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r660F3814 0 )
(#bsf #rrm 0 0 "R" 0 "C1" 16r00000FBC 0 )
(#bsr #rrm 0 0 "R" 0 "C1" 16r00000FBD 0 )
(#bswap #bswap 0 0 "R" 0 0 0 )
(#bt #bt "op1" 2r1001110 "op2" 2r10001110 "R" 4 "C1" 16r00000FA3 "C2" 16r00000FBA )
(#btc #bt "op1" 2r1001110 "op2" 2r10001110 "R" 7 "C1" 16r00000FBB "C2" 16r00000FBA )
(#btr #bt "op1" 2r1001110 "op2" 2r10001110 "R" 6 "C1" 16r00000FB3 "C2" 16r00000FBA )
(#bts #bt "op1" 2r1001110 "op2" 2r10001110 "R" 5 "C1" 16r00000FAB "C2" 16r00000FBA )
(#call #call 0 0 "R" 0 0 0 )
(#clc #emit 0 0 "R" 0 "C1" 16r000000F8 0 )
(#cld #emit 0 0 "R" 0 "C1" 16r000000FC 0 )
(#clflush #mem "op1" 2r1000000 0 "R" 7 "C1" 16r00000FAE 0 )
(#cmc #emit 0 0 "R" 0 "C1" 16r000000F5 0 )
(#cmova #rrm 0 0 "R" 0 "C1" 16r00000F47 0 )
(#cmovae #rrm 0 0 "R" 0 "C1" 16r00000F43 0 )
(#cmovb #rrm 0 0 "R" 0 "C1" 16r00000F42 0 )
(#cmovbe #rrm 0 0 "R" 0 "C1" 16r00000F46 0 )
(#cmovc #rrm 0 0 "R" 0 "C1" 16r00000F42 0 )
(#cmove #rrm 0 0 "R" 0 "C1" 16r00000F44 0 )
(#cmovg #rrm 0 0 "R" 0 "C1" 16r00000F4F 0 )
(#cmovge #rrm 0 0 "R" 0 "C1" 16r00000F4D 0 )
(#cmovl #rrm 0 0 "R" 0 "C1" 16r00000F4C 0 )
(#cmovle #rrm 0 0 "R" 0 "C1" 16r00000F4E 0 )
(#cmovna #rrm 0 0 "R" 0 "C1" 16r00000F46 0 )
(#cmovnae #rrm 0 0 "R" 0 "C1" 16r00000F42 0 )
(#cmovnb #rrm 0 0 "R" 0 "C1" 16r00000F43 0 )
(#cmovnbe #rrm 0 0 "R" 0 "C1" 16r00000F47 0 )
(#cmovnc #rrm 0 0 "R" 0 "C1" 16r00000F43 0 )
(#cmovne #rrm 0 0 "R" 0 "C1" 16r00000F45 0 )
(#cmovng #rrm 0 0 "R" 0 "C1" 16r00000F4E 0 )
(#cmovnge #rrm 0 0 "R" 0 "C1" 16r00000F4C 0 )
(#cmovnl #rrm 0 0 "R" 0 "C1" 16r00000F4D 0 )
(#cmovnle #rrm 0 0 "R" 0 "C1" 16r00000F4F 0 )
(#cmovno #rrm 0 0 "R" 0 "C1" 16r00000F41 0 )
(#cmovnp #rrm 0 0 "R" 0 "C1" 16r00000F4B 0 )
(#cmovns #rrm 0 0 "R" 0 "C1" 16r00000F49 0 )
(#cmovnz #rrm 0 0 "R" 0 "C1" 16r00000F45 0 )
(#cmovo #rrm 0 0 "R" 0 "C1" 16r00000F40 0 )
(#cmovp #rrm 0 0 "R" 0 "C1" 16r00000F4A 0 )
(#cmovpe #rrm 0 0 "R" 0 "C1" 16r00000F4A 0 )
(#cmovpo #rrm 0 0 "R" 0 "C1" 16r00000F4B 0 )
(#cmovs #rrm 0 0 "R" 0 "C1" 16r00000F48 0 )
(#cmovz #rrm 0 0 "R" 0 "C1" 16r00000F44 0 )
(#cmp #alu 0 0 "R" 7 "C1" 16r00000038 "C2" 16r00000080 )
(#cmppd #mmuRmImm8 "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r66000FC2 0 )
(#cmpps #mmuRmImm8 "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r00000FC2 0 )
(#cmpsd #mmuRmImm8 "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16rF2000FC2 0 )
(#cmpss #mmuRmImm8 "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16rF3000FC2 0 )
(#cmpxchg #rmr 0 0 "R" 0 "C1" 16r00000FB0 0 )
(#cmpxchg16b #mem "op1" 2r1000000 0 "R" 1 "C1" 16r00000FC7 "C2" 16r00000001 )
(#cmpxchg8b #mem "op1" 2r1000000 0 "R" 1 "C1" 16r00000FC7 0 )
(#comisd #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r66000F2F 0 )
(#comiss #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r00000F2F 0 )
(#cpuid #emit 0 0 "R" 0 "C1" 16r00000FA2 0 )
(#crc32 #crc32 0 0 "R" 0 "C1" 16rF20F38F0 0 )
(#cvtdq2pd #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16rF3000FE6 0 )
(#cvtdq2ps #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r00000F5B 0 )
(#cvtpd2dq #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16rF2000FE6 0 )
(#cvtpd2pi #mmurmi "op1" 2r10000 "op2" 2r1100000 "R" 0 "C1" 16r66000F2D 0 )
(#cvtpd2ps #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r66000F5A 0 )
(#cvtpi2pd #mmurmi "op1" 2r100000 "op2" 2r1010000 "R" 0 "C1" 16r66000F2A 0 )
(#cvtpi2ps #mmurmi "op1" 2r100000 "op2" 2r1010000 "R" 0 "C1" 16r00000F2A 0 )
(#cvtps2dq #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r66000F5B 0 )
(#cvtps2pd #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r00000F5A 0 )
(#cvtps2pi #mmurmi "op1" 2r10000 "op2" 2r1100000 "R" 0 "C1" 16r00000F2D 0 )
(#cvtsd2si #mmurmi "op1" 2r1100 "op2" 2r1100000 "R" 0 "C1" 16rF2000F2D 0 )
(#cvtsd2ss #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16rF2000F5A 0 )
(#cvtsi2sd #mmurmi "op1" 2r100000 "op2" 2r1001100 "R" 0 "C1" 16rF2000F2A 0 )
(#cvtsi2ss #mmurmi "op1" 2r100000 "op2" 2r1001100 "R" 0 "C1" 16rF3000F2A 0 )
(#cvtss2sd #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16rF3000F5A 0 )
(#cvtss2si #mmurmi "op1" 2r1100 "op2" 2r1100000 "R" 0 "C1" 16rF3000F2D 0 )
(#cvttpd2dq #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r66000FE6 0 )
(#cvttpd2pi #mmurmi "op1" 2r10000 "op2" 2r1100000 "R" 0 "C1" 16r66000F2C 0 )
(#cvttps2dq #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16rF3000F5B 0 )
(#cvttps2pi #mmurmi "op1" 2r10000 "op2" 2r1100000 "R" 0 "C1" 16r00000F2C 0 )
(#cvttsd2si #mmurmi "op1" 2r1100 "op2" 2r1100000 "R" 0 "C1" 16rF2000F2C 0 )
(#cvttss2si #mmurmi "op1" 2r1100 "op2" 2r1100000 "R" 0 "C1" 16rF3000F2C 0 )
(#daa #emit #x86 0 "R" 0 "C1" 16r00000027 0 )
(#das #emit #x86 0 "R" 0 "C1" 16r0000002F 0 )
(#dec #incdec 0 0 "R" 1 "C1" 16r00000048 "C2" 16r000000FE )
(#div #rm 0 0 "R" 6 "C1" 16r000000F6 0 )
(#divpd #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r66000F5E 0 )
(#divps #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r00000F5E 0 )
(#divsd #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16rF2000F5E 0 )
(#divss #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16rF3000F5E 0 )
(#dppd #mmuRmImm8 "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r660F3A41 0 )
(#dpps #mmuRmImm8 "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r660F3A40 0 )
(#emms #emit 0 0 "R" 0 "C1" 16r00000F77 0 )
(#enter #enter 0 0 "R" 0 "C1" 16r000000C8 0 )
(#extractps #mmuRmImm8 "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r660F3A17 0 )
(#f2xm1 #emit 0 0 "R" 0 "C1" 16r0000D9F0 0 )
(#fabs #emit 0 0 "R" 0 "C1" 16r0000D9E1 0 )
(#fadd #x87fpu 0 0 "R" 0 "C1" 16rD8DCC0C0 0 )
(#faddp #x87sti 0 0 "R" 0 "C1" 16r0000DEC0 0 )
(#fbld #mem "op1" 2r1000000 0 "R" 4 "C1" 16r000000DF 0 )
(#fbstp #mem "op1" 2r1000000 0 "R" 6 "C1" 16r000000DF 0 )
(#fchs #emit 0 0 "R" 0 "C1" 16r0000D9E0 0 )
(#fclex #emit 0 0 "R" 0 "C1" 16r9B00DBE2 0 )
(#fcmovb #x87sti 0 0 "R" 0 "C1" 16r0000DAC0 0 )
(#fcmovbe #x87sti 0 0 "R" 0 "C1" 16r0000DAD0 0 )
(#fcmove #x87sti 0 0 "R" 0 "C1" 16r0000DAC8 0 )
(#fcmovnb #x87sti 0 0 "R" 0 "C1" 16r0000DBC0 0 )
(#fcmovnbe #x87sti 0 0 "R" 0 "C1" 16r0000DBD0 0 )
(#fcmovne #x87sti 0 0 "R" 0 "C1" 16r0000DBC8 0 )
(#fcmovnu #x87sti 0 0 "R" 0 "C1" 16r0000DBD8 0 )
(#fcmovu #x87sti 0 0 "R" 0 "C1" 16r0000DAD8 0 )
(#fcom #x87fpu 0 0 "R" 2 "C1" 16rD8DCD0D0 0 )
(#fcomi #x87sti 0 0 "R" 0 "C1" 16r0000DBF0 0 )
(#fcomip #x87sti 0 0 "R" 0 "C1" 16r0000DFF0 0 )
(#fcomp #x87fpu 0 0 "R" 3 "C1" 16rD8DCD8D8 0 )
(#fcompp #emit 0 0 "R" 0 "C1" 16r0000DED9 0 )
(#fcos #emit 0 0 "R" 0 "C1" 16r0000D9FF 0 )
(#fdecstp #emit 0 0 "R" 0 "C1" 16r0000D9F6 0 )
(#fdiv #x87fpu 0 0 "R" 6 "C1" 16rD8DCF0F8 0 )
(#fdivp #x87sti 0 0 "R" 0 "C1" 16r0000DEF8 0 )
(#fdivr #x87fpu 0 0 "R" 7 "C1" 16rD8DCF8F0 0 )
(#fdivrp #x87sti 0 0 "R" 0 "C1" 16r0000DEF0 0 )
(#ffree #x87sti 0 0 "R" 0 "C1" 16r0000DDC0 0 )
(#fiadd #x87mem "op1" 2r110 0 "R" 0 "C1" 16rDEDA0000 0 )
(#ficom #x87mem "op1" 2r110 0 "R" 2 "C1" 16rDEDA0000 0 )
(#ficomp #x87mem "op1" 2r110 0 "R" 3 "C1" 16rDEDA0000 0 )
(#fidiv #x87mem "op1" 2r110 0 "R" 6 "C1" 16rDEDA0000 0 )
(#fidivr #x87mem "op1" 2r110 0 "R" 7 "C1" 16rDEDA0000 0 )
(#fild #x87mem "op1" 2r1110 0 "R" 0 "C1" 16rDFDBDF05 0 )
(#fimul #x87mem "op1" 2r110 0 "R" 1 "C1" 16rDEDA0000 0 )
(#fincstp #emit 0 0 "R" 0 "C1" 16r0000D9F7 0 )
(#finit #emit 0 0 "R" 0 "C1" 16r9B00DBE3 0 )
(#fist #x87mem "op1" 2r110 0 "R" 2 "C1" 16rDFDB0000 0 )
(#fistp #x87mem "op1" 2r1110 0 "R" 3 "C1" 16rDFDBDF07 0 )
(#fisttp #x87mem "op1" 2r1110 0 "R" 1 "C1" 16rDFDBDD01 0 )
(#fisub #x87mem "op1" 2r110 0 "R" 4 "C1" 16rDEDA0000 0 )
(#fisubr #x87mem "op1" 2r110 0 "R" 5 "C1" 16rDEDA0000 0 )
(#fld #x87memSti "op1" 2r11100 0 "R" 0 "C1" 16r00D9DD00 "C2" 16rD9C0DB05 )
(#fld1 #emit 0 0 "R" 0 "C1" 16r0000D9E8 0 )
(#fldcw #mem "op1" 2r1000000 0 "R" 5 "C1" 16r000000D9 0 )
(#fldenv #mem "op1" 2r1000000 0 "R" 4 "C1" 16r000000D9 0 )
(#fldl2e #emit 0 0 "R" 0 "C1" 16r0000D9EA 0 )
(#fldl2t #emit 0 0 "R" 0 "C1" 16r0000D9E9 0 )
(#fldlg2 #emit 0 0 "R" 0 "C1" 16r0000D9EC 0 )
(#fldln2 #emit 0 0 "R" 0 "C1" 16r0000D9ED 0 )
(#fldpi #emit 0 0 "R" 0 "C1" 16r0000D9EB 0 )
(#fldz #emit 0 0 "R" 0 "C1" 16r0000D9EE 0 )
(#fmul #x87fpu 0 0 "R" 1 "C1" 16rD8DCC8C8 0 )
(#fmulp #x87sti 0 0 "R" 0 "C1" 16r0000DEC8 0 )
(#fnclex #emit 0 0 "R" 0 "C1" 16r0000DBE2 0 )
(#fninit #emit 0 0 "R" 0 "C1" 16r0000DBE3 0 )
(#fnop #emit 0 0 "R" 0 "C1" 16r0000D9D0 0 )
(#fnsave #mem "op1" 2r1000000 0 "R" 6 "C1" 16r000000DD 0 )
(#fnstcw #mem "op1" 2r1000000 0 "R" 7 "C1" 16r000000D9 0 )
(#fnstenv #mem "op1" 2r1000000 0 "R" 6 "C1" 16r000000D9 0 )
(#fnstsw #x87fstsw "op1" 2r1000000 0 "R" 7 "C1" 16r000000DD "C2" 16r0000DFE0 )
(#fpatan #emit 0 0 "R" 0 "C1" 16r0000D9F3 0 )
(#fprem #emit 0 0 "R" 0 "C1" 16r0000D9F8 0 )
(#fprem1 #emit 0 0 "R" 0 "C1" 16r0000D9F5 0 )
(#fptan #emit 0 0 "R" 0 "C1" 16r0000D9F2 0 )
(#frndint #emit 0 0 "R" 0 "C1" 16r0000D9FC 0 )
(#frstor #mem "op1" 2r1000000 0 "R" 4 "C1" 16r000000DD 0 )
(#fsave #mem "op1" 2r1000000 0 "R" 6 "C1" 16r9B0000DD 0 )
(#fscale #emit 0 0 "R" 0 "C1" 16r0000D9FD 0 )
(#fsin #emit 0 0 "R" 0 "C1" 16r0000D9FE 0 )
(#fsincos #emit 0 0 "R" 0 "C1" 16r0000D9FB 0 )
(#fsqrt #emit 0 0 "R" 0 "C1" 16r0000D9FA 0 )
(#fst #x87memSti "op1" 2r1100 0 "R" 2 "C1" 16r00D9DD02 "C2" 16rDDD00000 )
(#fstcw #mem "op1" 2r1000000 0 "R" 7 "C1" 16r9B0000D9 0 )
(#fstenv #mem "op1" 2r1000000 0 "R" 6 "C1" 16r9B0000D9 0 )
(#fstp #x87memSti "op1" 2r11100 0 "R" 3 "C1" 16r00D9DD03 "C2" 16rDDD8DB07 )
(#fstsw #x87fstsw "op1" 2r1000000 0 "R" 7 "C1" 16r9B0000DD "C2" 16r9B00DFE0 )
(#fsub #x87fpu 0 0 "R" 4 "C1" 16rD8DCE0E8 0 )
(#fsubp #x87sti 0 0 "R" 0 "C1" 16r0000DEE8 0 )
(#fsubr #x87fpu 0 0 "R" 5 "C1" 16rD8DCE8E0 0 )
(#fsubrp #x87sti 0 0 "R" 0 "C1" 16r0000DEE0 0 )
(#ftst #emit 0 0 "R" 0 "C1" 16r0000D9E4 0 )
(#fucom #x87sti 0 0 "R" 0 "C1" 16r0000DDE0 0 )
(#fucomi #x87sti 0 0 "R" 0 "C1" 16r0000DBE8 0 )
(#fucomip #x87sti 0 0 "R" 0 "C1" 16r0000DFE8 0 )
(#fucomp #x87sti 0 0 "R" 0 "C1" 16r0000DDE8 0 )
(#fucompp #emit 0 0 "R" 0 "C1" 16r0000DAE9 0 )
(#fwait #emit 0 0 "R" 0 "C1" 16r0000009B 0 )
(#fxam #emit 0 0 "R" 0 "C1" 16r0000D9E5 0 )
(#fxch #x87sti 0 0 "R" 0 "C1" 16r0000D9C8 0 )
(#fxrstor #mem 0 0 "R" 1 "C1" 16r00000FAE 0 )
(#fxsave #mem 0 0 "R" 0 "C1" 16r00000FAE 0 )
(#fxtract #emit 0 0 "R" 0 "C1" 16r0000D9F4 0 )
(#fyl2x #emit 0 0 "R" 0 "C1" 16r0000D9F1 0 )
(#fyl2xp1 #emit 0 0 "R" 0 "C1" 16r0000D9F9 0 )
(#haddpd #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r66000F7C 0 )
(#haddps #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16rF2000F7C 0 )
(#hsubpd #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r66000F7D 0 )
(#hsubps #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16rF2000F7D 0 )
(#idiv #rm 0 0 "R" 7 "C1" 16r000000F6 0 )
(#imul #imul 0 0 "R" 0 0 0 )
(#inc #incdec 0 0 "R" 0 "C1" 16r00000040 "C2" 16r000000FE )
(#int3 #emit 0 0 "R" 0 "C1" 16r000000CC 0 )
(#ja #cjmp 0 0 "R" 0 "C1" 16r00000007 0 )
(#jae #cjmp 0 0 "R" 0 "C1" 16r00000003 0 )
(#jb #cjmp 0 0 "R" 0 "C1" 16r00000002 0 )
(#jbe #cjmp 0 0 "R" 0 "C1" 16r00000006 0 )
(#jc #cjmp 0 0 "R" 0 "C1" 16r00000002 0 )
(#je #cjmp 0 0 "R" 0 "C1" 16r00000004 0 )
(#jg #cjmp 0 0 "R" 0 "C1" 16r0000000F 0 )
(#jge #cjmp 0 0 "R" 0 "C1" 16r0000000D 0 )
(#jl #cjmp 0 0 "R" 0 "C1" 16r0000000C 0 )
(#jle #cjmp 0 0 "R" 0 "C1" 16r0000000E 0 )
(#jmp #jmp 0 0 "R" 0 0 0 )
(#jna #cjmp 0 0 "R" 0 "C1" 16r00000006 0 )
(#jnae #cjmp 0 0 "R" 0 "C1" 16r00000002 0 )
(#jnb #cjmp 0 0 "R" 0 "C1" 16r00000003 0 )
(#jnbe #cjmp 0 0 "R" 0 "C1" 16r00000007 0 )
(#jnc #cjmp 0 0 "R" 0 "C1" 16r00000003 0 )
(#jne #cjmp 0 0 "R" 0 "C1" 16r00000005 0 )
(#jng #cjmp 0 0 "R" 0 "C1" 16r0000000E 0 )
(#jnge #cjmp 0 0 "R" 0 "C1" 16r0000000C 0 )
(#jnl #cjmp 0 0 "R" 0 "C1" 16r0000000D 0 )
(#jnle #cjmp 0 0 "R" 0 "C1" 16r0000000F 0 )
(#jno #cjmp 0 0 "R" 0 "C1" 16r00000001 0 )
(#jnp #cjmp 0 0 "R" 0 "C1" 16r0000000B 0 )
(#jns #cjmp 0 0 "R" 0 "C1" 16r00000009 0 )
(#jnz #cjmp 0 0 "R" 0 "C1" 16r00000005 0 )
(#jo #cjmp 0 0 "R" 0 0 0 )
(#jp #cjmp 0 0 "R" 0 "C1" 16r0000000A 0 )
(#jpe #cjmp 0 0 "R" 0 "C1" 16r0000000A 0 )
(#jpo #cjmp 0 0 "R" 0 "C1" 16r0000000B 0 )
(#js #cjmp 0 0 "R" 0 "C1" 16r00000008 0 )
(#jz #cjmp 0 0 "R" 0 "C1" 16r00000004 0 )
(#lddqu #mmurmi "op1" 2r100000 "op2" 2r1000000 "R" 0 "C1" 16rF2000FF0 0 )
(#ldmxcsr #mem "op1" 2r1000000 0 "R" 2 "C1" 16r00000FAE 0 )
(#lea #lea 0 0 "R" 0 0 0 )
(#leave #emit 0 0 "R" 0 "C1" 16r000000C9 0 )
(#lfence #emit 0 0 "R" 0 "C1" 16r000FAEE8 0 )
(#lock #emit 0 0 "R" 0 "C1" 16r000000F0 0 )
(#maskmovdqu #mmurmi "op1" 2r100000 "op2" 2r100000 "R" 0 "C1" 16r66000F57 0 )
(#maskmovq #mmurmi "op1" 2r10000 "op2" 2r10000 "R" 0 "C1" 16r00000FF7 0 )
(#maxpd #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r66000F5F 0 )
(#maxps #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r00000F5F 0 )
(#maxsd #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16rF2000F5F 0 )
(#maxss #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16rF3000F5F 0 )
(#mfence #emit 0 0 "R" 0 "C1" 16r000FAEF0 0 )
(#minpd #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r66000F5D 0 )
(#minps #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r00000F5D 0 )
(#minsd #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16rF2000F5D 0 )
(#minss #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16rF3000F5D 0 )
(#monitor #emit 0 0 "R" 0 "C1" 16r000F01C8 0 )
(#mov #mov 0 0 "R" 0 0 0 )
"(#movPtr #movPtr 0 0 0 0 0 )"
(#movapd #mmuMov "op1" 2r1100000 "op2" 2r1100000 "R" 0 "C1" 16r66000F28 "C2" 16r66000F29 )
(#movaps #mmuMov "op1" 2r1100000 "op2" 2r1100000 "R" 0 "C1" 16r00000F28 "C2" 16r00000F29 )
(#movbe #movbe "op1" 2r1001110 "op2" 2r1001110 "R" 0 "C1" 16r000F38F0 "C2" 16r000F38F1 )
(#movd #mmuMovD 0 0 "R" 0 0 0 )
(#movddup #mmuMov "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16rF2000F12 0 )
(#movdq2q #mmuMov "op1" 2r10000 "op2" 2r100000 "R" 0 "C1" 16rF2000FD6 0 )
(#movdqa #mmuMov "op1" 2r1100000 "op2" 2r1100000 "R" 0 "C1" 16r66000F6F "C2" 16r66000F7F )
(#movdqu #mmuMov "op1" 2r1100000 "op2" 2r1100000 "R" 0 "C1" 16rF3000F6F "C2" 16rF3000F7F )
(#movhlps #mmuMov "op1" 2r100000 "op2" 2r100000 "R" 0 "C1" 16r00000F12 0 )
(#movhpd #mmuMov "op1" 2r1100000 "op2" 2r1100000 "R" 0 "C1" 16r66000F16 "C2" 16r66000F17 )
(#movhps #mmuMov "op1" 2r1100000 "op2" 2r1100000 "R" 0 "C1" 16r00000F16 "C2" 16r00000F17 )
(#movlhps #mmuMov "op1" 2r100000 "op2" 2r100000 "R" 0 "C1" 16r00000F16 0 )
(#movlpd #mmuMov "op1" 2r1100000 "op2" 2r1100000 "R" 0 "C1" 16r66000F12 "C2" 16r66000F13 )
(#movlps #mmuMov "op1" 2r1100000 "op2" 2r1100000 "R" 0 "C1" 16r00000F12 "C2" 16r00000F13 )
(#movmskpd #mmuMov "op1" 2r1101 "op2" 2r100000 "R" 0 "C1" 16r66000F50 0 )
(#movmskps #mmuMov "op1" 2r1101 "op2" 2r100000 "R" 0 "C1" 16r00000F50 0 )
(#movntdq #mmuMov "op1" 2r1000000 "op2" 2r100000 "R" 0 0 "C2" 16r66000FE7 )
(#movntdqa #mmuMov "op1" 2r100000 "op2" 2r1000000 "R" 0 "C1" 16r660F382A 0 )
(#movnti #mmuMov "op1" 2r1000000 "op2" 2r1100 "R" 0 0 "C2" 16r00000FC3 )
(#movntpd #mmuMov "op1" 2r1000000 "op2" 2r100000 "R" 0 0 "C2" 16r66000F2B )
(#movntps #mmuMov "op1" 2r1000000 "op2" 2r100000 "R" 0 0 "C2" 16r00000F2B )
(#movntq #mmuMov "op1" 2r1000000 "op2" 2r10000 "R" 0 0 "C2" 16r00000FE7 )
(#movq #mmuMovQ 0 0 "R" 0 0 0 )
(#movq2dq #mmurmi "op1" 2r100000 "op2" 2r10000 "R" 0 "C1" 16rF3000FD6 0 )
(#movsd #mmuMov "op1" 2r1100000 "op2" 2r1100000 "R" 0 "C1" 16rF2000F10 "C2" 16rF2000F11 )
(#movshdup #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16rF3000F16 0 )
(#movsldup #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16rF3000F12 0 )
(#movss #mmuMov "op1" 2r1100000 "op2" 2r1100000 "R" 0 "C1" 16rF3000F10 "C2" 16rF3000F11 )
(#movsx #movSxZx 0 0 "R" 0 "C1" 16r00000FBE 0 )
(#movsxd #movsxd 0 0 "R" 0 0 0 )
(#movupd #mmuMov "op1" 2r1100000 "op2" 2r1100000 "R" 0 "C1" 16r66000F10 "C2" 16r66000F11 )
(#movups #mmuMov "op1" 2r1100000 "op2" 2r1100000 "R" 0 "C1" 16r00000F10 "C2" 16r00000F11 )
(#movzx #movSxZx 0 0 "R" 0 "C1" 16r00000FB6 0 )
(#mpsadbw #mmuRmImm8 "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r660F3A42 0 )
(#mul #rm 0 0 "R" 4 "C1" 16r000000F6 0 )
(#mulpd #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r66000F59 0 )
(#mulps #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16rF3000F59 0 )
(#mulsd #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16rF2000F59 0 )
(#mulss #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16rF3000F59 0 )
(#mwait #emit 0 0 "R" 0 "C1" 16r000F01C9 0 )
(#neg #rm 0 0 "R" 3 "C1" 16r000000F6 0 )
(#nop #emit 0 0 "R" 0 "C1" 16r00000090 0 )
(#not #rm 0 0 "R" 2 "C1" 16r000000F6 0 )
(#or #alu 0 0 "R" 1 "C1" 16r00000008 "C2" 16r00000080 )
(#orpd #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r66000F56 0 )
(#orps #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r00000F56 0 )
(#pabsb #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r000F381C 0 )
(#pabsd #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r000F381E 0 )
(#pabsw #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r000F381D 0 )
(#packssdw #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000F6B 0 )
(#packsswb #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000F63 0 )
(#packusdw #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r660F382B 0 )
(#packuswb #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000F67 0 )
(#paddb #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000FFC 0 )
(#paddd #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000FFE 0 )
(#paddq #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000FD4 0 )
(#paddsb #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000FEC 0 )
(#paddsw #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000FED 0 )
(#paddusb #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000FDC 0 )
(#paddusw #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000FDD 0 )
(#paddw #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000FFD 0 )
(#palignr #mmuRmImm8 "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r000F3A0F 0 )
(#pand #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000FDB 0 )
(#pandn #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000FDF 0 )
(#pause #emit 0 0 "R" 0 "C1" 16rF3000090 0 )
(#pavgb #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000FE0 0 )
(#pavgw #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000FE3 0 )
(#pblendvb #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r660F3810 0 )
(#pblendw #mmuRmImm8 "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r660F3A0E 0 )
(#pcmpeqb #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000F74 0 )
(#pcmpeqd #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000F76 0 )
(#pcmpeqq #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r660F3829 0 )
(#pcmpeqw #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000F75 0 )
(#pcmpestri #mmuRmImm8 "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r660F3A61 0 )
(#pcmpestrm #mmuRmImm8 "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r660F3A60 0 )
(#pcmpgtb #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000F64 0 )
(#pcmpgtd #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000F66 0 )
(#pcmpgtq #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r660F3837 0 )
(#pcmpgtw #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000F65 0 )
(#pcmpistri #mmuRmImm8 "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r660F3A63 0 )
(#pcmpistrm #mmuRmImm8 "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r660F3A62 0 )
(#pextrb #mmuPextr "op1" 2r1000101 "op2" 2r100000 "R" 0 "C1" 16r000F3A14 0 )
(#pextrd #mmuPextr "op1" 2r1000100 "op2" 2r100000 "R" 0 "C1" 16r000F3A16 0 )
(#pextrq #mmuPextr "op1" 2r1001100 "op2" 2r100000 "R" 1 "C1" 16r000F3A16 0 )
(#pextrw #mmuPextr "op1" 2r1000100 "op2" 2r110000 "R" 0 "C1" 16r000F3A16 0 )
(#pf2id #mmuRm3DNow "op1" 2r10000 "op2" 2r1010000 "R" 0 "C1" 16r00000F0F "C2" 16r0000001D )
(#pf2iw #mmuRm3DNow "op1" 2r10000 "op2" 2r1010000 "R" 0 "C1" 16r00000F0F "C2" 16r0000001C )
(#pfacc #mmuRm3DNow "op1" 2r10000 "op2" 2r1010000 "R" 0 "C1" 16r00000F0F "C2" 16r000000AE )
(#pfadd #mmuRm3DNow "op1" 2r10000 "op2" 2r1010000 "R" 0 "C1" 16r00000F0F "C2" 16r0000009E )
(#pfcmpeq #mmuRm3DNow "op1" 2r10000 "op2" 2r1010000 "R" 0 "C1" 16r00000F0F "C2" 16r000000B0 )
(#pfcmpge #mmuRm3DNow "op1" 2r10000 "op2" 2r1010000 "R" 0 "C1" 16r00000F0F "C2" 16r00000090 )
(#pfcmpgt #mmuRm3DNow "op1" 2r10000 "op2" 2r1010000 "R" 0 "C1" 16r00000F0F "C2" 16r000000A0 )
(#pfmax #mmuRm3DNow "op1" 2r10000 "op2" 2r1010000 "R" 0 "C1" 16r00000F0F "C2" 16r000000A4 )
(#pfmin #mmuRm3DNow "op1" 2r10000 "op2" 2r1010000 "R" 0 "C1" 16r00000F0F "C2" 16r00000094 )
(#pfmul #mmuRm3DNow "op1" 2r10000 "op2" 2r1010000 "R" 0 "C1" 16r00000F0F "C2" 16r000000B4 )
(#pfnacc #mmuRm3DNow "op1" 2r10000 "op2" 2r1010000 "R" 0 "C1" 16r00000F0F "C2" 16r0000008A )
(#pfpnacc #mmuRm3DNow "op1" 2r10000 "op2" 2r1010000 "R" 0 "C1" 16r00000F0F "C2" 16r0000008E )
(#pfrcp #mmuRm3DNow "op1" 2r10000 "op2" 2r1010000 "R" 0 "C1" 16r00000F0F "C2" 16r00000096 )
(#pfrcpit1 #mmuRm3DNow "op1" 2r10000 "op2" 2r1010000 "R" 0 "C1" 16r00000F0F "C2" 16r000000A6 )
(#pfrcpit2 #mmuRm3DNow "op1" 2r10000 "op2" 2r1010000 "R" 0 "C1" 16r00000F0F "C2" 16r000000B6 )
(#pfrsqit1 #mmuRm3DNow "op1" 2r10000 "op2" 2r1010000 "R" 0 "C1" 16r00000F0F "C2" 16r000000A7 )
(#pfrsqrt #mmuRm3DNow "op1" 2r10000 "op2" 2r1010000 "R" 0 "C1" 16r00000F0F "C2" 16r00000097 )
(#pfsub #mmuRm3DNow "op1" 2r10000 "op2" 2r1010000 "R" 0 "C1" 16r00000F0F "C2" 16r0000009A )
(#pfsubr #mmuRm3DNow "op1" 2r10000 "op2" 2r1010000 "R" 0 "C1" 16r00000F0F "C2" 16r000000AA )
(#phaddd #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r000F3802 0 )
(#phaddsw #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r000F3803 0 )
(#phaddw #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r000F3801 0 )
(#phminposuw #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r660F3841 0 )
(#phsubd #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r000F3806 0 )
(#phsubsw #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r000F3807 0 )
(#phsubw #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r000F3805 0 )
(#pi2fd #mmuRm3DNow "op1" 2r10000 "op2" 2r1010000 "R" 0 "C1" 16r00000F0F "C2" 16r0000000D )
(#pi2fw #mmuRm3DNow "op1" 2r10000 "op2" 2r1010000 "R" 0 "C1" 16r00000F0F "C2" 16r0000000C )
(#pinsrb #mmuRmImm8 "op1" 2r100000 "op2" 2r1000100 "R" 0 "C1" 16r660F3A20 0 )
(#pinsrd #mmuRmImm8 "op1" 2r100000 "op2" 2r1000100 "R" 0 "C1" 16r660F3A22 0 )
(#pinsrq #mmuRmImm8 "op1" 2r100000 "op2" 2r1001000 "R" 0 "C1" 16r660F3A22 0 )
(#pinsrw #mmuRmImm8 "op1" 2r110000 "op2" 2r1000100 "R" 0 "C1" 16r00000FC4 0 )
(#pmaddubsw #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r000F3804 0 )
(#pmaddwd #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000FF5 0 )
(#pmaxsb #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r660F383C 0 )
(#pmaxsd #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r660F383D 0 )
(#pmaxsw #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000FEE 0 )
(#pmaxub #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000FDE 0 )
(#pmaxud #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r660F383F 0 )
(#pmaxuw #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r660F383E 0 )
(#pminsb #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r660F3838 0 )
(#pminsd #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r660F3839 0 )
(#pminsw #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000FEA 0 )
(#pminub #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000FDA 0 )
(#pminud #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r660F383B 0 )
(#pminuw #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r660F383A 0 )
(#pmovmskb #mmurmi "op1" 2r1100 "op2" 2r110000 "R" 0 "C1" 16r00000FD7 0 )
(#pmovsxbd #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r660F3821 0 )
(#pmovsxbq #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r660F3822 0 )
(#pmovsxbw #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r660F3820 0 )
(#pmovsxdq #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r660F3825 0 )
(#pmovsxwd #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r660F3823 0 )
(#pmovsxwq #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r660F3824 0 )
(#pmovzxbd #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r660F3831 0 )
(#pmovzxbq #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r660F3832 0 )
(#pmovzxbw #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r660F3830 0 )
(#pmovzxdq #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r660F3835 0 )
(#pmovzxwd #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r660F3833 0 )
(#pmovzxwq #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r660F3834 0 )
(#pmuldq #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r660F3828 0 )
(#pmulhrsw #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r000F380B 0 )
(#pmulhuw #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000FE4 0 )
(#pmulhw #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000FE5 0 )
(#pmulld #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r660F3840 0 )
(#pmullw #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000FD5 0 )
(#pmuludq #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000FF4 0 )
(#pop #pop 0 0 "R" 0 "C1" 16r00000058 "C2" 16r0000008F )
(#popad #emit #x86 0 "R" 0 "C1" 16r00000061 0 )
(#popcnt #rrm 0 0 "R" 0 "C1" 16rF3000FB8 0 )
(#popfd #emit 0 0 "R" 0 "C1" 16r0000009D 0 )
(#popfq #emit 0 0 "R" 0 "C1" 16r4800009D 0 )
(#por #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000FEB 0 )
(#prefetch #mmuPrefetch "op1" 2r1000000 "op2" 2r10000000 "R" 0 0 0 )
(#psadbw #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000FF6 0 )
(#pshufb #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r000F3800 0 )
(#pshufd #mmuRmImm8 "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r66000F70 0 )
(#pshufhw #mmuRmImm8 "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16rF3000F70 0 )
(#pshuflw #mmuRmImm8 "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16rF2000F70 0 )
(#pshufw #mmuRmImm8 "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000F70 0 )
(#psignb #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r000F3808 0 )
(#psignd #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r000F380A 0 )
(#psignw #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r000F3809 0 )
(#pslld #mmurmi "op1" 2r110000 "op2" 2r11110000 "R" 6 "C1" 16r00000FF2 "C2" 16r00000F72 )
(#pslldq #mmurmi "op1" 2r100000 "op2" 2r10000000 "R" 7 0 "C2" 16r66000F73 )
(#psllq #mmurmi "op1" 2r110000 "op2" 2r11110000 "R" 6 "C1" 16r00000FF3 "C2" 16r00000F73 )
(#psllw #mmurmi "op1" 2r110000 "op2" 2r11110000 "R" 6 "C1" 16r00000FF1 "C2" 16r00000F71 )
(#psrad #mmurmi "op1" 2r110000 "op2" 2r11110000 "R" 4 "C1" 16r00000FE2 "C2" 16r00000F72 )
(#psraw #mmurmi "op1" 2r110000 "op2" 2r11110000 "R" 4 "C1" 16r00000FE1 "C2" 16r00000F71 )
(#psrld #mmurmi "op1" 2r110000 "op2" 2r11110000 "R" 2 "C1" 16r00000FD2 "C2" 16r00000F72 )
(#psrldq #mmurmi "op1" 2r100000 "op2" 2r10000000 "R" 3 0 "C2" 16r66000F73 )
(#psrlq #mmurmi "op1" 2r110000 "op2" 2r11110000 "R" 2 "C1" 16r00000FD3 "C2" 16r00000F73 )
(#psrlw #mmurmi "op1" 2r110000 "op2" 2r11110000 "R" 2 "C1" 16r00000FD1 "C2" 16r00000F71 )
(#psubb #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000FF8 0 )
(#psubd #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000FFA 0 )
(#psubq #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000FFB 0 )
(#psubsb #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000FE8 0 )
(#psubsw #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000FE9 0 )
(#psubusb #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000FD8 0 )
(#psubusw #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000FD9 0 )
(#psubw #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000FF9 0 )
(#pswapd #mmuRm3DNow "op1" 2r10000 "op2" 2r1010000 "R" 0 "C1" 16r00000F0F "C2" 16r000000BB )
(#ptest #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r660F3817 0 )
(#punpckhbw #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000F68 0 )
(#punpckhdq #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000F6A 0 )
(#punpckhqdq #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r66000F6D 0 )
(#punpckhwd #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000F69 0 )
(#punpcklbw #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000F60 0 )
(#punpckldq #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000F62 0 )
(#punpcklqdq #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r66000F6C 0 )
(#punpcklwd #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000F61 0 )
(#push #push 0 0 "R" 6 "C1" 16r00000050 "C2" 16r000000FF )
(#pushad #emit #x86 0 "R" 0 "C1" 16r00000060 0 )
(#pushf #emit 0 0 "R" 0 "C1" 16r6600009C 0 )
(#pushfd #emit #x86 0 "R" 0 "C1" 16r0000009C 0 )
(#pushfq #emit #x64 0 "R" 0 "C1" 16r0000009C 0 )
(#pxor #mmurmi "op1" 2r110000 "op2" 2r1110000 "R" 0 "C1" 16r00000FEF 0 )
(#rcl #rot 0 0 "R" 2 0 0 )
(#rcpps #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r00000F53 0 )
(#rcpss #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16rF3000F53 0 )
(#rcr #rot 0 0 "R" 3 0 0 )
(#rdtsc #emit 0 0 "R" 0 "C1" 16r00000F31 0 )
(#rdtscp #emit 0 0 "R" 0 "C1" 16r000F01F9 0 )
(#ret #ret 0 0 "R" 0 0 0 )
(#rol #rot 0 0 "R" 0 0 0 )
(#ror #rot 0 0 "R" 1 0 0 )
(#roundpd #mmuRmImm8 "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r660F3A09 0 )
(#roundps #mmuRmImm8 "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r660F3A08 0 )
(#roundsd #mmuRmImm8 "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r660F3A0B 0 )
(#roundss #mmuRmImm8 "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r660F3A0A 0 )
(#rsqrtps #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r00000F52 0 )
(#rsqrtss #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16rF3000F52 0 )
(#sahf #emit 0 0 "R" 0 "C1" 16r0000009E 0 )
(#sal #rot 0 0 "R" 4 0 0 )
(#sar #rot 0 0 "R" 7 0 0 )
(#sbb #alu 0 0 "R" 3 "C1" 16r00000018 "C2" 16r00000080 )
(#sfence #emit 0 0 "R" 0 "C1" 16r000FAEF8 0 )
(#shl #rot 0 0 "R" 4 0 0 )
(#shld #shldShrd 0 0 "R" 0 "C1" 16r00000FA4 0 )
(#shr #rot 0 0 "R" 5 0 0 )
(#shrd #shldShrd 0 0 "R" 0 "C1" 16r00000FAC 0 )
(#shufps #mmuRmImm8 "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r00000FC6 0 )
(#sqrtpd #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r66000F51 0 )
(#sqrtps #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r00000F51 0 )
(#sqrtsd #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16rF2000F51 0 )
(#sqrtss #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16rF3000F51 0 )
(#stc #emit 0 0 "R" 0 "C1" 16r000000F9 0 )
(#std #emit 0 0 "R" 0 "C1" 16r000000FD 0 )
(#stmxcsr #mem "op1" 2r1000000 0 "R" 3 "C1" 16r00000FAE 0 )
(#sub #alu 0 0 "R" 5 "C1" 16r00000028 "C2" 16r00000080 )
(#subpd #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r66000F5C 0 )
(#subps #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r00000F5C 0 )
(#subsd #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16rF2000F5C 0 )
(#subss #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16rF3000F5C 0 )
(#syscall #emit "op1" 2r100000000 0 "R" 0 "C1" 16r00000F05 0 )
(#test #test 0 0 "R" 0 0 0 )
(#ucomisd #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r66000F2E 0 )
(#ucomiss #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r00000F2E 0 )
(#ud2 #emit 0 0 "R" 0 "C1" 16r00000F0B 0 )
(#unpckhpd #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r66000F15 0 )
(#unpckhps #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r00000F15 0 )
(#unpcklpd #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r66000F14 0 )
(#unpcklps #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r00000F14 0 )
(#xadd #rmr 0 0 "R" 0 "C1" 16r00000FC0 0 )
(#xchg #xchg 0 0 "R" 0 0 0 )
(#xor #alu 0 0 "R" 6 "C1" 16r00000030 "C2" 16r00000080 )
(#xorpd #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r66000F57 0 )
(#xorps #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r00000F57 0 )

)

]

{ #category : #accessing }
AJx86InstructionDescription class >> instructions [
	^ instructions ifNil: [ self initInstructions ]
]

{ #category : #initialization }
AJx86InstructionDescription class >> instructionsCDQ [

"CBW/CWDE/CDQE Convert Byte to Word/Convert Word to
Doubleword/Convert Doubleword to Quadword"
^#(

(#cbw #emit 0 0 "R" 0 "C1" 16r66000098 0 )
(#cwde #emit 0 0 "R" 0 "C1" 16r00000098 0 )
(#cdqe #emit #x64 0 "R" 0 "C1" 16r48000098 0 )

"CWD/CDQ/CQO Convert Word to Doubleword/Convert Doubleword to
Quadword"

(#cwd #emit 0 0 "R" 0 "C1" 16r66000099 0 )
(#cdq #emit 0 0 "R" 0 "C1" 16r00000099 0 )
(#cqo #emit #x64 0 "R" 0 "C1" 16r48000099 0 )

)
]

{ #category : #initialization }
AJx86InstructionDescription class >> instructionsOther [

^ #(

(#femms #emit 0 0 "R" 0 "C1" 16r00000F0E 0 )  " looks like invalid one "

(#movsb #emit 0 0 "R" 0 "C1" 16r000000A4 0 )
(#movsd #emit 0 0 "R" 0 "C1" 16r000000A5 0 )   "in 64bit mode - moves 64bits"
(#rep #emit 0 0 "R" 0 "C1" 16r000000F3 0 )   "repeat prefix"
(#repe #emit 0 0 "R" 0 "C1" 16r000000F3 0 )   "repeat prefix"
(#repz #emit 0 0 "R" 0 "C1" 16r000000F3 0 )   "repeat prefix"
(#repne #emit 0 0 "R" 0 "C1" 16r000000F2 0 )   "repeat prefix"
(#repnz #emit 0 0 "R" 0 "C1" 16r000000F2 0 )   "repeat prefix"


(#cmpsb #emit 0 0 "R" 0 "C1" 16r000000A6 0 )
"(#cmpsw #emit 0 0 0  16r000000A7 0 )  "
(#cmpsd #emit 0 0 "R" 0 "C1" 16r000000A7 0 )

)
]

{ #category : #printing }
AJx86InstructionDescription class >> printInstructions [
	" AJInstructionDescription printInstructions.

	AJInstructionDescription printInstructions openInWorkspaceWithTitle: 'x86 instructions'
	 "
	^ String streamContents: [:str | self printInstructionsOn: str ]


]

{ #category : #printing }
AJx86InstructionDescription class >> printInstructionsOn: aStream [
	" AJInstructionDescription printInstructionsOn: (FileStream newFileNamed: 'asm.st'). "

	aStream nextPutAll: '#(' ; cr.

	self instructions keys asSortedCollection do: [:aname |
		| instr |

		instr := instructions at: aname.

		instr printOn: aStream.
		aStream cr.
	].
	aStream cr;
		nextPut: $); cr

]

{ #category : #accessing }
AJx86InstructionDescription >> comment [
	^ comment
]

{ #category : #accessing }
AJx86InstructionDescription >> comment: aString [
	comment := aString
]

{ #category : #accessing }
AJx86InstructionDescription >> description [
	^ description
]

{ #category : #accessing }
AJx86InstructionDescription >> description: aString [
	description := aString
]

{ #category : #'emitting-dispatch' }
AJx86InstructionDescription >> emitUsing: emitter operand1: op1 operand2: op2 operand3: op3 [

	(self is64BitOnly and: [ emitter is64BitMode not ]) ifTrue: [
		self error: 'instruction is only for 64 bit mode' ].

	(self is32BitOnly and: [ emitter is32BitMode not ]) ifTrue: [
		self error: 'instruction is only for 32 bit mode' ].


	^ self perform: groupEmitSelector withArguments: 	{ emitter. op1. op2. op3 }
]

{ #category : #'emitting-dispatch' }
AJx86InstructionDescription >> emitUsing: emitter operands: operands [
	|args|

	(self is64BitOnly and: [ emitter is64BitMode not ]) ifTrue: [
		self error: 'instruction ', self name asUppercase,' is only for 64 bit mode' ].

	(self is32BitOnly and: [ emitter is32BitMode not ]) ifTrue: [
		self error: 'instruction ', self name asUppercase,' is only for 32 bit mode' ].

	"manually create the arguments array"
	args := Array new: 4.
	args at: 1 put: emitter.
	args replaceFrom: 2
		to: (operands size + 1 min: 4)
		with: operands
		startingAt: 1.

	^ self
		perform: groupEmitSelector
		withArguments: args
]

{ #category : #emitting }
AJx86InstructionDescription >> emitalu: emitter operand1: op1 operand2: op2 operand3: op3 [
	| opCode opCodeRegister |
	opCode := opCode1.
	opCodeRegister := opCodeR.

	" Mem <- Reg "
	(op1 isMemory and: [ op2 isRegister ]) ifTrue: [
		^ emitter emitX86RM: opCode + op2 isRegisterGeneralPurposeByte not asBit
			size: op2 size
			registerOrCode: op2
			rm: op1
	].

	"Reg <- Reg|Mem"
	(op1 isRegister and: [op2 isRegisterOrMemory]) ifTrue: [
		^ emitter emitX86RM: opCode + 2 + op1 isRegisterGeneralPurposeByte not asBit
			size: op1 size
			registerOrCode: op1
			rm: op2
	].

	op2 isImmediate ifFalse: [	self invalidInstruction ].

	"short constant"
	op2 isInt8 ifTrue: [
		| szBits |
		szBits := op1 size = 1 ifTrue: [ 0 ] ifFalse: [ 3 ].
		emitter emitX86RM: opCode2 + szBits
			size: op1 size
			registerOrCode: opCodeRegister
			rm: op1
			immediateSize: 1.
		^ emitter emitImmediate: op2 size: 1.
	].

      " AL, AX, EAX, RAX register shortcuts"
	(op1 isRegIndex: 0) ifTrue: [

		op1 isRegisterGeneralPurposeWord ifTrue: [ emitter emit16BitPrefix " 16 bit " ].
		op1 isRegisterGeneralPurposeQuadword ifTrue: [ emitter emitByte: 16r48 " REX.W" ].

		emitter emitByte: (opCodeRegister << 3 bitOr: (16r04 + op1 isRegisterGeneralPurposeByte not asBit)).
		^ emitter emitImmediate: op2 size: (op1 size min: 4)
	].

	(op1 isRegisterOrMemory) ifTrue: [ | immSize szBits |
		immSize := op2 isInt8 ifTrue: [1] ifFalse: [ op1 size min: 4].
		szBits := op1 size ~= 1 ifTrue: [ immSize ~= 1 ifTrue: [1] ifFalse: [3]] ifFalse: [ 0].
		emitter emitX86RM: opCode2 + szBits
			size: op1 size
			registerOrCode: opCodeRegister
			rm: op1
			immediateSize: immSize.
		^ emitter emitImmediate: op2 size: immSize.
	].

	self invalidInstruction.

]

{ #category : #emitting }
AJx86InstructionDescription >> emitbswap: emitter operand1: op1 operand2: op2 operand3: op3 [

	op1 isRegister ifTrue: [

		emitter emitRexR: op1 isRegisterGeneralPurposeQuadword opReg: 1 registerCode: op1 code.
		emitter emitByte: 16r0F.
		^ emitter emitModR: 1 r: op1 code
	].
	self invalidInstruction.
]

{ #category : #emitting }
AJx86InstructionDescription >> emitbt: emitter operand1: dst operand2: src operand3: op3 [

	dst isRegisterOrMemory
		ifFalse: [ self error: 'Expected register or memory but got ', dst asString ].

	(dst isRegister and: [ dst is8 ])
		ifTrue: [ self error: '8 bit register ', dst asString, ' not supported for bit test operations'].

	src isRegister ifTrue: [
		^ emitter emitX86RM: opCode1
			size: src size
			registerOrCode: src
			rm: dst
	].

	src isImmediate ifTrue: [
		src isInt8
			ifFalse: [ self error: 'Expected imm8 but got ', src size asString, ' immediate.' ].
		emitter emitX86RM: opCode2
			size: dst size
			registerOrCode: opCodeR
			rm: dst
			immediateSize: 1.
		^ emitter emitImmediate: src size: 1
	].

	self invalidInstruction

]

{ #category : #emitting }
AJx86InstructionDescription >> emitcall: emitter operand1: op1 operand2: op2 operand3: op3 [

	(op1 isMemory or: [ op1 isRegister and: [ op1 index = 0 "EAX" ] ]) ifTrue: [
		^ emitter emitX86RM:  16rFF
			size: 4
			registerOrCode: 2
			rm: op1
	].













	op1 isImmediate ifTrue: [ "call by relative offset, you should be really sure what you're' doing"
		emitter emitByte: 16rE8.
		op1 emitUsing: emitter size: 4.
		^ self.
		].

	op1 isLabel ifTrue: [
		emitter emitByte: 16rE8.
		emitter emitDisplacement: op1 inlinedDisp: -4.
		^ self
	].
	self invalidInstruction.

]

{ #category : #emitting }
AJx86InstructionDescription >> emitcjmp: emitter operand1: target operand2: hint operand3: op3 [
	"Conditional jump.
	Use only symbols as labels"


	target isString ifTrue: [
		"jump on label"
		^ emitter addJump: target condition: opCode1 hint: hint
	].

	"we could check if label is bound , and emit short jump,
	instead of 32-bit relative jump address"
	self invalidInstruction.
	emitter emitByte: 16r0F;
		emitByte: (16r80 bitOr: opCode1);
		emitDisplacement: target inlinedDisp: -4

]

{ #category : #emitting }
AJx86InstructionDescription >> emitcrc32: emitter operand1: dst operand2: src operand3: op3 [

	(dst isRegister and: [ src isRegisterOrMemory ]) ifTrue: [
		self assert: (dst isRegisterGeneralPurposeDoubleword | dst isRegisterGeneralPurposeQuadword).

		^ emitter emitX86RM: opCode1 + (src size ~= 1) asBit
			size: src size
			registerOrCode: dst
			rm: src
		].

	self invalidInstruction.

]

{ #category : #emitting }
AJx86InstructionDescription >> emitemit: emitter operand1: op1 operand2: op2 operand3: op3 [

	^ emitter emitOpCode: opCode1
]

{ #category : #emitting }
AJx86InstructionDescription >> emitenter: emitter operand1: op1 operand2: op2 operand3: op3 [

	(op1 isImmediate and: [ op2 isImmediate ]) ifFalse: [ self invalidInstruction ].

	emitter emitByte: 16rC8.
	emitter emitImmediate: op1 size: 2.
	emitter emitImmediate: op2 size: 1.

]

{ #category : #emitting }
AJx86InstructionDescription >> emitimul: emitter operand1: op1 operand2: op2 operand3: op3 [
	| immSize |

	op1 isRegisterOrMemory ifFalse: [  ^ self invalidInstruction ].

	" 1 operand "
	(op2 isNil and: [ op3 isNil ]) ifTrue: [
		^ emitter emitX86RM:  16rF6 + (op1 size ~= 1) asBit
			size: op1 size
			registerOrCode:  5
			rm:  op1
		].
	op1 isRegister ifFalse: [  ^ self invalidInstruction ].

	"2 operands"
	op3 isNil ifTrue: [
"		self assert: op1 isRegTypeGPW."

		op2 isRegisterOrMemory ifTrue: [
			^ emitter emitX86RM: 16r0FAF
				size: op1 size
				registerOrCode: op1 code
				rm:  op2
			].
		op2 isImmediate ifFalse: [ ^ self invalidInstruction ].

		(op2 isInt8 and: [ op2 isNoRelocation ]) ifTrue: [
			emitter emitX86RM: 16r6B
				size: op1 size
				registerOrCode:  op1 code
				rm:  op1
				immediateSize: 1.
			^ emitter emitImmediate: op2 size: 1.
			].

		immSize := op1 isRegisterGeneralPurposeWord ifTrue: [ 2 ] ifFalse: [ 4 ].
		emitter emitX86RM: 16r69
			size: op1 size
			registerOrCode:  op1 code
			rm:  op1
			immediateSize: immSize.
		^ emitter emitImmediate: op2 size: immSize.
	].

	" 3 operands "
	(op2 isRegisterOrMemory and: [op3 isImmediate ]) ifFalse: [ ^ self invalidInstruction ].

	(op3 isInt8 and: [ op3 isNoRelocation ]) ifTrue: [
		emitter emitX86RM: 16r6B
			size: op1 size
			registerOrCode:  op1
			rm: op2 immediateSize: 1.
		^ emitter emitImmediate: op3 size: 1.
		].

	immSize := op1 isRegisterGeneralPurposeWord ifTrue: [2] ifFalse: [4].
	emitter emitX86RM: 16r69
		size: op1 size
		registerOrCode:  op1
		rm:  op2 immediateSize: immSize.
	emitter emitImmediate: op3 size: immSize.

]

{ #category : #emitting }
AJx86InstructionDescription >> emitincdec: emitter operand1: dst operand2: op2 operand3: op3 [

	dst isRegisterOrMemory ifFalse: [ ^ self invalidInstruction ].

	"INC [r16|r32] in 64 bit mode is not encodable."
	emitter is32BitMode ifTrue: [
		(dst isRegister & dst isRegisterGeneralPurposeWord & dst isRegisterGeneralPurposeDoubleword) ifTrue: [
		^ emitter emitX86Inline: opCode1	reg: dst
	]].

	emitter emitX86RM:  opCode2 + (dst size ~= 1) asBit
		size: dst size
		registerOrCode:  opCodeR
		rm:  dst

]

{ #category : #emitting }
AJx86InstructionDescription >> emitjmp: emitter operand1: target operand2: op2 operand3: op3 [

	target isString ifTrue: [
		"jump on label"
		^ emitter addJump: target condition: nil hint: nil
	].

	target isRegisterOrMemory ifTrue: [
		^ emitter emitX86RM: 16rFF
			size: 0
			registerOrCode:  4
			rm:  target
	].

	emitter emitByte: 16rE9.
	emitter emitDisplacement: target inlinedDisp: -4

]

{ #category : #emitting }
AJx86InstructionDescription >> emitlea: emitter operand1: op1 operand2: op2 operand3: op3 [

	(op1 isRegister and: [ op2 isMemory ])
		ifFalse: [ self error: 'LEA: Expected Reg and Mem but got ', op1 asString, ' and ', op2 asString ].

	emitter emitX86RM: 16r8D
		size: op1 size
		registerOrCode: op1
		rm: op2
]

{ #category : #emitting }
AJx86InstructionDescription >> emitmem: emitter operand1: op1 operand2: op2 operand3: op3 [

	op1 isMemory ifFalse: [ self invalidInstruction ].

	self assert: (opCode2 = 0 or: [ opCode2 = 1 ]).
	emitter emitX86RM: opCode1
		size: opCode2 << 3
		registerOrCode: opCodeR
		rm: op1

]

{ #category : #emitting }
AJx86InstructionDescription >> emitmmuMov: emitter operand1: op1 operand2: op2 operand3: op3 [
	self flag: 'TODO'.
	self shouldBeImplemented.

	self assert: o1Flags ~= 0.
	self assert: o2Flags ~= 0.

      "Check parameters (X)MM|GP32_64 <- (X)MM|GP32_64|Mem|Imm"
	(op1 isMemory & ((o1Flags bitAnd: OMEM) = 0)) |
	(op1 isRegisterMM & ((o1Flags bitAnd: OMM) = 0)) |
	(op1 isRegisterXMM & ((o1Flags bitAnd: OXMM) = 0)) |
	(op1 isRegisterGeneralPurposeDoubleword & ((o1Flags bitAnd: OG32) = 0)) |
	(op1 isRegisterGeneralPurposeQuadword & ((o1Flags bitAnd: OG64) = 0)) |
	(op2 isRegisterMM & ((o2Flags bitAnd: OMM) = 0)) |
	(op2 isRegisterXMM & ((o2Flags bitAnd: OXMM) = 0)) |
	(op2 isRegisterGeneralPurposeDoubleword & ((o2Flags bitAnd: OG32) = 0)) |
	(op2 isRegisterGeneralPurposeQuadword & ((o2Flags bitAnd: OG64) = 0)) |
	(op2 isMemory & ((o2Flags bitAnd: OMEM) = 0)) |
	(op1 isMemory & op2 isMemory)
		ifTrue: [ self invalidInstruction ].



]

{ #category : #emitting }
AJx86InstructionDescription >> emitmmuMovD: emitter operand1: op1 operand2: op2 operand3: op3 [
	self flag: 'TODO'.
	self shouldBeImplemented
]

{ #category : #emitting }
AJx86InstructionDescription >> emitmmuMovQ: emitter operand1: op1 operand2: op2 operand3: op3 [
	self flag: 'TODO'.
	self shouldBeImplemented
]

{ #category : #emitting }
AJx86InstructionDescription >> emitmmuPextr: emitter operand1: op1 operand2: op2 operand3: op3 [
	self flag: 'TODO'.
	self shouldBeImplemented
]

{ #category : #emitting }
AJx86InstructionDescription >> emitmmuPrefetch: emitter operand1: op1 operand2: op2 operand3: op3 [
	self flag: 'TODO'.
	self shouldBeImplemented
]

{ #category : #emitting }
AJx86InstructionDescription >> emitmmuRm3DNow: emitter operand1: op1 operand2: op2 operand3: op3 [
	self flag: 'TODO'.
	self shouldBeImplemented
]

{ #category : #emitting }
AJx86InstructionDescription >> emitmmuRmImm8: emitter operand1: op1 operand2: op2 operand3: op3 [
	self flag: 'TODO'.
	self shouldBeImplemented
]

{ #category : #emitting }
AJx86InstructionDescription >> emitmmurmi: emitter operand1: op1 operand2: op2 operand3: op3 [
	self flag: 'TODO'.
	self shouldBeImplemented
]

{ #category : #emitting }
AJx86InstructionDescription >> emitmov: emitter operand1: dst operand2: src operand3: op3 [

	src isRegister & dst isRegister ifTrue: [
		self assert: (src isRegisterGeneralPurposeByte | src isRegisterGeneralPurposeWord | src isRegisterGeneralPurposeDoubleword | src isRegisterGeneralPurposeQuadword ).
		].

	" reg <- mem "
	dst isRegister & src isRegisterOrMemory ifTrue: [
		self assert: (dst isRegisterGeneralPurposeByte | dst isRegisterGeneralPurposeWord | dst isRegisterGeneralPurposeDoubleword | dst isRegisterGeneralPurposeQuadword ).
		^ emitter emitX86RM: 16r0000008A + dst isRegisterGeneralPurposeByte not asBit
			size:  dst size
			registerOrCode:  dst
			rm: src
		].

	" reg <- imm "
	dst isRegister & src isImmediate ifTrue: [
		| immSize |
		immSize := dst size.
		emitter is64BitMode & immSize = 8 & src isInt32 & src isNoRelocation ifTrue: [
			"Optimize instruction size by using 32 bit immediate if value can fit to it"
			 emitter emitX86RM: 16rC7
				size: dst size
				registerOrCode: 0 rm: dst.
	        immSize := 4
		] ifFalse: [
			emitter emitX86Inline: (immSize=1 ifTrue: [16rB0] ifFalse: [16rB8]) reg: dst
		].
		^ emitter emitImmediate: src size: immSize
	].

	"mem <- reg"
	dst isMemory & src isRegister ifTrue: [
		self assert: (src isRegisterGeneralPurposeByte | src isRegisterGeneralPurposeWord | src isRegisterGeneralPurposeDoubleword | src isRegisterGeneralPurposeQuadword ).
		^ emitter emitX86RM: 16r88 + src isRegisterGeneralPurposeByte not asBit
			size: src size registerOrCode: src rm: dst
	].

	"mem <- imm"
	dst isMemory & src isImmediate ifTrue: [ | immSize |

		immSize := dst size <= 4 ifTrue: [ dst size ] ifFalse: [4].

		emitter emitX86RM: 16rC6 + ((dst size = 1) not) asBit
			size: dst size
			registerOrCode:  0 rm:  dst
			immediateSize: immSize.

		^ emitter emitImmediate: src size: immSize
	].

	self invalidInstruction

]

{ #category : #emitting }
AJx86InstructionDescription >> emitmovSxZx: emitter operand1: dst operand2: src operand3: op3 [

	dst isRegister & src isRegisterOrMemory ifFalse: [ self invalidInstruction ].

	dst isRegisterGeneralPurposeByte ifTrue: [ self invalidInstruction ].

	(src size ~= 2 and: [src size ~= 1 ]) ifTrue: [ self invalidInstruction ].
	(src size = 2 and: [dst isRegisterGeneralPurposeWord ]) ifTrue: [ self invalidInstruction ].

	src size = 2 ifTrue: [
		^ emitter emitX86RM: opCode1 + 1 size: dst size registerOrCode: dst rm: src
		].

	emitter emitX86RM: opCode1 size: dst size registerOrCode: dst rm: src

]

{ #category : #emitting }
AJx86InstructionDescription >> emitmovbe: anAJx86Assembler operand1: anUndefinedObject operand2: anUndefinedObject3 operand3: anUndefinedObject4 [
	self flag: 'TODO'.
	self shouldBeImplemented
]

{ #category : #emitting }
AJx86InstructionDescription >> emitmovsxd: emitter operand1: dst operand2: src operand3: op3 [

	emitter is64BitMode ifFalse: [ self invalidInstruction ].
	dst isRegister & src isRegisterOrMemory ifFalse: [ self invalidInstruction ].

	emitter emitX86RM: 16r63
		size: dst size
		registerOrCode: dst  rm: src
]

{ #category : #emitting }
AJx86InstructionDescription >> emitpop: emitter operand1: op1 operand2: op2 operand3: op3 [

	op1 isRegister ifTrue: [
		(op1 isRegisterGeneralPurposeWord | (emitter isRegisterGeneralPurposeNative: op1))
			ifFalse: [ self error: 'Invalid register given: ', op1 asString].
		^ emitter emitX86Inline: opCode1 reg: op1.
		].

	op1 isMemory ifFalse: [ self invalidInstruction ].
	emitter emitX86RM: opCode2 size: op1 size registerOrCode: opCodeR rm: op1

]

{ #category : #emitting }
AJx86InstructionDescription >> emitpush: emitter operand1: op1 operand2: op2 operand3: op3 [

	"This section is only for immediates, memory/register operands are handled in emitpop:..."
	op1 isImmediate ifTrue: [
		op1 isInt8 & op1 isNoRelocation ifTrue: [
			emitter emitByte: 16r6A.
			^ emitter emitImmediate: op1 size: 1 ].

		emitter emitByte: 16r68.
		^ emitter emitImmediate: op1 size: 4
		].

	^ self emitpop: emitter operand1: op1 operand2: op2 operand3: op3

]

{ #category : #emitting }
AJx86InstructionDescription >> emitret: emitter operand1: op1 operand2: op2 operand3: op3 [

	op1 ifNil: [ ^ emitter emitByte: 16rC3 ].

	op1 isImmediate ifFalse: [ self invalidInstruction ].

	self assert: (op1 isUnsigned and: [op1 fitsInSize: 2]).

	(op1 value = 0 and: [ op1 isNoRelocation ]) ifTrue: [
		^ emitter emitByte: 16rC3	].

	emitter emitByte: 16rC2.
	emitter emitImmediate: op1 size: 2
]

{ #category : #emitting }
AJx86InstructionDescription >> emitrm: emitter operand1: dst operand2: src operand3: op3 [

	emitter emitX86RM: opCode1 + (dst isRegisterGeneralPurposeByte not) asBit
		size: dst size
		registerOrCode: opCodeR rm: dst
]

{ #category : #emitting }
AJx86InstructionDescription >> emitrmr: emitter operand1: dst operand2: src operand3: op3 [

	dst isRegisterOrMemory & src isRegister ifFalse: [ self invalidInstruction ].

	emitter emitX86RM: opCode1 + (src isRegisterGeneralPurposeByte not) asBit
		size: src size
		registerOrCode: src rm: dst
]

{ #category : #emitting }
AJx86InstructionDescription >> emitrot: emitter operand1: op1 operand2: op2 operand3: op3 [
	| useImm8 opCode |
	op1 isRegisterOrMemory & ((op2 isRegisterGeneralPurposeByte and: [ op2 index =  1 "cl" ]) | op2 isImmediate) ifFalse: [ self invalidInstruction ].

	useImm8 := op2 isImmediate and: [ (op2 value ~= 1) | op2 isRelocation ].
	opCode := useImm8 ifTrue: [ 16rC0 ] ifFalse: [ 16rD0 ].

	op1 size ~= 1 ifTrue: [ opCode := opCode bitOr: 1 ].
	op2 isRegister ifTrue: [ opCode := opCode bitOr: 2 ].

	emitter emitX86RM: opCode
		size: op1 size
		registerOrCode: opCodeR
		rm: 	op1
		immediateSize: useImm8 asBit.

	useImm8 ifTrue: [
		emitter emitImmediate: op2 size: 1
		]

]

{ #category : #emitting }
AJx86InstructionDescription >> emitrrm: emitter operand1: dst operand2: src operand3: op3 [

	dst isRegister & src isRegisterOrMemory ifFalse: [ self invalidInstruction ].

	self assert: (dst isRegisterGeneralPurposeByte not).

	emitter
		emitX86RM: opCode1
		size: dst size
		registerOrCode: dst rm: src
]

{ #category : #emitting }
AJx86InstructionDescription >> emitshldShrd: emitter operand1: dst operand2: src1 operand3: src2 [

	(src2 isImmediate or: [ src2 isRegisterGeneralPurposeByte and: [ src2 index = 1 "cl"]]) ifFalse: [ self invalidInstruction ].

	dst isRegisterOrMemory & src1 isRegister ifFalse: [ self invalidInstruction ].
	self assert: (dst size = src1 size).

	emitter emitX86RM: opCode1 + src2 isRegister asBit
		size: src1 size
		registerOrCode: src1 rm: dst immediateSize: src2 isImmediate asBit.

	src2 isImmediate ifTrue: [
		emitter emitImmediate: src2 size: 1 ]
]

{ #category : #'code emitting' }
AJx86InstructionDescription >> emittest: emitter operand1: op1 operand2: op2 operand3: op3 [
	| immSize |

	op1 isRegisterOrMemory & op2 isRegister
		ifTrue: [
			op1 size notNil & (op1 size ~= op2 size)
				ifTrue: [
					self
						error:
							'Operands ' , op1 asString , ' and ' , op2 asString , ' don''t match in size: ' , op1 size asString , ' != '
								, op2 size asString ].
			^ emitter
				emitX86RM: 16r84 + op2 isRegisterGeneralPurposeByte not asBit
				size: op2 size
				registerOrCode: op2
				rm: op1 ].

	(op1 isRegister and: [ op1 index = 0 and: [ op2 isImmediate ] ])
		ifTrue: [
			immSize := op1 size min: 4.
			op1 is16
				ifTrue: [ emitter emit16BitPrefix ].
			emitter emitRexRM: op1 is64 registerCode: 0 rm: op1.
			emitter emitByte: 16rA8 + (op1 size ~= 1) asBit.
			^ emitter emitImmediate: op2 size: immSize ].

	(op1 isRegisterOrMemory and: [ op2 isImmediate ])
		ifFalse: [ self invalidInstruction ].

	immSize := op1 size min: 4.
	(op2 fitsInSize: immSize)
		ifFalse: [ self invalidInstruction ].

	emitter emitSegmentPrefix: op1.
	emitter emitOperandSizeOverridePrefix: op1.
	emitter emitByte: 16rF6 + (op1 size ~= 1) asBit.
	op1 emitModRM: emitter code: 0.
	emitter emitImmediate: op2 size: immSize
]

{ #category : #emitting }
AJx86InstructionDescription >> emitx87addp: emitter operand1: op1 operand2: op2 operand3: op3 [

	| opp |
	opp := op1 ifNil:  [ AJx87Register new code: 1 ].

	opp isRegisterX87 ifTrue: [
		emitter emitByte: (opCode1 bitAnd: 16rFF00)>>8.
		emitter emitByte: (opCode1 bitAnd: 16rFF)
			+ opp index.
		^ self
	].

	^self emitx87sti: emitter operand1: opp operand2: op2 operand3: op3

]

{ #category : #emitting }
AJx86InstructionDescription >> emitx87fpu: emitter operand1: op1 operand2: op2 operand3: op3 [
	"Either we are in memory, and carry out by using D8 / DC followed by modRM where reg indicates the operation"
	op1 isMemory
		ifTrue: [	(op2 notNil or: [op3]) notNil ifTrue: [self error: 'Invalid arguments!'].

		emitter emitByte: (opCode1 >> (32 - (op1 size* 2)) bitAnd: 16rFF).
		^ op1 emitModRM: emitter code: opCodeR].

	"Or both my arguments are X87 registers, one of which is ST0.
	Store in op1 register."
	(op1 isRegisterX87 and: [op2 isRegisterX87]) ifTrue: [|shift offset|
		op1 index = 0
			ifTrue: [shift := 24.
					offset := op2 index]
			ifFalse: [
			op2 index = 0
				ifTrue: [shift = 16.
					offset := op1 index]
				ifFalse: [self error: 'ST0 must be one of arguments']].

		"D8 if Storing in ST0, DC if storing in other"
		emitter emitByte: (opCode1 >> shift bitAnd: 16rFF).

		emitter emitByte: (opCode1 >> (shift - 16) bitAnd: 16rFF) + offset
		]
		ifFalse: [self error: 'Invalid arguments!']

]

{ #category : #emitting }
AJx86InstructionDescription >> emitx87fstsw: anAJx86Assembler operand1: anUndefinedObject operand2: anUndefinedObject3 operand3: anUndefinedObject4 [
	self flag: 'TODO'.
	self shouldBeImplemented
]

{ #category : #emitting }
AJx86InstructionDescription >> emitx87mem: emitter operand1: m operand2: op2 operand3: op3 [
	| opCode mod |
      m isMemory ifFalse: [ ^ self invalidInstruction ].

	opCode := mod := 0.

	(m is16 and: [ (o1Flags bitAnd: OFM2) ~= 0 ]) ifTrue: [
		opCode := (opCode1 bitAnd: 16rFF000000) >> 24.
		mod := opCodeR ].

	(m is32 and: [ (o1Flags bitAnd: OFM4) ~= 0 ]) ifTrue: [
		opCode := (opCode1 bitAnd: 16r00FF0000) >> 16.
		mod := opCodeR ].

	(m is64 and: [ (o1Flags bitAnd: OFM8) ~= 0 ]) ifTrue: [
		opCode := (opCode1 bitAnd: 16r0000FF00) >> 8.
		mod :=  (opCode1 bitAnd: 16r000000FF) ].

	opCode = 0 ifTrue: [ self invalidInstruction ].

	emitter emitSegmentPrefix: m;
		emitByte: opCode.
	m emitModRM: emitter code: mod.

]

{ #category : #emitting }
AJx86InstructionDescription >> emitx87memSti: emitter operand1: op1 operand2: op2 operand3: op3 [

	op1 isRegisterX87 ifTrue: [
		emitter emitByte: (opCode2 bitAnd: 16rFF000000)>>24.
		emitter emitByte: (opCode2 bitAnd: 16r00FF0000)>>16
			+ op1 index.
		^ self
	].

   " ... fall through to I_X87_MEM ... "
	^ self emitx87mem: emitter operand1: op1 operand2: op2 operand3: op3

]

{ #category : #emitting }
AJx86InstructionDescription >> emitx87sti: emitter operand1: op1 operand2: op2 operand3: op3 [
	(op1 isNil and: [ op2 isNil and: [ op3 isNil ]])
		ifTrue: [ "Convenience fallback for ST1 "
			^ self emitx87sti: emitter operand1: AJx86Registers ST1 operand2: nil operand3: nil ].

	op1 isRegisterX87 ifTrue: [
		emitter emitByte: (opCode1 bitAnd: 16rFF00)>>8.
		emitter emitByte: (opCode1 bitAnd: 16rFF) + op1 index.
		^ self
	].

	self invalidInstruction
]

{ #category : #emitting }
AJx86InstructionDescription >> emitxchg: emitter operand1: dst operand2: src operand3: op3 [

	dst isRegisterOrMemory & src isRegister ifFalse: [ self invalidInstruction ].

	emitter emitSizePrefix: src segment: dst.

	"Special opcode for index 0 registers (AX, EAX, RAX vs register)"
	dst isRegister & (dst size > 1) & (dst index =0 or: [ src index = 0 ] ) ifTrue: [
			| index |
			index := dst index + src index.
			^ emitter emitByte: 16r90 + index.
		].

	emitter emitByte: 16r86 + src isRegisterGeneralPurposeByte not asBit.
	dst emitModRM: emitter code: src code
]

{ #category : #'initialize-release' }
AJx86InstructionDescription >> fromArray: arr [
	| tmp |
	name := arr at: 1.
	group := arr at: 2.
	groupEmitSelector := ('emit', group,':operand1:operand2:operand3:') asSymbol.

	tmp := arr at: 3.
	tmp isSymbol ifTrue: [ tmp := self translateSymFlag: tmp ].
	o1Flags := tmp.
	o2Flags := arr at: 4.
	opCodeR := arr at: 5.
	opCode1 := arr at: 6.
	opCode2 := arr at: 7.
]

{ #category : #accessing }
AJx86InstructionDescription >> group [
	^ group
]

{ #category : #accessing }
AJx86InstructionDescription >> group: anObject [
	"Set the value of group"

	group := anObject
]

{ #category : #errors }
AJx86InstructionDescription >> invalidInstruction [
	self error: 'invalid instruction'
]

{ #category : #testing }
AJx86InstructionDescription >> is32BitOnly [
	^ (o1Flags bitAnd: 2r1000000000) ~= 0
]

{ #category : #testing }
AJx86InstructionDescription >> is64BitOnly [
	^ (o1Flags bitAnd: 2r100000000) ~= 0
]

{ #category : #testing }
AJx86InstructionDescription >> isCall [
	^ false
]

{ #category : #testing }
AJx86InstructionDescription >> isJump [

	^ group == #cjmp or: [ group == #jmp ]
]

{ #category : #accessing }
AJx86InstructionDescription >> name [
	^ name
]

{ #category : #accessing }
AJx86InstructionDescription >> name: anObject [
	"Set the value of name"

	name := anObject
]

{ #category : #accessing }
AJx86InstructionDescription >> o1Flags [
	"Answer the value of o1Flags"

	^ o1Flags
]

{ #category : #accessing }
AJx86InstructionDescription >> o1Flags: anObject [
	"Set the value of o1Flags"

	o1Flags := anObject
]

{ #category : #accessing }
AJx86InstructionDescription >> o2Flags [
	"Answer the value of o2Flags"

	^ o2Flags
]

{ #category : #accessing }
AJx86InstructionDescription >> o2Flags: anObject [
	"Set the value of o2Flags"

	o2Flags := anObject
]

{ #category : #accessing }
AJx86InstructionDescription >> opCode1 [
	"Answer the value of opCode1"

	^ opCode1
]

{ #category : #accessing }
AJx86InstructionDescription >> opCode1: anObject [
	"Set the value of opCode1"

	opCode1 := anObject
]

{ #category : #accessing }
AJx86InstructionDescription >> opCode2 [
	"Answer the value of opCode2"

	^ opCode2
]

{ #category : #accessing }
AJx86InstructionDescription >> opCode2: anObject [
	"Set the value of opCode2"

	opCode2 := anObject
]

{ #category : #accessing }
AJx86InstructionDescription >> opCodeR [
	"Answer the value of opCodeR"

	^ opCodeR
]

{ #category : #accessing }
AJx86InstructionDescription >> opCodeR: anObject [
	"Set the value of opCodeR"

	opCodeR := anObject
]

{ #category : #printing }
AJx86InstructionDescription >> printDWord: value [

	| str |
	str := value printStringBase: 16.

	[str size < 8] whileTrue: [ str:= '0',str ].

	^ '16r', str
]

{ #category : #printing }
AJx86InstructionDescription >> printOn: aStream [

	aStream nextPutAll: '(';
	nextPutAll: name printString;
	space;
	nextPutAll: group printString;
	space.

	"print o1Flags"
	o1Flags > 0 ifTrue: [ aStream nextPutAll: '"op1" 2r' , (o1Flags printStringBase: 2) ]
		ifFalse: [ aStream nextPutAll: '0'].
	aStream space.

	"print o2Flags"
	o2Flags > 0 ifTrue: [ aStream nextPutAll: '"op2" 2r' , (o2Flags printStringBase: 2) ]
		ifFalse: [ aStream nextPutAll: '0'].
	aStream space.

	"print opCodeR"
	aStream nextPutAll: '"R" '.
	opCodeR printOn: aStream.
	aStream space.

	"print opCode1"
	opCode1 > 0 ifTrue: [
		aStream nextPutAll: '"C1" '.
		aStream nextPutAll:  (self printDWord: opCode1 ) ]
		ifFalse: [ aStream nextPutAll: '0'].

	aStream space.

	"print opCode2"
	opCode2 > 0 ifTrue: [
		aStream nextPutAll: '"C2" '.
		aStream nextPutAll:  (self printDWord: opCode2 ) ]
		ifFalse: [ aStream nextPutAll: '0'].

	aStream space;
	nextPut: $)

]

{ #category : #'initialize-release' }
AJx86InstructionDescription >> translateSymFlag: aflag [

	" 64-bit mode only instruction "
	aflag == #x64 ifTrue: [ ^ 2r100000000 ].

	" 32-bit mode only instruction "
	aflag == #x86 ifTrue: [ ^ 2r1000000000 ].

	self error: 'unknown flag'.
]
