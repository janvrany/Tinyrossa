Extension { #name : #TRILBlock }

{ #category : #'*Tinyrossa-Tests' }
TRILBlock >> setSuccessor1ForTestingOnly: blockOrNil [
	successor1 notNil ifTrue: [
		successor1 removePrecedessor: self.
	].
	successor1 := blockOrNil.
	successor1 notNil ifTrue: [
		successor1 addPrecedessor: self.
	]
]

{ #category : #'*Tinyrossa-Tests' }
TRILBlock >> setSuccessor2ForTestingOnly: block [
	successor2 notNil ifTrue: [
		successor2 removePrecedessor: self.
	].
	successor2 := block.
	successor2 notNil ifTrue: [
		successor2 addPrecedessor: self.
	]
]
