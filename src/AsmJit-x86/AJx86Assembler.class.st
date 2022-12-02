"
I am an assembler for the Intel x86 (32Bit) architecture.

Example:
	asm := AJx64Assembler new.
	""by default the assembler will set up a stack frame""
	asm noStackFrame.
	""load the constant 16r12 into the RAX register""
	asm mov: 16r12 to: asm RAX.
	""output the bytes for this instruction""
	asm bytes
"
Class {
	#name : #AJx86Assembler,
	#superclass : #AJAssembler,
	#instVars : [
		'is64'
	],
	#pools : [
		'AJConstants',
		'AJx86Registers'
	],
	#category : #'AsmJit-x86'
}

{ #category : #debugging }
AJx86Assembler class >> gccDisassemble: bytesArray [
	"compile the given bytes to a C binary and disassemble it using gdb"
	^ self new gccDisassemble: bytesArray
]

{ #category : #'accessing registers' }
AJx86Assembler >> AH [
	"A 8bit general purpose register
	This register overlaps with AH, AX, EAX, RAX"
	^ self registers AH
]

{ #category : #'accessing registers' }
AJx86Assembler >> AL [
	"A 8bit general purpose register
	This register overlaps with AL, AX, EAX, RAX"
	^ self registers AL
]

{ #category : #'accessing registers' }
AJx86Assembler >> AX [
	"A 16bit general purpose register
	This register overlaps with AL, AX, EAX, RAX"
	^ self registers AX
]

{ #category : #'accessing registers' }
AJx86Assembler >> BH [
	"A 8bit general purpose register
	This register overlaps with BH, BX, EBX, RBX"
	^ self registers BH
]

{ #category : #'accessing registers' }
AJx86Assembler >> BL [
	"A 8bit general purpose register
	This register overlaps with BL, BX, EBX, RBX"
	^ self registers BL
]

{ #category : #'accessing registers' }
AJx86Assembler >> BP [
	"A 16bit general purpose register
	This register overlaps with CH, CX, ECX, RCX"
	^ self registers BP
]

{ #category : #'accessing registers' }
AJx86Assembler >> BX [
	"A 16bit general purpose register
	This register overlaps with BL, BX, EBX, RBX"
	^ self registers BX
]

{ #category : #'accessing registers' }
AJx86Assembler >> CH [
	"A 8bit general purpose register
	This register overlaps with CH, CX, ECX, RCX"
	^ self registers CH
]

{ #category : #'accessing registers' }
AJx86Assembler >> CL [
	"A 8bit general purpose register
	This register overlaps with CL, CX, ECX, RCX"
	^ self registers CL
]

{ #category : #'accessing registers' }
AJx86Assembler >> CX [
	"A 16bit general purpose register
	This register overlaps with CL, CX, ECX, RCX"
	^ self registers CX
]

{ #category : #'accessing registers' }
AJx86Assembler >> DH [
	"A 8bit general purpose register
	This register overlaps with DH, DX, EDX, RDX"
	^ self registers DH
]

{ #category : #'accessing registers' }
AJx86Assembler >> DI [
	"A 16bit general purpose register
	This register overlaps with BH, BX, EBX, RBX"
	^ self registers DI
]

{ #category : #'accessing registers' }
AJx86Assembler >> DL [
	"A 8bit general purpose register
	This register overlaps with DL, DX, EDX, RDX"
	^ self registers DL
]

{ #category : #'accessing registers' }
AJx86Assembler >> DX [
	"A 16bit general purpose register
	This register overlaps with DL, DX, EDX, RDX"
	^ self registers DX
]

{ #category : #'accessing registers' }
AJx86Assembler >> EAX [
	"A 32bit general purpose register
	This register overlaps with AL, AX, EAX, RAX"
	^ self registers EAX
]

{ #category : #'accessing registers' }
AJx86Assembler >> EBP [
	"A 32bit general purpose register
	This register overlaps with CH, CX, ECX, RCX"
	^ self registers EBP
]

{ #category : #'accessing registers' }
AJx86Assembler >> EBX [
	"A 32bit general purpose register
	This register overlaps with BL, BX, EBX, RBX"
	^ self registers EBX
]

{ #category : #'accessing registers' }
AJx86Assembler >> ECX [
	"A 32bit general purpose register
	This register overlaps with CL, CX, ECX, RCX"
	^ self registers ECX
]

{ #category : #'accessing registers' }
AJx86Assembler >> EDI [
	"A 32bit general purpose register
	This register overlaps with BH, BX, EBX, RBX"
	^ self registers EDI
]

{ #category : #'accessing registers' }
AJx86Assembler >> EDX [
	"A 32bit general purpose register
	This register overlaps with DL, DX, EDX, RDX"
	^ self registers EDX
]

{ #category : #'accessing registers' }
AJx86Assembler >> ESI [
	"A 32bit general purpose register
	This register overlaps with DH, DX, EDX, RDX"
	^ self registers ESI
]

{ #category : #'accessing registers' }
AJx86Assembler >> ESP [
	"A 32bit general purpose register
	This register overlaps with AH, AX, EAX, RAX"
	^ self registers ESP
]

{ #category : #'accessing registers' }
AJx86Assembler >> MM0 [
	"An MMX register"
	^ self registers MM0
]

{ #category : #'accessing registers' }
AJx86Assembler >> MM1 [
	"An MMX register"
	^ self registers MM1
]

{ #category : #'accessing registers' }
AJx86Assembler >> MM2 [
	"An MMX register"
	^ self registers MM2
]

{ #category : #'accessing registers' }
AJx86Assembler >> MM3 [
	"An MMX register"
	^ self registers MM3
]

{ #category : #'accessing registers' }
AJx86Assembler >> MM4 [
	"An MMX register"
	^ self registers MM4
]

{ #category : #'accessing registers' }
AJx86Assembler >> MM5 [
	"An MMX register"
	^ self registers MM5
]

{ #category : #'accessing registers' }
AJx86Assembler >> MM6 [
	"An MMX register"
	^ self registers MM6
]

{ #category : #'accessing registers' }
AJx86Assembler >> MM7 [
	"An MMX register"
	^ self registers MM7
]

{ #category : #'accessing registers' }
AJx86Assembler >> SI [
	"A 16bit general purpose register
	This register overlaps with DH, DX, EDX, RDX"
	^ self registers SI
]

{ #category : #'accessing registers' }
AJx86Assembler >> SP [
	"A 16bit general purpose register
	This register overlaps with AH, AX, EAX, RAX"
	^ self registers SP
]

{ #category : #'accessing registers' }
AJx86Assembler >> ST0 [
	"A floating point register"
	^ self registers ST0
]

{ #category : #'accessing registers' }
AJx86Assembler >> ST1 [
	"A floating point register"
	^ self registers ST1
]

{ #category : #'accessing registers' }
AJx86Assembler >> ST2 [
	"A floating point register"
	^ self registers ST2
]

{ #category : #'accessing registers' }
AJx86Assembler >> ST3 [
	"A floating point register"
	^ self registers ST3
]

{ #category : #'accessing registers' }
AJx86Assembler >> ST4 [
	"A floating point register"
	^ self registers ST4
]

{ #category : #'accessing registers' }
AJx86Assembler >> ST5 [
	"A floating point register"
	^ self registers ST5
]

{ #category : #'accessing registers' }
AJx86Assembler >> ST6 [
	"A floating point register"
	^ self registers ST6
]

{ #category : #'accessing registers' }
AJx86Assembler >> ST7 [
	"A floating point register"
	^ self registers ST7
]

{ #category : #'accessing registers' }
AJx86Assembler >> XMM0 [
	"An SSE register"
	^ self registers XMM0
]

{ #category : #'accessing registers' }
AJx86Assembler >> XMM1 [
	"An SSE register"
	^ self registers XMM1
]

{ #category : #'accessing registers' }
AJx86Assembler >> XMM2 [
	"An SSE register"
	^ self registers XMM2
]

{ #category : #'accessing registers' }
AJx86Assembler >> XMM3 [
	"An SSE register"
	^ self registers XMM3
]

{ #category : #'accessing registers' }
AJx86Assembler >> XMM4 [
	"An SSE register"
	^ self registers XMM4
]

{ #category : #'accessing registers' }
AJx86Assembler >> XMM5 [
	"An SSE register"
	^ self registers XMM5
]

{ #category : #'accessing registers' }
AJx86Assembler >> XMM6 [
	"An SSE register"
	^ self registers XMM6
]

{ #category : #'accessing registers' }
AJx86Assembler >> XMM7 [
	"An SSE register"
	^ self registers XMM7
]

{ #category : #register }
AJx86Assembler >> accumulator [
	^ self is32BitMode
		ifTrue: [ self EAX ]
		ifFalse: [ self AX ]
]

{ #category : #'instructions generated' }
AJx86Assembler >> adc: aRegisterOrMemoryOperand with: aSource [
	"Add with Carry
	"
	^ self
		addInstruction: #adc
		operands: { aRegisterOrMemoryOperand . aSource }
]

{ #category : #'instructions generated' }
AJx86Assembler >> add: aRegisterOrMemoryOperand with: aSource [
	"Add
	Pseudo Code
-----------
DEST = DEST + SRC;

Description
-----------
Adds the destination operand (first operand) and the source operand
(second operand) and then stores the result in the destination operand.
The destination operand can be a register or a memory location; the
source operand can be an immediate, a register, or a memory location.
(However, two memory operands cannot be used in one instruction.) When
an immediate value is used as an operand, it is sign-extended to the
length of the destination operand format.

The ADD instruction performs integer addition. It evaluates the result
for both signed and unsigned integer operands and sets the OF and CF
flags to indicate a carry (overflow) in the signed or unsigned result,
respectively. The SF flag indicates the sign of the signed result.

This instruction can be used with a LOCK prefix to allow the instruction
to be executed atomically.

In 64-bit mode, the instruction's default operation size is 32 bits.
Using a REX prefix in the form of REX.R permits access to additional
registers (R8-R15). Using a REX a REX prefix in the form of REX.W
promotes operation to 64 bits. See the summary chart at the beginning of
this section for encoding data and limits.

"
	^ self
		addInstruction: #add
		operands: { aRegisterOrMemoryOperand . aSource }
]

{ #category : #alignment }
AJx86Assembler >> align: aByteSize [
	self addInstruction: (AJAlignmentInstruction align: aByteSize)
]

{ #category : #alignment }
AJx86Assembler >> alignDoubleword [
	self addInstruction: AJAlignmentInstruction alignDoubleword
]

{ #category : #alignment }
AJx86Assembler >> alignQuadword [
	self addInstruction: AJAlignmentInstruction alignQuadword
]

{ #category : #alignment }
AJx86Assembler >> alignWord [
	self addInstruction: AJAlignmentInstruction alignWord
]

{ #category : #'instructions generated' }
AJx86Assembler >> amdprefetch: aMemoryOperand [
	"
	"
	^ self
		addInstruction: #amdprefetch
		operands: { aMemoryOperand }
]

{ #category : #'instructions generated' }
AJx86Assembler >> amdprefetchw: aMemoryOperand [
	"
	"
	^ self
		addInstruction: #amdprefetchw
		operands: { aMemoryOperand }
]

{ #category : #'instructions generated' }
AJx86Assembler >> and: aRegisterOrMemoryOperand with: aSource [
	"Logical AND
	"
	^ self
		addInstruction: #and
		operands: { aRegisterOrMemoryOperand . aSource }
]

{ #category : #register }
AJx86Assembler >> basePointer [
	^ self is32BitMode
		ifTrue: [ self EBP ]
		ifFalse: [ self BP ]
]

{ #category : #'instructions generated' }
AJx86Assembler >> bsf: aRegister with: aSourceRegisterOrMemory [
	"Bit Scan Forward
	Description
-----------
Searches the source operand (second operand) for the least significant
set bit (1 bit). If a least significant 1 bit is found, its bit index is
stored in the destination operand (first operand). The source operand
can be a register or a memory location; the destination operand is a
register. The bit index is an unsigned offset from bit 0 of the source
operand. If the content of the source operand is 0, the content of the
destination operand is undefined.

In 64-bit mode, the instruction's default operation size is 32 bits.
Using a REX prefix in the form of REX.R permits access to additional
registers (R8-R15). Using a REX prefix in the form of REX.W promotes
operation to 64 bits. See the summary chart at the beginning of this
section for encoding data and limits.

"
	^ self
		addInstruction: #bsf
		operands: { aRegister . aSourceRegisterOrMemory }
]

{ #category : #'instructions generated' }
AJx86Assembler >> bsr: aRegister with: aSourceRegisterOrMemory [
	"Bit Scan Reverse
	Description
-----------
Searches the source operand (second operand) for the most significant
set bit (1 bit). If a most significant 1 bit is found, its bit index is
stored in the destination operand (first operand). The source operand
can be a register or a memory location; the destination operand is a
register. The bit index is an unsigned offset from bit 0 of the source
operand. If the content source operand is 0, the content of the
destination operand is undefined.

In 64-bit mode, the instruction's default operation size is 32 bits.
Using a REX prefix in the form of REX.R permits access to additional
registers (R8-R15). Using a REX prefix in the form of REX.W promotes
operation to 64 bits. See the summary chart at the beginning of this
section for encoding data and limits.

"
	^ self
		addInstruction: #bsr
		operands: { aRegister . aSourceRegisterOrMemory }
]

{ #category : #'instructions generated' }
AJx86Assembler >> bswap: aDestinationRegister [
	"Byte Swap
	Description
-----------
Reverses the byte order of a 32-bit or 64-bit (destination) register.
This instruction is provided for converting little-endian values to
big-endian format and vice versa. To swap bytes in a word value (16-bit
register), use the XCHG instruction. When the BSWAP instruction
references a 16-bit register, the result is undefined.

In 64-bit mode, the instruction's default operation size is 32 bits.
Using a REX prefix in the form of REX.R permits access to additional
registers (R8-R15). Using a REX prefix in the form of REX.W promotes
operation to 64 bits. See the summary chart at the beginning of this
section for encoding data and limits.

IA-32 Architecture Legacy Compatibility

The BSWAP instruction is not supported on IA-32 processors earlier than
the Intel486™ processor family. For compatibility with this instruction,
software should include functionally equivalent code for execution on
Intel processors earlier than the Intel486 processor family.

"
	^ self
		addInstruction: #bswap
		operands: { aDestinationRegister }
]

{ #category : #'instructions generated' }
AJx86Assembler >> bt: aDestinationRegisterOrMemory with: aSourceRegisterOrImmediate [
	"Bit Test
	Pseudo Code
-----------
CF = Bit(BitBase, BitOffset);

Description
-----------
Selects the bit in a bit string (specified with the first operand,
called the bit base) at the bit-position designated by the bit offset
(specified by the second operand) and stores the value of the bit in the
CF flag. The bit base operand can be a register or a memory location;
the bit offset operand can be a register or an immediate value:

-   If the bit base operand specifies a register, the instruction takes
    the modulo 16, 32, or 64 of the bit offset operand (modulo size
    depends on the mode and register size; 64-bit operands are available
    only in 64-bit mode).
-   If the bit base operand specifies a memory location, the operand
    represents the address of the byte in memory that contains the bit
    base (bit 0 of the specified byte) of the bit string. The range of
    the bit position that can be referenced by the offset operand
    depends on the operand size.

See also: Bit(BitBase, BitOffset) on page 3-11.

Some assemblers support immediate bit offsets larger than 31 by using
the immediate bit offset field in combination with the displacement
field of the memory operand. In this case, the low-order 3 or 5 bits (3
for 16-bit operands, 5 for 32-bit operands) of the immediate bit offset
are stored in the immediate bit offset field, and the high-order bits
are shifted and combined with the byte displacement in the addressing
mode by the assembler. The processor will ignore the high order bits if
they are not zero.

When accessing a bit in memory, the processor may access 4 bytes
starting from the memory address for a 32-bit operand size, using by the
following relationship:

Effective Address + (4 \* (BitOffset DIV 32))

Or, it may access 2 bytes starting from the memory address for a 16-bit
operand, using this relationship:

Effective Address + (2 \* (BitOffset DIV 16))

It may do so even when only a single byte needs to be accessed to reach
the given bit. When using this bit addressing mechanism, software should
avoid referencing areas of memory close to address space holes. In
particular, it should avoid references to memory-mapped I/O registers.
Instead, software should use the MOV instructions to load from or store
to these addresses, and use the register form of these instructions to
manipulate the data.

In 64-bit mode, the instruction's default operation size is 32 bits.
Using a REX prefix in the form of REX.R permits access to additional
registers (R8-R15). Using a REX prefix in the form of REX.W promotes
operation to 64 bit operands. See the summary chart at the beginning of
this section for encoding data and limits.

"
	^ self
		addInstruction: #bt
		operands: { aDestinationRegisterOrMemory . aSourceRegisterOrImmediate }
]

{ #category : #'instructions generated' }
AJx86Assembler >> btc: aDestinationRegisterOrMemory with: aSourceRegisterOrImmediate [
	"Bit Test and Complement
	Pseudo Code
-----------
CF = Bit(BitBase, BitOffset);
Bit(BitBase, BitOffset) = NOT Bit(BitBase, BitOffset);

Description
-----------
Selects the bit in a bit string (specified with the first operand,
called the bit base) at the bit-position designated by the bit offset
operand (second operand), stores the value of the bit in the CF flag,
and complements the selected bit in the bit string. The bit base operand
can be a register or a memory location; the bit offset operand can be a
register or an immediate value:

-   If the bit base operand specifies a register, the instruction takes
    the modulo 16, 32, or 64 of the bit offset operand (modulo size
    depends on the mode and register size; 64-bit operands are available
    only in 64-bit mode). This allows any bit position to be selected.
-   If the bit base operand specifies a memory location, the operand
    represents the address of the byte in memory that contains the bit
    base (bit 0 of the specified byte) of the bit string. The range of
    the bit position that can be referenced by the offset operand
    depends on the operand size.

See also: Bit(BitBase, BitOffset) on page 3-11.

Some assemblers support immediate bit offsets larger than 31 by using
the immediate bit offset field in combination with the displacement
field of the memory operand. See 'BT—Bit Test' in this chapter for more
information on this addressingmechanism.

This instruction can be used with a LOCK prefix to allow the instruction
to be executed atomically.

In 64-bit mode, the instruction's default operation size is 32 bits.
Using a REX prefix in the form of REX.R permits access to additional
registers (R8-R15). Using a REX prefix in the form of REX.W promotes
operation to 64 bits. See the summary chart at the beginning of this
section for encoding data and limits.

"
	^ self
		addInstruction: #btc
		operands: { aDestinationRegisterOrMemory . aSourceRegisterOrImmediate }
]

{ #category : #'instructions generated' }
AJx86Assembler >> btr: aDestinationRegisterOrMemory with: aSourceRegisterOrImmediate [
	"Bit Test and Reset
	Pseudo Code
-----------
CF = Bit(BitBase, BitOffset);
Bit(BitBase, BitOffset) = 0;

Description
-----------
Selects the bit in a bit string (specified with the first operand,
called the bit base) at the bit-position designated by the bit offset
operand (second operand), stores the value of the bit in the CF flag,
and clears the selected bit in the bit string to 0. The bit base operand
can be a register or a memory location; the bit offset operand can be a
register or an immediate value:

-   If the bit base operand specifies a register, the instruction takes
    the modulo 16, 32, or 64 of the bit offset operand (modulo size
    depends on the mode and register size; 64-bit operands are available
    only in 64-bit mode). This allows any bit position to be selected.
-   If the bit base operand specifies a memory location, the operand
    represents the address of the byte in memory that contains the bit
    base (bit 0 of the specified byte) of the bit string. The range of
    the bit position that can be referenced by the offset operand
    depends on the operand size.

See also: Bit(BitBase, BitOffset) on page 3-11.

Some assemblers support immediate bit offsets larger than 31 by using
the immediate bit offset field in combination with the displacement
field of the memory operand. See 'BT—Bit Test' in this chapter for more
information on this addressingmechanism.

This instruction can be used with a LOCK prefix to allow the instruction
to be executed atomically.

In 64-bit mode, the instruction's default operation size is 32 bits.
Using a REX prefix in the form of REX.R permits access to additional
registers (R8-R15). Using a REX prefix in the form of REX.W promotes
operation to 64 bits. See the summary chart at the beginning of this
section for encoding data and limits.

"
	^ self
		addInstruction: #btr
		operands: { aDestinationRegisterOrMemory . aSourceRegisterOrImmediate }
]

{ #category : #'instructions generated' }
AJx86Assembler >> bts: aDestinationRegisterOrMemory with: aSourceRegisterOrImmediate [
	"Bit Test and Set
	Pseudo Code
-----------
CF = Bit(BitBase, BitOffset);
Bit(BitBase, BitOffset) = 1;

Description
-----------
Selects the bit in a bit string (specified with the first operand,
called the bit base) at the bit-position designated by the bit offset
operand (second operand), stores the value of the bit in the CF flag,
and sets the selected bit in the bit string to 1. The bit base operand
can be a register or a memory location; the bit offset operand can be a
register or an immediate value:

-   If the bit base operand specifies a register, the instruction takes
    the modulo 16, 32, or 64 of the bit offset operand (modulo size
    depends on the mode and register size; 64-bit operands are available
    only in 64-bit mode). This allows any bit position to be selected.
-   If the bit base operand specifies a memory location, the operand
    represents the address of the byte in memory that contains the bit
    base (bit 0 of the specified byte) of the bit string. The range of
    the bit position that can be referenced by the offset operand
    depends on the operand size.

See also: Bit(BitBase, BitOffset) on page 3-11.

Some assemblers support immediate bit offsets larger than 31 by using
the immediate bit offset field in combination with the displacement
field of the memory operand. See 'BT—Bit Test' in this chapter for more
information on this addressingmechanism.

This instruction can be used with a LOCK prefix to allow the instruction
to be executed atomically.

In 64-bit mode, the instruction's default operation size is 32 bits.
Using a REX prefix in the form of REX.R permits access to additional
registers (R8-R15). Using a REX prefix in the form of REX.W promotes
operation to 64 bits. See the summary chart at the beginning of this
section for encoding data and limits.

"
	^ self
		addInstruction: #bts
		operands: { aDestinationRegisterOrMemory . aSourceRegisterOrImmediate }
]

{ #category : #'instructions generated' }
AJx86Assembler >> call: anAddressSource [
	"Call Procedure
	Description
-----------
Saves procedure linking information on the stack and branches to the
called procedure specified using the target operand. The target operand
specifies the address of the first instruction in the called procedure.
The operand can be an immediate value, a general-purpose register, or a
memory location.

This instruction can be used to execute four types of calls:

-   Near Call — A call to a procedure in the current code segment (the
    segment currently pointed to by the CS register), sometimes referred
    to as an intrasegment call.
-   Far Call — A call to a procedure located in a different segment than
    the current code segment, sometimes referred to as an inter-segment
    call.
-   Inter-privilege-level far call — A far call to a procedure in a
    segment at a different privilege level than that of the currently
    executing program or procedure.
-   Task switch — A call to a procedure located in a different task.

The latter two call types (inter-privilege-level call and task switch)
can only be executed in protected mode. See 'Calling Procedures Using
Call and RET' in Chapter6 of the Intel®64 and IA-32 Architectures
Software Developer's Manual, Volume 1, for additional information on
near, far, and inter-privilege-level calls. See Chapter 7,'Task
Management,' in theIntel® 64 and IA-32 Architectures Software
Developer'sManual, Volume 3A, for information on performing task
switches with the CALL instruction.

Near Call. When executing a near call, the processor pushes the value of
the EIP register (which contains the offset of the instruction following
the CALL instruction) on the stack (for use later as a
return-instruction pointer). The processor then branches to the address
in the current code segment specified by the target operand. The target
operand specifies either an absolute offset in the code segment (an
offset from the base of the code segment) or a relative offset (a signed
displacement relative to the current value of the instruction pointer in
the EIP register; this value points to the instruction following the
CALL instruction). The CS register is not changed on near calls.

For a near call absolute, an absolute offset is specified indirectly in
a general-purpose register or a memory location (r/m16, r/m32, or
r/m64). The operand-size attribute determines the size of the target
operand (16, 32 or 64 bits). When in 64-bit mode, the operand size for
near call (and all near branches) is forced to 64-bits. Absolute offsets
are loaded directly into the EIP(RIP) register. If the operand size
attribute is 16, the upper two bytes of the EIP register are cleared,
resulting in a maximum instruction pointer size of 16 bits. When
accessing an absolute offset indirectly using the stack pointer [ESP] as
the base register, the base value used is the value of the ESP before
the instruction executes.

A relative offset (rel16 or rel32) is generally specified as a label in
assembly code. But at the machine code level, it is encoded as a signed,
16- or 32-bit immediate value. This value is added to the value in the
EIP(RIP) register. In 64-bit mode the relative offset is always a 32-bit
immediate value which is sign extended to 64-bits before it is added to
the value in the RIP register for the target calculation. As with
absolute offsets, the operand-size attribute determines the size of the
target operand (16, 32, or 64 bits). In 64-bit mode the target operand
will always be 64-bits because the operand size is forced to 64-bits for
near branches.

Far Calls in Real-Address or Virtual-8086 Mode. When executing a far
call in real- address or virtual-8086 mode, the processor pushes the
current value of both the CS and EIP registers on the stack for use as a
return-instruction pointer. The processor then performs a 'far branch'
to the code segment and offset specified with the target operand for the
called procedure. The target operand specifies an absolute far address
either directly with a pointer (ptr16:16 or ptr16:32) or indirectly with
a memory location (m16:16 or m16:32). With the pointer method, the
segment and offset of the called procedure is encoded in the instruction
using a 4-byte (16-bit operand size) or 6-byte (32-bit operand size) far
address immediate. With the indirect method, the target operand
specifies a memory location that contains a 4-byte (16-bit operand size)
or 6-byte (32-bit operand size) far address. The operand-size attribute
determines the size of the offset (16 or 32 bits) in the far address.
The far address is loaded directly into the CS and EIP registers. If the
operand-size attribute is 16, the upper two bytes of the EIP register
are cleared.

Far Calls in Protected Mode. When the processor is operating in
protected mode, the CALL instruction can be used to perform the
following types of far calls:

-   Far call to the same privilege level
-   Far call to a different privilege level (inter-privilege level call)
-   Task switch (far call to another task)

In protected mode, the processor always uses the segment selector part
of the far address to access the corresponding descriptor in the GDT or
LDT. The descriptor type (code segment, call gate, task gate, or TSS)
and access rights determine the type of call operation to be performed.

If the selected descriptor is for a code segment, a far call to a code
segment at the same privilege level is performed. (If the selected code
segment is at a different privilege level and the code segment is
non-conforming, a general-protection exception is generated.) A far call
to the same privilege level in protected mode is very similar to one
carried out in real-address or virtual-8086 mode. The target operand
specifies an absolute far address either directly with a pointer
(ptr16:16 or ptr16:32) or indirectly with a memory location (m16:16 or
m16:32). The operand- size attribute determines the size of the offset
(16 or 32 bits) in the far address. The new code segment selector and
its descriptor are loaded into CS register; the offset from the
instruction is loaded into the EIP register.

A call gate (described in the next paragraph) can also be used to
perform a far call to a code segment at the same privilege level. Using
this mechanism provides an extra level of indirection and is the
preferred method of making calls between 16-bit and 32-bit code
segments.

When executing an inter-privilege-level far call, the code segment for
the procedure being called must be accessed through a call gate. The
segment selector specified by the target operand identifies the call
gate. The target operand can specify the call gate segment selector
either directly with a pointer (ptr16:16 or ptr16:32) or indirectly with
a memory location (m16:16 or m16:32). The processor obtains the segment
selector for the new code segment and the new instruction pointer
(offset) from the call gate descriptor. (The offset from the target
operand is ignored when a call gate is used.)

On inter-privilege-level calls, the processor switches to the stack for
the privilege level of the called procedure. The segment selector for
the new stack segment is specified in the TSS for the currently running
task. The branch to the new code segment occurs after the stack switch.
(Note that when using a call gate to perform a far call to a segment at
the same privilege level, no stack switch occurs.) On the new stack, the
processor pushes the segment selector and stack pointer for the calling
procedure's stack, an optional set of parameters from the calling
procedures stack, and the segment selector and instruction pointer for
the calling procedure's code segment. (A value in the call gate
descriptor determines how many parameters to copy to the new stack.)
Finally, the processor branches to the address of the procedure being
called within the new code segment.

Executing a task switch with the CALL instruction is similar to
executing a call through a call gate. The target operand specifies the
segment selector of the task gate for the new task activated by the
switch (the offset in the target operand is ignored). The task gate in
turn points to the TSS for the new task, which contains the segment
selectors for the task's code and stack segments. Note that the TSS also
contains the EIP value for the next instruction that was to be executed
before the calling task was suspended. This instruction pointer value is
loaded into the EIP register to re-start the calling task.

The CALL instruction can also specify the segment selector of the TSS
directly, which eliminates the indirection of the task gate. See Chapter
7, 'Task Management,' in the

Intel® 64 and IA-32 Architectures Software Developer's Manual, Volume
3A, for information on the mechanics of a task switch.

When you execute at task switch with a CALL instruction, the nested task
flag (NT) is set in the EFLAGS register and the new TSS's previous task
link field is loaded with the old task's TSS selector. Code is expected
to suspend this nested task by executing an IRET instruction which,
because the NT flag is set, automatically uses the previous task link to
return to the calling task. (See 'Task Linking' in Chapter 7 ofthe
Intel® 64 and IA-32 Architectures Software Developer's Manual, Volume
3A, for information on nested tasks.) Switching tasks with the CALL
instruction differs in this regard from JMP instruction. JMP does not
set the NT flag and therefore does not expect an IRET instruction to
suspend the task.

Mixing 16-Bit and 32-Bit Calls. When making far calls between 16-bit and
32-bit code segments, use a call gate. If the far call is from a 32-bit
code segment to a 16-bit code segment, the call should be made from the
first 64 KBytes of the 32-bit code segment. This is because the
operand-size attribute of the instruction is set to 16, so only a 16-bit
return address offset can be saved. Also, the call should be made using
a 16-bit call gate so that 16-bit values can be pushed on the stack. See
Chapter 18,'Mixing 16-Bit and 32-Bit Code,' in theIntel® 64 and IA-32
Architectures SoftwareDeveloper's Manual, Volume 3A, for more
information.

Far Calls in Compatibility Mode. When the processor is operating in
compatibility mode, the CALL instruction can be used to perform the
following types of far calls:

-   Far call to the same privilege level, remaining in compatibility
    mode
-   Far call to the same privilege level, transitioning to 64-bit mode
-   Far call to a different privilege level (inter-privilege level
    call), transitioning to 64bit mode

Note that a CALL instruction can not be used to cause a task switch in
compatibility mode since task switches are not supported in IA-32e mode.

In compatibility mode, the processor always uses the segment selector
part of the far address to access the corresponding descriptor in the
GDT or LDT. The descriptor type (code segment, call gate) and access
rights determine the type of call operation to be performed.

If the selected descriptor is for a code segment, a far call to a code
segment at the same privilege level is performed. (If the selected code
segment is at a different privilege level and the code segment is
non-conforming, a general-protection exception is generated.) A far call
to the same privilege level in compatibility mode is very similar to one
carried out in protected mode. The target operand specifies an absolute
far address either directly with a pointer (ptr16:16 or ptr16:32) or
indirectly with a memory location (m16:16 or m16:32). The operand-size
attribute determines the size of the offset (16 or 32 bits) in the far
address. The new code segment selector and its descriptor are loaded
into CS register and the offset from the instruction is loaded into the
EIP register. The difference is that 64-bit mode may be entered. This
specified by the L bit in the new code segment descriptor.

Note that a 64-bit call gate (described in the next paragraph) can also
be used to perform a far call to a code segment at the same privilege
level. However, using this mechanism requires that the target code
segment descriptor have the L bit set, causing an entry to 64-bit mode.

When executing an inter-privilege-level far call, the code segment for
the procedure being called must be accessed through a 64-bit call gate.
The segment selector specified by the target operand identifies the call
gate. The target operand can specify the call gate segment selector
either directly with a pointer (ptr16:16 or ptr16:32) or indirectly with
a memory location (m16:16 or m16:32). The processor obtains the segment
selector for the new code segment and the new instruction pointer
(offset) from the 16-byte call gate descriptor. (The offset from the
target operand is ignored when a call gate is used.)

On inter-privilege-level calls, the processor switches to the stack for
the privilege level of the called procedure. The segment selector for
the new stack segment is set to NULL. The new stack pointer is specified
in the TSS for the currently running task. The branch to the new code
segment occurs after the stack switch. (Note that when using a call gate
to perform a far call to a segment at the same privilege level, an
implicit stack switch occurs as a result of entering 64-bit mode. The SS
selector is unchanged, but stack segment accesses use a segment base of
0x0, the limit is ignored, and the default stack size is 64-bits. The
full value of RSP is used for the offset, of which the upper 32-bits are
undefined.) On the new stack, the processor pushes the segment selector
and stack pointer for the calling procedure's stack and the segment
selector and instruction pointer for the calling procedure's code
segment. (Parameter copy is not supported in IA-32e mode.) Finally, the
processor branches to the address of the procedure being called within
the new code segment.

Near/(Far) Calls in 64-bit Mode. When the processor is operating in
64-bit mode, the CALL instruction can be used to perform the following
types of far calls:

-   Far call to the same privilege level, transitioning to compatibility
    mode
-   Far call to the same privilege level, remaining in 64-bit mode
-   Far call to a different privilege level (inter-privilege level
    call), remaining in 64-bit mode

Note that in this mode the CALL instruction can not be used to cause a
task switch in 64-bit mode since task switches are not supported in
IA-32e mode.

In 64-bit mode, the processor always uses the segment selector part of
the far address to access the corresponding descriptor in the GDT or
LDT. The descriptor type (code segment, call gate) and access rights
determine the type of call operation to be performed.

If the selected descriptor is for a code segment, a far call to a code
segment at the same privilege level is performed. (If the selected code
segment is at a different privilege level and the code segment is
non-conforming, a general-protection exception is generated.) A far call
to the same privilege level in 64-bit mode is very similar to one
carried out in compatibility mode. The target operand specifies an
absolute far address indirectly with a memory location (m16:16, m16:32
or m16:64). The form of CALL with a direct specification of absolute far
address is not defined in 64-bit mode. The operand-size attribute
determines the size of the offset (16, 32, or 64 bits) in the far
address. The new code segment selector and its descriptor are loaded
into the CS register; the offset from the instruction is loaded into the
EIP register. The new code segment may specify entry either into
compatibility or 64-bit mode, based on the L bit value.

A 64-bit call gate (described in the next paragraph) can also be used to
perform a far call to a code segment at the same privilege level.
However, using this mechanism requires that the target code segment
descriptor have the L bit set.

When executing an inter-privilege-level far call, the code segment for
the procedure being called must be accessed through a 64-bit call gate.
The segment selector specified by the target operand identifies the call
gate. The target operand can only specify the call gate segment selector
indirectly with a memory location (m16:16, m16:32 or m16:64). The
processor obtains the segment selector for the new code segment and the
new instruction pointer (offset) from the 16-byte call gate descriptor.
(The offset from the target operand is ignored when a call gate is
used.)

On inter-privilege-level calls, the processor switches to the stack for
the privilege level of the called procedure. The segment selector for
the new stack segment is set to NULL. The new stack pointer is specified
in the TSS for the currently running task. The branch to the new code
segment occurs after the stack switch.

Note that when using a call gate to perform a far call to a segment at
the same privilege level, an implicit stack switch occurs as a result of
entering 64-bit mode. The SS selector is unchanged, but stack segment
accesses use a segment base of 0x0, the limit is ignored, and the
default stack size is 64-bits. (The full value of RSP is used for the
offset.) On the new stack, the processor pushes the segment selector and
stack pointer for the calling procedure's stack and the segment selector
and instruction pointer for the calling procedure's code segment.
(Parameter copy is not supported in IA-32e mode.) Finally, the processor
branches to the address of the procedure being called within the new
code segment.

"
	^ self addInstruction: (AJx86CALL target: anAddressSource)
]

{ #category : #'instructions generated' }
AJx86Assembler >> clflush: aMemoryOperand [
	"Flush Cache Line
	Pseudo Code
-----------
Flush_Cache_Line(SRC);

Description
-----------
Invalidates the cache line that contains the linear address specified
with the source operand from all levels of the processor cache hierarchy
(data and instruction). The invalidation is broadcast throughout the
cache coherence domain. If, at any level of the cache hierarchy, the
line is inconsistent with memory (dirty) it is written to memory before
invalidation. The source operand is a byte memory location.

The availability of CLFLUSH is indicated by the presence of the CPUID
feature flag CLFSH (bit 19 of the EDX register, see 'CPUID—CPU
Identification' in this chapter).The aligned cache line size affected is
also indicated with the CPUID instruction (bits 8 through 15 of the EBX
register when the initial value in the EAX register is 1).

The memory attribute of the page containing the affected line has no
effect on the behavior of this instruction. It should be noted that
processors are free to speculatively fetch and cache data from system
memory regions assigned a memory-type allowing for speculative reads
(such as, the WB, WC, and WT memory types). PREFETCHh instructions can
be used to provide the processor with hints for this speculative
behavior. Because this speculative fetching can occur at any time and is
not tied to instruction execution, the CLFLUSH instruction is not
ordered with respect to PREFETCHh instructions or any of the speculative
fetching mechanisms (that is, data can be speculatively loaded into a
cache line just before, during, or after the execution of a CLFLUSH
instruction that references the cache line).

CLFLUSH is only ordered by the MFENCE instruction. It is not guaranteed
to be ordered by any other fencing or serializing instructions or by
another CLFLUSH instruction. For example, software can use an MFENCE
instruction to ensure that previous stores are included in the
write-back.

The CLFLUSH instruction can be used at all privilege levels and is
subject to all permission checking and faults associated with a byte
load (and in addition, a CLFLUSH instruction is allowed to flush a
linear address in an execute-only segment). Like a load, the CLFLUSH
instruction sets the A bit but not the D bit in the page tables.

The CLFLUSH instruction was introduced with the SSE2 extensions;
however, because it has its own CPUID feature flag, it can be
implemented in IA-32 processors that do not include the SSE2 extensions.
Also, detecting the presence of the SSE2 extensions with the CPUID
instruction does not guarantee that the CLFLUSH instruction is
implemented in the processor.

CLFLUSH operation is the same in non-64-bit modes and 64-bit mode.

"
	^ self
		addInstruction: #clflush
		operands: { aMemoryOperand }
]

{ #category : #'instructions generated' }
AJx86Assembler >> cmova: aRegister with: aSourceRegisterOrMemory [
	"
	"
	^ self
		addInstruction: #cmova
		operands: { aRegister . aSourceRegisterOrMemory }
]

{ #category : #'instructions generated' }
AJx86Assembler >> cmovae: aRegister with: aSourceRegisterOrMemory [
	"
	"
	^ self
		addInstruction: #cmovae
		operands: { aRegister . aSourceRegisterOrMemory }
]

{ #category : #'instructions generated' }
AJx86Assembler >> cmovb: aRegister with: aSourceRegisterOrMemory [
	"Conditional Move - below/not above or equal/carry (CF=1)
	"
	^ self
		addInstruction: #cmovb
		operands: { aRegister . aSourceRegisterOrMemory }
]

{ #category : #'instructions generated' }
AJx86Assembler >> cmovbe: aRegister with: aSourceRegisterOrMemory [
	"Conditional Move - below or equal/not above (CF=1 AND ZF=1)
	"
	^ self
		addInstruction: #cmovbe
		operands: { aRegister . aSourceRegisterOrMemory }
]

{ #category : #'instructions generated' }
AJx86Assembler >> cmovc: aRegister with: aSourceRegisterOrMemory [
	"
	"
	^ self
		addInstruction: #cmovc
		operands: { aRegister . aSourceRegisterOrMemory }
]

{ #category : #'instructions generated' }
AJx86Assembler >> cmove: aRegister with: aSourceRegisterOrMemory [
	"
	"
	^ self
		addInstruction: #cmove
		operands: { aRegister . aSourceRegisterOrMemory }
]

{ #category : #'instructions generated' }
AJx86Assembler >> cmovg: aRegister with: aSourceRegisterOrMemory [
	"
	"
	^ self
		addInstruction: #cmovg
		operands: { aRegister . aSourceRegisterOrMemory }
]

{ #category : #'instructions generated' }
AJx86Assembler >> cmovge: aRegister with: aSourceRegisterOrMemory [
	"
	"
	^ self
		addInstruction: #cmovge
		operands: { aRegister . aSourceRegisterOrMemory }
]

{ #category : #'instructions generated' }
AJx86Assembler >> cmovl: aRegister with: aSourceRegisterOrMemory [
	"Conditional Move - less/not greater (SF!=OF)
	"
	^ self
		addInstruction: #cmovl
		operands: { aRegister . aSourceRegisterOrMemory }
]

{ #category : #'instructions generated' }
AJx86Assembler >> cmovle: aRegister with: aSourceRegisterOrMemory [
	"Conditional Move - less or equal/not greater ((ZF=1) OR (SF!=OF))
	"
	^ self
		addInstruction: #cmovle
		operands: { aRegister . aSourceRegisterOrMemory }
]

{ #category : #'instructions generated' }
AJx86Assembler >> cmovna: aRegister with: aSourceRegisterOrMemory [
	"
	"
	^ self
		addInstruction: #cmovna
		operands: { aRegister . aSourceRegisterOrMemory }
]

{ #category : #'instructions generated' }
AJx86Assembler >> cmovnae: aRegister with: aSourceRegisterOrMemory [
	"
	"
	^ self
		addInstruction: #cmovnae
		operands: { aRegister . aSourceRegisterOrMemory }
]

{ #category : #'instructions generated' }
AJx86Assembler >> cmovnb: aRegister with: aSourceRegisterOrMemory [
	"Conditional Move - not below/above or equal/not carry (CF=0)
	"
	^ self
		addInstruction: #cmovnb
		operands: { aRegister . aSourceRegisterOrMemory }
]

{ #category : #'instructions generated' }
AJx86Assembler >> cmovnbe: aRegister with: aSourceRegisterOrMemory [
	"Conditional Move - not below or equal/above (CF=0 AND ZF=0)
	"
	^ self
		addInstruction: #cmovnbe
		operands: { aRegister . aSourceRegisterOrMemory }
]

{ #category : #'instructions generated' }
AJx86Assembler >> cmovnc: aRegister with: aSourceRegisterOrMemory [
	"
	"
	^ self
		addInstruction: #cmovnc
		operands: { aRegister . aSourceRegisterOrMemory }
]

{ #category : #'instructions generated' }
AJx86Assembler >> cmovne: aRegister with: aSourceRegisterOrMemory [
	"
	"
	^ self
		addInstruction: #cmovne
		operands: { aRegister . aSourceRegisterOrMemory }
]

{ #category : #'instructions generated' }
AJx86Assembler >> cmovng: aRegister with: aSourceRegisterOrMemory [
	"
	"
	^ self
		addInstruction: #cmovng
		operands: { aRegister . aSourceRegisterOrMemory }
]

{ #category : #'instructions generated' }
AJx86Assembler >> cmovnge: aRegister with: aSourceRegisterOrMemory [
	"
	"
	^ self
		addInstruction: #cmovnge
		operands: { aRegister . aSourceRegisterOrMemory }
]

{ #category : #'instructions generated' }
AJx86Assembler >> cmovnl: aRegister with: aSourceRegisterOrMemory [
	"Conditional Move - not less/greater or equal (SF=OF)
	"
	^ self
		addInstruction: #cmovnl
		operands: { aRegister . aSourceRegisterOrMemory }
]

{ #category : #'instructions generated' }
AJx86Assembler >> cmovnle: aRegister with: aSourceRegisterOrMemory [
	"Conditional Move - not less nor equal/greater ((ZF=0) AND (SF=OF))
	"
	^ self
		addInstruction: #cmovnle
		operands: { aRegister . aSourceRegisterOrMemory }
]

{ #category : #'instructions generated' }
AJx86Assembler >> cmovno: aRegister with: aSourceRegisterOrMemory [
	"Conditional Move - not overflow (OF=0)
	"
	^ self
		addInstruction: #cmovno
		operands: { aRegister . aSourceRegisterOrMemory }
]

{ #category : #'instructions generated' }
AJx86Assembler >> cmovnp: aRegister with: aSourceRegisterOrMemory [
	"Conditional Move - not parity/parity odd
	"
	^ self
		addInstruction: #cmovnp
		operands: { aRegister . aSourceRegisterOrMemory }
]

{ #category : #'instructions generated' }
AJx86Assembler >> cmovns: aRegister with: aSourceRegisterOrMemory [
	"Conditional Move - not sign (SF=0)
	"
	^ self
		addInstruction: #cmovns
		operands: { aRegister . aSourceRegisterOrMemory }
]

{ #category : #'instructions generated' }
AJx86Assembler >> cmovnz: aRegister with: aSourceRegisterOrMemory [
	"Conditional Move - not zero/not equal (ZF=1)
	"
	^ self
		addInstruction: #cmovnz
		operands: { aRegister . aSourceRegisterOrMemory }
]

{ #category : #'instructions generated' }
AJx86Assembler >> cmovo: aRegister with: aSourceRegisterOrMemory [
	"Conditional Move - overflow (OF=1)
	"
	^ self
		addInstruction: #cmovo
		operands: { aRegister . aSourceRegisterOrMemory }
]

{ #category : #'instructions generated' }
AJx86Assembler >> cmovp: aRegister with: aSourceRegisterOrMemory [
	"Conditional Move - parity/parity even (PF=1)
	"
	^ self
		addInstruction: #cmovp
		operands: { aRegister . aSourceRegisterOrMemory }
]

{ #category : #'instructions generated' }
AJx86Assembler >> cmovpe: aRegister with: aSourceRegisterOrMemory [
	"
	"
	^ self
		addInstruction: #cmovpe
		operands: { aRegister . aSourceRegisterOrMemory }
]

{ #category : #'instructions generated' }
AJx86Assembler >> cmovpo: aRegister with: aSourceRegisterOrMemory [
	"
	"
	^ self
		addInstruction: #cmovpo
		operands: { aRegister . aSourceRegisterOrMemory }
]

{ #category : #'instructions generated' }
AJx86Assembler >> cmovs: aRegister with: aSourceRegisterOrMemory [
	"Conditional Move - sign (SF=1)
	"
	^ self
		addInstruction: #cmovs
		operands: { aRegister . aSourceRegisterOrMemory }
]

{ #category : #'instructions generated' }
AJx86Assembler >> cmovz: aRegister with: aSourceRegisterOrMemory [
	"Conditional Move - zero/equal (ZF=0)
	"
	^ self
		addInstruction: #cmovz
		operands: { aRegister . aSourceRegisterOrMemory }
]

{ #category : #'instructions generated' }
AJx86Assembler >> cmp: aRegisterOrMemoryOperand with: aSource [
	"Compare Two Operands
	Pseudo Code
-----------
temp = SRC1 - SignExtend(SRC2);
ModifyStatusFlags; (* Modify status flags in the same manner as the SUB instruction *)

Description
-----------
Compares the first source operand with the second source operand and
sets the status flags in the EFLAGS register according to the results.
The comparison is performed by subtracting the second operand from the
first operand and then setting the status flags in the same manner as
the SUB instruction. When an immediate value is used as an operand, it
is sign-extended to the length of the first operand.

The condition codes used by the Jcc, CMOVcc, and SETcc instructions are
based on the results of a CMP instruction. Appendix B, 'EFLAGS Condition
Codes,' in theIntel® 64 and IA-32 Architectures Software Developer's
Manual, Volume 1, shows the relationship of the status flags and the
condition codes.

In 64-bit mode, the instruction's default operation size is 32 bits. Use
of the REX.R prefix permits access to additional registers (R8-R15). Use
of the REX.W prefix promotes operation to 64 bits. See the summary chart
at the beginning of this section for encoding data and limits.

"
	^ self
		addInstruction: #cmp
		operands: { aRegisterOrMemoryOperand . aSource }
]

{ #category : #'instructions generated' }
AJx86Assembler >> cmpxchg16b: aMemoryOperand [
	"...
	"
	^ self
		addInstruction: #cmpxchg16b
		operands: { aMemoryOperand }
]

{ #category : #'instructions generated' }
AJx86Assembler >> cmpxchg8b: aMemoryOperand [
	"Compare and Exchange Bytes
	"
	^ self
		addInstruction: #cmpxchg8b
		operands: { aMemoryOperand }
]

{ #category : #'instructions generated' }
AJx86Assembler >> cmpxchg: aDestinationRegisterOrMemory with: aSourceRegister [
	"Compare and Exchange
	Pseudo Code
-----------
(* Accumulator = AL, AX, EAX, or RAX depending on whether a byte, word, doubleword, or quadword comparison is being performed *)
IF accumulator = DEST
    ZF = 1;
    DEST = SRC;
ELSE
    ZF = 0;
    accumulator = DEST;
FI;

Description
-----------
Compares the value in the AL, AX, EAX, or RAX register with the first
operand (destination operand). If the two values are equal, the second
operand (source operand) is loaded into the destination operand.
Otherwise, the destination operand is loaded into the AL, AX, EAX or RAX
register. RAX register is available only in 64-bit mode.

This instruction can be used with a LOCK prefix to allow the instruction
to be executed atomically. To simplify the interface to the processor's
bus, the destination operand receives a write cycle without regard to
the result of the comparison. The destination operand is written back if
the comparison fails; otherwise, the source operand is written into the
destination. (The processor never produces a locked read without also
producing a locked write.)

In 64-bit mode, the instruction's default operation size is 32 bits. Use
of the REX.R prefix permits access to additional registers (R8-R15). Use
of the REX.W prefix promotes operation to 64 bits. See the summary chart
at the beginning of this section for encoding data and limits.

"
	^ self
		addInstruction: #cmpxchg
		operands: { aDestinationRegisterOrMemory . aSourceRegister }
]

{ #category : #register }
AJx86Assembler >> counter [
	^ self is32BitMode
		ifTrue: [ self ECX ]
		ifFalse: [ self CX ]
]

{ #category : #'instructions generated' }
AJx86Assembler >> crc32: aRegister with: aSourceRegisterOrMemory [
	"Accumulate CRC32 Value
	Description
-----------
Starting with an initial value in the first operand (destination
operand), accumulates a CRC32 (polynomial 0x11EDC6F41) value for the
second operand (source operand) and stores the result in the destination
operand. The source operand can be a register or a memory location. The
destination operand must be an r32 or r64 register. If the destination
is an r64 register, then the 32-bit result is stored in the least
significant double word and 00000000H is stored in the most significant
double word of the r64 register.

The initial value supplied in the destination operand is a double word
integer stored in the r32 register or the least significant double word
of the r64 register. To incrementally accumulate a CRC32 value, software
retains the result of the previous CRC32 operation in the destination
operand, then executes the CRC32 instruction again with new input data
in the source operand. Data contained in the source operand is processed
in reflected bit order. This means that the most significant bit of the
source operand is treated as the least significant bit of the quotient,
and so on, for all the bits of the source operand. Likewise, the result
of the CRC operation is stored in the destination operand in reflected
bit order. This means that the most significant bit of the resulting CRC
(bit 31) is stored in the least significant bit of the destination
operand (bit 0), and so on, for all the bits of the CRC.

"
	^ self
		addInstruction: #crc32
		operands: { aRegister . aSourceRegisterOrMemory }
]

{ #category : #register }
AJx86Assembler >> data [
	^ self is32BitMode
		ifTrue: [ self EDX ]
		ifFalse: [ self DX ]
]

{ #category : #convenience }
AJx86Assembler >> db: aByteValue [
	^ self addInstruction: (AJData byte: aByteValue)
]

{ #category : #convenience }
AJx86Assembler >> dd: aByteArray [
	self assert: aByteArray size == SizeDWord.
	^ self addInstruction: (AJData data: aByteArray)
]

{ #category : #'instructions generated' }
AJx86Assembler >> dec: aRegisterOrMemory [
	"Decrement by 1
	Pseudo Code
-----------
DEST = DEST - 1;

Description
-----------
Subtracts 1 from the destination operand, while preserving the state of
the CF flag. The destination operand can be a register or a memory
location. This instruction allows a loop counter to be updated without
disturbing the CF flag. (To perform a decrement operation that updates
the CF flag, use a SUB instruction with an immediate operand of 1.)

This instruction can be used with a LOCK prefix to allow the instruction
to be executed atomically.

In 64-bit mode, DEC r16 and DEC r32 are not encodable (because opcodes
48H through 4FH are REX prefixes). Otherwise, the instruction's 64-bit
mode default operation size is 32 bits. Use of the REX.R prefix permits
access to additional registers (R8-R15). Use of the REX.W prefix
promotes operation to 64 bits.

See the summary chart at the beginning of this section for encoding data
and limits.

"
	^ self
		addInstruction: #dec
		operands: { aRegisterOrMemory }
]

{ #category : #'instruction list' }
AJx86Assembler >> decorateWith: annotation during: aBlock [

	self addInstruction: (AJInstructionDecoration new start annotation: annotation).
	decorationNestingLevel := decorationNestingLevel + 1.
	aBlock ensure: [
		decorationNestingLevel := decorationNestingLevel - 1.
		self addInstruction: (AJInstructionDecoration new end annotation: annotation) ]

]

{ #category : #register }
AJx86Assembler >> destinationIndex [
	^ self is32BitMode
		ifTrue: [ self EDI ]
		ifFalse: [ self DI ]
]

{ #category : #'instructions generated' }
AJx86Assembler >> div: aDestination [
	"Unsigned Divide
	Description
-----------
Divides unsigned the value in the AX, DX:AX, EDX:EAX, or RDX:RAX
registers (dividend) by the source operand (divisor) and stores the
result in the AX (AH:AL), DX:AX, EDX:EAX, or RDX:RAX registers. The
source operand can be a general-purpose register or a memory location.
The action of this instruction depends on the operand size
(dividend/divisor). Division using 64-bit operand is available only in
64-bit mode.

Non-integral results are truncated (chopped) towards 0. The remainder is
always less than the divisor in magnitude. Overflow is indicated with
the \#DE (divide error) exception rather than with the CF flag.

In 64-bit mode, the instruction's default operation size is 32 bits. Use
of the REX.R prefix permits access to additional registers (R8-R15). Use
of the REX.W prefix promotes operation to 64 bits. In 64-bit mode when
REX.W is applied, the instruction divides the unsigned value in RDX:RAX
by the source operand and stores the quotient in RAX, the remainder in
RDX.

See the summary chart at the beginning of this section for encoding data
and limits. See the following table.

DIV Action

Maximum

Operand Size

Dividend

Divisor

Quotient

Remainder

Quotient

Word/byte

AX

r/m8

AL

AH

255

Doubleword/word

DX:AX

r/m16

AX

DX

65,535

Quadword/doubleword

EDX:EAX

r/m32

EAX

EDX

2^32^ - 1

Doublequadword/quadword

RDX:RAX

r/m64

RAX

RDX

2^64^ - 1

"
	^ self
		addInstruction: #div
		operands: { aDestination }
]

{ #category : #dnu }
AJx86Assembler >> doesNotUnderstand: aMessage [
	"try to dispatch a message based on instruction name"

	| sel pos |
	sel := aMessage selector.
	sel isBinary ifTrue: [
		"binary selectors"
		^ super doesNotUnderstand: aMessage ].

	"use the first keyword to find the instruction"
	pos := sel indexOf: $:.
	pos > 0 ifTrue: [ sel := (sel first: pos - 1) asSymbol ].
	self instructionDescriptions at: sel ifPresent: [ :description|
		^ self addInstruction: sel description: description operands: aMessage arguments
	].

	^ super doesNotUnderstand: aMessage
]

{ #category : #convenience }
AJx86Assembler >> dq: aByteArray [
	self assert: aByteArray size == SizeQWord.
	^ self addInstruction: (AJData data: aByteArray)
]

{ #category : #convenience }
AJx86Assembler >> dw: aByteArray [
	self assert: aByteArray size == SizeWord.
	^ self addInstruction: (AJData data: aByteArray)
]

{ #category : #'instructions generated' }
AJx86Assembler >> enter: stackFrameSize with: lexicalNesting [
	"Make Stack Frame for Procedure Parameters
	Description
-----------
Creates a stack frame for a procedure. The first operand (size operand)
specifies the size of the stack frame (that is, the number of bytes of
dynamic storage allocated on the stack for the procedure). The second
operand (nesting level operand) gives the lexical nesting level (0 to
31) of the procedure. The nesting level determines the number of stack
frame pointers that are copied into the 'display area' of the new stack
frame from the preceding frame. Both of these operands are immediate
values.

The stack-size attribute determines whether the BP (16 bits), EBP (32
bits), or RBP (64 bits) register specifies the current frame pointer and
whether SP (16 bits), ESP (32 bits), or RSP (64 bits) specifies the
stack pointer. In 64-bit mode, stack-size attribute is always 64-bits.

The ENTER and companion LEAVE instructions are provided to support block
structured languages. The ENTER instruction (when used) is typically the
first instruction in a procedure and is used to set up a new stack frame
for a procedure. The LEAVE instruction is then used at the end of the
procedure (just before the RET instruction) to release the stack frame.

If the nesting level is 0, the processor pushes the frame pointer from
the BP/EBP/RBP register onto the stack, copies the current stack pointer
from the SP/ESP/RSP register into the BP/EBP/RBP register, and loads the
SP/ESP/RSP register with the current stack-pointer value minus the value
in the size operand. For nesting levels of 1 or greater, the processor
pushes additional frame pointers on the stack before adjusting the stack
pointer. These additional frame pointers provide the called procedure
with access points to other nested frames on the stack. See 'Procedure
Calls for Block-Structured Languages' in Chapter 6 of theIntel®64 and
IA-32 ArchitecturesSoftware Developer's Manual, Volume 1, for more
information about the actions of the ENTER instruction.

The ENTER instruction causes a page fault whenever a write using the
final value of the stack pointer (within the current stack segment)
would do so.

In 64-bit mode, default operation size is 64 bits; 32-bit operation size
cannot be encoded.

"
	^ self
		addInstruction: #enter
		operands: { stackFrameSize . lexicalNesting }
]

{ #category : #'instructions generated' }
AJx86Assembler >> fadd: aMemoryOperand [
	"Add
	"
	^ self
		addInstruction: #fadd
		operands: { aMemoryOperand }
]

{ #category : #'instructions generated' }
AJx86Assembler >> fadd: aX87Register1 with: aX87Register2 [
	"
	see #fadd"
	^ self
		addInstruction: #fadd
		operands: { aX87Register1 . aX87Register2 }
]

{ #category : #'instructions generated' }
AJx86Assembler >> faddp: aX87Register [
	"Add and Pop
	"
	^ self
		addInstruction: #faddp
		operands: { aX87Register }
]

{ #category : #'instructions generated' }
AJx86Assembler >> fbld: aMemoryOperand [
	"Load Binary Coded Decimal
	Pseudo Code
-----------
TOP = TOP - 1;
ST(0) = ConvertToDoubleExtendedPrecisionFP(SRC);

Description
-----------
Converts the BCD source operand into double extended-precision
floating-point format and pushes the value onto the FPU stack. The
source operand is loaded without rounding errors. The sign of the source
operand is preserved, including that of -0.

The packed BCD digits are assumed to be in the range 0 through 9; the
instruction does not check for invalid digits (AH through FH).
Attempting to load an invalid encoding produces an undefined result.

This instruction's operation is the same in non-64-bit modes and 64-bit
mode.

"
	^ self
		addInstruction: #fbld
		operands: { aMemoryOperand }
]

{ #category : #'instructions generated' }
AJx86Assembler >> fbstp: aMemoryOperand [
	"Store BCD Integer and Pop
	Pseudo Code
-----------
DEST = BCD(ST(0));
PopRegisterStack;

Description
-----------
Converts the value in the ST(0) register to an 18-digit packed BCD
integer, stores the result in the destination operand, and pops the
register stack. If the source value is a non-integral value, it is
rounded to an integer value, according to rounding mode specified by the
RC field of the FPU control word. To pop the register stack, the
processor marks the ST(0) register as empty and increments the stack
pointer (TOP) by 1.

The destination operand specifies the address where the first byte
destination value is to be stored. The BCD value (including its sign
bit) requires 10 bytes of space in memory.

The following table shows the results obtained when storing various
classes of numbers in packed BCD format.

  ST(0)                                    DEST
  ---------------------------------------- ------
  - = or Value Too Large for DEST Format   \*
  F \<= - 1                                - D
  -1 \< F \< -0                            \*\*
  - 0                                      - 0
  + 0                                      + 0
  + 0 \< F \< +1                           \*\*
  F \>= +1                                 + D
  + = or Value Too Large for DEST Format   \*
  NaN                                      \*

  : FBSTP Results

-   Notes:
-   F refers to a finite floating-point value.
-   D refers to packed-BCD number.
-   \* Indicates floating-point invalid-operation (\#IA) exception.
-   \*\* ±0 or ±1, depending on the rounding mode.

If the converted value is too large for the destination format, or if
the source operand is an ∞, SNaN, QNAN, or is in an unsupported format,
an invalid-arithmetic-operand condition is signaled. If the
invalid-operation exception is not masked, an invalidarithmetic-operand
exception (\#IA) is generated and no value is stored in the desti-nation
operand. If the invalid-operation exception is masked, the packed BCD
indefinite value is stored in memory.

This instruction's operation is the same in non-64-bit modes and 64-bit
mode.

"
	^ self
		addInstruction: #fbstp
		operands: { aMemoryOperand }
]

{ #category : #'instructions generated' }
AJx86Assembler >> fcmovb: aX87Register [
	"FP Conditional Move - below (CF=1)
	"
	^ self
		addInstruction: #fcmovb
		operands: { aX87Register }
]

{ #category : #'instructions generated' }
AJx86Assembler >> fcmovbe: aX87Register [
	"FP Conditional Move - below or equal (CF=1 or ZF=1)
	"
	^ self
		addInstruction: #fcmovbe
		operands: { aX87Register }
]

{ #category : #'instructions generated' }
AJx86Assembler >> fcmove: aX87Register [
	"FP Conditional Move - equal (ZF=1)
	"
	^ self
		addInstruction: #fcmove
		operands: { aX87Register }
]

{ #category : #'instructions generated' }
AJx86Assembler >> fcmovnb: aX87Register [
	"FP Conditional Move - not below (CF=0)
	"
	^ self
		addInstruction: #fcmovnb
		operands: { aX87Register }
]

{ #category : #'instructions generated' }
AJx86Assembler >> fcmovnbe: aX87Register [
	"FP Conditional Move - below or equal (CF=0 and ZF=0)
	"
	^ self
		addInstruction: #fcmovnbe
		operands: { aX87Register }
]

{ #category : #'instructions generated' }
AJx86Assembler >> fcmovne: aX87Register [
	"FP Conditional Move - not equal (ZF=0)
	"
	^ self
		addInstruction: #fcmovne
		operands: { aX87Register }
]

{ #category : #'instructions generated' }
AJx86Assembler >> fcmovnu: aX87Register [
	"FP Conditional Move - not unordered (PF=0)
	"
	^ self
		addInstruction: #fcmovnu
		operands: { aX87Register }
]

{ #category : #'instructions generated' }
AJx86Assembler >> fcmovu: aX87Register [
	"FP Conditional Move - unordered (PF=1)
	"
	^ self
		addInstruction: #fcmovu
		operands: { aX87Register }
]

{ #category : #'instructions generated' }
AJx86Assembler >> fcom: aMemoryOperand [
	"Compare Real
	"
	^ self
		addInstruction: #fcom
		operands: { aMemoryOperand }
]

{ #category : #'instructions generated' }
AJx86Assembler >> fcom: aX87Register1 with: aX87Register2 [
	"
	see #fcom"
	^ self
		addInstruction: #fcom
		operands: { aX87Register1 . aX87Register2 }
]

{ #category : #'instructions generated' }
AJx86Assembler >> fcomi: aX87Register [
	"Compare Floating Point Values and Set EFLAGS
	"
	^ self
		addInstruction: #fcomi
		operands: { aX87Register }
]

{ #category : #'instructions generated' }
AJx86Assembler >> fcomip: aX87Register [
	"Compare Floating Point Values and Set EFLAGS and Pop
	"
	^ self
		addInstruction: #fcomip
		operands: { aX87Register }
]

{ #category : #'instructions generated' }
AJx86Assembler >> fcomp: aMemoryOperand [
	"Compare Real and Pop
	"
	^ self
		addInstruction: #fcomp
		operands: { aMemoryOperand }
]

{ #category : #'instructions generated' }
AJx86Assembler >> fcomp: aX87Register1 with: aX87Register2 [
	"
	see #fcomp"
	^ self
		addInstruction: #fcomp
		operands: { aX87Register1 . aX87Register2 }
]

{ #category : #'instructions generated' }
AJx86Assembler >> fdiv: aMemoryOperand [
	"Divide
	"
	^ self
		addInstruction: #fdiv
		operands: { aMemoryOperand }
]

{ #category : #'instructions generated' }
AJx86Assembler >> fdiv: aX87Register1 with: aX87Register2 [
	"
	see #fdiv"
	^ self
		addInstruction: #fdiv
		operands: { aX87Register1 . aX87Register2 }
]

{ #category : #'instructions generated' }
AJx86Assembler >> fdivp: aX87Register [
	"Divide and Pop
	"
	^ self
		addInstruction: #fdivp
		operands: { aX87Register }
]

{ #category : #'instructions generated' }
AJx86Assembler >> fdivr: aMemoryOperand [
	"Reverse Divide
	"
	^ self
		addInstruction: #fdivr
		operands: { aMemoryOperand }
]

{ #category : #'instructions generated' }
AJx86Assembler >> fdivr: aX87Register1 with: aX87Register2 [
	"
	see #fdivr"
	^ self
		addInstruction: #fdivr
		operands: { aX87Register1 . aX87Register2 }
]

{ #category : #'instructions generated' }
AJx86Assembler >> fdivrp: aX87Register [
	"Reverse Divide and Pop
	"
	^ self
		addInstruction: #fdivrp
		operands: { aX87Register }
]

{ #category : #'instructions generated' }
AJx86Assembler >> ffree: aX87Register [
	"Free Floating-Point Register
	"
	^ self
		addInstruction: #ffree
		operands: { aX87Register }
]

{ #category : #'instructions generated' }
AJx86Assembler >> fiadd: aMemoryOperand [
	"Add
	"
	^ self
		addInstruction: #fiadd
		operands: { aMemoryOperand }
]

{ #category : #'instructions generated' }
AJx86Assembler >> ficom: aMemoryOperand [
	"Compare Integer
	"
	^ self
		addInstruction: #ficom
		operands: { aMemoryOperand }
]

{ #category : #'instructions generated' }
AJx86Assembler >> ficomp: aMemoryOperand [
	"Compare Integer and Pop
	"
	^ self
		addInstruction: #ficomp
		operands: { aMemoryOperand }
]

{ #category : #'instructions generated' }
AJx86Assembler >> fidiv: aMemoryOperand [
	"Divide
	"
	^ self
		addInstruction: #fidiv
		operands: { aMemoryOperand }
]

{ #category : #'instructions generated' }
AJx86Assembler >> fidivr: aMemoryOperand [
	"Reverse Divide
	"
	^ self
		addInstruction: #fidivr
		operands: { aMemoryOperand }
]

{ #category : #'instructions generated' }
AJx86Assembler >> fild: aMemoryOperand [
	"Load Integer
	Pseudo Code
-----------
TOP = TOP - 1;
ST(0) = ConvertToDoubleExtendedPrecisionFP(SRC);

Description
-----------
Converts the signed-integer source operand into double
extended-precision floating-point format and pushes the value onto the
FPU register stack. The source operand can be a word, doubleword, or
quadword integer. It is loaded without rounding errors. The sign of the
source operand is preserved.

This instruction's operation is the same in non-64-bit modes and 64-bit
mode.

"
	^ self
		addInstruction: #fild
		operands: { aMemoryOperand }
]

{ #category : #'instructions generated' }
AJx86Assembler >> fimul: aMemoryOperand [
	"Multiply
	"
	^ self
		addInstruction: #fimul
		operands: { aMemoryOperand }
]

{ #category : #'instructions generated' }
AJx86Assembler >> fist: aMemoryOperand [
	"Store Integer
	"
	^ self
		addInstruction: #fist
		operands: { aMemoryOperand }
]

{ #category : #'instructions generated' }
AJx86Assembler >> fistp: aMemoryOperand [
	"Store Integer and Pop
	"
	^ self
		addInstruction: #fistp
		operands: { aMemoryOperand }
]

{ #category : #'instructions generated' }
AJx86Assembler >> fisttp: aMemoryOperand [
	"Store Integer with Truncation and Pop
	Pseudo Code
-----------
DEST = ST;
pop ST;

Description
-----------
FISTTP converts the value in ST into a signed integer using truncation
(chop) as rounding mode, transfers the result to the destination, and
pop ST. FISTTP accepts word, short integer, and long integer
destinations.

The following table shows the results obtained when storing various
classes of numbers in integer format.

  ST(0)                                   DEST
  --------------------------------------- ------
  -∞ or Value Too Large for DEST Format   \*
  F ≤ - 1                                 - I
  - 1 \< F \< + 1                         0
  F ≥ + 1                                 + I
  +∞ or Value Too Large for DEST Format   \*
  NaN                                     \*

  : FISTTP Results

-   Notes
-   F means finite floating-point value.
-   I means integer.
-   Indicates floating-point invalid-operation (\#IA) exception.

This instruction's operation is the same in non-64-bit modes and 64-bit
mode.

"
	^ self
		addInstruction: #fisttp
		operands: { aMemoryOperand }
]

{ #category : #'instructions generated' }
AJx86Assembler >> fisub: aMemoryOperand [
	"Subtract
	"
	^ self
		addInstruction: #fisub
		operands: { aMemoryOperand }
]

{ #category : #'instructions generated' }
AJx86Assembler >> fisubr: aMemoryOperand [
	"Reverse Subtract
	"
	^ self
		addInstruction: #fisubr
		operands: { aMemoryOperand }
]

{ #category : #'instructions generated' }
AJx86Assembler >> fld: aMemoryOrX87Register [
	"Load Floating Point Value
	Description
-----------
Pushes the source operand onto the FPU register stack. The source
operand can be in single-precision, double-precision, or double
extended-precision floating-point format. If the source operand is in
single-precision or double-precision floating-point format, it is
automatically converted to the double extended-precision floating-point
format before being pushed on the stack.

The FLD instruction can also push the value in a selected FPU register
[ST(i)] onto the stack. Here, pushing register ST(0) duplicates the
stack top.

This instruction's operation is the same in non-64-bit modes and 64-bit
mode.

"
	^ self
		addInstruction: #fld
		operands: { aMemoryOrX87Register }
]

{ #category : #'instructions generated' }
AJx86Assembler >> fldcw: aMemoryOperand [
	"Load x87 FPU Control Word
	"
	^ self
		addInstruction: #fldcw
		operands: { aMemoryOperand }
]

{ #category : #'instructions generated' }
AJx86Assembler >> fldenv: aMemoryOperand [
	"Load x87 FPU Environment
	Pseudo Code
-----------
FPUControlWord = SRC[FPUControlWord];
FPUStatusWord = SRC[FPUStatusWord];
FPUTagWord = SRC[FPUTagWord];
FPUDataPointer = SRC[FPUDataPointer];
FPUInstructionPointer = SRC[FPUInstructionPointer];
FPULastInstructionOpcode = SRC[FPULastInstructionOpcode];

Description
-----------
Loads the complete x87 FPU operating environment from memory into the
FPU registers. The source operand specifies the first byte of the
operating-environment data in memory. This data is typically written to
the specified memory location by a FSTENV or FNSTENV instruction.

The FPU operating environment consists of the FPU control word, status
word, tag word, instruction pointer, data pointer, and last opcode.
Figures 8-9 through 8-12 in the Intel® 64 and IA-32 Architectures
Software Developer's Manual, Volume 1, show the layout in memory of the
loaded environment, depending on the operating mode of the processor
(protected or real) and the current operand-size attribute (16-bit or
32-bit). In virtual-8086 mode, the real mode layouts are used.

The FLDENV instruction should be executed in the same operating mode as
the corresponding FSTENV/FNSTENV instruction.

If one or more unmasked exception flags are set in the new FPU status
word, a floating-point exception will be generated upon execution of the
next floating-point instruction (except for the no-wait floating-point
instructions, see the section titled 'Software Exception Handling' in
Chapter 8 of the Intel®64 and IA-32 ArchitecturesSoftware Developer's
Manual, Volume 1). To avoid generating exceptions when loading a new
environment, clear all the exception flags in the FPU status word that
is being loaded.

If a page or limit fault occurs during the execution of this
instruction, the state of the x87 FPU registers as seen by the fault
handler may be different than the state being loaded from memory. In
such situations, the fault handler should ignore the status of the x87
FPU registers, handle the fault, and return. The FLDENV instruction will
then complete the loading of the x87 FPU registers with no resulting
context inconsistency.

This instruction's operation is the same in non-64-bit modes and 64-bit
mode.

"
	^ self
		addInstruction: #fldenv
		operands: { aMemoryOperand }
]

{ #category : #'instructions generated' }
AJx86Assembler >> fmul: aMemoryOperand [
	"Multiply
	"
	^ self
		addInstruction: #fmul
		operands: { aMemoryOperand }
]

{ #category : #'instructions generated' }
AJx86Assembler >> fmul: aX87Register1 with: aX87Register2 [
	"
	see #fmul"
	^ self
		addInstruction: #fmul
		operands: { aX87Register1 . aX87Register2 }
]

{ #category : #'instructions generated' }
AJx86Assembler >> fmulp: aX87Register [
	"Multiply and Pop
	"
	^ self
		addInstruction: #fmulp
		operands: { aX87Register }
]

{ #category : #'instructions generated' }
AJx86Assembler >> fnsave: aMemoryOperand [
	"Store x87 FPU State
	"
	^ self
		addInstruction: #fnsave
		operands: { aMemoryOperand }
]

{ #category : #'instructions generated' }
AJx86Assembler >> fnstcw: aMemoryOperand [
	"Store x87 FPU Control Word
	"
	^ self
		addInstruction: #fnstcw
		operands: { aMemoryOperand }
]

{ #category : #'instructions generated' }
AJx86Assembler >> fnstenv: aMemoryOperand [
	"Store x87 FPU Environment
	"
	^ self
		addInstruction: #fnstenv
		operands: { aMemoryOperand }
]

{ #category : #'instructions generated' }
AJx86Assembler >> frstor: aMemoryOperand [
	"Restore x87 FPU State
	Description
-----------
Loads the FPU state (operating environment and register stack) from the
memory area specified with the source operand. This state data is
typically written to the specified memory location by a previous
FSAVE/FNSAVE instruction.

The FPU operating environment consists of the FPU control word, status
word, tag word, instruction pointer, data pointer, and last opcode.
Figures 8-9 through 8-12 in the Intel® 64 and IA-32 Architectures
Software Developer's Manual, Volume 1, show the layout in memory of the
stored environment, depending on the operating mode of the processor
(protected or real) and the current operand-size attribute (16-bit or
32-bit). In virtual-8086 mode, the real mode layouts are used. The
contents of the FPU register stack are stored in the 80 bytes
immediately following the operating environment image.

The FRSTOR instruction should be executed in the same operating mode as
the corresponding FSAVE/FNSAVE instruction.

If one or more unmasked exception bits are set in the new FPU status
word, a floating-point exception will be generated. To avoid raising
exceptions when loading a new operating environment, clear all the
exception flags in the FPU status word that is being loaded.

This instruction's operation is the same in non-64-bit modes and 64-bit
mode.

"
	^ self
		addInstruction: #frstor
		operands: { aMemoryOperand }
]

{ #category : #'instructions generated' }
AJx86Assembler >> fsave: aMemoryOperand [
	"Store x87 FPU State
	"
	^ self
		addInstruction: #fsave
		operands: { aMemoryOperand }
]

{ #category : #'instructions generated' }
AJx86Assembler >> fst: aMemoryOrX87Register [
	"Store Floating Point Value
	"
	^ self
		addInstruction: #fst
		operands: { aMemoryOrX87Register }
]

{ #category : #'instructions generated' }
AJx86Assembler >> fstcw: aMemoryOperand [
	"Store x87 FPU Control Word
	"
	^ self
		addInstruction: #fstcw
		operands: { aMemoryOperand }
]

{ #category : #'instructions generated' }
AJx86Assembler >> fstenv: aMemoryOperand [
	"Store x87 FPU Environment
	"
	^ self
		addInstruction: #fstenv
		operands: { aMemoryOperand }
]

{ #category : #'instructions generated' }
AJx86Assembler >> fstp: aMemoryOrX87Register [
	"Store Floating Point Value and Pop
	"
	^ self
		addInstruction: #fstp
		operands: { aMemoryOrX87Register }
]

{ #category : #'instructions generated' }
AJx86Assembler >> fsub: aMemoryOperand [
	"Subtract
	"
	^ self
		addInstruction: #fsub
		operands: { aMemoryOperand }
]

{ #category : #'instructions generated' }
AJx86Assembler >> fsub: aX87Register1 with: aX87Register2 [
	"
	see #fsub"
	^ self
		addInstruction: #fsub
		operands: { aX87Register1 . aX87Register2 }
]

{ #category : #'instructions generated' }
AJx86Assembler >> fsubp: aX87Register [
	"Subtract and Pop
	"
	^ self
		addInstruction: #fsubp
		operands: { aX87Register }
]

{ #category : #'instructions generated' }
AJx86Assembler >> fsubr: aMemoryOperand [
	"Reverse Subtract
	"
	^ self
		addInstruction: #fsubr
		operands: { aMemoryOperand }
]

{ #category : #'instructions generated' }
AJx86Assembler >> fsubr: aX87Register1 with: aX87Register2 [
	"
	see #fsubr"
	^ self
		addInstruction: #fsubr
		operands: { aX87Register1 . aX87Register2 }
]

{ #category : #'instructions generated' }
AJx86Assembler >> fsubrp: aX87Register [
	"Reverse Subtract and Pop
	"
	^ self
		addInstruction: #fsubrp
		operands: { aX87Register }
]

{ #category : #'instructions generated' }
AJx86Assembler >> fucom: aX87Register [
	"Unordered Compare Floating Point Values
	"
	^ self
		addInstruction: #fucom
		operands: { aX87Register }
]

{ #category : #'instructions generated' }
AJx86Assembler >> fucomi: aX87Register [
	"Unordered Compare Floating Point Values and Set EFLAGS
	"
	^ self
		addInstruction: #fucomi
		operands: { aX87Register }
]

{ #category : #'instructions generated' }
AJx86Assembler >> fucomip: aX87Register [
	"Unordered Compare Floating Point Values and Set EFLAGS and Pop
	"
	^ self
		addInstruction: #fucomip
		operands: { aX87Register }
]

{ #category : #'instructions generated' }
AJx86Assembler >> fucomp: aX87Register [
	"Unordered Compare Floating Point Values and Pop
	"
	^ self
		addInstruction: #fucomp
		operands: { aX87Register }
]

{ #category : #'instructions generated' }
AJx86Assembler >> fxch: aX87Register [
	"Exchange Register Contents
	Description
-----------
Exchanges the contents of registers ST(0) and ST(i). If no source
operand is specified, the contents of ST(0) and ST(1) are exchanged.

This instruction provides a simple means of moving values in the FPU
register stack to the top of the stack [ST(0)], so that they can be
operated on by those floating-point instructions that can only operate
on values in ST(0). For example, the following instruction sequence
takes the square root of the third register from the top of the register
stack:

    FXCH ST(3);
    FSQRT;
    FXCH ST(3);

This instruction's operation is the same in non-64-bit modes and 64-bit
mode.

"
	^ self
		addInstruction: #fxch
		operands: { aX87Register }
]

{ #category : #'instructions generated' }
AJx86Assembler >> fxrstor: aMemoryOperand [
	"Restore x87 FPU, MMX, XMM, and MXCSR State
	Pseudo Code
-----------
(x87 FPU, MMX, XMM7-XMM0, MXCSR) = Load(SRC);

Description
-----------
Reloads the x87 FPU, MMX technology, XMM, and MXCSR registers from the
512-byte memory image specified in the source operand. This data should
have been written to memory previously using the FXSAVE instruction, and
in the same format as required by the operating modes. The first byte of
the data should be located on a 16-byte boundary. There are three
distinct layouts of the FXSAVE state map: one for legacy and
compatibility mode, a second format for 64-bit mode FXSAVE/FXRSTOR with
REX.W=0, and the third format is for 64-bit mode with
FXSAVE64/FXRSTOR64. Table 3-48 ('Non-64-bit-Mode Layout of FXSAVE and
FXRSTOR Memory Region') shows the layout of the legacy/compatibility
mode state information inmemory and describes the fields in the memory
image for the FXRSTOR and FXSAVE instructions.Table 3-51 shows the
layout of the 64-bit mode state information whenREX.W is set
(FXSAVE64/FXRSTOR64). Table 3-52 shows the layout of the 64-bitmode
state information when REX.W is clear (FXSAVE/FXRSTOR).

The state image referenced with an FXRSTOR instruction must have been
saved using an FXSAVE instruction or be in the same format as required
by Table 3-48, Table 3-51, or Table 3-52. Referencing a state image
saved with an FSAVE, FNSAVEinstruction or incompatible field layout will
result in an incorrect state restoration.

The FXRSTOR instruction does not flush pending x87 FPU exceptions. To
check and raise exceptions when loading x87 FPU state information with
the FXRSTOR instruction, use an FWAIT instruction after the FXRSTOR
instruction.

If the OSFXSR bit in control register CR4 is not set, the FXRSTOR
instruction may not restore the states of the XMM and MXCSR registers.
This behavior is implementation dependent.

If the MXCSR state contains an unmasked exception with a corresponding
status flag also set, loading the register with the FXRSTOR instruction
will not result in a SIMD floating-point error condition being
generated. Only the next occurrence of this unmasked exception will
result in the exception being generated.

Bits 16 through 32 of the MXCSR register are defined as reserved and
should be set to 0. Attempting to write a 1 in any of these bits from
the saved state image will result in a general protection exception
(\#GP) being generated.

Bytes 464:511 of an FXSAVE image are available for software use. FXRSTOR
ignores the content of bytes 464:511 in an FXSAVE state image.

"
	^ self
		addInstruction: #fxrstor
		operands: { aMemoryOperand }
]

{ #category : #'instructions generated' }
AJx86Assembler >> fxsave: aMemoryOperand [
	"Save x87 FPU, MMX, XMM, and MXCSR State
	Description
-----------
Saves the current state of the x87 FPU, MMX technology, XMM, and MXCSR
registers to a 512-byte memory location specified in the destination
operand. The content layout of the 512 byte region depends on whether
the processor is operating in non-64-bit operating modes or 64-bit
sub-mode of IA-32e mode.

Bytes 464:511 are available to software use. The processor does not
write to bytes 464:511 of an FXSAVE area.

The operation of FXSAVE in non-64-bit modes is described first.

### Non-64-Bit Mode Operation

The following table shows the layout of the state information in memory
when the processoris operating in legacy modes.

  ------------- --------- -------- ----- -------- ----- ----- ----- --- --- --- --- --- --- --- --- --
  15            14        13       12    11       10    9     8     7   6   5   4   3   2   1   0
  Rsrvd         CS        FPU IP   FOP   Rs rvd   FTW   FSW   FCW   0
  MXCSR\_MASK   MXCSR     Rsrvd    DS    FPU DP   16
  Reserved      ST0/MM0   32
  Reserved      ST1/MM1   48
  Reserved      ST2/MM2   64
  Reserved      ST3/MM3   80
  Reserved      ST4/MM4   96
  Reserved      ST5/MM5   112
  Reserved      ST6/MM6   128
  Reserved      ST7/MM7   144
  XMM0          160
  XMM1          176
  XMM2          192
  XMM3          208
  XMM4          224
  XMM5          240
  XMM6          256
  XMM7          272
  Reserved      288
  Reserved      304
  Reserved      320
  Reserved      336
  Reserved      352
  Reserved      368
  Reserved      384
  Reserved      400
  Reserved      416
  Reserved      432
  Reserved      448
  Available     464
  Available     480
  Available     496
  ------------- --------- -------- ----- -------- ----- ----- ----- --- --- --- --- --- --- --- --- --

  : Non-64-bit-Mode Layout of FXSAVE and FXRSTOR Memory Region

The destination operand contains the first byte of the memory image, and
it must be aligned on a 16-byte boundary. A misaligned destination
operand will result in a general-protection (\#GP) exception being
generated (or in some cases, an alignment check exception [\#AC]).

The FXSAVE instruction is used when an operating system needs to perform
a context switch or when an exception handler needs to save and examine
the current state of the x87 FPU, MMX technology, and/or XMM and MXCSR
registers.

The fields used in the previous table are defined in the following
table.

Field Definitions

Field

Definition

FCW

x87 FPU Control Word (16 bits). See Figure 8-6 in the Intel® 64 and
IA-32 Architectures Software Developer's Manual, Volume 1, for the
layout of the x87 FPU control word.

FSW

x87 FPU Status Word (16 bits). See Figure 8-4 in the Intel® 64 and IA-32
Architectures Software Developer's Manual, Volume 1, for the layout of
the x87 FPU status word.

Abridged FTW

x87 FPU Tag Word (8 bits). The tag information saved here is abridged,
as described in the following paragraphs.

FOP

x87 FPU Opcode (16 bits). The lower 11 bits of this field contain the
opcode, upper 5 bits are reserved. See Figure 8-8 in the Intel® 64 and
IA-32 Architectures Software Developer's Manual, Volume 1, for the
layout of the x87 FPU opcode field.

FPU IP

x87 FPU Instruction Pointer Offset (32 bits). The contents of this field
differ depending on the current addressing mode (32-bit or 16-bit) of
the processor when the FXSAVE instruction was executed:

-   32-bit mode — 32-bit IP offset.
-   16-bit mode — low 16 bits are IP offset; high 16 bits are reserved.

See 'x87 FPU Instruction and Operand (Data) Pointers' in Chapter 8 of
the Intel® 64 and IA-32 Architectures Software Developer's Manual,
Volume 1, for a description of the x87 FPU instruction pointer.

CS

x87 FPU Instruction Pointer Selector (16 bits).

FPU DP

x87 FPU Instruction Operand (Data) Pointer Offset (32 bits). The
contents of this field differ depending on the current addressing mode
(32-bit or 16bit) of the processor when the FXSAVE instruction was
executed:

-   32-bit mode — 32-bit DP offset.
-   16-bit mode — low 16 bits are DP offset; high 16 bits are reserved.

See 'x87 FPU Instruction and Operand (Data) Pointers' in Chapter 8 of
the Intel® 64 and IA-32 Architectures Software Developer's Manual,
Volume 1, for a description of the x87 FPU operand pointer.

DS

x87 FPU Instruction Operand (Data) Pointer Selector (16 bits).

MXCSR

MXCSR Register State (32 bits). See Figure 10-3 in the Intel® 64 and
IA-32 Architectures Software Developer's Manual, Volume 1, for the
layout of the MXCSR register. If the OSFXSR bit in control register CR4
is not set, the FXSAVE instruction may not save this register. This
behavior is implementation dependent.

MXCSR\_

MXCSR\_MASK (32 bits). This mask can be used to adjust values written to

MASK

the MXCSR register, ensuring that reserved bits are set to 0. Set the
mask bits and flags in MXCSR to the mode of operation desired for SSE
and SSE2 SIMD floating-point instructions. See 'Guidelines for Writing
to the MXCSR Register' in Chapter 11 of the Intel® 64 and IA-32
Architectures Software Developer's Manual, Volume 1, for instructions
for how to determine and use the MXCSR\_MASK value.

ST0/MM0 through

x87 FPU or MMX technology registers. These 80-bit fields contain the x87

ST7/MM7

FPU data registers or the MMX technology registers, depending on the
state of the processor prior to the execution of the FXSAVE instruction.
If the processor had been executing x87 FPU instruction prior to the
FXSAVE instruction, the x87 FPU data registers are saved; if it had been
executing MMX instructions (or SSE or SSE2 instructions that operated on
the MMX technology registers), the MMX technology registers are saved.
When the MMX technology registers are saved, the high 16 bits of the
field are reserved.

XMM0 through XMM7

XMM registers (128 bits per field). If the OSFXSR bit in control
register CR4 is not set, the FXSAVE instruction may not save these
registers. This behavior is implementation dependent.

The FXSAVE instruction saves an abridged version of the x87 FPU tag word
in the FTW field (unlike the FSAVE instruction, which saves the complete
tag word). The tag information is saved in physical register order (R0
through R7), rather than in top-ofstack (TOS) order. With the FXSAVE
instruction, however, only a single bit (1 for valid or 0 for empty) is
saved for each tag. For example, assume that the tag word is currently
set as follows:

  ---- ---- ---- ---- ---- ---- ---- ----
  R7   R6   R5   R4   R3   R2   R1   R0
  11   xx   xx   xx   11   11   11   11
  ---- ---- ---- ---- ---- ---- ---- ----

Here, 11B indicates empty stack elements and 'xx' indicates valid (00B),
zero (01B), or special (10B).

For this example, the FXSAVE instruction saves only the following 8 bits
of information:

  ---- ---- ---- ---- ---- ---- ---- ----
  R7   R6   R5   R4   R3   R2   R1   R0
  0    1    1    1    0    0    0    0
  ---- ---- ---- ---- ---- ---- ---- ----

Here, a 1 is saved for any valid, zero, or special tag, and a 0 is saved
for any empty tag.

The operation of the FXSAVE instruction differs from that of the FSAVE
instruction, the as follows:

-   FXSAVE instruction does not check for pending unmasked
    floating-point exceptions. (The FXSAVE operation in this regard is
    similar to the operation of the FNSAVE instruction).
-   After the FXSAVE instruction has saved the state of the x87 FPU, MMX
    technology, XMM, and MXCSR registers, the processor retains the
    contents of the registers. Because of this behavior, the FXSAVE
    instruction cannot be used by an application program to pass a
    'clean' x87 FPU state to a procedure, since it retains the current
    state. To clean the x87 FPU state, an application must explicitly
    execute an FINIT instruction after an FXSAVE instruction to
    reinitialize the x87 FPU state.
-   The format of the memory image saved with the FXSAVE instruction is
    the same regardless of the current addressing mode (32-bit or
    16-bit) and operating mode (protected, real address, or system
    management). This behavior differs from the FSAVE instructions,
    where the memory image format is different depending on the
    addressing mode and operating mode. Because of the different image
    formats, the memory image saved with the FXSAVE instruction cannot
    be restored correctly with the FRSTOR instruction, and likewise the
    state saved with the FSAVE instruction cannot be restored correctly
    with the FXRSTOR instruction.

The FSAVE format for FTW can be recreated from the FTW valid bits and
the stored 80-bit FP data (assuming the stored data was not the contents
of MMX technology registers) using Table 3-50.

  Exponent all 1's                    Exponent all 0's   Fraction all 0's   J and M bits   FTW valid bit   x87 FTW
  ----------------------------------- ------------------ ------------------ -------------- --------------- --------- ----
  0                                   0                  0                  0x             1               Special   10
  0                                   0                  0                  1x             1               Valid     00
  0                                   0                  1                  00             1               Special   10
  0                                   0                  1                  10             1               Valid     00
  0                                   1                  0                  0x             1               Special   10
  0                                   1                  0                  1x             1               Special   10
  0                                   1                  1                  00             1               Zero      01
  0                                   1                  1                  10             1               Special   10
  1                                   0                  0                  1x             1               Special   10
  1                                   0                  0                  1x             1               Special   10
  1                                   0                  1                  00             1               Special   10
  1                                   0                  1                  10             1               Special   10
  For all legal combinations above.   0                  Empty              11

  : Recreating FSAVE Format

The J-bit is defined to be the 1-bit binary integer to the left of the
decimal place in the significand. The M-bit is defined to be the most
significant bit of the fractional portion of the significand (i.e., the
bit immediately to the right of the decimal place).

When the M-bit is the most significant bit of the fractional portion of
the significand, it must be 0 if the fraction is all 0's.

### IA-32e Mode Operation

In compatibility sub-mode of IA-32e mode, legacy SSE registers, XMM0
through XMM7, are saved according to the legacy FXSAVE map. In 64-bit
mode, all of the SSE registers, XMM0 through XMM15, are saved.
Additionally, there are two different layouts of the FXSAVE map in
64-bit mode, corresponding to FXSAVE64 (which requires REX.W=1) and
FXSAVE (REX.W=0). In the FXSAVE64 map (following table), theFPU IP and
FPU DP pointers are 64-bit wide. In the FXSAVE map for 64-bit mode (see
the following tables), the FPU IP and FPU DP pointers are 32-bits.

  ------------- --------- ---------- ----- ----- ----- --- --- --- --- --- --- --- --- --- --- --
  15            14        13         12    11    10    9   8   7   6   5   4   3   2   1   0
  FPU IP        FOP       Reserved   FTW   FSW   FCW   0
  MXCSR\_MASK   MXCSR     FPU DP     16
  Reserved      ST0/MM0   32
  Reserved      ST1/MM1   48
  Reserved      ST2/MM2   64
  Reserved      ST3/MM3   80
  Reserved      ST4/MM4   96
  Reserved      ST5/MM5   112
  Reserved      ST6/MM6   128
  Reserved      ST7/MM7   144
  XMM0          160
  XMM1          176
  XMM2          192
  XMM3          208
  XMM4          224
  XMM5          240
  XMM6          256
  XMM7          272
  XMM8          288
  XMM9          304
  XMM10         320
  XMM11         336
  XMM12         352
  XMM13         368
  XMM14         384
  XMM15         400
  Reserved      416
  Reserved      432
  Reserved      448
  Available     464
  Available     480
  Available     496
  ------------- --------- ---------- ----- ----- ----- --- --- --- --- --- --- --- --- --- --- --

  : Layout of the 64-bit-mode FXSAVE64 Map (requires REX.W = 1)

  ------------- --------- ---------- -------- ---------- ----- ----- ----- --- --- --- --- --- --- --- --- --
  15            14        13         12       11         10    9     8     7   6   5   4   3   2   1   0
  Reserved      CS        FPU IP     FOP      Reserved   FTW   FSW   FCW   0
  MXCSR\_MASK   MXCSR     Reserved   FPU DP   16
  Reserved      ST0/MM0   32
  Reserved      ST1/MM1   48
  Reserved      ST2/MM2   64
  Reserved      ST3/MM3   80
  ------------- --------- ---------- -------- ---------- ----- ----- ----- --- --- --- --- --- --- --- --- --

  : Layout of the 64-bit-mode FXSAVE Map (REX.W = 0)

Reserved

ST4/MM4

96

Reserved

ST5/MM5

112

Reserved

ST6/MM6

128

Reserved

ST7/MM7

144

XMM0

160

XMM1

176

XMM2

192

XMM3

208

XMM4

224

XMM5

240

XMM6

256

XMM7

272

XMM8

288

XMM9

304

XMM10

320

XMM11

336

XMM12

352

XMM13

368

XMM14

384

XMM15

400

Reserved

416

Reserved

432

Reserved

448

Available

464

Available

480

Available

496

"
	^ self
		addInstruction: #fxsave
		operands: { aMemoryOperand }
]

{ #category : #debugging }
AJx86Assembler >> gccDisassemble [
	^ self gccDisassemble: self bytes.
]

{ #category : #testing }
AJx86Assembler >> hasLabelNamed: aName [

	^ labels includesKey: aName
]

{ #category : #'instructions generated' }
AJx86Assembler >> idiv: aDestination [
	"Signed Divide
	Description
-----------
Divides the (signed) value in the AX, DX:AX, or EDX:EAX (dividend) by
the source operand (divisor) and stores the result in the AX (AH:AL),
DX:AX, or EDX:EAX registers. The source operand can be a general-purpose
register or a memory location. The action of this instruction depends on
the operand size (dividend/divisor).

Non-integral results are truncated (chopped) towards 0. The remainder is
always less than the divisor in magnitude. Overflow is indicated with
the \#DE (divide error) exception rather than with the CF flag.

In 64-bit mode, the instruction's default operation size is 32 bits. Use
of the REX.R prefix permits access to additional registers (R8-R15). Use
of the REX.W prefix promotes operation to 64 bits. In 64-bit mode when
REX.W is applied, the instruction divides the signed value in RDX:RAX by
the source operand. RAX contains a 64-bit quotient; RDX contains a
64-bit remainder.

See the summary chart at the beginning of this section for encoding data
and limits. See the following.

  Operand Size              Dividend   Divisor   Quotient   Remainder   Quotient Range
  ------------------------- ---------- --------- ---------- ----------- ---------------------
  Word/byte                 AX         r/m8      AL         AH          -128 to +127
  Doubleword/word           DX:AX      r/m16     AX         DX          -32,768 to +32,767
  Quadword/doubleword       EDX:EAX    r/m32     EAX        EDX         -2^31^ to 2^32^ - 1
  Doublequadword/quadword   RDX:RAX    r/m64     RAX        RDX         -2^63^ to 2^64^ - 1

  : IDIV Results

"
	^ self
		addInstruction: #idiv
		operands: { aDestination }
]

{ #category : #converting }
AJx86Assembler >> imm: value [
	^ value asImm
]

{ #category : #'instructions generated' }
AJx86Assembler >> imul: aRegisterOrMemory [
	"Signed Multiply
	Description
-----------
Performs a signed multiplication of two operands. This instruction has
three forms, depending on the number of operands.

-   One-operand form — This form is identical to that used by the MUL
    instruction. Here, the source operand (in a general-purpose register
    or memory location) is multiplied by the value in the AL, AX, EAX,
    or RAX register (depending on the operand size) and the product is
    stored in the AX, DX:AX, EDX:EAX, or RDX:RAX registers,
    respectively.
-   Two-operand form — With this form the destination operand (the first
    operand) is multiplied by the source operand (second operand). The
    destination operand is a general-purpose register and the source
    operand is an immediate value, a general-purpose register, or a
    memory location. The product is then stored in the destination
    operand location.
-   Three-operand form — This form requires a destination operand (the
    first operand) and two source operands (the second and the third
    operands). Here, the first source operand (which can be a
    general-purpose register or a memory location) is multiplied by the
    second source operand (an immediate value). The product is then
    stored in the destination operand (a general-purpose register).

When an immediate value is used as an operand, it is sign-extended to
the length of the destination operand format.

The CF and OF flags are set when significant bit (including the sign
bit) are carried into the upper half of the result. The CF and OF flags
are cleared when the result (including the sign bit) fits exactly in the
lower half of the result.

The three forms of the IMUL instruction are similar in that the length
of the product is calculated to twice the length of the operands. With
the one-operand form, the product is stored exactly in the destination.
With the two- and three- operand forms, however, the result is truncated
to the length of the destination before it is stored in the destination
register. Because of this truncation, the CF or OF flag should be tested
to ensure that no significant bits are lost.

The two- and three-operand forms may also be used with unsigned operands
because the lower half of the product is the same regardless if the
operands are signed or unsigned. The CF and OF flags, however, cannot be
used to determine if the upper half of the result is non-zero.

In 64-bit mode, the instruction's default operation size is 32 bits. Use
of the REX.R prefix permits access to additional registers (R8-R15). Use
of the REX.W prefix promotes operation to 64 bits. Use of REX.W modifies
the three forms of the instruction as follows.

-   One-operand form —The source operand (in a 64-bit general-purpose
    register or memory location) is multiplied by the value in the RAX
    register and the product is stored in the RDX:RAX registers.
-   Two-operand form — The source operand is promoted to 64 bits if it
    is a register or a memory location. If the source operand is an
    immediate, it is sign extended to 64 bits. The destination operand
    is promoted to 64 bits.
-   Three-operand form — The first source operand (either a register or
    a memory location) and destination operand are promoted to 64 bits.

"
	^ self
		addInstruction: #imul
		operands: { aRegisterOrMemory }
]

{ #category : #'instructions generated' }
AJx86Assembler >> imul: aRegister with: aRegisterOrMemoryOrImmediate [
	"
	see #imul"
	^ self
		addInstruction: #imul
		operands: { aRegister . aRegisterOrMemoryOrImmediate }
]

{ #category : #'instructions generated' }
AJx86Assembler >> imul: aRegister with: aRegisterOrMemory with: anImmediate [
	"
	see #imul"
	^ self
		addInstruction: #imul
		operands: { aRegister . aRegisterOrMemory . anImmediate }
]

{ #category : #'instructions generated' }
AJx86Assembler >> inc: aRegisterOrMemory [
	"Increment by 1
	Pseudo Code
-----------
DEST = DEST + 1;
AFlags Affected
The CF flag is not affected. The OF, SF, ZF, AF, and PF flags are set according to the result.

Description
-----------
Adds 1 to the destination operand, while preserving the state of the CF
flag. The destination operand can be a register or a memory location.
This instruction allows a loop counter to be updated without disturbing
the CF flag. (Use a ADD instruction with an immediate operand of 1 to
perform an increment operation that does updates the CF flag.)

This instruction can be used with a LOCK prefix to allow the instruction
to be executed atomically.

In 64-bit mode, INC r16 and INC r32 are not encodable (because opcodes
40H through 47H are REX prefixes). Otherwise, the instruction's 64-bit
mode default operation size is 32 bits. Use of the REX.R prefix permits
access to additional registers (R8-R15). Use of the REX.W prefix
promotes operation to 64 bits.

"
	^ self
		addInstruction: #inc
		operands: { aRegisterOrMemory }
]

{ #category : #'initialize-release' }
AJx86Assembler >> initialize [
	super initialize.
	is64 := false.
]

{ #category : #'instruction list' }
AJx86Assembler >> insert: i after: instruction [

	| next |
	i ifNil: [ "nothing to insert" ^ self ].
	i do: [:each |
		each increaseLevel: instruction level
		].
	next := instruction next.
	instruction next: i.
	i last next: next
]

{ #category : #'instruction list' }
AJx86Assembler >> insert: newInstruction before: anInstruction [

	"insert one or more instructions before an instruction"

	^ instructions := instructions insert: newInstruction before: anInstruction
]

{ #category : #accessing }
AJx86Assembler >> instructionDescriptions [
	^ AJx86InstructionDescription instructions
]

{ #category : #register }
AJx86Assembler >> instructionPointer [
	"not available on 32bit x86 CPUs"
	self notYetImplemented
]

{ #category : #'instruction list' }
AJx86Assembler >> instructionsFor: aBlockWithCode [

	| old new |

	old := instructions.
	instructions := nil.

	[
		aBlockWithCode value.
	] ensure: [
		new := instructions.
		instructions := old ].

	^ new
]

{ #category : #testing }
AJx86Assembler >> is32 [
	^ true
]

{ #category : #testing }
AJx86Assembler >> is64 [
	^ false
]

{ #category : #testing }
AJx86Assembler >> isLabelUsed: aLabel [
	| used |
	used := false.
	instructions do: [:instr |
		used := used or: [instr isLabelUsed: aLabel ] ].
	^ used
]

{ #category : #'instructions generated' }
AJx86Assembler >> ja: targetLabel [
	"
	"
	^ self
		addInstruction: #ja
		operands: { targetLabel }
]

{ #category : #'instructions generated' }
AJx86Assembler >> jae: targetLabel [
	"
	"
	^ self
		addInstruction: #jae
		operands: { targetLabel }
]

{ #category : #'instructions generated' }
AJx86Assembler >> jb: targetLabel [
	"Jump short if below/not above or equal/carry (CF=1)
	"
	^ self
		addInstruction: #jb
		operands: { targetLabel }
]

{ #category : #'instructions generated' }
AJx86Assembler >> jbe: targetLabel [
	"Jump short if below or equal/not above (CF=1 AND ZF=1)
	"
	^ self
		addInstruction: #jbe
		operands: { targetLabel }
]

{ #category : #'instructions generated' }
AJx86Assembler >> jc: targetLabel [
	"
	"
	^ self
		addInstruction: #jc
		operands: { targetLabel }
]

{ #category : #'instructions generated' }
AJx86Assembler >> je: targetLabel [
	"
	"
	^ self
		addInstruction: #je
		operands: { targetLabel }
]

{ #category : #'instructions generated' }
AJx86Assembler >> jg: targetLabel [
	"
	"
	^ self
		addInstruction: #jg
		operands: { targetLabel }
]

{ #category : #'instructions generated' }
AJx86Assembler >> jge: targetLabel [
	"
	"
	^ self
		addInstruction: #jge
		operands: { targetLabel }
]

{ #category : #'instructions generated' }
AJx86Assembler >> jl: targetLabel [
	"Jump short if less/not greater (SF!=OF)
	"
	^ self
		addInstruction: #jl
		operands: { targetLabel }
]

{ #category : #'instructions generated' }
AJx86Assembler >> jle: targetLabel [
	"Jump short if less or equal/not greater ((ZF=1) OR (SF!=OF))
	"
	^ self
		addInstruction: #jle
		operands: { targetLabel }
]

{ #category : #'instructions generated' }
AJx86Assembler >> jmp: aLabelOrRegisterOrMemory [
	"Jump
	Description
-----------
Transfers program control to a different point in the instruction stream
without recording return information. The destination (target) operand
specifies the address of the instruction being jumped to. This operand
can be an immediate value, a general-purpose register, or a memory
location.

This instruction can be used to execute four different types of jumps:

-   Near jump—A jump to an instruction within the current code segment
    (the segment currently pointed to by the CS register), sometimes
    referred to as an intrasegment jump.
-   Short jump—A near jump where the jump range is limited to -128 to
    +127 from the current EIP value.
-   Far jump—A jump to an instruction located in a different segment
    than the current code segment but at the same privilege level,
    sometimes referred to as an intersegment jump.
-   Task switch—A jump to an instruction located in a different task.

A task switch can only be executed in protected mode (see Chapter 7, in
theIntel® 64 and IA-32 Architectures Software Developer's Manual, Volume
3A, for information on performing task switches with the JMP
instruction).

Near and Short Jumps. When executing a near jump, the processor jumps to
the address (within the current code segment) that is specified with the
target operand. The target operand specifies either an absolute offset
(that is an offset from the base of the code segment) or a relative
offset (a signed displacement relative to the current value of the
instruction pointer in the EIP register). A near jump to a relative
offset of 8-bits (rel8) is referred to as a short jump. The CS register
is not changed on near and short jumps.

An absolute offset is specified indirectly in a general-purpose register
or a memory location (r/m16 or r/m32). The operand-size attribute
determines the size of the target operand (16 or 32 bits). Absolute
offsets are loaded directly into the EIP register. If the operand-size
attribute is 16, the upper two bytes of the EIP register are cleared,
resulting in a maximum instruction pointer size of 16 bits.

A relative offset (rel8, rel16, or rel32) is generally specified as a
label in assembly code, but at the machine code level, it is encoded as
a signed 8-, 16-, or 32-bit immediate value. This value is added to the
value in the EIP register. (Here, the EIP register contains the address
of the instruction following the JMP instruction). When using relative
offsets, the opcode (for short vs. near jumps) and the operand-size
attribute (for near relative jumps) determines the size of the target
operand (8, 16, or 32 bits).

Far Jumps in Real-Address or Virtual-8086 Mode. When executing a far
jump in real-address or virtual-8086 mode, the processor jumps to the
code segment and offset specified with the target operand. Here the
target operand specifies an absolute far address either directly with a
pointer (ptr16:16 or ptr16:32) or indirectly with a memory location
(m16:16 or m16:32). With the pointer method, the segment and address of
the called procedure is encoded in the instruction, using a 4-byte
(16-bit operand size) or 6-byte (32-bit operand size) far address
immediate. With the indirect method, the target operand specifies a
memory location that contains a 4-byte (16-bit operand size) or 6-byte
(32-bit operand size) far address. The far address is loaded directly
into the CS and EIP registers. If the operand-size attribute is 16, the
upper two bytes of the EIP register are cleared.

Far Jumps in Protected Mode. When the processor is operating in
protected mode, the JMP instruction can be used to perform the following
three types of far jumps:

-   A far jump to a conforming or non-conforming code segment.
-   A far jump through a call gate.
-   A task switch.

(The JMP instruction cannot be used to perform inter-privilege-level far
jumps.)

In protected mode, the processor always uses the segment selector part
of the far address to access the corresponding descriptor in the GDT or
LDT. The descriptor type (code segment, call gate, task gate, or TSS)
and access rights determine the type of jump to be performed.

If the selected descriptor is for a code segment, a far jump to a code
segment at the same privilege level is performed. (If the selected code
segment is at a different privilege level and the code segment is
non-conforming, a general-protection exception is generated.) A far jump
to the same privilege level in protected mode is very similar to one
carried out in real-address or virtual-8086 mode. The target operand
specifies an absolute far address either directly with a pointer
(ptr16:16 or ptr16:32) or indirectly with a memory location (m16:16 or
m16:32). The operand-size attribute determines the size of the offset
(16 or 32 bits) in the far address. The new code segment selector and
its descriptor are loaded into CS register, and the offset from the
instruction is loaded into the EIP register. Note that a call gate
(described in the next paragraph) can also be used to perform far call
to a code segment at the same privilege level. Using this mechanism
provides an extra level of indirection and is the preferred method of
making jumps between 16-bit and 32-bit code segments.

When executing a far jump through a call gate, the segment selector
specified by the target operand identifies the call gate. (The offset
part of the target operand is ignored.) The processor then jumps to the
code segment specified in the call gate descriptor and begins executing
the instruction at the offset specified in the call gate. No stack
switch occurs. Here again, the target operand can specify the far
address of the call gate either directly with a pointer (ptr16:16 or
ptr16:32) or indirectly with a memory location (m16:16 or m16:32).

Executing a task switch with the JMP instruction is somewhat similar to
executing a jump through a call gate. Here the target operand specifies
the segment selector of the task gate for the task being switched to
(and the offset part of the target operand is ignored). The task gate in
turn points to the TSS for the task, which contains the segment
selectors for the task's code and stack segments. The TSS also contains
the EIP value for the next instruction that was to be executed before
the task was suspended. This instruction pointer value is loaded into
the EIP register so that the task begins executing again at this next
instruction.

The JMP instruction can also specify the segment selector of the TSS
directly, which eliminates the indirection of the task gate. See Chapter
7 inIntel® 64 and IA-32Architectures Software Developer's Manual, Volume
3A, for detailed information on the mechanics of a task switch.

Note that when you execute at task switch with a JMP instruction, the
nested task flag (NT) is not set in the EFLAGS register and the new
TSS's previous task link field is not loaded with the old task's TSS
selector. A return to the previous task can thus not be carried out by
executing the IRET instruction. Switching tasks with the JMP instruction
differs in this regard from the CALL instruction which does set the NT
flag and save the previous task link information, allowing a return to
the calling task with an IRET instruction.

In 64-Bit Mode — The instruction's operation size is fixed at 64 bits.
If a selector points to a gate, then RIP equals the 64-bit displacement
taken from gate; else RIP equals the zero-extended offset from the far
pointer referenced in the instruction.

See the summary chart at the beginning of this section for encoding data
and limits.

"
	^ self
		addInstruction: #jmp
		operands: { aLabelOrRegisterOrMemory }
]

{ #category : #'instructions generated' }
AJx86Assembler >> jna: targetLabel [
	"
	"
	^ self
		addInstruction: #jna
		operands: { targetLabel }
]

{ #category : #'instructions generated' }
AJx86Assembler >> jnae: targetLabel [
	"
	"
	^ self
		addInstruction: #jnae
		operands: { targetLabel }
]

{ #category : #'instructions generated' }
AJx86Assembler >> jnb: targetLabel [
	"Jump short if not below/above or equal/not carry (CF=0)
	"
	^ self
		addInstruction: #jnb
		operands: { targetLabel }
]

{ #category : #'instructions generated' }
AJx86Assembler >> jnbe: targetLabel [
	"Jump short if not below or equal/above (CF=0 AND ZF=0)
	"
	^ self
		addInstruction: #jnbe
		operands: { targetLabel }
]

{ #category : #'instructions generated' }
AJx86Assembler >> jnc: targetLabel [
	"
	"
	^ self
		addInstruction: #jnc
		operands: { targetLabel }
]

{ #category : #'instructions generated' }
AJx86Assembler >> jne: targetLabel [
	"
	"
	^ self
		addInstruction: #jne
		operands: { targetLabel }
]

{ #category : #'instructions generated' }
AJx86Assembler >> jng: targetLabel [
	"
	"
	^ self
		addInstruction: #jng
		operands: { targetLabel }
]

{ #category : #'instructions generated' }
AJx86Assembler >> jnge: targetLabel [
	"
	"
	^ self
		addInstruction: #jnge
		operands: { targetLabel }
]

{ #category : #'instructions generated' }
AJx86Assembler >> jnl: targetLabel [
	"Jump short if not less/greater or equal (SF=OF)
	"
	^ self
		addInstruction: #jnl
		operands: { targetLabel }
]

{ #category : #'instructions generated' }
AJx86Assembler >> jnle: targetLabel [
	"Jump short if not less nor equal/greater ((ZF=0) AND (SF=OF))
	"
	^ self
		addInstruction: #jnle
		operands: { targetLabel }
]

{ #category : #'instructions generated' }
AJx86Assembler >> jno: targetLabel [
	"Jump short if not overflow (OF=0)
	"
	^ self
		addInstruction: #jno
		operands: { targetLabel }
]

{ #category : #'instructions generated' }
AJx86Assembler >> jnp: targetLabel [
	"Jump short if not parity/parity odd
	"
	^ self
		addInstruction: #jnp
		operands: { targetLabel }
]

{ #category : #'instructions generated' }
AJx86Assembler >> jns: targetLabel [
	"Jump short if not sign (SF=0)
	"
	^ self
		addInstruction: #jns
		operands: { targetLabel }
]

{ #category : #'instructions generated' }
AJx86Assembler >> jnz: targetLabel [
	"Jump short if not zero/not equal (ZF=1)
	"
	^ self
		addInstruction: #jnz
		operands: { targetLabel }
]

{ #category : #'instructions generated' }
AJx86Assembler >> jo: targetLabel [
	"Jump short if overflow (OF=1)
	"
	^ self
		addInstruction: #jo
		operands: { targetLabel }
]

{ #category : #'instructions generated' }
AJx86Assembler >> jp: targetLabel [
	"Jump short if parity/parity even (PF=1)
	"
	^ self
		addInstruction: #jp
		operands: { targetLabel }
]

{ #category : #'instructions generated' }
AJx86Assembler >> jpe: targetLabel [
	"
	"
	^ self
		addInstruction: #jpe
		operands: { targetLabel }
]

{ #category : #'instructions generated' }
AJx86Assembler >> jpo: targetLabel [
	"
	"
	^ self
		addInstruction: #jpo
		operands: { targetLabel }
]

{ #category : #'instructions generated' }
AJx86Assembler >> js: targetLabel [
	"Jump short if sign (SF=1)
	"
	^ self
		addInstruction: #js
		operands: { targetLabel }
]

{ #category : #'instructions generated' }
AJx86Assembler >> jz: targetLabel [
	"Jump short if zero/equal (ZF=0)
	"
	^ self
		addInstruction: #jz
		operands: { targetLabel }
]

{ #category : #labels }
AJx86Assembler >> label: aNameOrLabel [
	^ self
		label: aNameOrLabel
		ifPresent: [ self error: 'label ', aNameOrLabel asString, ' already set' ].
]

{ #category : #labels }
AJx86Assembler >> label: aNameOrLabel ifPresent: anExceptionBlock [
	| label |
	label := aNameOrLabel.
	label isString
		ifTrue: [ label := self labelNamed: label ].

	label isSet
		ifTrue: [ ^ anExceptionBlock cull: label ].

	label isSet: true.
	^ self addInstruction: label.
]

{ #category : #labels }
AJx86Assembler >> labelNamed: aNameOrLabel [

	"directly use an object as label"
	aNameOrLabel isString ifFalse: [
		self assert: (labels at: aNameOrLabel name ) = aNameOrLabel.
		^ aNameOrLabel ].

	^ labels at: aNameOrLabel ifAbsentPut: [
		AJJumpLabel new
			name: aNameOrLabel
		]
]

{ #category : #'instructions generated' }
AJx86Assembler >> ldmxcsr: aMemoryOperand [
	"Load MXCSR Register
	Pseudo Code
-----------
MXCSR = m32;
C/C++ Compiler Intrinsic Equivalent
_mm_setcsr(unsigned int i)

Description
-----------
Loads the source operand into the MXCSR control/status register. The
source operand is a 32-bit memory location. See 'MXCSR Control and
Status Register' in Chapter 10, of theIntel®64 and IA-32 Architectures
Software Developer's Manual,Volume 1, for a description of the MXCSR
register and its contents.

The LDMXCSR instruction is typically used in conjunction with the
STMXCSR instruction, which stores the contents of the MXCSR register in
memory.

The default MXCSR value at reset is 1F80H.

If a LDMXCSR instruction clears a SIMD floating-point exception mask bit
and sets the corresponding exception flag bit, a SIMD floating-point
exception will not be immediately generated. The exception will be
generated only upon the execution of the next SSE or SSE2 instruction
that causes that particular SIMD floating-point exception to be
reported.

This instruction's operation is the same in non-64-bit modes and 64-bit
mode.

"
	^ self
		addInstruction: #ldmxcsr
		operands: { aMemoryOperand }
]

{ #category : #'instructions generated' }
AJx86Assembler >> lea: aDestinationRegister with: aSourceMemory [
	"Load Effective Address
	"
	^ self
		addInstruction: #lea
		operands: { aDestinationRegister . aSourceMemory }
]

{ #category : #'instructions generated' }
AJx86Assembler >> mov: aDestinationRegisterOrMemory with: aSource [
	"Move
	Description
-----------
Copies the second operand (source operand) to the first operand
(destination operand). The source operand can be an immediate value,
general-purpose register, segment register, or memory location; the
destination register can be a general-purpose register, segment
register, or memory location. Both operands must be the same size, which
can be a byte, a word, a doubleword, or a quadword.

The MOV instruction cannot be used to load the CS register. Attempting
to do so results in an invalid opcode exception (\#UD). To load the CS
register, use the far JMP, CALL, or RET instruction.

If the destination operand is a segment register (DS, ES, FS, GS, or
SS), the source operand must be a valid segment selector. In protected
mode, moving a segment selector into a segment register automatically
causes the segment descriptor information associated with that segment
selector to be loaded into the hidden (shadow) part of the segment
register. While loading this information, the segment selector and
segment descriptor information is validated (see the 'Operation'
algorithm below). The segment descriptor data is obtained from the GDT
or LDT entry for the specified segment selector.

A NULL segment selector (values 0000-0003) can be loaded into the DS,
ES, FS, and GS registers without causing a protection exception.
However, any subsequent attempt to reference a segment whose
corresponding segment register is loaded with a NULL value causes a
general protection exception (\#GP) and no memory reference occurs.

Loading the SS register with a MOV instruction inhibits all interrupts
until after the execution of the next instruction. This operation allows
a stack pointer to be loaded into the ESP register with the next
instruction (MOV ESP, stack-pointer value) before an interrupt occurs1.
Be aware that the LSS instruction offers a more efficient method of
loading the SS and ESP registers.

When operating in 32-bit mode and moving data between a segment register
and a general-purpose register, the 32-bit IA-32 processors do not
require the use of the 16-bit operand-size prefix (a byte with the value
66H) with this instruction, but most assemblers will insert it if the
standard form of the instruction is used (for example, MOV DS, AX). The
processor will execute this instruction correctly, but it will usually
require an extra clock. With most assemblers, using the instruction form
MOV DS, EAX will avoid this unneeded 66H prefix. When the processor
executes the instruction with a 32-bit general-purpose register, it
assumes that the 16 least-significant bits of the general-purpose
register are the destination or source operand. If the register is a
destination operand, the resulting value in the two high-order bytes of
the register is implementation dependent. For the Pentium 4, Intel Xeon,
and P6 family processors, the two high-order bytes are filled with
zeros; for earlier 32-bit IA-32 processors, the two high order bytes are
undefined.

In 64-bit mode, the instruction's default operation size is 32 bits. Use
of the REX.R prefix permits access to additional registers (R8-R15). Use
of the REX.W prefix promotes operation to 64 bits. See the summary chart
at the beginning of this section for encoding data and limits.

"
	^ self addInstruction: (AJx86MOV
		source: aSource
		destination: aDestinationRegisterOrMemory)
]

{ #category : #'instructions generated' }
AJx86Assembler >> movPtr: aRegisterOrImmedate1 with: aRegisterOrImmedate2 [
	"
	"
	^ self
		addInstruction: #movPtr
		operands: { aRegisterOrImmedate1 . aRegisterOrImmedate2 }
]

{ #category : #'instructions generated' }
AJx86Assembler >> movapd: aRegisterOrMemory1 with: aRegisterOrMemory2 [
	"Move Aligned Packed Double-FP Values
	Pseudo Code
-----------
DEST = SRC;
(* #GP if SRC or DEST unaligned memory operand *)

Description
-----------
Moves a double quadword containing two packed double-precision
floating-point values from the source operand (second operand) to the
destination operand (first operand). This instruction can be used to
load an XMM register from a 128-bit memory location, to store the
contents of an XMM register into a 128-bit memory location, or to move
data between two XMM registers. When the source or destination operand
is a memory operand, the operand must be aligned on a 16-byte boundary
or a general-protection exception (\#GP) will be generated.

To move double-precision floating-point values to and from unaligned
memory locations, use the MOVUPD instruction.

In 64-bit mode, use of the REX.R prefix permits this instruction to
access additional registers (XMM8-XMM15).

"
	^ self
		addInstruction: #movapd
		operands: { aRegisterOrMemory1 . aRegisterOrMemory2 }
]

{ #category : #'instructions generated' }
AJx86Assembler >> movaps: aRegisterOrMemory1 with: aRegisterOrMemory2 [
	"Move Aligned Packed Single-FP Values
	Pseudo Code
-----------
DEST = SRC;
(* #GP if SRC or DEST unaligned memory operand *)

Description
-----------
Moves a double quadword containing four packed single-precision
floating-point values from the source operand (second operand) to the
destination operand (first operand). This instruction can be used to
load an XMM register from a 128-bit memory location, to store the
contents of an XMM register into a 128-bit memory location, or to move
data between two XMM registers. When the source or destination operand
is a memory operand, the operand must be aligned on a 16-byte boundary
or a general-protection exception (\#GP) is generated.

To move packed single-precision floating-point values to or from
unaligned memory locations, use the MOVUPS instruction.

In 64-bit mode, use of the REX.R prefix permits this instruction to
access additional registers (XMM8-XMM15).

"
	^ self
		addInstruction: #movaps
		operands: { aRegisterOrMemory1 . aRegisterOrMemory2 }
]

{ #category : #'instructions generated' }
AJx86Assembler >> movddup: aRegisterOrMemory1 with: aRegisterOrMemory2 [
	"Move One Double-FP and Duplicate
	Description
-----------
The linear address corresponds to the address of the least-significant
byte of the referenced memory data. When a memory address is indicated,
the 8 bytes of data at memory location m64 are loaded. When the
register-register form of this operation is used, the lower half of the
128-bit source register is duplicated and copied into the 128-bit
destination register.

In 64-bit mode, use of the REX.R prefix permits this instruction to
access additional registers (XMM8-XMM15).

"
	^ self
		addInstruction: #movddup
		operands: { aRegisterOrMemory1 . aRegisterOrMemory2 }
]

{ #category : #'instructions generated' }
AJx86Assembler >> movdq2q: aRegisterOrMemory1 with: aRegisterOrMemory2 [
	"Move Quadword from XMM to MMX Technology Register
	Pseudo Code
-----------
DEST = SRC[63:0];

Description
-----------
Moves the low quadword from the source operand (second operand) to the
destination operand (first operand). The source operand is an XMM
register and the destination operand is an MMX technology register.

This instruction causes a transition from x87 FPU to MMX technology
operation (that is, the x87 FPU top-of-stack pointer is set to 0 and the
x87 FPU tag word is set to all 0s [valid]). If this instruction is
executed while an x87 FPU floating-point exception is pending, the
exception is handled before the MOVDQ2Q instruction is executed.

In 64-bit mode, use of the REX.R prefix permits this instruction to
access additional registers (XMM8-XMM15).

"
	^ self
		addInstruction: #movdq2q
		operands: { aRegisterOrMemory1 . aRegisterOrMemory2 }
]

{ #category : #'instructions generated' }
AJx86Assembler >> movdqa: aRegisterOrMemory1 with: aRegisterOrMemory2 [
	"Move Aligned Double Quadword
	Pseudo Code
-----------
DEST = SRC;
(* #GP if SRC or DEST unaligned memory operand *)

Description
-----------
Moves a double quadword from the source operand (second operand) to the
destination operand (first operand). This instruction can be used to
load an XMM register from a 128-bit memory location, to store the
contents of an XMM register into a 128-bit memory location, or to move
data between two XMM registers. When the source or destination operand
is a memory operand, the operand must be aligned on a 16-byte boundary
or a general-protection exception (\#GP) will be generated.

To move a double quadword to or from unaligned memory locations, use the
MOVDQU instruction.

In 64-bit mode, use of the REX.R prefix permits this instruction to
access additional registers (XMM8-XMM15).

"
	^ self
		addInstruction: #movdqa
		operands: { aRegisterOrMemory1 . aRegisterOrMemory2 }
]

{ #category : #'instructions generated' }
AJx86Assembler >> movdqu: aRegisterOrMemory1 with: aRegisterOrMemory2 [
	"Move Unaligned Double Quadword
	Pseudo Code
-----------
DEST = SRC;
1. If alignment checking is enabled (CR0.AM = 1, RFLAGS.AC = 1, and CPL = 3), an alignment-check exception (#AC) may or may not be generated (depending on processor implementation) when the operand is not aligned on an 8-byte boundary.

Description
-----------
Moves a double quadword from the source operand (second operand) to the
destination operand (first operand). This instruction can be used to
load an XMM register from a 128-bit memory location, to store the
contents of an XMM register into a 128-bit memory location, or to move
data between two XMM registers. When the source or destination operand
is a memory operand, the operand may be unaligned on a 16-byte boundary
without causing a general-protection exception (\#GP) to be generated.1

To move a double quadword to or from memory locations that are known to
be aligned on 16-byte boundaries, use the MOVDQA instruction.

While executing in 16-bit addressing mode, a linear address for a
128-bit data access that overlaps the end of a 16-bit segment is not
allowed and is defined as reserved behavior. A specific processor
implementation may or may not generate a general-protection exception
(\#GP) in this situation, and the address that spans the end of the
segment may or may not wrap around to the beginning of the segment.

In 64-bit mode, use of the REX.R prefix permits this instruction to
access additional registers (XMM8-XMM15).

"
	^ self
		addInstruction: #movdqu
		operands: { aRegisterOrMemory1 . aRegisterOrMemory2 }
]

{ #category : #'instructions generated' }
AJx86Assembler >> movhlps: aRegisterOrMemory1 with: aRegisterOrMemory2 [
	"Move Packed Single-FP Values High to Low
	Pseudo Code
-----------
DEST[63:0] = SRC[127:64]; (* DEST[127:64] unchanged *)

Description
-----------
Moves two packed single-precision floating-point values from the high
quadword of the source operand (second operand) to the low quadword of
the destination operand (first operand). The high quadword of the
destination operand is left unchanged.

In 64-bit mode, use of the REX.R prefix permits this instruction to
access additional registers (XMM8-XMM15).

"
	^ self
		addInstruction: #movhlps
		operands: { aRegisterOrMemory1 . aRegisterOrMemory2 }
]

{ #category : #'instructions generated' }
AJx86Assembler >> movhpd: aRegisterOrMemory1 with: aRegisterOrMemory2 [
	"Move High Packed Double-FP Value
	Pseudo Code
-----------
(* MOVHPD instruction for memory to XMM move *)
DEST[127:64] = SRC;
(* DEST[63:0] unchanged *)
(* MOVHPD instruction for XMM to memory move *)
DEST = SRC[127:64];

Description
-----------
Moves a double-precision floating-point value from the source operand
(second operand) to the destination operand (first operand). The source
and destination operands can be an XMM register or a 64-bit memory
location. This instruction allows a double-precision floating-point
value to be moved to and from the high quadword of an XMM register and
memory. It cannot be used for register to register or memory to memory
moves. When the destination operand is an XMM register, the low
quad-word of the register remains unchanged.

In 64-bit mode, use of the REX.R prefix permits this instruction to
access additional registers (XMM8-XMM15).

"
	^ self
		addInstruction: #movhpd
		operands: { aRegisterOrMemory1 . aRegisterOrMemory2 }
]

{ #category : #'instructions generated' }
AJx86Assembler >> movhps: aRegisterOrMemory1 with: aRegisterOrMemory2 [
	"Move High Packed Single-FP Values
	Pseudo Code
-----------
(* MOVHPS instruction for memory to XMM move *)
DEST[127:64] = SRC;
(* DEST[63:0] unchanged *)
(* MOVHPS instruction for XMM to memory move *)
DEST = SRC[127:64];

Description
-----------
Moves two packed single-precision floating-point values from the source
operand (second operand) to the destination operand (first operand). The
source and destination operands can be an XMM register or a 64-bit
memory location. This instruction allows two single-precision
floating-point values to be moved to and from the high quadword of an
XMM register and memory. It cannot be used for register to register or
memory to memory moves. When the destination operand is an XMM register,
the low quadword of the register remains unchanged.

In 64-bit mode, use of the REX.R prefix permits this instruction to
access additional registers (XMM8-XMM15).

"
	^ self
		addInstruction: #movhps
		operands: { aRegisterOrMemory1 . aRegisterOrMemory2 }
]

{ #category : #'instructions generated' }
AJx86Assembler >> movlhps: aRegisterOrMemory1 with: aRegisterOrMemory2 [
	"Move Packed Single-FP Values Low to High
	Pseudo Code
-----------
DEST[127:64] = SRC[63:0]; (* DEST[63:0] unchanged *)

Description
-----------
Moves two packed single-precision floating-point values from the low
quadword of the source operand (second operand) to the high quadword of
the destination operand (first operand). The low quadword of the
destination operand is left unchanged.

In 64-bit mode, use of the REX.R prefix permits this instruction to
access additional registers (XMM8-XMM15).

"
	^ self
		addInstruction: #movlhps
		operands: { aRegisterOrMemory1 . aRegisterOrMemory2 }
]

{ #category : #'instructions generated' }
AJx86Assembler >> movlpd: aRegisterOrMemory1 with: aRegisterOrMemory2 [
	"Move Low Packed Double-FP Value
	Pseudo Code
-----------
(* MOVLPD instruction for memory to XMM move *)
DEST[63:0] = SRC;
(* DEST[127:64] unchanged *)
(* MOVLPD instruction for XMM to memory move *)
DEST = SRC[63:0];

Description
-----------
Moves a double-precision floating-point value from the source operand
(second operand) to the destination operand (first operand). The source
and destination operands can be an XMM register or a 64-bit memory
location. This instruction allows a double-precision floating-point
value to be moved to and from the low quadword of an XMM register and
memory. It cannot be used for register to register or memory to memory
moves. When the destination operand is an XMM register, the high
quad-word of the register remains unchanged.

In 64-bit mode, use of the REX.R prefix permits this instruction to
access additional registers (XMM8-XMM15).

"
	^ self
		addInstruction: #movlpd
		operands: { aRegisterOrMemory1 . aRegisterOrMemory2 }
]

{ #category : #'instructions generated' }
AJx86Assembler >> movlps: aRegisterOrMemory1 with: aRegisterOrMemory2 [
	"Move Low Packed Single-FP Values
	Pseudo Code
-----------
(* MOVLPD instruction for memory to XMM move *)
DEST[63:0] = SRC;
(* DEST[127:64] unchanged *)
(* MOVLPD instruction for XMM to memory move *)
DEST = SRC[63:0];

Description
-----------
Moves two packed single-precision floating-point values from the source
operand (second operand) and the destination operand (first operand).
The source and destination operands can be an XMM register or a 64-bit
memory location. This instruction allows two single-precision
floating-point values to be moved to and from the low quadword of an XMM
register and memory. It cannot be used for register to register or
memory to memory moves. When the destination operand is an XMM register,
the high quadword of the register remains unchanged.

In 64-bit mode, use of the REX.R prefix permits this instruction to
access additional registers (XMM8-XMM15).

"
	^ self
		addInstruction: #movlps
		operands: { aRegisterOrMemory1 . aRegisterOrMemory2 }
]

{ #category : #'instructions generated' }
AJx86Assembler >> movmskpd: aRegisterOrMemory1 with: aRegisterOrMemory2 [
	"Extract Packed Double-FP Sign Mask
	Pseudo Code
-----------
DEST[0] = SRC[63];
DEST[1] = SRC[127];
IF DEST = r32
    DEST[31:2] = ZeroExtend;
ELSE
    DEST[63:2] = ZeroExtend;
FI;

Description
-----------
Extracts the sign bits from the packed double-precision floating-point
values in the source operand (second operand), formats them into a 2-bit
mask, and stores the mask in the destination operand (first operand).
The source operand is an XMM register, and the destination operand is a
general-purpose register. The mask is stored in the 2 low-order bits of
the destination operand. Zero-extend the upper bits of the destination.

In 64-bit mode, the instruction can access additional registers
(XMM8-XMM15, R8-R15) when used with a REX.R prefix. The default operand
size is 64-bit in 64-bit mode.

"
	^ self
		addInstruction: #movmskpd
		operands: { aRegisterOrMemory1 . aRegisterOrMemory2 }
]

{ #category : #'instructions generated' }
AJx86Assembler >> movmskps: aRegisterOrMemory1 with: aRegisterOrMemory2 [
	"Extract Packed Single-FP Sign Mask
	Description
-----------
Extracts the sign bits from the packed single-precision floating-point
values in the source operand (second operand), formats them into a 4-bit
mask, and stores the mask in the destination operand (first operand).
The source operand is an XMM register, and the destination operand is a
general-purpose register. The mask is stored in the 4 low-order bits of
the destination operand. Zero-extend the upper bits of the destination
operand.

In 64-bit mode, the instruction can access additional registers
(XMM8-XMM15, R8-R15) when used with a REX.R prefix. The default operand
size is 64-bit in 64-bit mode.

"
	^ self
		addInstruction: #movmskps
		operands: { aRegisterOrMemory1 . aRegisterOrMemory2 }
]

{ #category : #'instructions generated' }
AJx86Assembler >> movntdq: aRegisterOrMemory1 with: aRegisterOrMemory2 [
	"Store Double Quadword Using Non-Temporal Hint
	Pseudo Code
-----------
DEST = SRC;

Description
-----------
Moves the double quadword in the source operand (second operand) to the
destination operand (first operand) using a non-temporal hint to prevent
caching of the data during the write to memory. The source operand is an
XMM register, which is assumed to contain integer data (packed bytes,
words, doublewords, or quadwords). The destination operand is a 128-bit
memory location.

The non-temporal hint is implemented by using a write combining (WC)
memory type protocol when writing the data to memory. Using this
protocol, the processor does not write the data into the cache
hierarchy, nor does it fetch the corresponding cache line from memory
into the cache hierarchy. The memory type of the region being written to
can override the non-temporal hint, if the memory address specified for
the non-temporal store is in an uncacheable (UC) or write protected (WP)
memory region. For more information on non-temporal stores, see 'Caching
of Temporal vs. Non-Temporal Data' in Chapter 10 in theIntel®64 and
IA-32 Architectures Software Developer's Manual, Volume 1.

Because the WC protocol uses a weakly-ordered memory consistency model,
a fencing operation implemented with the SFENCE or MFENCE instruction
should be used in conjunction with MOVNTDQ instructions if multiple
processors might use different memory types to read/write the
destination memory locations.

In 64-bit mode, use of the REX.R prefix permits this instruction to
access additional registers (XMM8-XMM15).

"
	^ self
		addInstruction: #movntdq
		operands: { aRegisterOrMemory1 . aRegisterOrMemory2 }
]

{ #category : #'instructions generated' }
AJx86Assembler >> movntdqa: aRegisterOrMemory1 with: aRegisterOrMemory2 [
	"Load Double Quadword Non-Temporal Aligned Hint
	Pseudo Code
-----------
DST = SRC;

Description
-----------
MOVNTDQA loads a double quadword from the source operand (second
operand) to the destination operand (first operand) using a non-temporal
hint. A processor implementation may make use of the non-temporal hint
associated with this instruction if the memory source is WC (write
combining) memory type. An implementation may also make use of the
non-temporal hint associated with this instruction if the memory source
is WB (write back) memory type.

A processor's implementation of the non-temporal hint does not override
the effective memory type semantics, but the implementation of the hint
is processor dependent. For example, a processor implementation may
choose to ignore the hint and process the instruction as a normal MOVDQA
for any memory type. Another implementation of the hint for WC memory
type may optimize data transfer throughput of WC reads. A third
implementation may optimize cache reads generated by MOVNTDQA on WB
memory type to reduce cache evictions.

WC Streaming Load Hint

For WC memory type in particular, the processor never appears to read
the data into the cache hierarchy. Instead, the non-temporal hint may be
implemented by loading a temporary internal buffer with the equivalent
of an aligned cache line without filling this data to the cache. Any
memory-type aliased lines in the cache will be snooped and flushed.
Subsequent MOVNTDQA reads to unread portions of the WC cache line will
receive data from the temporary internal buffer if data is available.
The temporary internal buffer may be flushed by the processor at any
time for any reason, for example:

-   A load operation other than a MOVNTDQA which references memory
    already resident in a temporary internal buffer.
-   A non-WC reference to memory already resident in a temporary
    internal buffer.
-   Interleaving of reads and writes to memory currently residing in a
    single temporary internal buffer.
-   Repeated MOVNTDQA loads of a particular 16-byte item in a streaming
    line.
-   Certain micro-architectural conditions including resource shortages,
    detection of a mis-speculation condition, and various fault
    conditions

The memory type of the region being read can override the non-temporal
hint, if the memory address specified for the non-temporal read is not a
WC memory region. Information on non-temporal reads and writes can be
found in Chapter 11, 'MemoryCache Control' ofIntel® 64 and IA-32
Architectures Software Developer's Manual,Volume 3A.

Because the WC protocol uses a weakly-ordered memory consistency model,
an MFENCE or locked instruction should be used in conjunction with
MOVNTDQA instructions if multiple processors might reference the same WC
memory locations or in order to synchronize reads of a processor with
writes by other agents in the system. Because of the speculative nature
of fetching due to MOVNTDQA, Streaming loads must not be used to
reference memory addresses that are mapped to I/O devices having side
effects or when reads to these devices are destructive. For additional
information on MOVNTDQA usages, see Section 12.10.3 in Chapter 12,
'Programming with SSE3, SSSE3 and SSE4' ofIntel®64 and IA-32
Architectures SoftwareDeveloper's Manual, Volume 1.

"
	^ self
		addInstruction: #movntdqa
		operands: { aRegisterOrMemory1 . aRegisterOrMemory2 }
]

{ #category : #'instructions generated' }
AJx86Assembler >> movnti: aRegisterOrMemory1 with: aRegisterOrMemory2 [
	"Store Doubleword Using Non-Temporal Hint
	Pseudo Code
-----------
DEST = SRC;

Description
-----------
Moves the doubleword integer in the source operand (second operand) to
the destination operand (first operand) using a non-temporal hint to
minimize cache pollution during the write to memory. The source operand
is a general-purpose register. The destination operand is a 32-bit
memory location.

The non-temporal hint is implemented by using a write combining (WC)
memory type protocol when writing the data to memory. Using this
protocol, the processor does not write the data into the cache
hierarchy, nor does it fetch the corresponding cache line from memory
into the cache hierarchy. The memory type of the region being written to
can override the non-temporal hint, if the memory address specified for
the non-temporal store is in an uncacheable (UC) or write protected (WP)
memory region. For more information on non-temporal stores, see 'Caching
of Temporal vs. Non-Temporal Data' in Chapter 10 in theIntel®64 and
IA-32 Architectures Software Developer's Manual, Volume 1.

Because the WC protocol uses a weakly-ordered memory consistency model,
a fencing operation implemented with the SFENCE or MFENCE instruction
should be used in conjunction with MOVNTI instructions if multiple
processors might use different memory types to read/write the
destination memory locations.

In 64-bit mode, the instruction's default operation size is 32 bits. Use
of the REX.R prefix permits access to additional registers (R8-R15). Use
of the REX.W prefix promotes operation to 64 bits. See the summary chart
at the beginning of this section for encoding data and limits.

"
	^ self
		addInstruction: #movnti
		operands: { aRegisterOrMemory1 . aRegisterOrMemory2 }
]

{ #category : #'instructions generated' }
AJx86Assembler >> movntpd: aRegisterOrMemory1 with: aRegisterOrMemory2 [
	"Store Packed Double-FP Values Using Non-Temporal Hint
	Pseudo Code
-----------
DEST = SRC;

Description
-----------
Moves the double quadword in the source operand (second operand) to the
destination operand (first operand) using a non-temporal hint to
minimize cache pollution during the write to memory. The source operand
is an XMM register, which is assumed to contain two packed
double-precision floating-point values. The destination operand is a
128-bit memory location.

The non-temporal hint is implemented by using a write combining (WC)
memory type protocol when writing the data to memory. Using this
protocol, the processor does not write the data into the cache
hierarchy, nor does it fetch the corresponding cache line from memory
into the cache hierarchy. The memory type of the region being written to
can override the non-temporal hint, if the memory address specified for
the non-temporal store is in an uncacheable (UC) or write protected (WP)
memory region. For more information on non-temporal stores, see 'Caching
of Temporal vs. Non-Temporal Data' in Chapter 10 in theIntel®64 and
IA-32 Architectures Software Developer's Manual, Volume 1.

Because the WC protocol uses a weakly-ordered memory consistency model,
a fencing operation implemented with the SFENCE or MFENCE instruction
should be used in conjunction with MOVNTPD instructions if multiple
processors might use different memory types to read/write the
destination memory locations.

In 64-bit mode, use of the REX.R prefix permits this instruction to
access additional registers (XMM8-XMM15).

"
	^ self
		addInstruction: #movntpd
		operands: { aRegisterOrMemory1 . aRegisterOrMemory2 }
]

{ #category : #'instructions generated' }
AJx86Assembler >> movntps: aRegisterOrMemory1 with: aRegisterOrMemory2 [
	"Store Packed Single-FP Values Using Non-Temporal Hint
	Pseudo Code
-----------
DEST = SRC;

Description
-----------
Moves the double quadword in the source operand (second operand) to the
destination operand (first operand) using a non-temporal hint to
minimize cache pollution during the write to memory. The source operand
is an XMM register, which is assumed to contain four packed
single-precision floating-point values. The destination operand is a
128-bit memory location.

The non-temporal hint is implemented by using a write combining (WC)
memory type protocol when writing the data to memory. Using this
protocol, the processor does not write the data into the cache
hierarchy, nor does it fetch the corresponding cache line from memory
into the cache hierarchy. The memory type of the region being written to
can override the non-temporal hint, if the memory address specified for
the non-temporal store is in an uncacheable (UC) or write protected (WP)
memory region. For more information on non-temporal stores, see 'Caching
of Temporal vs. Non-Temporal Data' in Chapter 10 in theIntel®64 and
IA-32 Architectures Software Developer's Manual, Volume 1.

Because the WC protocol uses a weakly-ordered memory consistency model,
a fencing operation implemented with the SFENCE or MFENCE instruction
should be used in conjunction with MOVNTPS instructions if multiple
processors might use different memory types to read/write the
destination memory locations.

In 64-bit mode, use of the REX.R prefix permits this instruction to
access additional registers (XMM8-XMM15).

"
	^ self
		addInstruction: #movntps
		operands: { aRegisterOrMemory1 . aRegisterOrMemory2 }
]

{ #category : #'instructions generated' }
AJx86Assembler >> movntq: aRegisterOrMemory1 with: aRegisterOrMemory2 [
	"Store of Quadword Using Non-Temporal Hint
	Pseudo Code
-----------
DEST = SRC;

Description
-----------
Moves the quadword in the source operand (second operand) to the
destination operand (first operand) using a non-temporal hint to
minimize cache pollution during the write to memory. The source operand
is an MMX technology register, which is assumed to contain packed
integer data (packed bytes, words, or doublewords). The destination
operand is a 64-bit memory location.

The non-temporal hint is implemented by using a write combining (WC)
memory type protocol when writing the data to memory. Using this
protocol, the processor does not write the data into the cache
hierarchy, nor does it fetch the corresponding cache line from memory
into the cache hierarchy. The memory type of the region being written to
can override the non-temporal hint, if the memory address specified for
the non-temporal store is in an uncacheable (UC) or write protected (WP)
memory region. For more information on non-temporal stores, see 'Caching
of Temporal vs. Non-Temporal Data' in Chapter 10 in theIntel®64 and
IA-32 Architectures Software Developer's Manual, Volume 1.

Because the WC protocol uses a weakly-ordered memory consistency model,
a fencing operation implemented with the SFENCE or MFENCE instruction
should be used in conjunction with MOVNTQ instructions if multiple
processors might use different memory types to read/write the
destination memory locations.

This instruction's operation is the same in non-64-bit modes and 64-bit
mode.

"
	^ self
		addInstruction: #movntq
		operands: { aRegisterOrMemory1 . aRegisterOrMemory2 }
]

{ #category : #'instructions generated' }
AJx86Assembler >> movss: aRegisterOrMemory1 with: aRegisterOrMemory2 [
	"Move Scalar Single-FP Values
	Description
-----------
Moves a scalar single-precision floating-point value from the source
operand (second operand) to the destination operand (first operand). The
source and destination operands can be XMM registers or 32-bit memory
locations. This instruction can be used to move a single-precision
floating-point value to and from the low doubleword of an XMM register
and a 32-bit memory location, or to move a single-precision
floating-point value between the low doublewords of two XMM registers.
The instruction cannot be used to transfer data between memory
locations.

When the source and destination operands are XMM registers, the three
high-order doublewords of the destination operand remain unchanged. When
the source operand is a memory location and destination operand is an
XMM registers, the three high-order doublewords of the destination
operand are cleared to all 0s.

In 64-bit mode, use of the REX.R prefix permits this instruction to
access additional registers (XMM8-XMM15).

"
	^ self
		addInstruction: #movss
		operands: { aRegisterOrMemory1 . aRegisterOrMemory2 }
]

{ #category : #convenience }
AJx86Assembler >> movsx: src to: dest [
	"Ensure right src/dest order"
	^ self movsx: dest with: src
]

{ #category : #'instructions generated' }
AJx86Assembler >> movsx: aDestinationRegister with: aSourceRegisterOrMemory [
	"Move with Sign-Extension
	"
	^ self
		addInstruction: #movsx
		operands: { aDestinationRegister . aSourceRegisterOrMemory }
]

{ #category : #'instructions generated' }
AJx86Assembler >> movsxd: aDestinationRegister with: aSourceRegisterOrMemory [
	"Move with Sign-Extension
	"
	^ self
		addInstruction: #movsxd
		operands: { aDestinationRegister . aSourceRegisterOrMemory }
]

{ #category : #'instructions generated' }
AJx86Assembler >> movupd: aRegisterOrMemory1 with: aRegisterOrMemory2 [
	"Move Unaligned Packed Double-FP Value
	Pseudo Code
-----------
DEST = SRC;

Description
-----------
Moves a double quadword containing two packed double-precision
floating-point values from the source operand (second operand) to the
destination operand (first operand). This instruction can be used to
load an XMM register from a 128-bit memory location, store the contents
of an XMM register into a 128-bit memory location, or move data between
two XMM registers. When the source or destination operand is a memory
operand, the operand may be unaligned on a 16-byte boundary without
causing a general-protection exception (\#GP) to be generated.1

To move double-precision floating-point values to and from memory
locations that are known to be aligned on 16-byte boundaries, use the
MOVAPD instruction.

While executing in 16-bit addressing mode, a linear address for a
128-bit data access that overlaps the end of a 16-bit segment is not
allowed and is defined as reserved behavior. A specific processor
implementation may or may not generate a general-protection exception
(\#GP) in this situation, and the address that spans the end of the
segment may or may not wrap around to the beginning of the segment.

In 64-bit mode, use of the REX.R prefix permits this instruction to
access additional registers (XMM8-XMM15).

​1. If alignment checking is enabled (CR0.AM = 1, RFLAGS.AC = 1, and CPL
= 3), an alignment-check exception (\#AC) may or may not be generated
(depending on processor implementation) when the operand is not aligned
on an 8-byte boundary.

"
	^ self
		addInstruction: #movupd
		operands: { aRegisterOrMemory1 . aRegisterOrMemory2 }
]

{ #category : #'instructions generated' }
AJx86Assembler >> movups: aRegisterOrMemory1 with: aRegisterOrMemory2 [
	"Move Unaligned Packed Single-FP Values
	Pseudo Code
-----------
DEST = SRC;

Description
-----------
Moves a double quadword containing four packed single-precision
floating-point values from the source operand (second operand) to the
destination operand (first operand). This instruction can be used to
load an XMM register from a 128-bit memory location, store the contents
of an XMM register into a 128-bit memory location, or move data between
two XMM registers. When the source or destination operand is a memory
operand, the operand may be unaligned on a 16-byte boundary without
causing a general-protection exception (\#GP) to be generated.1

To move packed single-precision floating-point values to and from memory
locations that are known to be aligned on 16-byte boundaries, use the
MOVAPS instruction.

While executing in 16-bit addressing mode, a linear address for a
128-bit data access that overlaps the end of a 16-bit segment is not
allowed and is defined as reserved behavior. A specific processor
implementation may or may not generate a general-protection exception
(\#GP) in this situation, and the address that spans the end of the
segment may or may not wrap around to the beginning of the segment.

In 64-bit mode, use of the REX.R prefix permits this instruction to
access additional registers (XMM8-XMM15).

​1. If alignment checking is enabled (CR0.AM = 1, RFLAGS.AC = 1, and CPL
= 3), an alignment-check exception (\#AC) may or may not be generated
(depending on processor implementation) when the operand is not aligned
on an 8-byte boundary.

"
	^ self
		addInstruction: #movups
		operands: { aRegisterOrMemory1 . aRegisterOrMemory2 }
]

{ #category : #convenience }
AJx86Assembler >> movzx: src to: dest [
	"Ensure right src/dest order"
	^ self movzx: dest with: src
]

{ #category : #'instructions generated' }
AJx86Assembler >> movzx: aDestinationRegister with: aSourceRegisterOrMemory [
	"Move with Zero-Extend
	Pseudo Code
-----------
DEST = ZeroExtend(SRC);

Description
-----------
Copies the contents of the source operand (register or memory location)
to the destination operand (register) and zero extends the value. The
size of the converted value depends on the operand-size attribute.

In 64-bit mode, the instruction's default operation size is 32 bits. Use
of the REX.R prefix permits access to additional registers (R8-R15). Use
of the REX.W prefix promotes operation to 64 bit operands. See the
summary chart at the beginning of this section for encoding data and
limits.

"
	^ self
		addInstruction: #movzx
		operands: { aDestinationRegister . aSourceRegisterOrMemory }
]

{ #category : #'instructions generated' }
AJx86Assembler >> mul: aDestination [
	"Unsigned Multiply
	Description
-----------
Performs an unsigned multiplication of the first operand (destination
operand) and the second operand (source operand) and stores the result
in the destination operand. The destination operand is an implied
operand located in register AL, AX or EAX (depending on the size of the
operand); the source operand is located in a general-purpose register or
a memory location. The action of this instruction and the location of
the result depends on the opcode and the operand size as shown in the
following table.

The result is stored in register AX, register pair DX:AX, or register
pair EDX:EAX (depending on the operand size), with the high-order bits
of the product contained in register AH, DX, or EDX, respectively. If
the high-order bits of the product are 0, the CF and OF flags are
cleared; otherwise, the flags are set.

In 64-bit mode, the instruction's default operation size is 32 bits. Use
of the REX.R prefix permits access to additional registers (R8 - R15).
Use of the REX.W prefix promotes operation to 64 bits.

See the summary chart at the beginning of this section for encoding data
and limits.

  Operand Size   Source 1   Source 2   Destination
  -------------- ---------- ---------- -------------
  Byte           AL         r/m8       AX
  Word           AX         r/m16      DX:AX
  Doubleword     EAX        r/m32      EDX:EAX
  Quadword       RAX        r/m64      RDX:RAX

  : MUL Results

"
	^ self
		addInstruction: #mul
		operands: { aDestination }
]

{ #category : #'instructions generated' }
AJx86Assembler >> neg: aDestination [
	"Two's Complement Negation
	Pseudo Code
-----------
IF DEST = 0
    CF = 0;
ELSE
    CF = 1;
FI;
DEST = [- (DEST)]

Description
-----------
Replaces the value of operand (the destination operand) with its two's
complement. (This operation is equivalent to subtracting the operand
from 0.) The destination operand is located in a general-purpose
register or a memory location.

This instruction can be used with a LOCK prefix to allow the instruction
to be executed atomically.

In 64-bit mode, the instruction's default operation size is 32 bits.
Using a REX prefix in the form of REX.R permits access to additional
registers (R8-R15). Using a REX prefix in the form of REX.W promotes
operation to 64 bits. See the summary chart at the beginning of this
section for encoding data and limits.

"
	^ self
		addInstruction: #neg
		operands: { aDestination }
]

{ #category : #'instruction list' }
AJx86Assembler >> newCallInstruction: name description: description operands: operands [
	^ self newInstruction
		name: name;
		description: description;
		operands: operands;
		checkOperandsForConflict
]

{ #category : #accessing }
AJx86Assembler >> newInstruction [
	^ AJx86Instruction new
]

{ #category : #'instruction list' }
AJx86Assembler >> newInstruction: name description: description operands: operands [
	| instruction |
	description isJump
		ifTrue: [ ^ self newJumpInstruction: name description: description operands: operands ].
	description isCall
		ifTrue: [ ^ self newCallInstruction: name description: description operands: operands ].

	instruction := (AJx86NewInstruction forMnemonic: name) new.
	instruction
		name: name;
		description: description;
		operands: operands;
		is64: self is64;
		checkOperandsForConflict.
	^ instruction
]

{ #category : #accessing }
AJx86Assembler >> newJumpInstruction [
	^ AJx86JumpInstruction new
]

{ #category : #'instruction list' }
AJx86Assembler >> newJumpInstruction: name description: description operands: operands [
	| jumpInstruction destination |
	jumpInstruction := self newJumpInstruction
		name: name;
		description: description.
	operands size ~= 1
		ifTrue: [ Error signal: 'Jump instruction only takes one argument!' ].
	destination := operands first.
	destination isString
		ifTrue: [ ^ jumpInstruction label: (self labelNamed: destination) ].
	destination isLabel
		ifTrue: [ ^ jumpInstruction label: destination ].
	^ self newInstruction
		name: name;
		description: description;
		operands: operands;
		checkOperandsForConflict
]

{ #category : #'instructions generated' }
AJx86Assembler >> not: aDestination [
	"One's Complement Negation
	Pseudo Code
-----------
DEST = NOT DEST;

Description
-----------
Performs a bitwise NOT operation (each 1 is set to 0, and each 0 is set
to 1) on the destination operand and stores the result in the
destination operand location. The destination operand can be a register
or a memory location.

This instruction can be used with a LOCK prefix to allow the instruction
to be executed atomically.

In 64-bit mode, the instruction's default operation size is 32 bits.
Using a REX prefix in the form of REX.R permits access to additional
registers (R8-R15). Using a REX prefix in the form of REX.W promotes
operation to 64 bits. See the summary chart at the beginning of this
section for encoding data and limits.

"
	^ self
		addInstruction: #not
		operands: { aDestination }
]

{ #category : #accessing }
AJx86Assembler >> numGPRegisters [
	"answer the total number of general-purpose registers for target platform"
	^ 8

]

{ #category : #converting }
AJx86Assembler >> operand: anObject [

	anObject isInteger ifTrue: [
		^ anObject asImm
		].

	anObject isString ifTrue: [
		^ anObject
		].

	^ anObject
]

{ #category : #'instructions generated' }
AJx86Assembler >> or: aRegisterOrMemoryOperand with: aSource [
	"Logical Inclusive OR
	Pseudo Code
-----------
DEST = DEST OR SRC;

Description
-----------
Performs a bitwise inclusive OR operation between the destination
(first) and source (second) operands and stores the result in the
destination operand location. The source operand can be an immediate, a
register, or a memory location; the destination operand can be a
register or a memory location. (However, two memory operands cannot be
used in one instruction.) Each bit of the result of the OR instruction
is set to 0 if both corresponding bits of the first and second operands
are 0; otherwise, each bit is set to 1.

This instruction can be used with a LOCK prefix to allow the instruction
to be executed atomically.

In 64-bit mode, the instruction's default operation size is 32 bits.
Using a REX prefix in the form of REX.R permits access to additional
registers (R8-R15). Using a REX prefix in the form of REX.W promotes
operation to 64 bits. See the summary chart at the beginning of this
section for encoding data and limits.

"
	^ self
		addInstruction: #or
		operands: { aRegisterOrMemoryOperand . aSource }
]

{ #category : #accessing }
AJx86Assembler >> pointerSize [
	"the default pointer size in bytes on this CPU"
	^ 4
]

{ #category : #'instructions generated' }
AJx86Assembler >> pop: aRegisterOrMemoryDestination [
	"Pop a Value from the Stack
	Description
-----------
Loads the value from the top of the stack to the location specified with
the destination operand (or explicit opcode) and then increments the
stack pointer. The destination operand can be a general-purpose
register, memory location, or segment register.

The address-size attribute of the stack segment determines the stack
pointer size (16, 32, 64 bits) and the operand-size attribute of the
current code segment determines the amount the stack pointer is
incremented (2, 4, 8 bytes).

For example, if the address- and operand-size attributes are 32, the
32-bit ESP register (stack pointer) is incremented by 4; if they are 16,
the 16-bit SP register is incremented by 2. (The B flag in the stack
segment's segment descriptor determines the stack's address-size
attribute, and the D flag in the current code segment's segment
descriptor, along with prefixes, determines the operand-size attribute
and also the address-size attribute of the destination operand.)

If the destination operand is one of the segment registers DS, ES, FS,
GS, or SS, the value loaded into the register must be a valid segment
selector. In protected mode, popping a segment selector into a segment
register automatically causes the descriptor information associated with
that segment selector to be loaded into the hidden (shadow) part of the
segment register and causes the selector and the descriptor information
to be validated (see the 'Operation' section below).

A NULL value (0000-0003) may be popped into the DS, ES, FS, or GS
register without causing a general protection fault. However, any
subsequent attempt to reference a segment whose corresponding segment
register is loaded with a NULL value causes a general protection
exception (\#GP). In this situation, no memory reference occurs and the
saved value of the segment register is NULL.

The POP instruction cannot pop a value into the CS register. To load the
CS register from the stack, use the RET instruction.

If the ESP register is used as a base register for addressing a
destination operand in memory, the POP instruction computes the
effective address of the operand after it increments the ESP register.
For the case of a 16-bit stack where ESP wraps to 0H as a result of the
POP instruction, the resulting location of the memory write is
processor-family-specific.

The POP ESP instruction increments the stack pointer (ESP) before data
at the old top of stack is written into the destination.

A POP SS instruction inhibits all interrupts, including the NMI
interrupt, until after execution of the next instruction. This action
allows sequential execution of POP SS and MOV ESP, EBP instructions
without the danger of having an invalid stack during an interrupt1.
However, use of the LSS instruction is the preferred method of loading
the SS and ESP registers.

In 64-bit mode, using a REX prefix in the form of REX.R permits access
to additional registers (R8-R15). When in 64-bit mode, POPs using 32-bit
operands are not encodable and POPs to DS, ES, SS are not valid. See the
summary chart at the beginning of this section for encoding data and
limits.

"
	^ self
		addInstruction: #pop
		operands: { aRegisterOrMemoryDestination }
]

{ #category : #'instructions generated' }
AJx86Assembler >> popcnt: aRegister with: aSourceRegisterOrMemory [
	"Bit Population Count
	Description
-----------
This instruction calculates of number of bits set to 1 in the second
operand (source) and returns the count in the first operand (a
destination register).

"
	^ self
		addInstruction: #popcnt
		operands: { aRegister . aSourceRegisterOrMemory }
]

{ #category : #'instructions generated' }
AJx86Assembler >> push: aSource [
	"Push Word, Doubleword or Quadword Onto the Stack
	"
	^ self
		addInstruction: #push
		operands: { aSource }
]

{ #category : #'instructions generated' }
AJx86Assembler >> rcl: aDestinationRegisterOrMemory with: aRegisterOrImmediate [
	"Rotate
	"
	^ self
		addInstruction: #rcl
		operands: { aDestinationRegisterOrMemory . aRegisterOrImmediate }
]

{ #category : #'instructions generated' }
AJx86Assembler >> rcr: aDestinationRegisterOrMemory with: aRegisterOrImmediate [
	"Rotate
	"
	^ self
		addInstruction: #rcr
		operands: { aDestinationRegisterOrMemory . aRegisterOrImmediate }
]

{ #category : #accessing }
AJx86Assembler >> reg16: index [

	"answer one of 16bit general-purpose registers, based on index"
	| code |

	index < 0 ifTrue: [ self invalidRegisterIndex ].
	(index >= self numGPRegisters) ifTrue: [ self invalidRegisterIndex ].

	code := 16r10 + index.
	^ AJx86Registers code: code
]

{ #category : #accessing }
AJx86Assembler >> reg32: index [

	"answer one of 32bit general-purpose registers, based on index"
	| code |

	index < 0 ifTrue: [ self invalidRegisterIndex ].
	(index >= self numGPRegisters) ifTrue: [ self invalidRegisterIndex ].

	code := 16r20 + index.
	^ AJx86Registers code: code
]

{ #category : #accessing }
AJx86Assembler >> reg8: index [

	"answer one of 8bit general-purpose registers, based on index"

	index < 0 ifTrue: [ self invalidRegisterIndex ].
	(index >= self numGPRegisters) ifTrue: [ self invalidRegisterIndex ].

	^ AJx86Registers code: index
]

{ #category : #accessing }
AJx86Assembler >> reg: index size: nBytes [

	nBytes = 1 ifTrue: [ ^ self reg8: index ].
	nBytes = 2 ifTrue: [ ^ self reg16: index ].
	nBytes = 4 ifTrue: [ ^ self reg32: index ].
	nBytes = 8 ifTrue: [ ^ self reg64: index ].

	self error: 'invalid register size'.
]

{ #category : #accessing }
AJx86Assembler >> registers [
	^ AJx86Registers
]

{ #category : #'instructions generated' }
AJx86Assembler >> ret: anImmediate [
	"
	"
	^ self
		addInstruction: #ret
		operands: { anImmediate }
]

{ #category : #'instructions generated' }
AJx86Assembler >> rol: aDestinationRegisterOrMemory with: aRegisterOrImmediate [
	"Rotate
	"
	^ self
		addInstruction: #rol
		operands: { aDestinationRegisterOrMemory . aRegisterOrImmediate }
]

{ #category : #'instructions generated' }
AJx86Assembler >> ror: aDestinationRegisterOrMemory with: aRegisterOrImmediate [
	"Rotate
	"
	^ self
		addInstruction: #ror
		operands: { aDestinationRegisterOrMemory . aRegisterOrImmediate }
]

{ #category : #'instructions generated' }
AJx86Assembler >> sal: aDestinationRegisterOrMemory with: aRegisterOrImmediate [
	"
	"
	^ self
		addInstruction: #sal
		operands: { aDestinationRegisterOrMemory . aRegisterOrImmediate }
]

{ #category : #'instructions generated' }
AJx86Assembler >> sar: aDestinationRegisterOrMemory with: aRegisterOrImmediate [
	"Shift
	"
	^ self
		addInstruction: #sar
		operands: { aDestinationRegisterOrMemory . aRegisterOrImmediate }
]

{ #category : #'instructions generated' }
AJx86Assembler >> sbb: aRegisterOrMemoryOperand with: aSource [
	"Integer Subtraction with Borrow
	"
	^ self
		addInstruction: #sbb
		operands: { aRegisterOrMemoryOperand . aSource }
]

{ #category : #'instructions generated' }
AJx86Assembler >> shl: aDestinationRegisterOrMemory with: aRegisterOrImmediate [
	"Shift
	"
	^ self
		addInstruction: #shl
		operands: { aDestinationRegisterOrMemory . aRegisterOrImmediate }
]

{ #category : #'instructions generated' }
AJx86Assembler >> shld: aDestinationRegisterOrMemory with: aSourceRegister with: aSourceRegisterOrImmediate [
	"Double Precision Shift Left
	Description
-----------
The SHLD instruction is used for multi-precision shifts of 64 bits or
more.

The instruction shifts the first operand (destination operand) to the
left the number of bits specified by the third operand (count operand).
The second operand (source operand) provides bits to shift in from the
right (starting with bit 0 of the destination operand).

The destination operand can be a register or a memory location; the
source operand is a register. The count operand is an unsigned integer
that can be stored in an immediate byte or in the CL register. If the
count operand is CL, the shift count is the logical AND of CL and a
count mask. In non-64-bit modes and default 64-bit mode; only bits 0
through 4 of the count are used. This masks the count to a value between
0 and 31. If a count is greater than the operand size, the result is
undefined.

If the count is 1 or greater, the CF flag is filled with the last bit
shifted out of the destination operand. For a 1-bit shift, the OF flag
is set if a sign change occurred; otherwise, it is cleared. If the count
operand is 0, flags are not affected.

In 64-bit mode, the instruction's default operation size is 32 bits.
Using a REX prefix in the form of REX.R permits access to additional
registers (R8-R15). Using a REX prefix in the form of REX.W promotes
operation to 64 bits (upgrading the count mask to 6 bits). See the
summary chart at the beginning of this section for encoding data and
limits.

"
	^ self
		addInstruction: #shld
		operands: { aDestinationRegisterOrMemory . aSourceRegister . aSourceRegisterOrImmediate }
]

{ #category : #'instructions generated' }
AJx86Assembler >> shr: aDestinationRegisterOrMemory with: aRegisterOrImmediate [
	"Shift
	"
	^ self
		addInstruction: #shr
		operands: { aDestinationRegisterOrMemory . aRegisterOrImmediate }
]

{ #category : #'instructions generated' }
AJx86Assembler >> shrd: aDestinationRegisterOrMemory with: aSourceRegister with: aSourceRegisterOrImmediate [
	"Double Precision Shift Right
	Description
-----------
The SHRD instruction is useful for multi-precision shifts of 64 bits or
more.

The instruction shifts the first operand (destination operand) to the
right the number of bits specified by the third operand (count operand).
The second operand (source operand) provides bits to shift in from the
left (starting with the most significant bit of the destination
operand).

The destination operand can be a register or a memory location; the
source operand is a register. The count operand is an unsigned integer
that can be stored in an immediate byte or the CL register. If the count
operand is CL, the shift count is the logical AND of CL and a count
mask. In non-64-bit modes and default 64-bit mode, the width of the
count mask is 5 bits. Only bits 0 through 4 of the count register are
used (masking the count to a value between 0 and 31). If the count is
greater than the operand size, the result is undefined.

If the count is 1 or greater, the CF flag is filled with the last bit
shifted out of the destination operand. For a 1-bit shift, the OF flag
is set if a sign change occurred; otherwise, it is cleared. If the count
operand is 0, flags are not affected.

In 64-bit mode, the instruction's default operation size is 32 bits.
Using a REX prefix in the form of REX.R permits access to additional
registers (R8-R15). Using a REX prefix in the form of REX.W promotes
operation to 64 bits (upgrading the count mask to 6 bits). See the
summary chart at the beginning of this section for encoding data and
limits.

"
	^ self
		addInstruction: #shrd
		operands: { aDestinationRegisterOrMemory . aSourceRegister . aSourceRegisterOrImmediate }
]

{ #category : #register }
AJx86Assembler >> sourceIndex [
	^ self is32BitMode
		 ifTrue: [ self ESI ]
		ifFalse: [ self SI ]
]

{ #category : #'stack management' }
AJx86Assembler >> stackFrameValueAtOffset: offset [

	^ self EBP ptr32 - offset
]

{ #category : #register }
AJx86Assembler >> stackPointer [
	^ self is32
		ifTrue: [ self ESP ]
		ifFalse: [ self SP ]
]

{ #category : #'instructions generated' }
AJx86Assembler >> stmxcsr: aMemoryOperand [
	"Store MXCSR Register State
	Pseudo Code
-----------
m32 = MXCSR;

Description
-----------
Stores the contents of the MXCSR control and status register to the
destination operand. The destination operand is a 32-bit memory
location. The reserved bits in the MXCSR register are stored as 0s.

This instruction's operation is the same in non-64-bit modes and 64-bit
mode.

"
	^ self
		addInstruction: #stmxcsr
		operands: { aMemoryOperand }
]

{ #category : #'instructions generated' }
AJx86Assembler >> sub: aRegisterOrMemoryOperand with: aSource [
	"Subtract
	Pseudo Code
-----------
DEST = (DEST - SRC);

Description
-----------
Subtracts the second operand (source operand) from the first operand
(destination operand) and stores the result in the destination operand.
The destination operand can be a register or a memory location; the
source operand can be an immediate, register, or memory location.
(However, two memory operands cannot be used in one instruction.) When
an immediate value is used as an operand, it is sign-extended to the
length of the destination operand format.

The SUB instruction performs integer subtraction. It evaluates the
result for both signed and unsigned integer operands and sets the OF and
CF flags to indicate an overflow in the signed or unsigned result,
respectively. The SF flag indicates the sign of the signed result.

In 64-bit mode, the instruction's default operation size is 32 bits.
Using a REX prefix in the form of REX.R permits access to additional
registers (R8-R15). Using a REX prefix in the form of REX.W promotes
operation to 64 bits. See the summary chart at the beginning of this
section for encoding data and limits.

This instruction can be used with a LOCK prefix to allow the instruction
to be executed atomically.

"
	^ self
		addInstruction: #sub
		operands: { aRegisterOrMemoryOperand . aSource }
]

{ #category : #'instructions generated' }
AJx86Assembler >> syscall [
	"SYSCALL saves the RIP of the instruction following SYSCALL to RCX and loads a new
RIP from the IA32_LSTAR (64-bit mode). Upon return, SYSRET copies the value
saved in RCX to the RIP.
SYSCALL saves RFLAGS (lower 32 bit only) in R11. It then masks RFLAGS with an
OS-defined value using the IA32_FMASK (MSR C000_0084). The actual mask value
used by the OS is the complement of the value written to the IA32_FMASK MSR.
None of the bits in RFLAGS are automatically cleared (except for RF). SYSRET
restores RFLAGS from R11 (the lower 32 bits only).
Software should not alter the CS or SS descriptors in a manner that violates the
following assumptions made by SYSCALL/SYSRET:

* The CS and SS base and limit remain the same for all processes, including the
operating system (the base is 0H and the limit is 0FFFFFFFFH).

* The CS of the SYSCALL target has a privilege level of 0.

* The CS of the SYSRET target has a privilege level of 3.

SYSCALL/SYSRET do not check for violations of these assumptions.

Operation

IF (CS.L ~= 1 ) or (IA32_EFER.LMA ~= 1) or (IA32_EFER.SCE ~= 1)
(* Not in 64-Bit Mode or SYSCALL/SYSRET not enabled in IA32_EFER *)
  THEN #UD; FI;
RCX := RIP;
RIP := LSTAR_MSR;
R11 := EFLAGS;
EFLAGS := (EFLAGS MASKED BY IA32_FMASK);
CPL := 0;
CS(SEL) := IA32_STAR_MSR[47:32];
CS(DPL) := 0;
CS(BASE) := 0;
CS(LIMIT) := 0xFFFFF;
CS(GRANULAR) := 1;
SS(SEL) := IA32_STAR_MSR[47:32] + 8;
SS(DPL) := 0;
SS(BASE) := 0;
SS(LIMIT) := 0xFFFFF;
SS(GRANULAR) := 1;
"

	^ self addInstruction: #syscall operands: #()
]

{ #category : #'instructions generated' }
AJx86Assembler >> test: aRegisterOrMemory with: aRegisterOrImmediate [
	"Logical Compare
	Description
-----------
Computes the bit-wise logical AND of first operand (source 1 operand)
and the second operand (source 2 operand) and sets the SF, ZF, and PF
status flags according to the result. The result is then discarded.

In 64-bit mode, using a REX prefix in the form of REX.R permits access
to additional registers (R8-R15). Using a REX prefix in the form of
REX.W promotes operation to 64 bits. See the summary chart at the
beginning of this section for encoding data and limits.

"
	^ self
		addInstruction: #test
		operands: { aRegisterOrMemory . aRegisterOrImmediate }
]

{ #category : #accessing }
AJx86Assembler >> undefinedLabels [

	"answer a collection of labels, which having no defined position "
	| lbls |
	lbls := OrderedCollection new.

	labels keysAndValuesDo: [:key :value |
		value ifNil: [ lbls add: key]
	].
	^ lbls
]

{ #category : #labels }
AJx86Assembler >> uniqueLabelName: aName [

	^ self labelNamed: aName, labels size asString
]

{ #category : #accessing }
AJx86Assembler >> wordSize [
	^ 4
]

{ #category : #debugging }
AJx86Assembler >> writeCodeToFile: aFileName [
	aFileName asReference asReference delete writeStreamDo: [:s|
		s nextPutAll: self bytes
		]

]

{ #category : #'instructions generated' }
AJx86Assembler >> xadd: aDestinationRegisterOrMemory with: aSourceRegister [
	"Exchange and Add
	Pseudo Code
-----------
TEMP = SRC + DEST;
SRC = DEST;
DEST = TEMP;

Description
-----------
Exchanges the first operand (destination operand) with the second
operand (source operand), then loads the sum of the two values into the
destination operand. The destination operand can be a register or a
memory location; the source operand is a register.

In 64-bit mode, the instruction's default operation size is 32 bits.
Using a REX prefix in the form of REX.R permits access to additional
registers (R8-R15). Using a REX prefix in the form of REX.W promotes
operation to 64 bits. See the summary chart at the beginning of this
section for encoding data and limits.

This instruction can be used with a LOCK prefix to allow the instruction
to be executed atomically.

"
	^ self
		addInstruction: #xadd
		operands: { aDestinationRegisterOrMemory . aSourceRegister }
]

{ #category : #'instructions generated' }
AJx86Assembler >> xchg: aDestinationRegisterOrMemory with: aSourceRegister [
	"Exchange Register/Memory with Register
	Pseudo Code
-----------
TEMP = DEST;
DEST = SRC;
SRC = TEMP;

Description
-----------
Exchanges the contents of the destination (first) and source (second)
operands. The operands can be two general-purpose registers or a
register and a memory location. If a memory operand is referenced, the
processor's locking protocol is automatically implemented for the
duration of the exchange operation, regardless of the presence or
absence of the LOCK prefix or of the value of the IOPL. (See the LOCK
prefix description in this chapter for more information on the locking
protocol.)

This instruction is useful for implementing semaphores or similar data
structures for process synchronization. (See 'Bus Locking' in Chapter 8
of theIntel® 64 and IA-32Architectures Software Developer's Manual,
Volume 3A, for more information on bus locking.)

The XCHG instruction can also be used instead of the BSWAP instruction
for 16-bit operands.

In 64-bit mode, the instruction's default operation size is 32 bits.
Using a REX prefix in the form of REX.R permits access to additional
registers (R8-R15). Using a REX prefix in the form of REX.W promotes
operation to 64 bits. See the summary chart at the beginning of this
section for encoding data and limits.

"
	^ self
		addInstruction: #xchg
		operands: { aDestinationRegisterOrMemory . aSourceRegister }
]

{ #category : #'instructions generated' }
AJx86Assembler >> xor: aRegisterOrMemoryOperand with: aSource [
	"Logical Exclusive OR
	Pseudo Code
-----------
DEST = DEST XOR SRC;

Description
-----------
Performs a bitwise exclusive OR (XOR) operation on the destination
(first) and source (second) operands and stores the result in the
destination operand location. The source operand can be an immediate, a
register, or a memory location; the destination operand can be a
register or a memory location. (However, two memory operands cannot be
used in one instruction.) Each bit of the result is 1 if the
corresponding bits of the operands are different; each bit is 0 if the
corresponding bits are the same.

This instruction can be used with a LOCK prefix to allow the instruction
to be executed atomically.

In 64-bit mode, using a REX prefix in the form of REX.R permits access
to additional registers (R8-R15). Using a REX prefix in the form of
REX.W promotes operation to 64 bits. See the summary chart at the
beginning of this section for encoding data and limits.

"
	^ self
		addInstruction: #xor
		operands: { aRegisterOrMemoryOperand . aSource }
]
