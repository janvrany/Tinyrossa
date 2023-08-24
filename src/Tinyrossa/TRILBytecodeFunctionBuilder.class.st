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

{ #category : #'defining state' }
TRILBytecodeFunctionBuilder >> defineState: vmState [
	"Define initial (simulated) 'VM' state, if there's any.

	 Users of bytecode builders typically want to do something
	 like:

		functionBuilder defineState: TRVMOperandStack new.

	 Of course, depending on the VM, VM state may be more 
	 complicated than just (simulated interpreter) stack.
	 Users may set initial state to any custom object as long
	 as it conforms to API.
	 "
	 self entryState: vmState.
]
