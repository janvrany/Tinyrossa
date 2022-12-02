"
Convert Packed Double-Precision Floating-Point Values to Packed Doubleword Integers
"
Class {
	#name : #AJx86CVTPD2PI,
	#superclass : #AJx86MmuRmiInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE2'
}

{ #category : #accessing }
AJx86CVTPD2PI class >> description [
	^ #(#cvtpd2pi #mmurmi "op1" 2r10000 "op2" 2r1100000 "R" 0 "C1" 16r66000F2D 0 )
]

{ #category : #accessing }
AJx86CVTPD2PI class >> mnemonic [
	^ #cvtpd2pi
]
