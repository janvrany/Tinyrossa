Extension { #name : #AJx86Instruction }

{ #category : #'*Tinyrossa-Tools-SmalltalkX-AMD64' }
AJx86Instruction >> disassemble [
	((Smalltalk includesKey: #UDIS86) and:[machineCode notNil]) ifTrue: [ 
		^ ((Smalltalk at: #UDIS86) new disassemble: machineCode) first assembly
	].
	^ String streamContents: [ :s | self name printOn: s. self printOperandsOn: s  ]
]
