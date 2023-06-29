Class {
	#name : #TRILTestCodeGenerator,
	#superclass : #TRCodeGenerator,
	#category : #'Tinyrossa-Tests-Codegen'
}

{ #category : #'accessing - config' }
TRILTestCodeGenerator >> assemblerClass [
	AcDSLAssembler generated: true.
	^ AcDSLAssembler
]

{ #category : #'accessing - config' }
TRILTestCodeGenerator >> evaluatorClass [
	^ TRCodeEvaluator
]
