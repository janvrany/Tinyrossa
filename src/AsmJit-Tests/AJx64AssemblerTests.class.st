Class {
	#name : #AJx64AssemblerTests,
	#superclass : #AJx86AssemblerTests,
	#pools : [
		'AJx86Registers'
	],
	#category : #'AsmJit-Tests'
}

{ #category : #documentation }
AJx64AssemblerTests class >> copyright [
"
	Copyright (c) 2012-2016 Igor Stasenko
							Martin McClure
							Damien Pollet
							Camillo Bruni
							Guido Chari
				   2016-now Jan Vrany <jan.vrany [at] fit . cvut . cz>

	Permission is hereby granted, free of charge, to any person obtaining a copy
	of this software and associated documentation files (the 'Software'), to deal
	in the Software without restriction, including without limitation the rights
	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
	copies of the Software, and to permit persons to whom the Software is
	furnished to do so, subject to the following conditions:

	The above copyright notice and this permission notice shall be included in all
	copies or substantial portions of the Software.

	THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
	SOFTWARE.

"

]

{ #category : #'as yet unclassified' }
AJx64AssemblerTests class >> shouldInheritSelectors [
	^ true

]

{ #category : #utility }
AJx64AssemblerTests >> newAssembler [ 
	^ AJx64Assembler new
		noStackFrame;
		yourself

]

{ #category : #tests }
AJx64AssemblerTests >> testAssembly0 [
	self assert: [ :a | a mov: 16rfeedface -> RAX ] 
		bytes: #[72 184 206 250 237 254 0 0 0 0]

]

{ #category : #tests }
AJx64AssemblerTests >> testAssembly01 [
	self
		assert: [ :a | 
			self assert: (a reg: 8 size: 4) = R8D.	"mov    $0xfeedface,%r8d"
			a mov: 16rfeedface asUImm to: R8D ]
		bytes: #[65 184 206 250 237 254]

]

{ #category : #tests }
AJx64AssemblerTests >> testAssembly1 [

	
	self 
		assert: [ :a|
			a 
				push: a RBP;
				mov: a RSP -> a RBP;
				mov: 1024 -> a RAX;
				mov: a RBP -> a RSP;
				pop: a RBP;
				ret.]	
		bytes: #[
			85 
			72 139 236 
			72	199	192	0	4	0	0
			72 139 229 
			93 
			195]

]

{ #category : #tests }
AJx64AssemblerTests >> testAssembly2 [

	self 
		assert: [ :a|
		asm 
			push: a BP;
			mov: a SP -> a BP;
			mov: 16r400 -> a RAX;
			mov: a BP -> a SP;
			pop: a RSP;
			ret. ]
		bytes: #[
			102 85
			102 139 236 
			72	199	192 0 4 0 0
			102 139 229 
			92 
			195]
	

]

{ #category : #tests }
AJx64AssemblerTests >> testAssembly3 [

	" instructions without operands.

	(AJInstructionDescription instructions select: [:each | each group = #emit]) keys asSortedCollection
	 "
	| str |
	str :=
#(
#cbw 16r66 16r98
#cdq 16r99
#cdqe 16r48 16r98
#clc 16rF8
#cld 16rFC
#cmc 16rF5 
#cpuid 16r0F 16rA2
#cqo  16r48	16r99 "64 bit "
#cwd 16r66 16r99
#cwde 16r98
"#daa 16r27 32 bit"
"#das 16r2F 32 bit"
#emms 16r0F 16r77
#f2xm1 16rD9 16rF0
#fabs  16rD9 16rE1
#fchs 16rD9 16rE0
#fclex 16r9B 16rDB 16rE2
#fcompp 16rDE 16rD9
#fcos 16rD9 16rFF
#fdecstp 16rD9 16rF6
#fincstp 16rD9 16rF7
#finit 16r9B 16rDB 16rE3
#fld1 16rD9 16rE8
#fldl2e 16rD9 16rEA
#fldl2t 16rD9 16rE9
#fldlg2 16rD9 16rEC
#fldln2 16rD9 16rED
#fldpi 16rD9 16rEB
#fldz 16rD9 16rEE
#fnclex 16rDB 16rE2
#fninit 16rDB 16rE3
#fnop 16rD9 16rD0
#fpatan 16rD9 16rF3
#fprem 16rD9 16rF8
#fprem1 16rD9 16rF5
#fptan 16rD9 16rF2
#frndint 16rD9 16rFC
#fscale 16rD9 16rFD
#fsin 16rD9 16rFE
#fsincos 16rD9 16rFB
#fsqrt 16rD9 16rFA
#ftst 16rD9 16rE4
#fucompp 16rDA 16rE9
#fwait 16r9B
#fxam 16rD9 16rE5
#fxtract  16rD9 16rF4
#fyl2x  16rD9 16rF1
#fyl2xp1 16rD9 16rF9
#int3 16rCC
#leave  16rC9
#lfence 16r0F 16rAE 16rE8
#lock 16rF0 "prefix"
#mfence 16r0F 16rAE 16rF0
#monitor 16r0F 16r01 16rC8
#mwait 16r0F 16r01 16rC9
#nop 16r90
#pause 16rF3 16r90
"#popad 16r61 32 bit"
#popfd 16r9D
#popfq 16r48 16r9D   "- 64 bit "
"#pushad 16r60 32 bit"
#pushf 16r66 16r9C
"#pushfd 16r9C 32 bit"
#pushfq 16r9c" -64 bit"
#rdtsc 16r0F 16r31  
#rdtscp 16r0F 16r01 16rF9
#sahf 16r9E
#sfence 16r0F 16rAE 16rF8
#stc 16rF9
#std 16rFD
#ud2 16r0F 16r0B
#std 16rFD "dummy"
) readStream.

[ str atEnd ] whileFalse: [
	| instr tst bytes |
	instr := str next.
	tst := OrderedCollection new.
	[ str peek isInteger ] whileTrue: [ tst add: str next  ].

	asm reset noStackFrame.
	asm perform: instr.
	bytes := asm bytes.
	self assert: (bytes = tst asByteArray ) description: instr, ' failed. expected ', tst asByteArray printString, ' but got ', bytes asByteArray printString.
].

]

{ #category : #tests }
AJx64AssemblerTests >> testAssemblyImmAddr [
	"This is not supported in 64-bit mode -- the ModRM value for this results in RIP-relative addressing."

	self skipIf: true description: 'This is not supported in 64-bit mode -- the ModRM value for this results in RIP-relative addressing.'.
	super testAssemblyImmAddr

	"Modified: / 21-12-2015 / 09:47:24 / Jan Vrany <jan.vrany@fit.cvut.cz>"

]

{ #category : #tests }
AJx64AssemblerTests >> testAssemblyMemBase [

	self 
		assert: [ :a | a mov: a RAX ptr to: a EAX ]
		bytes: #[ 16r8B 2r00000000 ].
		
	self 
		assert: [ :a | a mov: a RSP ptr to: a EAX]
		bytes: #[ 16r8B 16r04 16r24 ].
	self 
		assert: [ :a | a mov: a RBP ptr to: a EAX ]
		bytes: #[ 16r8B 16r45 16r00 ].

]

{ #category : #tests }
AJx64AssemblerTests >> testAssemblyMemBaseDisp [
	asm
		mov: RAX ptr + 1 -> EAX;
		mov: RBX ptr + ECX -> EAX.
	self assert: asm bytes = #(16r8B 16r40 16r01 16r8B 16r04 16r0B) asByteArray

]

{ #category : #tests }
AJx64AssemblerTests >> testAssemblyMemBaseDisp2 [
	asm
		mov: RAX ptr - 1 -> EAX;
		mov: (RBX ptr + ECX) * 2 - 5 -> EAX.
	self assert: asm bytes = #(16r8B 16r40 16rFF 16r8B 16r44 16r4B 16rFB) asByteArray

]

{ #category : #tests }
AJx64AssemblerTests >> testAssemblyMemBytes [
	asm
		mov: (RSI ptr + ECX size: 1) -> BL;
		mov: BL -> (RSI ptr + ECX size: 1).
	self assert: asm bytes = #(16r8A 16r1C 16r0E 16r88 16r1C 16r0E) asByteArray

]

{ #category : #tests }
AJx64AssemblerTests >> testBitTest [
	"8 Bit ====================================================="
	self asmShould: [ :a| a bt: a R8B with: 16r1. ] raise: Error.
	
	"16 bit ====================================================="
	"lower bank 16bit register opcode + ModR/M"
	self 
		assert: [ :a| a bt: a AX with: 16r01 ]
		bytes: #[ "16bit mode" 16r66  "OP" 16r0f 16rba "ModRM" 2r11100000 "immediate" 16r01].

	"upper bank 16bit register opcode + ModR/M"
	self 
		assert: [ :a| a bt: a R8W with: 16r01 ]
		bytes: #[ "16bit mode" 16r66 "REX" 2r01000001 "OP" 16r0f 16rba "ModRM" 2r11100000 "immediate" 16r01].
		
	"32 bit ====================================================="
	"lower bank 32bit register opcode + ModR/M"
	self 
		assert: [ :a| a bt: a EAX with: 16r01 ]
		bytes: #[ "OP" 16r0f 16rba "ModRM" 2r11100000 "immediate" 16r01].
	
	"upper bank 32bit register opcode + ModR/M"
	self 
		assert: [ :a| a bt: a R8D with: 16r01 ]
		bytes: #[ "REX" 2r01000001 "OP" 16r0f 16rba "ModRM" 2r11100000 "immediate" 16r01].
	
	"64 bit ====================================================="
	"lower bank 32bit register opcode + ModR/M"
	self 
		assert: [ :a| a bt: a RAX with: 16r01 ]
		bytes: #[ "REX" 2r01001000 "OP" 16r0f 16rba "ModRM" 2r11100000 "immediate" 16r01].
	
	"upper bank 32bit register opcode + ModR/M"
	self 
		assert: [ :a| a bt: a R8 with: 16r01 ]
		bytes: #[ "REX" 2r01001001 "OP" 16r0f 16rba "ModRM" 2r11100000 "immediate" 16r01].

]

{ #category : #tests }
AJx64AssemblerTests >> testByteRegs4through7 [
	"Test valid uses of byte registers SPL BPL SIL DIL, only available in 64-bit mode, and when using a REX prefix.
	Can't be used in the same instruction with AH, CH, DH, or BH -- this is tested in testHighByteRegistersInvalid."

	| byteRegs op2codes opBothCodes mixedWidthOpCodes byteRMOperands wideRegisters |
	"byteRegs -- register -> contribution to ModRM byte when used as the reg operand"
	byteRegs := {(SPL -> 16r20).
	(BPL -> 16r28).
	(SIL -> 16r30).
	(DIL -> 16r38)}.	"opBothCodes -- #selector -> #(opcode when byteReg second arg, opcode when byteReg first arg)"
	opBothCodes := {(#adc:with: -> #(16r10 16r12)).
	(#add:with: -> #(16r00 16r02)).
	(#mov:with: -> #(16r88 16r8A)).
	(#cmp:with: -> #(16r38 16r3A)).
	(#or:with: -> #(16r08 16r0A)).
	(#sbb:with: -> #(16r18 16r1A)).
	(#sub:with -> #(16r28 16r2A)).
	(#xor:with: -> #(16r30 16r32))}.	"op2Codes -- #selector -> multiByteBytecode. ByteReg is always the second arg"
	op2codes := {(#cmpxchg:with: -> #[16r0F 16rB0]).
	(#test:with: -> #[16r84]).
	(#xadd:with: -> #[16r0F 16rC0])	"xchg is not actually supported at this time (#xchg:with: -> #[16r86])"}.	"mixedWidthOpCodes -- #selector -> multiByteBytecode. ByteReg is always the second arg"
	mixedWidthOpCodes := {(#movsx:with: -> #[16r0F 16rBE]).
	(#movzx:with: -> #[16r0F 16rB6])}.	"**** Handle #crc32:with: separately due to its legacy prefix ****"	"wideRegisters -- register -> #[REX prefix, contribution to ModRM byte when used as r/m operand]"
	wideRegisters := {(EAX -> #[16r40 16rC0]).
	(RAX -> #[16r48 16rC0]).
	(R8D -> #[16r44 16rC0]).
	(R8 -> #[16r4C 16rC0])}.	"byteRMOperands -- operand -> #(REX prefix, #[modRMContribution, SIB and displacement bytes if any])"
	byteRMOperands := {(SPL -> #(16r40 #[16rC4])).
	(BPL -> #(16r40 #[16rC5])).
	(SIL -> #(16r40 #[16rC6])).
	(DIL -> #(16r40 #[16rC7])).
	(R8B -> #(16r41 #[16rC0])).
	(AL -> #(16r40 #[16rC0])).
	(R8 ptr -> #(16r41 #[16r00])).
	(RAX ptr -> #(16r40 #[16r00])).
	(R8 ptr + 16r12 -> #(16r41 #[16r40 16r12])).
	(RAX ptr + 16r12 -> #(16r40 #[16r40 16r12])).
	(R8 ptr + 16r1234 -> #(16r41 #[16r80 16r34 16r12 16r00 16r00])).
	(RAX ptr + 16r1234 -> #(16r40 #[16r80 16r34 16r12 16r00 16r00])).
	((RAX ptr + R8) * 2 -> #(16r42 #[16r04 16r40])).
	((RAX ptr + RAX) * 2 -> #(16r40 #[16r04 16r40])).
	((RAX ptr + R8) * 4 + 16r12 -> #(16r42 #[16r44 16r80 16r12])).
	((RAX ptr + RAX) * 4 + 16r12 -> #(16r40 #[16r44 16r80 16r12])).
	((RAX ptr + R8) * 8 + 16r1234 -> #(16r42 #[16r84 16rC0 16r34 16r12 16r00 16r00])).
	((RAX ptr + RAX) * 8 + 16r1234 -> #(16r40 #[16r84 16rC0 16r34 16r12 16r00 16r00]))}.
	byteRegs
		do: [ :reg | 
			byteRMOperands
				do: [ :rm | 
					opBothCodes
						do: [ :opcode | 
							| opcodeByte op1 op2 |
							op1 := reg key.
							op2 := rm key.
							opcodeByte := opcode value last.
							self
								assert: [ :a | a perform: opcode key with: op1 with: op2 ]
								bytes:
									(ByteArray with: rm value first with: opcodeByte with: reg value | rm value last first) , rm value last allButFirst	"REX"	"ModRM"	"SIB and displacement"	"Need to add the necessary data to allow testing the reverse order of operands." ].
					op2codes
						do: [ :opcode | 
							self
								assert: [ :a | a perform: opcode key with: rm key with: reg key ]
								bytes:
									((ByteArray with: rm value first) , opcode value copyWith: reg value | rm value last first) , rm value last allButFirst	"REX"	"ModRM"	"SIB and displacement" ] ].
			mixedWidthOpCodes
				do: [ :opcode | 
					wideRegisters
						do: [ :rm | 
							self
								assert: [ :a | a perform: opcode key with: rm key with: reg key ]
								bytes: ((ByteArray with: rm value first) , opcode value copyWith: reg value >> 3 | rm value last)	"REX"	"ModRM"	"SIB and displacement" ] ] ]

]

{ #category : #tests }
AJx64AssemblerTests >> testCall [
	"relative calls ==================================================================="
	"8bit offset"
	self assert: [:a | a call: 16r12 ] bytes: #[ 16rE8 16r12 0 0 0].
	"16bit offset"
	self assert: [:a | a call: 16r1234 ] bytes: #[ 16rE8 16r34 16r12 0 0 ].
	"32bit offset"
	self assert: [:a | a call: 16r12345678 ] bytes: #[ 16rE8 16r78 16r56 16r34 16r12 ].
	
	"indirect calls ==================================================================="
	"lower bank register"
	self assert: [:a | a call: asm RAX ] bytes: #[ 16rFF 2r11010000 ].
	self assert: [:a | a call: asm RDI ] bytes: #[ 16rFF 2r11010111 ].
	
	"upper bank register (require REX prefix)"
	self assert: [:a | a call: asm R8 ] bytes: #[ 2r01001001 16rFF 2r11010000 ].
	self assert: [:a | a call: asm R15 ] bytes: #[ 2r01001001 16rFF 2r11010111 ].
	
	"double indirect calls (with ModR/M) =============================================="
	"mod = 2r00"
	"lower bank register"
	self assert: [:a | a call: a RAX ptr ] bytes: #[ 16rFF 2r00010000 ].
	self assert: [:a | a call: a RDI ptr ] bytes: #[ 16rFF 2r00010111 ].
	
	"upper bank register (require REX prefix)"
	self assert: [:a | a call: a R8 ptr ] bytes: #[ 2r01000001 16rFF 2r00010000 ].
	self assert: [:a | a call: a R15 ptr ] bytes: #[ 2r01000001 16rFF 2r00010111 ].
	
	"double indirect calls with offsets =============================================="
	"mod = 2r01 hence with a folllwing 8bit offset"
	"lower bank register"
	self assert: [:a | a call: a RAX ptr + 8 ] bytes: #[ 16rFF 2r01010000 8].
	self assert: [:a | a call: a RDI ptr + 8 ] bytes: #[ 16rFF 2r01010111 8].
	
	"upper bank register (require REX prefix)"
	self assert: [:a | a call: a R8 ptr + 8] bytes: #[ 2r01000001 16rFF 2r01010000 8].
	self assert: [:a | a call: a R15 ptr + 8] bytes: #[ 2r01000001 16rFF 2r01010111 8].
	
	"double indirect calls with offsets =============================================="
	"mod = 2r10 hence with a following 32bit offset"
	"lower bank register"
	self assert: [:a | a call: a RAX ptr + 16r12345678 ] bytes: #[ 16rFF 2r10010000 16r78 16r56 16r34 16r12].
	self assert: [:a | a call: a RDI ptr + 16r12345678 ] bytes: #[ 16rFF 2r10010111 16r78 16r56 16r34 16r12].
	
	"upper bank register (require REX prefix)"
	self assert: [:a | a call: a R8 ptr + 16r12345678] bytes: #[ 2r01000001 16rFF 2r10010000 16r78 16r56 16r34 16r12].
	self assert: [:a | a call: a R15 ptr + 16r12345678] bytes: #[ 2r01000001 16rFF 2r10010111 16r78 16r56 16r34 16r12].

]

{ #category : #tests }
AJx64AssemblerTests >> testCallInvalid [
	"on 64 bit ..
	- only 32bit relative offset are allowed
	- only 64bit registers for indirect addresses"

	"relative calls with 64bit addresses are not supported"

	self asmShould: [ :a | a call: 16r123456789ABCDEF ] raise: Error.
	AJx86Registers generalPurpose
		do: [ :register | 
			register is64
				ifFalse: [ self asmShould: [ :a | a call: register ] raise: Error ]
				ifTrue: [ self deny: (self bytes: [ :a | a call: register ]) isEmpty ] ]

]

{ #category : #tests }
AJx64AssemblerTests >> testHighByteRegistersInvalid [
	"Can't access AH, BH, CH, DH if a REX byte is required.
	This test attempts to test every instruction supported by AsmJit that can access an 8-bit general-purpose register AND also require a REX prefix."

	| legacyHRegs op2codes opBothCodes mixedWidthOpCodes byteOperandsRequiringRex wideRegistersRequiringRex |
	legacyHRegs := {AH.
	CH.
	DH.
	BH}.
	opBothCodes := #(#adc:with: #add:with: #mov:to: #cmp:with: #or:with: #sbb:with: #sub:with #xchg:with: #xor:with:).
	op2codes := #(#cmpxchg:with: #test:with: #xadd:with:).
	mixedWidthOpCodes := #(#crc32:with: #movsx:to: #movzx:to:).
	wideRegistersRequiringRex := {RAX.
	R8D}.	"RAX requires REX.W, R8D requires REX.R or REX.B"
	byteOperandsRequiringRex := {SPL.
	BPL.
	SIL.
	DIL.
	R8B.
	(R8 ptr).
	(R8 ptr + 16r12).
	(R8 ptr + 16r1234).
	((RAX ptr + R8) * 2).
	((RAX ptr + R8) * 4 + 16r12).
	((RAX ptr + R8) * 8 + 16r1234)}.
	legacyHRegs
		do: [ :hreg | 
			byteOperandsRequiringRex
				do: [ :operand | 
					opBothCodes
						do: [ :opcode | 
							self asmShould: [ :a | a perform: opcode with: hreg with: operand ] raise: Error.
							self asmShould: [ :a | a perform: opcode with: operand with: hreg ] raise: Error ].
					op2codes do: [ :opcode | self asmShould: [ :a | a perform: opcode with: operand with: hreg ] raise: Error ] ].
			mixedWidthOpCodes
				do: [ :opcode | 
					wideRegistersRequiringRex
						do: [ :wideReg | self asmShould: [ :a | a perform: opcode with: wideReg with: hreg ] raise: Error ] ] ]

]

{ #category : #tests }
AJx64AssemblerTests >> testImmLabels [
	"test immediates with labels"

	| code pos |
	asm
		mov: RAX ptr -> EAX;
		mov: (16rFFFFFFFF asUImm label: (asm labelNamed: #foo)) to: EAX.
	code := asm generatedCode.
	pos := code offsetAt: #foo.
	self assert: (code bytes at: pos + 1) = 255.
	self assert: (code bytes at: pos + 2) = 255.
	self assert: (code bytes at: pos + 3) = 255.
	self assert: (code bytes at: pos + 4) = 255

]

{ #category : #tests }
AJx64AssemblerTests >> testIndexScales [
	self
		assert: [ :a | a mov: RAX -> ((RCX ptr + RDX) * 1) ] bytes: #[16r48 16r89 16r04 16r11];
		assert: [ :a | a mov: RAX -> ((RCX ptr + RDX) * 2) ] bytes: #[16r48 16r89 16r04 16r51];
		assert: [ :a | a mov: RAX -> ((RCX ptr + RDX) * 4) ] bytes: #[16r48 16r89 16r04 16r91];
		assert: [ :a | a mov: RAX -> ((RCX ptr + RDX) * 8) ] bytes: #[16r48 16r89 16r04 16rD1].
	self
		assert: [ :a | a mov: (RCX ptr + RDX) * 1 -> RAX ] bytes: #[16r48 16r8B 16r04 16r11];
		assert: [ :a | a mov: (RCX ptr + RDX) * 2 -> RAX ] bytes: #[16r48 16r8B 16r04 16r51];
		assert: [ :a | a mov: (RCX ptr + RDX) * 4 -> RAX ] bytes: #[16r48 16r8B 16r04 16r91];
		assert: [ :a | a mov: (RCX ptr + RDX) * 8 -> RAX ] bytes: #[16r48 16r8B 16r04 16rD1]

]

{ #category : #tests }
AJx64AssemblerTests >> testInvalidTest [
	"In 64-bit mode, r/m8 cannot be encoded to access the following byte registers if an REX prefix is used: AH, BH, CH, DH."

	{AH.
	CH.
	DH.
	BH}
		do: [ :reg | 
			self deny: (self bytes: [ :a | a test: reg with: AL ]) isEmpty.
			self deny: (self bytes: [ :a | a test: AL with: reg ]) isEmpty.
			self deny: (self bytes: [ :a | a test: reg with: 16r12 ]) isEmpty.	"with an upper bank byte register => requires REX prefix"
			self asmShould: [ :a | a test: reg with: R8B ] raise: Error.
			self asmShould: [ :a | a test: R8B with: reg ] raise: Error.	"with a 64bit register requring again an REX prefix"
			self asmShould: [ :a | a test: reg with: RAX ] raise: Error.
			self asmShould: [ :a | a test: RAX with: reg ] raise: Error ]

]

{ #category : #tests }
AJx64AssemblerTests >> testJumps [

	self 
		assert: [:a|
			a 
				label: #label1;
				nop;
				nop;
				nop;
				jz: #label1.
		] bytes: #[144 144 144 16r74 251 "-5 asByte"].
	
	
	
	asm 
		reset; noStackFrame;
		label: #label1.
		126 timesRepeat: [ asm nop ].
		asm jz: #label1.
	self assert: (asm bytes size = 128).


	self 
		assert: [:a |
			a
				reset; noStackFrame;
				label: #label1;
				nop;
				nop;
				nop;
				jmp: #label1.
		] bytes: #[144 144 144 235 251 ].
	
	self 
		assert: [:a |
			a 
				reset; noStackFrame;
				jmp: #label1;
				label: #label1.
		] bytes: #[ 16rEB 0 ].
		

]

{ #category : #tests }
AJx64AssemblerTests >> testMovHighIndexRegister [
	"Mov that use r8-r15 as an index register, therefore requiring REX.X"

	self
		assert: [ :a | a mov: RAX -> ((RCX ptr + R14) * 1) ] bytes: #[16r4A 16r89 16r04 16r31];
		assert: [ :a | a mov: (RCX ptr + R14) * 1 -> RAX ] bytes: #[16r4A 16r8B 16r04 16r31]

]

{ #category : #tests }
AJx64AssemblerTests >> testMovImmediate [
	"8bit immediate to 8bit register"
	self 
		assert: [:a | a mov: 16r12 to: a AL ] 
		bytes: #[16rB0     16r12].
		
	"16bit immediate to 16bit register (requires 16bit fallback prefix)"
	self 
		assert: [:a | a mov: 16r1234 to: a AX ] 
		bytes: #[16r66 16rB8     16r34 16r12].
	
	"32bit immediate to 32bit register"
	self 
		assert: [:a | a mov: 16r12345678 to: a EAX ] 
		bytes: #[16rB8     16r78 16r56 16r34 16r12].
	
	"64bit immediate to 64bit register (requires REX prefix)"
	self 
		assert: [:a | a mov: 16r123456789ABCDEF0 to: a RAX ] 
		bytes: #[2r01001000 16rB8    16rF0 16rDE 16rBC 16r9A 16r78 16r56 16r34 16r12].
		
	"32bit immediate sign-extended to 64bit register (REX prefix)"
	self
		assert: [:a | a mov: 16r12345678 to: a RAX]
		bytes: #[ 2r01001000 16rc7 "ModR/M"16rc0    16r78 16r56 16r34 16r12 ]

]

{ #category : #tests }
AJx64AssemblerTests >> testMovMemory [
	"mov memory to 8bit register =========================="
	self 
		assert: [:a | a mov: a RCX ptr to: a AL ] 
		bytes: #[16r8A 16r00000001 "ModR/M"].
	

]

{ #category : #tests }
AJx64AssemblerTests >> testMovZX [
	"byte to word ========================================"
	"lower bank 8bit to lower bank 16bit"
	self 
		assert: [:a | a movzx: a AL to: a AX ]
		bytes: #[102 15 182 192 ].
	"lower bank 8bit to upper bank 16bit"
	self 
		assert: [:a | a movzx: a AL to: a R8W ]
		bytes: #[102 68 15 182 192].
	"upper bank 8bit to lower bank 16bit"
	self 
		assert: [:a | a movzx: a R8B to: a AX ]
		bytes: #[102 65 15 182 192].
	"upper bank 8bit to upper bank 16bit"
	self 
		assert: [:a | a movzx: a R8B to: a R8W ]
		bytes: #[102 69 15 182 192].
	
	"byte to doubleword ================================"
	"lower bank 8bit to lower bank 32bit"
	self 
		assert: [:a | a movzx: a AL to: a EAX ]
		bytes: #[15 182 192 ].
	"lower bank 8bit to upper bank 32bit"
	self 
		assert: [:a | a movzx: a AL to: a R8D ]
		bytes: #[68 15 182 192].
	"upper bank 8bit to lower bank 32bit"
	self 
		assert: [:a | a movzx: a R8B to: a EAX ]
		bytes: #[65 15 182 192].
	"upper bank 8bit to upper bank 32bit"
	self 
		assert: [:a | a movzx: a R8B to: a R8D ]
		bytes: #[69 15 182 192].
	
	"byte to quadword ==================="
	"lower bank 8bit to lower bank 64bit"
	self 
		assert: [:a | a movzx: a AL to: a RAX ]
		bytes: #[72 15 182 192 ].
	"lower bank 8bit to upper bank 64bit"
	self 
		assert: [:a | a movzx: a AL to: a R8 ]
		bytes: #[76 15 182 192].
	"upper bank 8bit to lower bank 64bit"
	self 
		assert: [:a | a movzx: a R8B to: a RAX ]
		bytes: #[73 15 182 192 ].
	"upper bank 8bit to upper bank 64bit"
	self 
		assert: [:a | a movzx: a R8B to: a R8 ]
		bytes: #[77 15 182 192].
	
	"word to quadword ==================="
	"lower bank 16bit to lower bank 64bit"
	self 
		assert: [:a | a movzx: a AX to: a RAX ]
		bytes: #[72 15 183 192].
	"lower bank 16bit to upper bank 64bit"
	self 
		assert: [:a | a movzx: a AX to: a R8 ]
		bytes: #[76 15 183 192].
	"upper bank 16bit to lower bank 64bit"
	self 
		assert: [:a| a movzx: a R8W to: a RAX ]
		bytes: #[73 15 183 192].
	"upper bank 16bit to upper bank 64bit"
	self 
		assert: [:a | a movzx: a R8W to: a R8 ]
		bytes: #[77 15 183 192].

]

{ #category : #tests }
AJx64AssemblerTests >> testMovZxSxInvalid [
	{AH.
	CH.
	DH.
	BH}
		do: [ :reg | 
			self deny: (self bytes: [ :a | a movzx: reg to: a EAX ]) isEmpty.
			self asmShould: [ :a | a movzx: reg to: a RAX ] raise: Error ]

]

{ #category : #tests }
AJx64AssemblerTests >> testMul [
	"8bit unsigned multiplication =================================="
	"lower bank register: AX := AL * CL"
	self 
		assert: [ :a | a mul: a CL]
		bytes: #[ 16rF6 "ModR/M" 2r11100001 ].
	"upper bank register needs an REX prefix: AX := AL * R8B"
	self 
		assert: [ :a | a mul: a R9B]
		bytes: #[ 2r01000001 16rF6 2r11100001].
		
	"16bit unsigned multiplication =================================="	
	"DX:AX := AX * CX"
	self 
		assert: [ :a | a mul: a CX]
		bytes: #[ "16bit fallback" 16r66 16rF7 2r11100001].
	"32bit unsigned multiplication =================================="	
	"EDX:EAX := EAX * ECX"
	self 
		assert: [ :a | a mul: a ECX]
		bytes: #[ 16rF7 2r11100001 ].
	"64bit unsigned multiplication =================================="	
	"RDX:RAX := RAX * RCX"
	self 
		assert: [ :a| a mul: a RCX]
		bytes: #[ 2r01001000 16rF7 2r11100001].

]

{ #category : #tests }
AJx64AssemblerTests >> testNeg [
	"8bit ======================================================"
	self 
		assert: [ :a | a neg: a AL]
		bytes: #[ 16rF6 "ModR/M" 2r11011000 ].
	"8bit upper bank with REX"
	self 
		assert: [ :a | a neg: a R8B]
		bytes: #[ 2r01000001 16rF6 "ModR/M" 2r11011000 ].
	
	"16bit with fallback ======================================="
	self 
		assert: [ :a | a neg: a AX]
		bytes: #[ 16r66 16rF7"ModR/M" 2r11011000 ].
	"16bit upper bank with REX"
	self 
		assert: [ :a | a neg: a R8W]
		bytes: #[ 16r66 2r01000001 16rF7"ModR/M" 2r11011000 ].
	"word 16bit IP relative "
	self 
		assert: [ :a | a neg: a IP ptr16 + 16r12345678]
		bytes: #[16r66 16rF7 "ModR/M"2r00011101 16r78 16r56 16r34 16r12].
		
	"32bit ===================================================="
	self 
		assert: [ :a | a neg: a EAX]
		bytes: #[ 16rF7"ModR/M" 2r11011000 ].
	"32bit upper bank with REX"
	self 
		assert: [ :a | a neg: a R8D]
		bytes: #[ 2r01000001 16rF7"ModR/M" 2r11011000 ].
	"negate double word 32bit EIP relative "
	self 
		assert: [ :a | a neg: a EIP ptr32 + 16r12345678]
		bytes: #[16rF7 "ModR/M"2r00011101 16r78 16r56 16r34 16r12].
		
	"64bit with REX =========================================="
	self 
		assert: [ :a | a neg: a RAX]
		bytes: #[ 2r01001000 16rF7 "ModR/M"2r11011000 ].
	"64bit upper bank"
	self 
		assert: [ :a | a neg: a R8]
		bytes: #[ 2r01001001 16rF7 "ModR/M"2r11011000 ].
	"negate quadword 64bit RIP relative "
	self 
		assert: [ :a | a neg: a RIP ptr64 + 16r12345678]
		bytes: #["REX"2r01001000 16rF7 "ModR/M"2r00011101 16r78 16r56 16r34 16r12].
		

]

{ #category : #tests }
AJx64AssemblerTests >> testPop [
	"lower bank 64bit register"		
	self assert: [:a | a pop: a RSP ]
		bytes: #[ 16r5c ].

]

{ #category : #tests }
AJx64AssemblerTests >> testPush [
	"lower bank 64bit register"		
	self assert: [:a | a push: a RSP ]
		bytes: #[ 16r54 "16r50 + RSP index" ].

]

{ #category : #tests }
AJx64AssemblerTests >> testSyscall [
	self assert: [ :a | a syscall ] bytes: #[16r0F 16r05]

]

{ #category : #tests }
AJx64AssemblerTests >> testTest [
	"8bit operand  and lower bank 8bit register"		
	self assert: [:a | a test: a CL with: 16r12 ]
		bytes: #[246	 193 16r12].
	"8bit operand  and uppe bank 8bit register"	
	self assert: [:a | a test: a R8B with: 16r12]
		bytes: #[2r01000001 2r11110110  2r11000000  16r12].
	
	"16bit operand  and lower bank 16bit register"		
	self assert: [:a | a test: a CX with: 16r1234]
		bytes: #[102 247 193   16r34 16r12].
	"16bit operand  and uppe bank 16bit register"	
	self assert: [:a | a test: a R8W with: 16r1234]
		bytes: #[102 65 247 192   16r34 16r12].
	
	"32bit operand  and lower bank 32bit register"		
	self assert: [:a | a test: a ECX with: 16r12345678]
		bytes: #[247 193   16r78 16r56 16r34 16r12].
	"32bit operand  and uppe bank 32bit register"	
	self assert: [:a | a test: a R8D with: 16r12345678]
		bytes: #[65 247 192   16r78 16r56 16r34 16r12].
	
	"32bit operand  and lower bank 64bit register"		
	self assert: [:a| a test: a RCX with: 16r12345678]
		bytes: #[72 247 193   16r78 16r56 16r34 16r12].
	"32bit operand  and uppe bank 64bit register"	
	self assert: [:a| a test: a R8 with: 16r12345678]
		bytes: #[73 247 192	  16r78 16r56 16r34 16r12].
	
	
	

]

{ #category : #tests }
AJx64AssemblerTests >> testXor [
	"8bit register xor 8bit immediate =================================="		
	"lower bank 8bit register opcode + ModR/M"
	self 
		assert: [ :a | a xor: a CL with: 16r12]
		bytes: #[ 16r80 2r11110001    16r12].
		
	"upper bank 8bit register requiring REX"
	self 
		assert: [ :a | a xor: a R8B with: 16r12]
		bytes: #[2r01000001 16r80 2r11110000    16r12].
		
	"16bit register xor 8bit immediate =================================="
	"lower bank 16bit register"
	self 
		assert: [ :a | a xor: a CX with: 16r1234]
		bytes: #[16r66 16r81 2r11110001    16r34 16r12].
	"upper bank 16bit"
	self 
		assert: [ :a | a xor: a R8W with: 16r1234]
		bytes: #[16r66 2r01000001 16r81 2r11110000 16r34 16r12].
		
	"32bit register ====================================================="
	"lower bank 32bit register"
	self 
		assert: [ :a | a xor: a ECX with: 16r12345678]
		bytes: #[16r81 2r11110001    16r78 16r56 16r34 16r12].
		
	"upper bank register requiring REX prefix"
	self 
		assert: [ :a | a xor: a R8D with: 16r12345678]
		bytes: #[2r01000001 16r81 2r11110000     16r78 16r56 16r34 16r12]
	

]

{ #category : #tests }
AJx64AssemblerTests >> testXorFastCode [
	self  "shortcut for AL + 8bit immedidate"
		assert: [ :a | a xor: a AL with: 16r12]
		bytes: #[ 16r34    16r12].
		
	self  "shortcut for AX + 16bit immedidate"
		assert: [ :a | a xor: a AX with: 16r1234]
		bytes: #[ 16r66 16r35    16r34 16r12].
		
	self  "shortcut for EAX + 16bit immedidate"
		assert: [ :a | a xor: a EAX with: 16r12345678]
		bytes: #[ 16r35    16r78 16r56 16r34 16r12].
		
	self  "shortcut for RAX + 32bit immedidate"
		assert: [ :a | a xor: a RAX with: 16r12345678]
		bytes: #[ 2r01001000 16r35    16r78 16r56 16r34 16r12].

]

{ #category : #tests }
AJx64AssemblerTests >> testXorInvalid [
	"xor registers with non-matching sizes"

	self asmShould: [ :a | a xor: AL to: RAX ] raise: Error.
	self asmShould: [ :a | a xor: RAX to: AL ] raise: Error.
	self asmShould: [ :a | a xor: R8B to: RAX ] raise: Error.
	self asmShould: [ :a | a xor: RAX to: R8B ] raise: Error.	"in 64bit mode AH CH DH and BH cannot be encoded when an REX prefix is present"
	{AH.
	CH.
	DH.
	BH} do: [ :reg | self asmShould: [ :a | a xor: reg to: a R8B ] raise: Error ]

]
