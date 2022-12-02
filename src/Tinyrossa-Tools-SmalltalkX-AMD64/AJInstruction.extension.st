Extension { #name : #AJInstruction }

{ #category : '*Tinyrossa-Tools-SmalltalkX-AMD64' }
AJInstruction >> asGDBInstruction [
	^ GDBInstruction new
		propertyAt: #address put: nil;
		propertyAt: #opcodes put: self machineCode;
		propertyAt: #inst put: self disassemble;
		propertyAt: #dissection put: self;
		yourself
]

{ #category : '*Tinyrossa-Tools-SmalltalkX-AMD64' }
AJInstruction >> disassemble [
	^ String streamContents: [ :s | self printSelfOn: s ]
]

{ #category : '*Tinyrossa-Tools-SmalltalkX-AMD64' }
AJInstruction >> machineCode [
	machineCode isNil ifTrue: [ 
		^ ByteArray new: self machineCodeSize.
	].
	^ machineCode
]
