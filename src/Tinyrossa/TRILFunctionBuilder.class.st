Class {
	#name : #TRILFunctionBuilder,
	#superclass : #TRILBuilder,
	#category : #'Tinyrossa-IL-Builder'
}

{ #category : #'instance creation' }
TRILFunctionBuilder class >> forCompilation: aTRCompilation [
	^ self forCompilation: aTRCompilation block: aTRCompilation cfg entry.
]

{ #category : #'defining symbols' }
TRILFunctionBuilder >> defineAutomatic: name type: type [
	^ compilation symbolManager defineAutomatic: name type: type
]

{ #category : #'defining symbols' }
TRILFunctionBuilder >> defineName: name type: type [
	"Define this function's name and return type"
	| linkageClass symbol |

	linkageClass := compilation config linkageClass.
	symbol := compilation symbolManager defineFunction: name type: type linkage: linkageClass.
	compilation setFunctionSymbol: symbol.
	^ symbol
]

{ #category : #'defining symbols' }
TRILFunctionBuilder >> defineParameter: name type: type [
	^ compilation symbolManager defineParameter: name type: type
]
