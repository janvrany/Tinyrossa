Class {
	#name : #TRAMD64CodeEvaluator,
	#superclass : #TRCodeEvaluator,
	#category : #'Tinyrossa-AMD64-Codegen'
}

{ #category : #evaluation }
TRAMD64CodeEvaluator >> evaluate_iconst: node [
	| dstReg |

	dstReg := self codegen allocateRegister dword.

	generate 
		mov: node constant -> dstReg.

	^ dstReg
]
