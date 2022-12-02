Extension { #name : #Integer }

{ #category : #'*AsmJit-Extension' }
Integer >> asAJOperand [
	"Convert receiver into operand: a signed immediate"
	^ AJImmediate new ivalue: self
]

{ #category : #'*AsmJit-Extension' }
Integer >> asByte [
	^ self asTwosComplement: 16rFF
]

{ #category : #'*AsmJit-Extension' }
Integer >> asDoubleWord [
	^ self asTwosComplement: 16rFFFFFFFF
]

{ #category : #'*AsmJit-Extension' }
Integer >> asImm [

	"Convert integer value into a signed immediate operand"
	^ AJImmediate new ivalue: self
]

{ #category : #'*AsmJit-Extension' }
Integer >> asImm16 [

	"Convert integer value into a signed immediate word operand "
	^ AJImmediate new ivalue: self; size: 2
]

{ #category : #'*AsmJit-Extension' }
Integer >> asImm32 [

	"Convert integer value into a signed immediate operand"
	^ AJImmediate new ivalue: self; size: 4
]

{ #category : #'*AsmJit-Extension' }
Integer >> asImm8 [

	"Convert integer value into a signed immediate operand"
	^ AJImmediate new ivalue: self; size: 1
]

{ #category : #'*AsmJit-Extension' }
Integer >> asQuadWord [
	^ self asTwosComplement: 16rFFFFFFFFFFFFFFFF
]

{ #category : #'*AsmJit-Extension' }
Integer >> asTwosComplement: mask [
	"return the two's completemented cropped version.
	Example for a byte value:
		-5 asTwosComplement: 16rFF "
	| bound |
	bound := (mask + 1).

	self * 2 >= bound
		ifTrue: [Error signal: self printString , ' too big for signed ', mask highBit printString,  'bit value'].

	(self >= 0)
		ifTrue: [ ^ self bitAnd: mask ].

	self * 2 < bound negated
		ifTrue: [Error signal: self printString , ' too small for signed ', mask highBit printString, 'bit value'].

	^ (self + mask + 1) bitAnd: mask
]

{ #category : #'*AsmJit-Extension' }
Integer >> asUImm [

	"Convert integer value into an unsigned immediate operand"
	^ AJImmediate new uvalue: self
]

{ #category : #'*AsmJit-Extension' }
Integer >> asUImm16 [

	"Convert integer value into an unsigned immediate operand"
	^ AJImmediate new uvalue: self; size: 2
]

{ #category : #'*AsmJit-Extension' }
Integer >> asUImm32 [

	"Convert integer value into an unsigned immediate operand"
	^ AJImmediate new uvalue: self; size: 4
]

{ #category : #'*AsmJit-Extension' }
Integer >> asUImm8 [

	"Convert integer value into an unsigned immediate operand"
	^ AJImmediate new uvalue: self; size: 1
]

{ #category : #'*AsmJit-Extension' }
Integer >> asWord [
	^ self asTwosComplement: 16rFFFF
]

{ #category : #'*AsmJit-Extension' }
Integer >> bin [
	"Print the receiver as hex, prefixed with 2r."
	^self storeStringBase: 2
]

{ #category : #'*AsmJit-Extension' }
Integer >> isByte [
	^ self >= 0 and: [ self <= 255 ]
]

{ #category : #'*AsmJit-Extension' }
Integer >> printAsOperandOn: aStream [
	aStream print: self.
]

{ #category : #'*AsmJit-Extension' }
Integer >> validateIn: anObject [
	^ anObject validateImmediate: self asImm
]
