Class {
	#name : #AJx86RegisterTests,
	#superclass : #TestCase,
	#pools : [
		'AJx86Registers'
	],
	#category : #'AsmJit-Tests'
}

{ #category : #documentation }
AJx86RegisterTests class >> copyright [
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
AJx86RegisterTests >> testAsHighByte [
	| highByteRegs lowByteRegs otherGPRegs |
	highByteRegs := {AH.
	CH.
	DH.
	BH}.
	lowByteRegs := {AL.
	CL.
	DL.
	BL}.
	otherGPRegs := AJx86Registers generalPurpose reject: [ :r | r isHighByte | r isLowByte ].
	self assert: (highByteRegs collect: [ :r | r asHighByte ]) equals: highByteRegs.
	self assert: (lowByteRegs collect: [ :r | r asHighByte ]) equals: highByteRegs.
	self assert: otherGPRegs size equals: 60.	"16 of each size, less the lowByteRegs"
	otherGPRegs do: [ :r | self should: [ r asHighByte ] raise: Error ]

]

{ #category : #'as yet unclassified' }
AJx86RegisterTests >> testAsLowByte [
	| highByteRegs lowByteRegs otherGPRegs |
	highByteRegs := {AH.
	CH.
	DH.
	BH}.
	lowByteRegs := {AL.
	CL.
	DL.
	BL}.
	otherGPRegs := AJx86Registers generalPurpose reject: [ :r | r isHighByte | r isLowByte ].
	self assert: (highByteRegs collect: [ :r | r asLowByte ]) equals: lowByteRegs.
	self assert: (lowByteRegs collect: [ :r | r asLowByte ]) equals: lowByteRegs.
	self assert: otherGPRegs size equals: 60.	"16 of each size, less the lowByteRegs"
	otherGPRegs do: [ :r | self should: [ r asLowByte ] raise: Error ]

]

{ #category : #'as yet unclassified' }
AJx86RegisterTests >> testRegisterWidthConversions [
	"Test the generalPurpose register methods #as8, #as16, #as32, #as64. 
	Some resulting registers are not valid except in 64-bit mode, but that is not checked until you try to use the register in an instruction."

	| regs8 regs16 regs32 regs64 highByteRegs |
	regs8 := {AL.
	CL.
	DL.
	BL.
	SPL.
	BPL.
	SIL.
	DIL.
	R8B.
	R9B.
	R10B.
	R11B.
	R12B.
	R13B.
	R14B.
	R15B}.
	regs16 := {AX.
	CX.
	DX.
	BX.
	SP.
	BP.
	SI.
	DI.
	R8W.
	R9W.
	R10W.
	R11W.
	R12W.
	R13W.
	R14W.
	R15W}.
	regs32 := {EAX.
	ECX.
	EDX.
	EBX.
	ESP.
	EBP.
	ESI.
	EDI.
	R8D.
	R9D.
	R10D.
	R11D.
	R12D.
	R13D.
	R14D.
	R15D}.
	regs64 := {RAX.
	RCX.
	RDX.
	RBX.
	RSP.
	RBP.
	RSI.
	RDI.
	R8.
	R9.
	R10.
	R11.
	R12.
	R13.
	R14.
	R15}.
	highByteRegs := {AH.
	CH.
	DH.
	BH}.
	self
		assert: (regs8 collect: [ :r | r as8 ]) equals: regs8;
		assert: (regs16 collect: [ :r | r as8 ]) equals: regs8;
		assert: (regs32 collect: [ :r | r as8 ]) equals: regs8;
		assert: (regs64 collect: [ :r | r as8 ]) equals: regs8.
	self
		assert: (regs8 collect: [ :r | r as16 ]) equals: regs16;
		assert: (regs16 collect: [ :r | r as16 ]) equals: regs16;
		assert: (regs32 collect: [ :r | r as16 ]) equals: regs16;
		assert: (regs64 collect: [ :r | r as16 ]) equals: regs16.
	self
		assert: (regs8 collect: [ :r | r as32 ]) equals: regs32;
		assert: (regs16 collect: [ :r | r as32 ]) equals: regs32;
		assert: (regs32 collect: [ :r | r as32 ]) equals: regs32;
		assert: (regs64 collect: [ :r | r as32 ]) equals: regs32.
	self
		assert: (regs8 collect: [ :r | r as64 ]) equals: regs64;
		assert: (regs16 collect: [ :r | r as64 ]) equals: regs64;
		assert: (regs32 collect: [ :r | r as64 ]) equals: regs64;
		assert: (regs64 collect: [ :r | r as64 ]) equals: regs64.
	self
		assert: (highByteRegs collect: [ :r | r as8 ]) equals: highByteRegs;
		assert: (highByteRegs collect: [ :r | r as16 ])
			equals:
				{AX.
					CX.
					DX.
					BX};
		assert: (highByteRegs collect: [ :r | r as32 ])
			equals:
				{EAX.
					ECX.
					EDX.
					EBX};
		assert: (highByteRegs collect: [ :r | r as64 ])
			equals:
				{RAX.
					RCX.
					RDX.
					RBX}

]
