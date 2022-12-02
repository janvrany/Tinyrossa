"
Convert Packed Double-Precision Floating-Point Values to Packed Single-Precision Floating-Point Values
"
Class {
	#name : #AJx86CVTPD2PS,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE2'
}

{ #category : #accessing }
AJx86CVTPD2PS class >> description [
	^ #(#cvtpd2ps #mmurmi "op1" 2r100000 "op2" 2r1100000 "R" 0 "C1" 16r66000F5A 0 )
]

{ #category : #accessing }
AJx86CVTPD2PS class >> mnemonic [
	^ #cvtpd2ps
]
