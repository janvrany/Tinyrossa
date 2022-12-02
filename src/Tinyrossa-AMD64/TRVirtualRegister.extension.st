Extension { #name : #TRVirtualRegister }

{ #category : #'*Tinyrossa-AMD64' }
TRVirtualRegister >> asAJOperand [
	allocation notNil ifTrue: [ 
		allocation value asAJOperand
	] ifFalse: [ 
		self halt.
	].
]

{ #category : #'*Tinyrossa-AMD64' }
TRVirtualRegister >> code [
	^ 0
]

{ #category : #'*Tinyrossa-AMD64' }
TRVirtualRegister >> extractLabels: aBlock [
	"Nothing to do"
]

{ #category : #'*Tinyrossa-AMD64' }
TRVirtualRegister >> is64 [
	^ true
]

{ #category : #'*Tinyrossa-AMD64' }
TRVirtualRegister >> isReg [
	^ true
]

{ #category : #'*Tinyrossa-AMD64' }
TRVirtualRegister >> isUpperBank [
	^ true
]

{ #category : #'*Tinyrossa-AMD64' }
TRVirtualRegister >> printAsOperandOn: aStream [
	value printOn: aStream
]

{ #category : #'*Tinyrossa-AMD64' }
TRVirtualRegister >> requiresRex [
	^ true
]
