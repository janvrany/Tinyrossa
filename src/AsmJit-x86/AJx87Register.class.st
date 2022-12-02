"
I am an x87 Floating Point register (ST0 - ST7) used in the FPU stack.

The lower 64bit of the floating point ST registers are shared with the MMX registers.
"
Class {
	#name : #AJx87Register,
	#superclass : #AJBaseReg,
	#category : #'AsmJit-x86-Operands'
}

{ #category : #'instance creation' }
AJx87Register class >> code: index [
	^ self new
		code: index;
		yourself
]

{ #category : #accessing }
AJx87Register >> code: aCode [

	code := aCode bitOr: RegX87.
	size := 10.
]

{ #category : #printing }
AJx87Register >> descriptionOn: s [
	s nextPutAll: 'A floating point register'.
]

{ #category : #accessing }
AJx87Register >> influencingRegisters [
	"ST registers overlap with the MMX register"
	self shouldBeImplemented.
]

{ #category : #testing }
AJx87Register >> isGeneralPurpose [
	^ false
]

{ #category : #testing }
AJx87Register >> isRegisterX87 [
	^ true
]

{ #category : #testing }
AJx87Register >> isX86 [
	^ true
]
