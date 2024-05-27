"
Virtual registers used for relative instruction pointer addressing in 64Bit mode

In IA-32 architecture and compatibility mode, addressing relative to the instruction pointer is available only with control-transfer instructions. In 64-bit mode, instruc- tions that use ModR/M addressing can use RIP-relative addressing. Without RIP-rela- tive addressing, all ModR/M instruction modes address memory relative to zero.
"
Class {
	#name : #AJx64RipRegister,
	#superclass : #AJx86GeneralPurposeRegister,
	#pools : [
		'AJConstants',
		'AJx86Registers'
	],
	#category : #'AsmJit-x86-Operands'
}

{ #category : #converting }
AJx64RipRegister >> as16 [
	^ AJx86Registers at: #IP
]

{ #category : #converting }
AJx64RipRegister >> as32 [
	^ AJx86Registers at: #EIP
]

{ #category : #converting }
AJx64RipRegister >> as64 [
	^ AJx86Registers at: #RIP
]

{ #category : #converting }
AJx64RipRegister >> as8 [

	self error: 'No 8bit register available for instruction pointer relative addressing'
]

{ #category : #accessing }
AJx64RipRegister >> code [
	self ripAccessError
]

{ #category : #printing }
AJx64RipRegister >> descriptionOn: s [
	s nextPutAll: 'A '; print: self size * 8; nextPutAll: 'bit instruction pointer register'.
]

{ #category : #accessing }
AJx64RipRegister >> index [
	self ripAccessError
]

{ #category : #accessing }
AJx64RipRegister >> influencingRegisters [
	self is16
		ifFalse: [ ^ self as16 influencingRegisters ].
	^ { self as16. self as32. self as64 }
]

{ #category : #testing }
AJx64RipRegister >> isGeneralPurpose [
	^ false
]

{ #category : #testing }
AJx64RipRegister >> isRip [
	^ true
]

{ #category : #testing }
AJx64RipRegister >> isUpperBank [
	^ false
]

{ #category : #testing }
AJx64RipRegister >> isX86 [
	^ false
]

{ #category : #error }
AJx64RipRegister >> ripAccessError [
	self error: 'RIP register ', self name, ' can only be used for relative addressing'
]
