Extension { #name : #TRCompilationConfig }

{ #category : #'*Tinyrossa-Formal' }
TRCompilationConfig >> checkTermination [
	^ options at: #CheckTermination ifAbsent:[ true ]
]

{ #category : #'*Tinyrossa-Formal' }
TRCompilationConfig >> checkTermination: aBoolean [
	^ options at: #CheckTermination put: aBoolean
]
