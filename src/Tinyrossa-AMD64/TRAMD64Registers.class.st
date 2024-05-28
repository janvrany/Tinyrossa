Class {
	#name : #TRAMD64Registers,
	#superclass : #SharedPool,
	#classVars : [
		'eax',
		'ebp',
		'ebx',
		'ecx',
		'edi',
		'edx',
		'esi',
		'esp',
		'r10',
		'r10d',
		'r11',
		'r11d',
		'r12',
		'r12d',
		'r13',
		'r13d',
		'r14',
		'r14d',
		'r15',
		'r15d',
		'r8',
		'r8d',
		'r9',
		'r9d',
		'rax',
		'rbp',
		'rbx',
		'rcx',
		'rdi',
		'rdx',
		'rsi',
		'rsp'
	],
	#pools : [
		'AJx86Registers',
		'TRRegisterKinds'
	],
	#category : #'Tinyrossa-AMD64-Codegen'
}

{ #category : #initialization }
TRAMD64Registers class >> initialize [
	rax := TRAMD64Register value: RAX kind: GPR.
	rcx := TRAMD64Register value: RCX kind: GPR.
	rdx := TRAMD64Register value: RDX kind: GPR.
	rbx := TRAMD64Register value: RBX kind: GPR.
	rsp := TRAMD64Register value: RSP kind: GPR.
	rbp := TRAMD64Register value: RBP kind: GPR.
	rsi := TRAMD64Register value: RSI kind: GPR.
	rdi := TRAMD64Register value: RDI kind: GPR.
	r8  := TRAMD64Register value: R8  kind: GPR.
	r9  := TRAMD64Register value: R9  kind: GPR.
	r10 := TRAMD64Register value: R10 kind: GPR.
	r11 := TRAMD64Register value: R11 kind: GPR.
	r12 := TRAMD64Register value: R12 kind: GPR.
	r13 := TRAMD64Register value: R13 kind: GPR.
	r14 := TRAMD64Register value: R14 kind: GPR.
	r15 := TRAMD64Register value: R15 kind: GPR.

	eax := TRAMD64Register value: EAX kind: GPR.
	ecx := TRAMD64Register value: ECX kind: GPR.
	edx := TRAMD64Register value: EDX kind: GPR.
	ebx := TRAMD64Register value: EBX kind: GPR.
	esp := TRAMD64Register value: ESP kind: GPR.
	ebp := TRAMD64Register value: EBP kind: GPR.
	esi := TRAMD64Register value: ESI kind: GPR.
	edi := TRAMD64Register value: EDI kind: GPR.
	r8d := TRAMD64Register value: R8D kind: GPR.
	r9d := TRAMD64Register value: R9D kind: GPR.
	r10d:= TRAMD64Register value: R10D kind: GPR.
	r11d:= TRAMD64Register value: R11D kind: GPR.
	r12d:= TRAMD64Register value: R12D kind: GPR.
	r13d:= TRAMD64Register value: R13D kind: GPR.
	r14d:= TRAMD64Register value: R14D kind: GPR.
	r15d:= TRAMD64Register value: R15D kind: GPR.

	rax setOverlaps: { rax  . eax  . nil . nil }.
	rcx setOverlaps: { rcx  . ecx  . nil . nil }.
	rdx setOverlaps: { rdx  . edx  . nil . nil }.
	rbx setOverlaps: { rbx  . ebx  . nil . nil }.
	rsp setOverlaps: { rsp  . esp  . nil . nil }.
	rbp setOverlaps: { rbp  . ebp  . nil . nil }.
	rsi setOverlaps: { rsi  . esi  . nil . nil }.
	rdi setOverlaps: { rdi  . edi  . nil . nil }.
	r8  setOverlaps: { r8   . r8d  . nil . nil }.
	r9  setOverlaps: { r9   . r9d  . nil . nil }.
	r10 setOverlaps: { r10  . r10d . nil . nil }.
	r11 setOverlaps: { r11  . r11d . nil . nil }.
	r12 setOverlaps: { r12  . r12d . nil . nil }.
	r13 setOverlaps: { r13  . r13d . nil . nil }.
	r14 setOverlaps: { r14  . r14d . nil . nil }.
	r15 setOverlaps: { r15  . r15d . nil . nil }.
]
