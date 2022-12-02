Extension { #name : #AJx86Instruction }

{ #category : '*Tinyrossa-Tools-SmalltalkX-AMD64' }
AJx86Instruction >> disassemble [
	((Smalltalk includesKey: #UDIS86) and:[machineCode notNil]) ifTrue: [ 
		^ (Smalltalk at: #UDIS86) disassemble: machineCode
	].
	^ String streamContents: [ :s | self name printOn: s. self printOperandsOn: s  ]
]
