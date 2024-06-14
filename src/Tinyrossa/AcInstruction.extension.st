Extension { #name : #AcInstruction }

{ #category : #'*Tinyrossa' }
AcInstruction >> dependencies [
	^ self annotationAt: TRRegisterDependencies
]

{ #category : #'*Tinyrossa' }
AcInstruction >> dependencies: aTRRegisterDependencies [
	self annotationAddOrReplace: aTRRegisterDependencies
]

{ #category : #'*Tinyrossa' }
AcInstruction >> isLeaveInstruction [
	^ false
]

{ #category : #'*Tinyrossa' }
AcInstruction >> location [
	| node loc |

	node := self node.
	node notNil ifTrue: [
		loc := node location.
	].
	^ loc
]

{ #category : #'*Tinyrossa' }
AcInstruction >> node [
	^ self annotationAt: TRILNode
]

{ #category : #'*Tinyrossa' }
AcInstruction >> node: aTRILNode [
	^ self annotationAddOrReplace: aTRILNode
]

{ #category : #'*Tinyrossa' }
AcInstruction >> replaceVirtualRegistersUsing: replacementMap [
	"Replace all references according to `replacementMap` and return
	 new instruction.

	 `replacementMap` should be a dictionary mapping old v-register NAME
	 to new v-register ITSELF. That is, keys are strings, values are v-regs.

	 This is similar to `#inEnvironment:` except it also updates register
	 dependencies (and other Tinyrossa-specific metadata that may come
	 in future).

	 Implementation note: using strings as keys instead of original vreg
	 this looks silly, but here we're limited by `Z3Node >> #inEnvironment:`
	 which works with either Z3Nodes or Strings a keys.
	"

	"Nothing to do here, overriden in ProcessorInstruction"
]
