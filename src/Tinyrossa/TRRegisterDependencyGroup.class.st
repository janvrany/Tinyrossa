"
See class TRRegisterDependencies

"
Class {
	#name : #TRRegisterDependencyGroup,
	#superclass : #OrderedCollection,
	#category : #'Tinyrossa-Codegen'
}

{ #category : #'adding & removing' }
TRRegisterDependencyGroup >> addDependency: vReg on: rReg [
	"Add dependency of given (usually virtual) register `vReg` 
	 on given real register `rReg`.

	 See class documentation of `TRRegisterDependencies`.
	"

	self assert: vReg isTRRegister.
	self assert: rReg isTRRealRegister.

	self add: (TRRegisterDependency virtual: vReg real: rReg).
]

{ #category : #'adding & removing' }
TRRegisterDependencyGroup >> addTrashed: rReg [
	"Mark real register `rReg` as 'trashed', that is
	 overwritten by given instruction.

	 See class documentation of `TRRegisterDependencies`.
	"

	self assert: rReg isTRRealRegister.

	self add: (TRRegisterDependency virtual: nil real: rReg).
]
