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
	#category : #'Tinyrossa-RISCV-Codegen'
}

{ #category : #initialization }
TRRV64GPSABILinkage >> initializeWithCodeGenerator: aTRCodeGenerator [ 
	super initializeWithCodeGenerator: aTRCodeGenerator.
	generate := codegen assembler
]
