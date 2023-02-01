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

{ #category : #'defining locations' }
TRILFunctionBuilder >> defineFile: file line: line [
	"Define this function's source location"

	self defineFile: file line: line column: 0.
]

{ #category : #'defining locations' }
TRILFunctionBuilder >> defineFile: file line: line column: column [
	"Define this function's source location"

	self file: file line: line column: column.
	compilation entry treetops first location: location.
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
