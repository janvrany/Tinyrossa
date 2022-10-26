Class {
	#name : #TRGASGenerator,
	#superclass : #Object,
	#instVars : [
		'compilation'
	],
	#category : #'Tinyrossa-AOT'
}

{ #category : #'instance creation' }
TRGASGenerator class >> forCompilation: aTRCompilation [
	^ self basicNew initializeWithCompilation: aTRCompilation
]

{ #category : #'instance creation' }
TRGASGenerator class >> new [
	self shouldNotImplement. "Use #forCompilation:"
]

{ #category : #'generating output' }
TRGASGenerator >> generateAssemblerFile [
	| asmFile |

	asmFile := (compilation config objectFile , '.s') asFileReference.
	asmFile exists ifTrue:[
			asmFile delete.
	].
	asmFile writeStreamDo: [ :asm |
		asm nextPutAll: '        .globl ', compilation functionSymbol name; lf.
		asm nextPutAll: '        .type  ', compilation functionSymbol name , ', @function'; lf.
		asm nextPutAll: '        .cfi_startproc'; lf.
		compilation codeBuffer instructions do:[:insn |
			insn isLabelInstruction ifTrue: [ 
				asm nextPutAll: insn symbol; nextPut: $:.
			] ifFalse: [ 
			insn isProcessorInstruction ifTrue: [ 
				asm nextPutAll: '        '.
				asm nextPutAll: ' /* ', insn disassemble , ' */'.
				asm nextPutAll: ' .byte '.
				insn asByteArray do: [:byte | asm nextPutAll:'0x'. byte printOn: asm base: 16 ]
						separatedBy: [ asm nextPutAll: ', ' ].

			]].
			asm lf.
		].
		asm nextPutAll: '        .cfi_endproc'; lf.
	].
]

{ #category : #initialization }
TRGASGenerator >> initializeWithCompilation: aTRCompilation [ 
	compilation := aTRCompilation.
]
