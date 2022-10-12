"
Implements RISC-V standard ps ABI [1]

[1]: https://github.com/riscv-non-isa/riscv-elf-psabi-doc

"
Class {
	#name : #TRRV64GPSABILinkage,
	#superclass : #TRLinkage,
	#instVars : [
		'generate'
	],
	#pools : [
		'TRRV64GRegisters'
	],
	#category : #'Tinyrossa-RISCV-Codegen'
}

{ #category : #accessing }
TRRV64GPSABILinkage >> allocatableRegisters [

	"FIXME: bogus!"
	^ { t0 . t1 . t2 . t3 . t4 . t5 . t6 . a0 . a1 . a2}
]

{ #category : #initialization }
TRRV64GPSABILinkage >> initializeWithCodeGenerator: aTRCodeGenerator [ 
	super initializeWithCodeGenerator: aTRCodeGenerator.
	generate := codegen assembler
]
