Class {
	#name : #TRILBytecodeFunctionBuilder,
	#superclass : #TRILBytecodeBuilder,
	#category : #'Tinyrossa-IL-Builder-Bytecode'
}

{ #category : #'instance creation' }
TRILBytecodeFunctionBuilder class >> forCompilation: aTRCompilation [
	^ self forCompilation: aTRCompilation block: aTRCompilation cfg entry.
]

{ #category : #'defining symbols' }
TRILBytecodeFunctionBuilder >> defineAutomatic: name type: type [
	^ compilation symbolManager defineAutomatic: name type: type
]

{ #category : #'defining symbols' }
TRILBytecodeFunctionBuilder >> defineName: name type: type [
	"Define this function's name and return type"
	| linkageClass symbol |

	linkageClass := compilation config linkageClass.
	symbol := compilation symbolManager defineFunction: name type: type linkage: linkageClass.
	compilation setFunctionSymbol: symbol.
	^ symbol
]

{ #category : #'defining symbols' }
TRILBytecodeFunctionBuilder >> defineParameter: name type: type [
	^ compilation symbolManager defineParameter: name type: type
]

{ #category : #initialization }
TRILBytecodeFunctionBuilder >> initializeWithCompilation: aTRCompilation block: aTRILBlock [
	super initializeWithCompilation: aTRCompilation block: aTRILBlock.
	entryState := TRVMOperandStack new. "<<< BOGUS, client should set it!"
	currentState := entryState copy.
]

{ #category : #'building-blocks' }
TRILBytecodeFunctionBuilder >> orphan [
	"Return a new subbuilder which may be used to build 
	 code fragments. The code has no relation to the receiver
	 (hence the name 'orphan') so caller is responsible to pass
	 control to orphan if it wishes (via `#goto:` or conditional
	 jump)."

	^ TRILBytecodeBuilder forCompilation: compilation block: compilation cfg addBlock.
]
