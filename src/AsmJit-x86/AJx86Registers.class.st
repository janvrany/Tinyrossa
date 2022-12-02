"
I am a SHaredPool which initializes all the registers needed by the Assmbler.
"
Class {
	#name : #AJx86Registers,
	#superclass : #SharedPool,
	#classVars : [
		'AH',
		'AL',
		'AX',
		'BH',
		'BL',
		'BP',
		'BPL',
		'BX',
		'CH',
		'CL',
		'CX',
		'Codes',
		'DH',
		'DI',
		'DIL',
		'DL',
		'DX',
		'EAX',
		'EBP',
		'EBX',
		'ECX',
		'EDI',
		'EDX',
		'EIP',
		'ESI',
		'ESP',
		'IP',
		'MM0',
		'MM1',
		'MM2',
		'MM3',
		'MM4',
		'MM5',
		'MM6',
		'MM7',
		'R10',
		'R10B',
		'R10D',
		'R10W',
		'R11',
		'R11B',
		'R11D',
		'R11W',
		'R12',
		'R12B',
		'R12D',
		'R12W',
		'R13',
		'R13B',
		'R13D',
		'R13W',
		'R14',
		'R14B',
		'R14D',
		'R14W',
		'R15',
		'R15B',
		'R15D',
		'R15W',
		'R8',
		'R8B',
		'R8D',
		'R8W',
		'R9',
		'R9B',
		'R9D',
		'R9W',
		'RAX',
		'RBP',
		'RBX',
		'RCX',
		'RDI',
		'RDX',
		'RIP',
		'RSI',
		'RSP',
		'SI',
		'SIL',
		'SP',
		'SPL',
		'ST0',
		'ST1',
		'ST2',
		'ST3',
		'ST4',
		'ST5',
		'ST6',
		'ST7',
		'XMM0',
		'XMM1',
		'XMM10',
		'XMM11',
		'XMM12',
		'XMM13',
		'XMM14',
		'XMM15',
		'XMM2',
		'XMM3',
		'XMM4',
		'XMM5',
		'XMM6',
		'XMM7',
		'XMM8',
		'XMM9'
	],
	#pools : [
		'AJConstants'
	],
	#category : #'AsmJit-x86'
}

{ #category : #'accessing registers' }
AJx86Registers class >> AH [
	"A 8bit general purpose register
	This register overlaps with AH, AX, EAX, RAX"
	^ self at: #AH
]

{ #category : #'accessing registers' }
AJx86Registers class >> AL [
	"A 8bit general purpose register
	This register overlaps with AL, AX, EAX, RAX"
	^ self at: #AL
]

{ #category : #'accessing registers' }
AJx86Registers class >> AX [
	"A 16bit general purpose register
	This register overlaps with AL, AX, EAX, RAX"
	^ self at: #AX
]

{ #category : #'accessing registers' }
AJx86Registers class >> BH [
	"A 8bit general purpose register
	This register overlaps with BH, BX, EBX, RBX"
	^ self at: #BH
]

{ #category : #'accessing registers' }
AJx86Registers class >> BL [
	"A 8bit general purpose register
	This register overlaps with BL, BX, EBX, RBX"
	^ self at: #BL
]

{ #category : #'accessing registers' }
AJx86Registers class >> BP [
	"A 16bit general purpose register
	This register overlaps with CH, CX, ECX, RCX"
	^ self at: #BP
]

{ #category : #'accessing registers' }
AJx86Registers class >> BX [
	"A 16bit general purpose register
	This register overlaps with BL, BX, EBX, RBX"
	^ self at: #BX
]

{ #category : #'accessing registers' }
AJx86Registers class >> CH [
	"A 8bit general purpose register
	This register overlaps with CH, CX, ECX, RCX"
	^ self at: #CH
]

{ #category : #'accessing registers' }
AJx86Registers class >> CL [
	"A 8bit general purpose register
	This register overlaps with CL, CX, ECX, RCX"
	^ self at: #CL
]

{ #category : #'accessing registers' }
AJx86Registers class >> CX [
	"A 16bit general purpose register
	This register overlaps with CL, CX, ECX, RCX"
	^ self at: #CX
]

{ #category : #'accessing registers' }
AJx86Registers class >> DH [
	"A 8bit general purpose register
	This register overlaps with DH, DX, EDX, RDX"
	^ self at: #DH
]

{ #category : #'accessing registers' }
AJx86Registers class >> DI [
	"A 16bit general purpose register
	This register overlaps with BH, BX, EBX, RBX"
	^ self at: #DI
]

{ #category : #'accessing registers' }
AJx86Registers class >> DL [
	"A 8bit general purpose register
	This register overlaps with DL, DX, EDX, RDX"
	^ self at: #DL
]

{ #category : #'accessing registers' }
AJx86Registers class >> DX [
	"A 16bit general purpose register
	This register overlaps with DL, DX, EDX, RDX"
	^ self at: #DX
]

{ #category : #'accessing registers' }
AJx86Registers class >> EAX [
	"A 32bit general purpose register
	This register overlaps with AL, AX, EAX, RAX"
	^ self at: #EAX
]

{ #category : #'accessing registers' }
AJx86Registers class >> EBP [
	"A 32bit general purpose register
	This register overlaps with CH, CX, ECX, RCX"
	^ self at: #EBP
]

{ #category : #'accessing registers' }
AJx86Registers class >> EBX [
	"A 32bit general purpose register
	This register overlaps with BL, BX, EBX, RBX"
	^ self at: #EBX
]

{ #category : #'accessing registers' }
AJx86Registers class >> ECX [
	"A 32bit general purpose register
	This register overlaps with CL, CX, ECX, RCX"
	^ self at: #ECX
]

{ #category : #'accessing registers' }
AJx86Registers class >> EDI [
	"A 32bit general purpose register
	This register overlaps with BH, BX, EBX, RBX"
	^ self at: #EDI
]

{ #category : #'accessing registers' }
AJx86Registers class >> EDX [
	"A 32bit general purpose register
	This register overlaps with DL, DX, EDX, RDX"
	^ self at: #EDX
]

{ #category : #'accessing registers' }
AJx86Registers class >> EIP [
	"A 32bit instruction pointer register
	This register overlaps with IP, EIP, RIP"
	^ self at: #EIP
]

{ #category : #'accessing registers' }
AJx86Registers class >> ESI [
	"A 32bit general purpose register
	This register overlaps with DH, DX, EDX, RDX"
	^ self at: #ESI
]

{ #category : #'accessing registers' }
AJx86Registers class >> ESP [
	"A 32bit general purpose register
	This register overlaps with AH, AX, EAX, RAX"
	^ self at: #ESP
]

{ #category : #'accessing registers' }
AJx86Registers class >> IP [
	"A 16bit instruction pointer register
	This register overlaps with IP, EIP, RIP"
	^ self at: #IP
]

{ #category : #'accessing registers' }
AJx86Registers class >> MM0 [
	"An MMX register"
	^ self at: #MM0
]

{ #category : #'accessing registers' }
AJx86Registers class >> MM1 [
	"An MMX register"
	^ self at: #MM1
]

{ #category : #'accessing registers' }
AJx86Registers class >> MM2 [
	"An MMX register"
	^ self at: #MM2
]

{ #category : #'accessing registers' }
AJx86Registers class >> MM3 [
	"An MMX register"
	^ self at: #MM3
]

{ #category : #'accessing registers' }
AJx86Registers class >> MM4 [
	"An MMX register"
	^ self at: #MM4
]

{ #category : #'accessing registers' }
AJx86Registers class >> MM5 [
	"An MMX register"
	^ self at: #MM5
]

{ #category : #'accessing registers' }
AJx86Registers class >> MM6 [
	"An MMX register"
	^ self at: #MM6
]

{ #category : #'accessing registers' }
AJx86Registers class >> MM7 [
	"An MMX register"
	^ self at: #MM7
]

{ #category : #'accessing registers' }
AJx86Registers class >> R10 [
	"A 64bit general purpose register
	This register overlaps with R10B, R10W, R10D, R10"
	^ self at: #R10
]

{ #category : #'accessing registers' }
AJx86Registers class >> R10B [
	"A 8bit general purpose register
	This register overlaps with R10B, R10W, R10D, R10"
	^ self at: #R10B
]

{ #category : #'accessing registers' }
AJx86Registers class >> R10D [
	"A 32bit general purpose register
	This register overlaps with R10B, R10W, R10D, R10"
	^ self at: #R10D
]

{ #category : #'accessing registers' }
AJx86Registers class >> R10W [
	"A 16bit general purpose register
	This register overlaps with R10B, R10W, R10D, R10"
	^ self at: #R10W
]

{ #category : #'accessing registers' }
AJx86Registers class >> R11 [
	"A 64bit general purpose register
	This register overlaps with R11B, R11W, R11D, R11"
	^ self at: #R11
]

{ #category : #'accessing registers' }
AJx86Registers class >> R11B [
	"A 8bit general purpose register
	This register overlaps with R11B, R11W, R11D, R11"
	^ self at: #R11B
]

{ #category : #'accessing registers' }
AJx86Registers class >> R11D [
	"A 32bit general purpose register
	This register overlaps with R11B, R11W, R11D, R11"
	^ self at: #R11D
]

{ #category : #'accessing registers' }
AJx86Registers class >> R11W [
	"A 16bit general purpose register
	This register overlaps with R11B, R11W, R11D, R11"
	^ self at: #R11W
]

{ #category : #'accessing registers' }
AJx86Registers class >> R12 [
	"A 64bit general purpose register
	This register overlaps with R12B, R12W, R12D, R12"
	^ self at: #R12
]

{ #category : #'accessing registers' }
AJx86Registers class >> R12B [
	"A 8bit general purpose register
	This register overlaps with R12B, R12W, R12D, R12"
	^ self at: #R12B
]

{ #category : #'accessing registers' }
AJx86Registers class >> R12D [
	"A 32bit general purpose register
	This register overlaps with R12B, R12W, R12D, R12"
	^ self at: #R12D
]

{ #category : #'accessing registers' }
AJx86Registers class >> R12W [
	"A 16bit general purpose register
	This register overlaps with R12B, R12W, R12D, R12"
	^ self at: #R12W
]

{ #category : #'accessing registers' }
AJx86Registers class >> R13 [
	"A 64bit general purpose register
	This register overlaps with R13B, R13W, R13D, R13"
	^ self at: #R13
]

{ #category : #'accessing registers' }
AJx86Registers class >> R13B [
	"A 8bit general purpose register
	This register overlaps with R13B, R13W, R13D, R13"
	^ self at: #R13B
]

{ #category : #'accessing registers' }
AJx86Registers class >> R13D [
	"A 32bit general purpose register
	This register overlaps with R13B, R13W, R13D, R13"
	^ self at: #R13D
]

{ #category : #'accessing registers' }
AJx86Registers class >> R13W [
	"A 16bit general purpose register
	This register overlaps with R13B, R13W, R13D, R13"
	^ self at: #R13W
]

{ #category : #'accessing registers' }
AJx86Registers class >> R14 [
	"A 64bit general purpose register
	This register overlaps with R14B, R14W, R14D, R14"
	^ self at: #R14
]

{ #category : #'accessing registers' }
AJx86Registers class >> R14B [
	"A 8bit general purpose register
	This register overlaps with R14B, R14W, R14D, R14"
	^ self at: #R14B
]

{ #category : #'accessing registers' }
AJx86Registers class >> R14D [
	"A 32bit general purpose register
	This register overlaps with R14B, R14W, R14D, R14"
	^ self at: #R14D
]

{ #category : #'accessing registers' }
AJx86Registers class >> R14W [
	"A 16bit general purpose register
	This register overlaps with R14B, R14W, R14D, R14"
	^ self at: #R14W
]

{ #category : #'accessing registers' }
AJx86Registers class >> R15 [
	"A 64bit general purpose register
	This register overlaps with R15B, R15W, R15D, R15"
	^ self at: #R15
]

{ #category : #'accessing registers' }
AJx86Registers class >> R15B [
	"A 8bit general purpose register
	This register overlaps with R15B, R15W, R15D, R15"
	^ self at: #R15B
]

{ #category : #'accessing registers' }
AJx86Registers class >> R15D [
	"A 32bit general purpose register
	This register overlaps with R15B, R15W, R15D, R15"
	^ self at: #R15D
]

{ #category : #'accessing registers' }
AJx86Registers class >> R15W [
	"A 16bit general purpose register
	This register overlaps with R15B, R15W, R15D, R15"
	^ self at: #R15W
]

{ #category : #'accessing registers' }
AJx86Registers class >> R8 [
	"A 64bit general purpose register
	This register overlaps with R8B, R8W, R8D, R8"
	^ self at: #R8
]

{ #category : #'accessing registers' }
AJx86Registers class >> R8B [
	"A 8bit general purpose register
	This register overlaps with R8B, R8W, R8D, R8"
	^ self at: #R8B
]

{ #category : #'accessing registers' }
AJx86Registers class >> R8D [
	"A 32bit general purpose register
	This register overlaps with R8B, R8W, R8D, R8"
	^ self at: #R8D
]

{ #category : #'accessing registers' }
AJx86Registers class >> R8W [
	"A 16bit general purpose register
	This register overlaps with R8B, R8W, R8D, R8"
	^ self at: #R8W
]

{ #category : #'accessing registers' }
AJx86Registers class >> R9 [
	"A 64bit general purpose register
	This register overlaps with R9B, R9W, R9D, R9"
	^ self at: #R9
]

{ #category : #'accessing registers' }
AJx86Registers class >> R9B [
	"A 8bit general purpose register
	This register overlaps with R9B, R9W, R9D, R9"
	^ self at: #R9B
]

{ #category : #'accessing registers' }
AJx86Registers class >> R9D [
	"A 32bit general purpose register
	This register overlaps with R9B, R9W, R9D, R9"
	^ self at: #R9D
]

{ #category : #'accessing registers' }
AJx86Registers class >> R9W [
	"A 16bit general purpose register
	This register overlaps with R9B, R9W, R9D, R9"
	^ self at: #R9W
]

{ #category : #'accessing registers' }
AJx86Registers class >> RAX [
	"A 64bit general purpose register
	This register overlaps with AL, AX, EAX, RAX"
	^ self at: #RAX
]

{ #category : #'accessing registers' }
AJx86Registers class >> RBP [
	"A 64bit general purpose register
	This register overlaps with CH, CX, ECX, RCX"
	^ self at: #RBP
]

{ #category : #'accessing registers' }
AJx86Registers class >> RBX [
	"A 64bit general purpose register
	This register overlaps with BL, BX, EBX, RBX"
	^ self at: #RBX
]

{ #category : #'accessing registers' }
AJx86Registers class >> RCX [
	"A 64bit general purpose register
	This register overlaps with CL, CX, ECX, RCX"
	^ self at: #RCX
]

{ #category : #'accessing registers' }
AJx86Registers class >> RDI [
	"A 64bit general purpose register
	This register overlaps with BH, BX, EBX, RBX"
	^ self at: #RDI
]

{ #category : #'accessing registers' }
AJx86Registers class >> RDX [
	"A 64bit general purpose register
	This register overlaps with DL, DX, EDX, RDX"
	^ self at: #RDX
]

{ #category : #'accessing registers' }
AJx86Registers class >> RIP [
	"A 64bit instruction pointer register
	This register overlaps with IP, EIP, RIP"
	^ self at: #RIP
]

{ #category : #'accessing registers' }
AJx86Registers class >> RSI [
	"A 64bit general purpose register
	This register overlaps with DH, DX, EDX, RDX"
	^ self at: #RSI
]

{ #category : #'accessing registers' }
AJx86Registers class >> RSP [
	"A 64bit general purpose register
	This register overlaps with AH, AX, EAX, RAX"
	^ self at: #RSP
]

{ #category : #'accessing registers' }
AJx86Registers class >> SI [
	"A 16bit general purpose register
	This register overlaps with DH, DX, EDX, RDX"
	^ self at: #SI
]

{ #category : #'accessing registers' }
AJx86Registers class >> SP [
	"A 16bit general purpose register
	This register overlaps with AH, AX, EAX, RAX"
	^ self at: #SP
]

{ #category : #'accessing registers' }
AJx86Registers class >> ST0 [
	"A floating point register"
	^ self at: #ST0
]

{ #category : #'accessing registers' }
AJx86Registers class >> ST1 [
	"A floating point register"
	^ self at: #ST1
]

{ #category : #'accessing registers' }
AJx86Registers class >> ST2 [
	"A floating point register"
	^ self at: #ST2
]

{ #category : #'accessing registers' }
AJx86Registers class >> ST3 [
	"A floating point register"
	^ self at: #ST3
]

{ #category : #'accessing registers' }
AJx86Registers class >> ST4 [
	"A floating point register"
	^ self at: #ST4
]

{ #category : #'accessing registers' }
AJx86Registers class >> ST5 [
	"A floating point register"
	^ self at: #ST5
]

{ #category : #'accessing registers' }
AJx86Registers class >> ST6 [
	"A floating point register"
	^ self at: #ST6
]

{ #category : #'accessing registers' }
AJx86Registers class >> ST7 [
	"A floating point register"
	^ self at: #ST7
]

{ #category : #'accessing registers' }
AJx86Registers class >> XMM0 [
	"An SSE register"
	^ self at: #XMM0
]

{ #category : #'accessing registers' }
AJx86Registers class >> XMM1 [
	"An SSE register"
	^ self at: #XMM1
]

{ #category : #'accessing registers' }
AJx86Registers class >> XMM10 [
	"An SSE register"
	^ self at: #XMM10
]

{ #category : #'accessing registers' }
AJx86Registers class >> XMM11 [
	"An SSE register"
	^ self at: #XMM11
]

{ #category : #'accessing registers' }
AJx86Registers class >> XMM12 [
	"An SSE register"
	^ self at: #XMM12
]

{ #category : #'accessing registers' }
AJx86Registers class >> XMM13 [
	"An SSE register"
	^ self at: #XMM13
]

{ #category : #'accessing registers' }
AJx86Registers class >> XMM14 [
	"An SSE register"
	^ self at: #XMM14
]

{ #category : #'accessing registers' }
AJx86Registers class >> XMM15 [
	"An SSE register"
	^ self at: #XMM15
]

{ #category : #'accessing registers' }
AJx86Registers class >> XMM2 [
	"An SSE register"
	^ self at: #XMM2
]

{ #category : #'accessing registers' }
AJx86Registers class >> XMM3 [
	"An SSE register"
	^ self at: #XMM3
]

{ #category : #'accessing registers' }
AJx86Registers class >> XMM4 [
	"An SSE register"
	^ self at: #XMM4
]

{ #category : #'accessing registers' }
AJx86Registers class >> XMM5 [
	"An SSE register"
	^ self at: #XMM5
]

{ #category : #'accessing registers' }
AJx86Registers class >> XMM6 [
	"An SSE register"
	^ self at: #XMM6
]

{ #category : #'accessing registers' }
AJx86Registers class >> XMM7 [
	"An SSE register"
	^ self at: #XMM7
]

{ #category : #'accessing registers' }
AJx86Registers class >> XMM8 [
	"An SSE register"
	^ self at: #XMM8
]

{ #category : #'accessing registers' }
AJx86Registers class >> XMM9 [
	"An SSE register"
	^ self at: #XMM9
]

{ #category : #accessing }
AJx86Registers class >> all [
	^ Codes values collect: [ :each| self classPool at: each ]
]

{ #category : #accessing }
AJx86Registers class >> all16 [
	^ self all select: [:reg| reg is16 ]
]

{ #category : #accessing }
AJx86Registers class >> all32 [
	^ self all select: [:reg| reg is32 ]
]

{ #category : #accessing }
AJx86Registers class >> all64 [
	^ self all select: [:reg| reg is64 ]
]

{ #category : #accessing }
AJx86Registers class >> all8 [
	^ self all select: [:reg| reg is8 ]
]

{ #category : #accessing }
AJx86Registers class >> at: aRegisterIdentifierSymbol [
	^ self classPool at: aRegisterIdentifierSymbol
]

{ #category : #accessing }
AJx86Registers class >> code: registerCode [
	"Access a register by its code.
	Example:
		RBP == (self code: RBP code)"
	| registerName |
	self flag: 'XXX now this is some ugly code... add an instance variable for the requiresRex boolean instead of encoding it in #code'.
	registerName := Codes at: registerCode ifAbsent: [
				Codes at: registerCode + 16r100 ifAbsent: [
					Codes at: registerCode + 16r200 ifAbsent: [  KeyNotFound signalFor: registerCode ] ] ].
	^ self classPool at: registerName
]

{ #category : #accessing }
AJx86Registers class >> doesNotUnderstand: aMessage [
	self classPool at: aMessage selector ifPresent: [:val| ^ val ].
	^ super doesNotUnderstand: aMessage
]

{ #category : #accessing }
AJx86Registers class >> generalPurpose [
	^ self all select: [ :reg| reg isGeneralPurpose ]
]

{ #category : #accessing }
AJx86Registers class >> generalPurpose16 [
	^ self sortRegistersByIndex: (self generalPurpose select: [:reg| reg is16 ])
]

{ #category : #accessing }
AJx86Registers class >> generalPurpose32 [
	^ self sortRegistersByIndex: (self generalPurpose select: [:reg| reg is32 ])
]

{ #category : #accessing }
AJx86Registers class >> generalPurpose64 [
	^ self sortRegistersByIndex: (self generalPurpose select: [:reg| reg is64 ])
]

{ #category : #accessing }
AJx86Registers class >> generalPurpose8 [
	^ self sortRegistersByIndex: (self generalPurpose select: [:reg| reg is8 ])
]

{ #category : #accessing }
AJx86Registers class >> generalPurposeWithIndex: index size: numBytes [
	"Access a register by its properties.
	Example:
		RBP == (self generalPurposeWithIndex: RBP index size: RBP size)"

	| type code |
	type := numBytes = 1
		ifTrue: [ 0 ]
		ifFalse: [
			numBytes = 2
				ifTrue: [ 16r10 ]
				ifFalse: [
					numBytes = 4
						ifTrue: [ 16r20 ]
						ifFalse: [
							numBytes = 8
								ifTrue: [ 16r30 ]
								ifFalse: [ self error: 'Size must be 1, 2, 4, or 8 bytes' ] ] ] ].
	code := type + index.
	^ self classPool at: (Codes at: code)
]

{ #category : #accessing }
AJx86Registers class >> generalPurposeWithIndex: index size: numBytes requiresRex: requiresRex prohibitsRex: prohibitsRex [
	"Access a register by its properties.
	Example:
		RBP == (self generalPurposeWithIndex: RBP index size: RBP size)"

	| type code |
	type := numBytes = 1
		ifTrue: [ 0 ]
		ifFalse: [
			numBytes = 2
				ifTrue: [ 16r10 ]
				ifFalse: [
					numBytes = 4
						ifTrue: [ 16r20 ]
						ifFalse: [
							numBytes = 8
								ifTrue: [ 16r30 ]
								ifFalse: [ self error: 'Size must be 1, 2, 4, or 8 bytes' ] ] ] ].
	code := type + index.
	^ self classPool at: (Codes at: code)
]

{ #category : #initialization }
AJx86Registers class >> initialize [
	"AJx86Registers initialize"

	self classPool at: #Codes put: IdentityDictionary new.

	self initializeGeneralPurpose8BitRegisters.
	self initializeGeneralPurpose16BitRegisters.
	self initializeGeneralPurpose32BitRegisters.
	self initializeGeneralPurpose64BitRegisters.

	self initializeInstructionPointerRegisters.

	self initializeX87Registers.
	self initializeMMXRegisters.
	self initializeSSERegisters.
]

{ #category : #initialization }
AJx86Registers class >> initializeGeneralPurpose16BitRegisters [
	"initialize general purpose 16 bit registers "

	self
		registerBase: 16r10
		class: AJx86GeneralPurposeRegister
		values: #(#AX #CX #DX #BX #SP #BP #SI #DI);

		registerBase: 16r18
		class: AJx86GeneralPurposeRexRegister
		values: #(#R8W #R9W #R10W #R11W #R12W #R13W #R14W #R15W)
]

{ #category : #initialization }
AJx86Registers class >> initializeGeneralPurpose32BitRegisters [
	"initialize general purpose 32 bit registers "

	self
		registerBase: 16r20
		class: AJx86GeneralPurposeRegister
		values: #(#EAX #ECX #EDX #EBX #ESP #EBP #ESI #EDI);

		registerBase: 16r28
		class: AJx86GeneralPurposeRexRegister
		values: #(#R8D #R9D #R10D #R11D #R12D #R13D #R14D #R15D)
]

{ #category : #initialization }
AJx86Registers class >> initializeGeneralPurpose64BitRegisters [
	"initialize general purpose 64 bit registers"

	self
		registerBase: 16r30
		class: AJx86GeneralPurposeRegister
		values: #(#RAX #RCX #RDX #RBX #RSP #RBP #RSI #RDI);

		registerBase: 16r38
		class: AJx86GeneralPurposeRexRegister
		values: #(#R8 #R9 #R10 #R11 #R12 #R13 #R14 #R15)
]

{ #category : #initialization }
AJx86Registers class >> initializeGeneralPurpose8BitRegisters [
	"general purpose 8 bit registers "
	| lowByte highByte |
	lowByte := self
		registerBase: 0
		class: AJx86LowByteRegister
		values: #(#AL #CL #DL #BL).

	highByte := self
		registerBase: 4
		class: AJx86HighByteRegister
		values: #(#AH #CH #DH #BH).
	lowByte with: highByte do:  [ :low :high|
		low highByteComplementRegister: high.
		high lowByteComplementRegister: low. ].

	self
		registerBase: 4
		class: AJx86GeneralPurposeRexRegister
		values: #(#SPL #BPL #SIL #DIL #R8B #R9B #R10B #R11B #R12B #R13B #R14B #R15B)
]

{ #category : #initialization }
AJx86Registers class >> initializeInstructionPointerRegisters [
	| ip eip rip |

	ip := AJx64RipRegister code: SI code name: #IP.
	eip := AJx64RipRegister code: ESI code name: #EIP.
	rip := AJx64RipRegister code: RSI code name: #RIP.

	Codes
		at: SI code negated put: #IP;
		at: ESI code negated put: #EIP;
		at: RSI code negated put: #RIP.

	self classPool
		at: #IP put: ip;
		at: #EIP put: eip;
		at: #RIP put: rip.
]

{ #category : #initialization }
AJx86Registers class >> initializeMMXRegisters [

	" MMX registers "
	self registerBase: 16r60  class: AJMMRegister values: #(
		#MM0 #MM1   #MM2   #MM3   #MM4   #MM5   #MM6   #MM7 ).
]

{ #category : #initialization }
AJx86Registers class >> initializeSSERegisters [
	" SSE registers "
	self registerBase: 16r70 class: AJxMMRegister  values: #(
		#XMM0 #XMM1  #XMM2  #XMM3  #XMM4  #XMM5  #XMM6  #XMM7
		#XMM8 #XMM9  #XMM10 #XMM11 #XMM12 #XMM13 #XMM14 #XMM15).
]

{ #category : #initialization }
AJx86Registers class >> initializeX87Registers [
	"X87 registers"
	self registerBase: 16r50 class: AJx87Register values: #(
		#ST0 #ST1 #ST2 #ST3 #ST4 #ST5 #ST6 #ST7 ).
]

{ #category : #'method compilation' }
AJx86Registers class >> installRegister: register accessorCategory: registerAccessorsCategory [

	^ self class
		compile:(String streamContents: [ :s |
			s nextPutAll: register name; crtab.
			self printRegister: register descriptionOn: s.
			s crtab; nextPutAll: '^ self at: #'; nextPutAll: register name ])
		classified: registerAccessorsCategory
]

{ #category : #'method compilation' }
AJx86Registers class >> installRegister: register accessorCategory: registerAccessorsCategory on: aClass [

	aClass
		compile: (String	streamContents: [ :s |
			s nextPutAll: register name; crtab.
			self printRegister: register descriptionOn: s.
			s crtab; nextPutAll: '^ '; nextPutAll: register name ])
		classified: registerAccessorsCategory
]

{ #category : #'method compilation' }
AJx86Registers class >> installRegisterAccessors [
	"this method creates simple accessors for all registers"

	| registerAccessorsCategory |

	registerAccessorsCategory := 'accessing registers'.

	"remove all methods in the 'accessing register' category"
	self class methods
		select: [ :method | method category = registerAccessorsCategory ]
		thenDo: [ :method | self class removeSelector: method selector ].

	self all
		do: [ :register | | method |
			"install the direct accessor on this class"
			self installRegister: register accessorCategory: registerAccessorsCategory.
			"install the accessor on the assembler"
			self
				installRegister: register
				accessorCategory: registerAccessorsCategory
				on: (register isX86 ifTrue: [ AJx86Assembler ]  ifFalse: [ AJx64Assembler ])]
		displayingProgress: [ :each| each name ].
]

{ #category : #'method compilation' }
AJx86Registers class >> printRegister: register descriptionOn: s [

	s nextPut: $".
	register descriptionOn: s.
	register influencingRegisters ifNotEmpty: [ :registers|
		s crtab nextPutAll: 'This register overlaps with '.
		registers do: [ :reg| s nextPutAll: reg name ] separatedBy: [ s nextPutAll: ', ']].
	s nextPut: $"
]

{ #category : #initialization }
AJx86Registers class >> registerBase: base class: regClass values: names [
	| val |
	val := base.
	^ names collect: [ :regName |
		| register |
		register := regClass code: val name: regName.
		self classPool at: regName put: register.
		Codes at: val put: regName.
		val := val + 1.
		register ]
]

{ #category : #accessing }
AJx86Registers class >> registerNamed: regName [
	^ self perform: regName
]

{ #category : #initialization }
AJx86Registers class >> sortRegistersByIndex: aRegisterCollection [
	^ aRegisterCollection sort: [ :regA :regB| regA index < regB index ].
]
