Class {
	#name : #TRAMD64Registers,
	#superclass : #SharedPool,
	#classVars : [
		'r10',
		'r11',
		'r12',
		'r13',
		'r14',
		'r15',
		'r8',
		'r9',
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
	rax := TRRealRegister value: RAX kind: GPR.
	rcx := TRRealRegister value: RCX kind: GPR.
	rdx := TRRealRegister value: RDX kind: GPR.
	rbx := TRRealRegister value: RBX kind: GPR.
	rsp := TRRealRegister value: RSP kind: GPR.
	rbp := TRRealRegister value: RBP kind: GPR.
	rsi := TRRealRegister value: RSI kind: GPR.
	rdi := TRRealRegister value: RDI kind: GPR.
	r8 :=  TRRealRegister value: R8  kind: GPR.
	r9 :=  TRRealRegister value: R9  kind: GPR.
	r10 := TRRealRegister value: R10 kind: GPR.
	r11 := TRRealRegister value: R11 kind: GPR.
	r12 := TRRealRegister value: R12 kind: GPR.
	r13 := TRRealRegister value: R13 kind: GPR.
	r14 := TRRealRegister value: R14 kind: GPR.
	r15 := TRRealRegister value: R15 kind: GPR.
]
