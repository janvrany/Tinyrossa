Class {
	#name : #TRCompilationConfig,
	#superclass : #Object,
	#instVars : [
		'options'
	],
	#pools : [
		'TRCompilationConfigOptions'
	],
	#category : #'Tinyrossa-Compile'
}

{ #category : #'instance creation' }
TRCompilationConfig class >> forTarget: aTRCompilationTarget [
	^ self basicNew initializeWithTarget: aTRCompilationTarget
]

{ #category : #'instance creation' }
TRCompilationConfig class >> new [
	self shouldNotImplement. "Use #forConfig:"
]

{ #category : #options }
TRCompilationConfig >> aot [
	^ options at: OptionAOT ifAbsent: [ false ]
]

{ #category : #options }
TRCompilationConfig >> aot: aBoolean [
	options at: OptionAOT put: aBoolean
]

{ #category : #options }
TRCompilationConfig >> codeGeneratorClass [
	^ self target codeGeneratorClass
]

{ #category : #initialization }
TRCompilationConfig >> initializeWithTarget: aTRCompilationTarget [
	options := Dictionary new.
	options at: OptionTarget put: aTRCompilationTarget
]

{ #category : #options }
TRCompilationConfig >> linkageClass [
	^ options at: OptionLinkage ifAbsent:[ self target systemLinkageClass ]
]

{ #category : #options }
TRCompilationConfig >> linkageClass: aClass [
	^ options at: OptionLinkage put: aClass
]

{ #category : #options }
TRCompilationConfig >> objectFile [
	^ options at: OptionObjectFile ifAbsent: [ 'a.out' ]
]

{ #category : #options }
TRCompilationConfig >> objectFile: aString [
	options at: OptionObjectFile put: aString
]

{ #category : #options }
TRCompilationConfig >> optimizationPasses [
	^ options at: OptionOptimizationPasses ifAbsent:[ 
		"Default optimization pipeline"
		{
			TRCFGSimplifier .
			TRILCommoner .
			TRILSimplifier .  

			"FIXME:
			 Since TRILSimplifier may have changed CFG, we run
			 CFG simplifier commoner and TRIL simplifier again.
			 In theory we may want to run them as long as they
			 change anything, but that's left as future work.
			 We should also do this based on hotness, if we ever
			 get to the point of implementing it."

			TRCFGSimplifier .
			TRILCommoner .
			TRILSimplifier .  
		}
	].
]

{ #category : #options }
TRCompilationConfig >> optimizationPasses: passes [
	options at: OptionOptimizationPasses put: passes
]

{ #category : #options }
TRCompilationConfig >> registerAllocatorClass [
	^ options at: OptionRegisterAllocator ifAbsent: [ TRRegisterAllocator defaultClass ]
]

{ #category : #options }
TRCompilationConfig >> registerAllocatorClass: aClass [
	^ options at: OptionRegisterAllocator put: aClass
]

{ #category : #options }
TRCompilationConfig >> stressRA [
	^ options at: OptionStressRA ifAbsent: [ false ]
]

{ #category : #options }
TRCompilationConfig >> stressRA: aBoolean [
	^ options at: OptionStressRA put: aBoolean
]

{ #category : #options }
TRCompilationConfig >> target [
	^ options at: OptionTarget ifAbsent: [ self error:'Oops, no target specified!' ]
]

{ #category : #options }
TRCompilationConfig >> verifyAfterEachOptimizationPass [
	^ options at: OptionVerifyAfterEachOptimizationPass ifAbsent:[ true ]
]

{ #category : #options }
TRCompilationConfig >> verifyAfterEachOptimizationPass: aBoolean [
	^ options at: OptionVerifyAfterEachOptimizationPass put: aBoolean
]
