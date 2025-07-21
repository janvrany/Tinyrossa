Class {
	#name : #TRGASGenerator,
	#superclass : #Object,
	#instVars : [
		'compilation',
		'files',
		'file',
		'bci'
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
		asm nextPutAll: '        .globl '; nextPutAll: compilation functionSymbol name; lf.
		asm nextPutAll: '        .type  '; nextPutAll: compilation functionSymbol name; nextPutAll: ', @function'; lf.
		asm nextPutAll: '        .cfi_startproc'; lf.
		compilation codeBuffer instructions do:[:insn |
			self generateInstruction: insn on: asm.
			asm lf.
		].
		asm nextPutAll: '        .cfi_endproc'; lf.
	].
]

{ #category : #'generating output' }
TRGASGenerator >> generateInstruction: insn on: asm [
	| location relocation |

	location := insn location.
	location isTRSourceLocation ifTrue: [ 
		| fileNo |

		file ~= location file ifTrue: [
			fileNo := files indexOf: location file.
			fileNo == 0 ifTrue: [ 
				files add: location file.
				fileNo := files size.
				asm nextPutAll: '        .file '.
				fileNo printOn: asm.
				asm space.
				location file printOn: asm.
				asm lf.
			].
			file := location file.
		].
		asm nextPutAll: '        .loc '.
		fileNo printOn: asm.
		asm space.
		location line printOn: asm.
		location column notNil ifTrue: [ 
			asm space.
			location column printOn: asm.
		].
		insn node opcode isTreeTop ifTrue: [ 
			asm nextPutAll: ' is_stmt 1'.
		] ifFalse: [ 
			asm nextPutAll: ' is_stmt 0'.
		].
		asm lf.
	].
	location isTRBytecodeLocation ifTrue: [ 
		bci ~= location index ifTrue: [
			asm lf.    
			asm nextPutAll: '         /* BCI '.
			location index printOn: asm.
			asm nextPutAll: ' */'.
			asm lf.
			bci := location index.
		].
	].

	relocation := insn relocation.
	relocation notNil ifTrue: [
		self assert: (relocation addend = 0).
		self assert: (relocation symbol notNil).

		asm nextPutAll: '        '.
		asm nextPutAll: '.reloc ., '; nextPutAll: relocation type; nextPutAll: ', '; nextPutAll: relocation symbol asString.
		asm lf.
	].

	insn isLabelInstruction ifTrue: [ 
		asm nextPutAll: insn symbol asString; nextPut: $:.
	] ifFalse: [ 
	insn isProcessorInstruction ifTrue: [ 
		asm nextPutAll: '        '. 
		"
		asm nextPutAll: ' /* '; nextPutAll: insn disassemble; nextPutAll: ' */'.
		asm nextPutAll: ' .byte '.
		insn asByteArray do: [:byte | asm nextPutAll:'0x'. byte printOn: asm base: 16 ]
				separatedBy: [ asm nextPutAll: ', ' ].
		"
		asm nextPutAll: insn disassemble        
	]].
]

{ #category : #initialization }
TRGASGenerator >> initializeWithCompilation: aTRCompilation [ 
	compilation := aTRCompilation.
	files := OrderedCollection new.
]
