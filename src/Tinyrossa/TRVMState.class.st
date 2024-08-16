Class {
	#name : #TRVMState,
	#superclass : #Object,
	#instVars : [
		'stack',
		'registers'
	],
	#category : #'Tinyrossa-IL-Builder-Bytecode'
}

{ #category : #'instance creation' }
TRVMState class >> new [
	"return an initialized instance"

	^ self basicNew initialize.
]

{ #category : #initialization }
TRVMState >> defineRegister: registerName [
	self halt.
]

{ #category : #initialization }
TRVMState >> initialize [
	super initialize.
	stack := TRVMOperandStack new.
	registers := TRVMRegisters new.
]

{ #category : #operations }
TRVMState >> mergeInto: currentState using: builder [
	stack mergeInto: currentState stack using: builder
]

{ #category : #operations }
TRVMState >> pop [
	^ stack pop
]

{ #category : #copying }
TRVMState >> postCopy [
	stack := stack copy.
	registers := registers copy.
	registers keysAndValuesDo: [ :regName :reg |
		registers at: regName put: reg copy
	].
]

{ #category : #operations }
TRVMState >> push: aTRILValue [
	^ stack push: aTRILValue
]

{ #category : #accessing }
TRVMState >> registerNamed: regName [
	^ registers at: regName ifAbsent: 'No VM register named ', regName asString.
]

{ #category : #accessing }
TRVMState >> registers [
	^ registers
]

{ #category : #accessing }
TRVMState >> stack [
	^ stack
]
