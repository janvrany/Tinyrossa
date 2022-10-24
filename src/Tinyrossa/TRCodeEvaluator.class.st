Class {
	#name : #TRCodeEvaluator,
	#superclass : #TRILEvaluator,
	#instVars : [
		'codegen',
		'currentNode'
	],
	#category : #'Tinyrossa-Codegen'
}

{ #category : #'instance creation' }
TRCodeEvaluator class >> forCodeGenerator: aTRCodeGenerator [
	^ self basicNew initializeWithCodeGenerator: aTRCodeGenerator
]

{ #category : #'instance creation' }
TRCodeEvaluator class >> new [
	self shouldNotImplement. "Use #forCodeGenerator:"
]

{ #category : #evaluation }
TRCodeEvaluator >> evaluate: node [
	| savedNode |

	savedNode := currentNode.
	currentNode := node.
	^ [ super evaluate: node ] 
		ensure: [ currentNode := savedNode.].
]

{ #category : #evaluation }
TRCodeEvaluator >> evaluate_areturn: node [
	self evaluate_return: node
]

{ #category : #evaluation }
TRCodeEvaluator >> evaluate_bbend: node [
	"Nothing to do"
]

{ #category : #evaluation }
TRCodeEvaluator >> evaluate_bbstart: node [
	"Nothing to do"
]

{ #category : #evaluation }
TRCodeEvaluator >> evaluate_dreturn: node [
	self evaluate_return: node
]

{ #category : #evaluation }
TRCodeEvaluator >> evaluate_freturn: node [
	self evaluate_return: node
]

{ #category : #evaluation }
TRCodeEvaluator >> evaluate_ireturn: node [
	self evaluate_return: node
]

{ #category : #evaluation }
TRCodeEvaluator >> evaluate_lreturn: node [
	self evaluate_return: node
]

{ #category : #evaluation }
TRCodeEvaluator >> evaluate_return: node [
	^ self subclassResponsibility
]

{ #category : #initialization }
TRCodeEvaluator >> initializeWithCodeGenerator: aTRCodeGenerator [
	codegen := aTRCodeGenerator
]
