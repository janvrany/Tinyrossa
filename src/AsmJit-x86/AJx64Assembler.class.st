"
I am an assembler for the Intel x86-64 architecture.
"
Class {
	#name : #AJx64Assembler,
	#superclass : #AJx86Assembler,
	#category : #'AsmJit-x86'
}

{ #category : #'accessing registers' }
AJx64Assembler >> BPL [
	^ self registers BPL
]

{ #category : #'accessing registers' }
AJx64Assembler >> DIL [
	^ self registers DIL
]

{ #category : #'accessing registers' }
AJx64Assembler >> EIP [
	"A 32bit instruction pointer register
	This register overlaps with IP, EIP, RIP"
	^ self registers EIP
]

{ #category : #'accessing registers' }
AJx64Assembler >> IP [
	"A 16bit instruction pointer register
	This register overlaps with IP, EIP, RIP"
	^ self registers IP
]

{ #category : #'accessing registers' }
AJx64Assembler >> R10 [
	"A 64bit general purpose register
	This register overlaps with R10B, R10W, R10D, R10"
	^ self registers R10
]

{ #category : #'accessing registers' }
AJx64Assembler >> R10B [
	"A 8bit general purpose register
	This register overlaps with R10B, R10W, R10D, R10"
	^ self registers R10B
]

{ #category : #'accessing registers' }
AJx64Assembler >> R10D [
	"A 32bit general purpose register
	This register overlaps with R10B, R10W, R10D, R10"
	^ self registers R10D
]

{ #category : #'accessing registers' }
AJx64Assembler >> R10W [
	"A 16bit general purpose register
	This register overlaps with R10B, R10W, R10D, R10"
	^ self registers R10W
]

{ #category : #'accessing registers' }
AJx64Assembler >> R11 [
	"A 64bit general purpose register
	This register overlaps with R11B, R11W, R11D, R11"
	^ self registers R11
]

{ #category : #'accessing registers' }
AJx64Assembler >> R11B [
	"A 8bit general purpose register
	This register overlaps with R11B, R11W, R11D, R11"
	^ self registers R11B
]

{ #category : #'accessing registers' }
AJx64Assembler >> R11D [
	"A 32bit general purpose register
	This register overlaps with R11B, R11W, R11D, R11"
	^ self registers R11D
]

{ #category : #'accessing registers' }
AJx64Assembler >> R11W [
	"A 16bit general purpose register
	This register overlaps with R11B, R11W, R11D, R11"
	^ self registers R11W
]

{ #category : #'accessing registers' }
AJx64Assembler >> R12 [
	"A 64bit general purpose register
	This register overlaps with R12B, R12W, R12D, R12"
	^ self registers R12
]

{ #category : #'accessing registers' }
AJx64Assembler >> R12B [
	"A 8bit general purpose register
	This register overlaps with R12B, R12W, R12D, R12"
	^ self registers R12B
]

{ #category : #'accessing registers' }
AJx64Assembler >> R12D [
	"A 32bit general purpose register
	This register overlaps with R12B, R12W, R12D, R12"
	^ self registers R12D
]

{ #category : #'accessing registers' }
AJx64Assembler >> R12W [
	"A 16bit general purpose register
	This register overlaps with R12B, R12W, R12D, R12"
	^ self registers R12W
]

{ #category : #'accessing registers' }
AJx64Assembler >> R13 [
	"A 64bit general purpose register
	This register overlaps with R13B, R13W, R13D, R13"
	^ self registers R13
]

{ #category : #'accessing registers' }
AJx64Assembler >> R13B [
	"A 8bit general purpose register
	This register overlaps with R13B, R13W, R13D, R13"
	^ self registers R13B
]

{ #category : #'accessing registers' }
AJx64Assembler >> R13D [
	"A 32bit general purpose register
	This register overlaps with R13B, R13W, R13D, R13"
	^ self registers R13D
]

{ #category : #'accessing registers' }
AJx64Assembler >> R13W [
	"A 16bit general purpose register
	This register overlaps with R13B, R13W, R13D, R13"
	^ self registers R13W
]

{ #category : #'accessing registers' }
AJx64Assembler >> R14 [
	"A 64bit general purpose register
	This register overlaps with R14B, R14W, R14D, R14"
	^ self registers R14
]

{ #category : #'accessing registers' }
AJx64Assembler >> R14B [
	"A 8bit general purpose register
	This register overlaps with R14B, R14W, R14D, R14"
	^ self registers R14B
]

{ #category : #'accessing registers' }
AJx64Assembler >> R14D [
	"A 32bit general purpose register
	This register overlaps with R14B, R14W, R14D, R14"
	^ self registers R14D
]

{ #category : #'accessing registers' }
AJx64Assembler >> R14W [
	"A 16bit general purpose register
	This register overlaps with R14B, R14W, R14D, R14"
	^ self registers R14W
]

{ #category : #'accessing registers' }
AJx64Assembler >> R15 [
	"A 64bit general purpose register
	This register overlaps with R15B, R15W, R15D, R15"
	^ self registers R15
]

{ #category : #'accessing registers' }
AJx64Assembler >> R15B [
	"A 8bit general purpose register
	This register overlaps with R15B, R15W, R15D, R15"
	^ self registers R15B
]

{ #category : #'accessing registers' }
AJx64Assembler >> R15D [
	"A 32bit general purpose register
	This register overlaps with R15B, R15W, R15D, R15"
	^ self registers R15D
]

{ #category : #'accessing registers' }
AJx64Assembler >> R15W [
	"A 16bit general purpose register
	This register overlaps with R15B, R15W, R15D, R15"
	^ self registers R15W
]

{ #category : #'accessing registers' }
AJx64Assembler >> R8 [
	"A 64bit general purpose register
	This register overlaps with R8B, R8W, R8D, R8"
	^ self registers R8
]

{ #category : #'accessing registers' }
AJx64Assembler >> R8B [
	"A 8bit general purpose register
	This register overlaps with R8B, R8W, R8D, R8"
	^ self registers R8B
]

{ #category : #'accessing registers' }
AJx64Assembler >> R8D [
	"A 32bit general purpose register
	This register overlaps with R8B, R8W, R8D, R8"
	^ self registers R8D
]

{ #category : #'accessing registers' }
AJx64Assembler >> R8W [
	"A 16bit general purpose register
	This register overlaps with R8B, R8W, R8D, R8"
	^ self registers R8W
]

{ #category : #'accessing registers' }
AJx64Assembler >> R9 [
	"A 64bit general purpose register
	This register overlaps with R9B, R9W, R9D, R9"
	^ self registers R9
]

{ #category : #'accessing registers' }
AJx64Assembler >> R9B [
	"A 8bit general purpose register
	This register overlaps with R9B, R9W, R9D, R9"
	^ self registers R9B
]

{ #category : #'accessing registers' }
AJx64Assembler >> R9D [
	"A 32bit general purpose register
	This register overlaps with R9B, R9W, R9D, R9"
	^ self registers R9D
]

{ #category : #'accessing registers' }
AJx64Assembler >> R9W [
	"A 16bit general purpose register
	This register overlaps with R9B, R9W, R9D, R9"
	^ self registers R9W
]

{ #category : #'accessing registers' }
AJx64Assembler >> RAX [
	"A 64bit general purpose register
	This register overlaps with AL, AX, EAX, RAX"
	^ self registers RAX
]

{ #category : #'accessing registers' }
AJx64Assembler >> RBP [
	"A 64bit general purpose register
	This register overlaps with CH, CX, ECX, RCX"
	^ self registers RBP
]

{ #category : #'accessing registers' }
AJx64Assembler >> RBX [
	"A 64bit general purpose register
	This register overlaps with BL, BX, EBX, RBX"
	^ self registers RBX
]

{ #category : #'accessing registers' }
AJx64Assembler >> RCX [
	"A 64bit general purpose register
	This register overlaps with CL, CX, ECX, RCX"
	^ self registers RCX
]

{ #category : #'accessing registers' }
AJx64Assembler >> RDI [
	"A 64bit general purpose register
	This register overlaps with BH, BX, EBX, RBX"
	^ self registers RDI
]

{ #category : #'accessing registers' }
AJx64Assembler >> RDX [
	"A 64bit general purpose register
	This register overlaps with DL, DX, EDX, RDX"
	^ self registers RDX
]

{ #category : #'accessing registers' }
AJx64Assembler >> RIP [
	"A 64bit instruction pointer register
	This register overlaps with IP, EIP, RIP"
	^ self registers RIP
]

{ #category : #'accessing registers' }
AJx64Assembler >> RSI [
	"A 64bit general purpose register
	This register overlaps with DH, DX, EDX, RDX"
	^ self registers RSI
]

{ #category : #'accessing registers' }
AJx64Assembler >> RSP [
	"A 64bit general purpose register
	This register overlaps with AH, AX, EAX, RAX"
	^ self registers RSP
]

{ #category : #'accessing registers' }
AJx64Assembler >> SIL [
	^ self registers SIL
]

{ #category : #'accessing registers' }
AJx64Assembler >> SPL [
	^ self registers SPL
]

{ #category : #'accessing registers' }
AJx64Assembler >> XMM10 [
	"An SSE register"
	^ self registers XMM10
]

{ #category : #'accessing registers' }
AJx64Assembler >> XMM11 [
	"An SSE register"
	^ self registers XMM11
]

{ #category : #'accessing registers' }
AJx64Assembler >> XMM12 [
	"An SSE register"
	^ self registers XMM12
]

{ #category : #'accessing registers' }
AJx64Assembler >> XMM13 [
	"An SSE register"
	^ self registers XMM13
]

{ #category : #'accessing registers' }
AJx64Assembler >> XMM14 [
	"An SSE register"
	^ self registers XMM14
]

{ #category : #'accessing registers' }
AJx64Assembler >> XMM15 [
	"An SSE register"
	^ self registers XMM15
]

{ #category : #'accessing registers' }
AJx64Assembler >> XMM8 [
	"An SSE register"
	^ self registers XMM8
]

{ #category : #'accessing registers' }
AJx64Assembler >> XMM9 [
	"An SSE register"
	^ self registers XMM9
]

{ #category : #register }
AJx64Assembler >> accumulator [
	^ self RAX
]

{ #category : #'instruction list' }
AJx64Assembler >> addInstruction: anInstruction [
	anInstruction is64: true.
	^ super addInstruction: anInstruction
]

{ #category : #register }
AJx64Assembler >> basePointer [
	^ self RBP
]

{ #category : #register }
AJx64Assembler >> counter [
	^ self RCX
]

{ #category : #register }
AJx64Assembler >> data [
	^ self RDX
]

{ #category : #register }
AJx64Assembler >> destinationIndex [
	^ self RDI
]

{ #category : #initialization }
AJx64Assembler >> initialize [
	super initialize.
	is64 := true.
]

{ #category : #accessing }
AJx64Assembler >> instructionDescriptions [
	^ AJx64InstructionDescription instructions
]

{ #category : #register }
AJx64Assembler >> instructionPointer [
	^ self RIP
]

{ #category : #testing }
AJx64Assembler >> is32 [
	^ false
]

{ #category : #testing }
AJx64Assembler >> is64 [
	^ true
]

{ #category : #accessing }
AJx64Assembler >> newInstruction [
	^ AJx64Instruction new
]

{ #category : #accessing }
AJx64Assembler >> newJumpInstruction [
	^ AJx64JumpInstruction new
]

{ #category : #accessing }
AJx64Assembler >> numGPRegisters [
	^ 16
]

{ #category : #accessing }
AJx64Assembler >> pointerSize [
	"see AJx86Assembler >> #pointerSize"
	^ 8
]

{ #category : #register }
AJx64Assembler >> sourceIndex [
	^ self RSI
]

{ #category : #register }
AJx64Assembler >> stackPointer [
	^ self RSP
]
