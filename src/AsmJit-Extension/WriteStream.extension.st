Extension { #name : #WriteStream }

{ #category : #'*AsmJit-Extension' }
WriteStream >> asLineStream [
	^ AJLineStream on: self
]
