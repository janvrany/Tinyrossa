Class {
	#name : #TRILFunctionBuilder,
	#superclass : #TRILBuilder,
	#category : #'Tinyrossa-IL'
}

{ #category : #'defining symbols' }
TRILFunctionBuilder >> defineParameter: name type: type [
	compilation symbolManager defineParameter: name type: type
]
