"
Packed Swap Doubleword
"
Class {
	#name : #AJx86PSWAPD,
	#superclass : #AJx86MmuRm3DNowInstruction,
	#category : #'AsmJit-x86-Instructions-Concrete-SSE2'
}

{ #category : #accessing }
AJx86PSWAPD class >> description [
	^ #(#pswapd #mmuRm3DNow "op1" 2r10000 "op2" 2r1010000 "R" 0 "C1" 16r00000F0F "C2" 16r000000BB )
]

{ #category : #accessing }
AJx86PSWAPD class >> mnemonic [
	^ #pswapd
]
