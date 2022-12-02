Class {
	#name : #AJx86AssemblerTests,
	#superclass : #TestCase,
	#instVars : [
		'asm'
	],
	#pools : [
		'AJx86Registers'
	],
	#category : #'AsmJit-Tests'
}

{ #category : #documentation }
AJx86AssemblerTests class >> copyright [
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

{ #category : #utility }
AJx86AssemblerTests >> asmShould: aBlock raise: anError [

	self should: [self bytes: aBlock] raise: anError.

]

{ #category : #utility }
AJx86AssemblerTests >> assert: aBlock bytes: aByteArray [

	self assert: (self bytes: aBlock) equals: aByteArray .

]

{ #category : #utility }
AJx86AssemblerTests >> bytes: aBlock [
	asm := self newAssembler.
	aBlock value: asm.
	^ asm bytes

]

{ #category : #utility }
AJx86AssemblerTests >> newAssembler [ 
	^ AJx86Assembler new
		noStackFrame;
		yourself

]

{ #category : #running }
AJx86AssemblerTests >> setUp [
	super setUp.
	asm := self newAssembler.

]

{ #category : #'tests-data' }
AJx86AssemblerTests >> setUpDataBytes [
	^ self setUpDataBytesAlign: 1

]

{ #category : #'tests-data' }
AJx86AssemblerTests >> setUpDataBytesAlign: alignToBytes [

	asm nop.
	asm align: alignToBytes.
	^ asm db: 16r12.

]

{ #category : #tests }
AJx86AssemblerTests >> testAssembly1 [
	
	asm 
		push: EBP;
		mov: ESP -> EBP;
		mov: 1024 -> EAX;
		mov: EBP -> ESP;
		pop: EBP;
		ret.
	
	self assert: asm bytes = #(85 139 236 184 0 4 0 0 139 229 93 195) asByteArray

]

{ #category : #tests }
AJx86AssemblerTests >> testAssembly3 [

	" instructions without operands.

	(AJInstructionDescription instructions select: [:each | each group = #emit]) keys asSortedCollection
	 "
	| str |
	str :=
#(
#cbw 16r66 16r98
#cdq 16r99
"#cdqe  64 bit "
#clc 16rF8
#cld 16rFC
#cmc 16rF5 
#cpuid 16r0F 16rA2
"#cqo  64 bit "
#cwd 16r66 16r99
#cwde 16r98
#daa 16r27
#das 16r2F
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
#popad 16r61
#popfd 16r9D
" #popfq 16r48 16r9D   - 64 bit "
#pushad 16r60
#pushf 16r66 16r9C
#pushfd 16r9C
" #pushfq -64 bit"
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
	| instr tst |
	instr := str next.
	tst := OrderedCollection new.
	[ str peek isInteger ] whileTrue: [ tst add: str next  ].

	asm reset noStackFrame.
	asm perform: instr.
	self assert: (asm bytes = tst asByteArray )
].

]

{ #category : #tests }
AJx86AssemblerTests >> testAssemblyImmAddr [
	"test generating immediate address, 
	note GDB disassembling it to:
		0x1fab <instructions.1862>:     0x8b    0x05    0xef    0xbe    0xad    0xde
		0x00001fab <instructions.1862+0>:       mov    0xdeadbeef,%eax
	which is WRONG!
	"

	asm
		mov: 16rdeadbeef asUImm ptr32 to: asm EAX. 

	" 8b05efbeadde                   mov         eax, [deadbeef] "
	
	self assert: asm bytes =  #[139 5 239 190 173 222]
	

]

{ #category : #tests }
AJx86AssemblerTests >> testAssemblyMemBase [
	
	asm 
		mov: EAX ptr  -> EAX;
		mov: ESP ptr -> EAX;
		mov: EBP ptr -> EAX.
	
	self assert: asm bytes = #(16r8B 0 16r8B 16r04 16r24 16r8B 16r45 16r00) asByteArray

]

{ #category : #tests }
AJx86AssemblerTests >> testAssemblyMemBaseDisp [

	asm 
		mov: EAX ptr + 1 -> EAX;
		mov: EBX ptr + ECX -> EAX.
	
	self assert: asm bytes = #(16r8B 16r40 16r01 16r8B 16r04 16r0B) asByteArray

]

{ #category : #tests }
AJx86AssemblerTests >> testAssemblyMemBaseDisp2 [

	asm 
		mov: EAX ptr - 1 -> EAX;
		mov: EBX ptr + ECX * 2 - 5 -> EAX.
	
	self assert: asm bytes = #(16r8B 16r40 16rFF 16r8B 16r44 16r4B 16rFB) asByteArray

]

{ #category : #tests }
AJx86AssemblerTests >> testAssemblyMemBytes [

	asm 
		mov: ((ESI ptr + ECX) size: 1) -> BL;
		mov: BL -> ((ESI ptr + ECX) size:1).
		
	self assert: asm bytes = #(16r8A 16r1C 16r0E 16r88 16r1C 16r0E ) asByteArray

]

{ #category : #tests }
AJx86AssemblerTests >> testBitTest [

	asm 
		bt: EAX with: 0.

	self assert: asm bytes =  #(16r0F 16rBA 16rE0 16r00) asByteArray

]

{ #category : #tests }
AJx86AssemblerTests >> testCall [

	asm 
		call: EAX;
		call: EAX ptr - 4;
		call: EAX ptr.
	self assert: asm bytes =  #(255 208 255 80 252 255 16) asByteArray

]

{ #category : #'tests-data' }
AJx86AssemblerTests >> testDataBytes [
	
	|data|
	data := self setUpDataBytes.
	
	self assert: asm bytes equals: #[144   16r12].

]

{ #category : #'tests-data' }
AJx86AssemblerTests >> testDataBytesAlignDouble [
	
	|data|
	data := self setUpDataBytesAlign: 4.
	
	self assert: asm bytes equals: #[144   0 0 0 16r12].

]

{ #category : #'tests-data' }
AJx86AssemblerTests >> testDataBytesAlignQuad [
	
	|data|
	data := self setUpDataBytesAlign: 8. 
	self assert: asm bytes equals: #[144   0 0 0   0 0 0 0   16r12].

]

{ #category : #'tests-data' }
AJx86AssemblerTests >> testDataBytesAlignWord [
	
	|data|
	data := self setUpDataBytesAlign: 2.
	
	self assert: asm bytes equals: #[144   0 16r12].

]

{ #category : #'tests-data' }
AJx86AssemblerTests >> testDataDouble [
	
	| data|
	
	asm nop.
	data := asm dd: #[16r78 16r56 16r34 16r12].
	
	self assert: asm bytes equals: #[144   16r78 16r56 16r34 16r12].

]

{ #category : #'tests-data' }
AJx86AssemblerTests >> testDataWord [
	
	| data|
	asm nop.
	data := asm dw: #[16r34 16r12].
	
	self assert: asm bytes equals: #[144   16r34 16r12].
	
	

]

{ #category : #'tests-FPU' }
AJx86AssemblerTests >> testFXCH [

	self 
		assert: [ :a|
		a fxch "the same as: asm fxch: asm ST1" ]
		bytes: #[	2r11011001 2r11001001 ]
	

]

{ #category : #'tests-FPU' }
AJx86AssemblerTests >> testFXCHST1 [

	self 
		assert: [ :a| a fxch: asm ST1 ]
		bytes: #[	2r11011001 2r11001001 ]
	

]

{ #category : #tests }
AJx86AssemblerTests >> testForwardJumps [
	
	asm
		jmp: #label1;
		label: #label1.

	self assert: asm bytes =  #(16rEB 0 ) asByteArray.
		

]

{ #category : #tests }
AJx86AssemblerTests >> testImmLabels [

	"test immediates with labels"
	
	| code pos |
	
	asm 
		mov: EAX ptr  -> EAX;
		mov: (16rFFFFFFFF asUImm label: (asm labelNamed: #foo) ) to:  EAX.
	
	code := asm generatedCode.
	pos := code offsetAt: #foo.

	self assert: (code bytes at: pos+1) = 255.
	self assert: (code bytes at: pos+2) = 255.
	self assert: (code bytes at: pos+3) = 255.
	self assert: (code bytes at: pos+4) = 255.

]

{ #category : #tests }
AJx86AssemblerTests >> testJMPRegister [
	
	self 
		assert: [  :assembler |
			assembler jmp: assembler EAX ]
		bytes: #[ 16rFF 2r11100000 ].
		
	self 
		assert: [  :assembler |
			assembler jmp: assembler ECX ]
		bytes: #[ 16rFF 2r11100001 ].
		
	self 
		assert: [  :assembler |
			assembler jmp: assembler EDX ]
		bytes: #[ 16rFF 2r11100010 ]

]

{ #category : #tests }
AJx86AssemblerTests >> testJumps [
	
	asm 
		label: #label1;
		nop;
		nop;
		nop;
		jz: #label1.
		
	self assert: asm bytes =  #(144 144 144 116 251) asByteArray.

	
	asm 
		reset; noStackFrame;
		label: #label1.
		126 timesRepeat: [ asm nop ].
		asm jz: #label1.
	self assert: (asm bytes size = 128).
	
	asm 
		reset; noStackFrame;
		label: #label1;
		nop;
		nop;
		nop;
		jmp: #label1.
		
	self assert: asm bytes =  #(144 144 144 235 251) asByteArray.
	
	asm
		reset; noStackFrame;
		jmp: #label1;
		label: #label1.
		
	self assert: asm bytes =  #(16rEB 0 ) asByteArray.
		

]

{ #category : #tests }
AJx86AssemblerTests >> testMovSxZx [

	asm 
		movsx: asm AX to: asm EAX;
		movzx: asm AX to: asm EAX;
		movsx: asm AL to: asm EAX;
		movzx: asm AH to: asm EAX.

	self assert: asm bytes = 
	#[
		16r0F 16rBF 16rC0
		16r0F 16rB7 16rC0
		16r0F 16rBE 16rC0
		16r0F 16rB6 16rC4 ]

]

{ #category : #tests }
AJx86AssemblerTests >> testSyscall [
	"Syscall instruction is only valid in 64-bit mode"

	self asmShould: [ :a | a syscall ] raise: Error

]

{ #category : #tests }
AJx86AssemblerTests >> testTest [
	"Special RAX opcodes"
	
	"8bit operand  opcode"		
	asm 
		test: AL with: 5.
	self assert: asm bytes = #[16rA8 05].

	
	asm reset;
		test: AX with: 5.
	"16bit operand Prefix byte, 16bit immediate (LSB)"
	self assert: asm bytes = #[16r66 16rA9 05 0].

	"32bit operand "
	asm reset;
		test: EAX with: 1.
	self assert: asm bytes =  #[16rA9 01 00 00 00].
	
	"Need more assert for non-EAX receiver, non-immediate operands"
	
	
	

]

{ #category : #tests }
AJx86AssemblerTests >> tstRegistersOf: asm [

	| numRegs |
	numRegs := asm numGPRegisters.
	
	0 to: numRegs-1 do: [:i |
		self assert: (asm reg8: i) size = 1.
		self assert: (asm reg8: i) index = i.
		
		self assert: (asm reg16: i) size = 2.
		self assert: (asm reg16: i) index = i.
		
		self assert: (asm reg32: i) size = 4.
		self assert: (asm reg32: i) index = i.

		self assert: (asm isGPNRegister: (asm nReg: i)).
	
		asm is64BitMode ifTrue: [
			self assert: (asm reg64: i) size = 8.
			self assert: (asm reg64: i) index = i.
			]   
	].

	"Created: / 15-12-2015 / 23:59:23 / Jan Vrany <jan.vrany@fit.cvut.cz>"

]
