"
`TRRegisterDependencies` are used to describe dependencies (constraints)
of (virtual and real) registers at given point in instruction steam. This
information is used by register allocator when assiging real registers
to virtual registers.

Examples of such dependencies (constraints) include: 

 * When making a subroutine call, often (some) parameters are
   passed in specific real registers and return value is 
   returned through specific real registers. Calling convention
   usually dictates that.

   In this case, we say that (virtual) register containing
   parameter value ""is dependent"" on real register at given
   instruction. Similarly for return values.

 * Also when making call, some registers are volatile (or caller-saved)
   so when used by the caller, they must be spilled before / reloaded after
   the call.

   In this case, we say that real registers is trashed by given 
   instruction.

 * On some architectures certain instruction requires operands to be
   placed in certain registers or put result into certain register.
   Intel X86 is famous for this - for example `mul` instruction uses 
   `eax` (`rax`) as one operand and places result to `edx`,`eax` 
	(`rdx`:`rax`) pairs.

   In this case there's a dependency of first operand on `eax` (`rax`),
   dependency of return (virtual) register on `eax` (`rax`) and
   either dependency of return (virtual) register on `edx` (`rdx`)
   in case we want high bits of multiplication result or `edx` (`rdx`)
   is trashed (in case we do not need high bits).

`TRRegisterDependencies` contain two set of dependencies:

  (i) 'pre-dependencies' that express dependencies (constraints) on
	  registers *BEFORE* the instruction is executed.

 (ii) 'pre-dependencies' that express dependencies (constraints) on
	  registers *AFTER* the instruction is executed.

"
Class {
	#name : #TRRegisterDependencies,
	#superclass : #Object,
	#instVars : [
		'pre',
		'post'
	],
	#category : #'Tinyrossa-Codegen'
}

{ #category : #'instance creation' }
TRRegisterDependencies class >> new [
	^ self pre: TRRegisterDependencyGroup new post: TRRegisterDependencyGroup new
]

{ #category : #'instance creation' }
TRRegisterDependencies class >> post: postDependencyGroup [
	^ self pre: TRRegisterDependencyGroup new post: postDependencyGroup
]

{ #category : #'instance creation' }
TRRegisterDependencies class >> pre: preDependencyGroup [
	^ self pre: preDependencyGroup post: TRRegisterDependencyGroup new
]

{ #category : #'instance creation' }
TRRegisterDependencies class >> pre: pre post: post [
	^ self basicNew initializeWithPre: pre post: post.
]

{ #category : #initialization }
TRRegisterDependencies >> initializeWithPre: preDependencyGroup post: postDependencyGroup [
	pre := preDependencyGroup.
	post := postDependencyGroup
]

{ #category : #testing }
TRRegisterDependencies >> isEmptyOrNil [
	^ pre isEmptyOrNil and: [ post isEmptyOrNil ]
]

{ #category : #testing }
TRRegisterDependencies >> notEmptyOrNil [
	^ pre notEmptyOrNil or: [ post notEmptyOrNil ]
]

{ #category : #accessing }
TRRegisterDependencies >> post [
	^ post
]

{ #category : #accessing }
TRRegisterDependencies >> pre [
	^ pre
]

{ #category : #utilities }
TRRegisterDependencies >> replaceVirtualRegistersUsing: replacementMap [
	^ self class
		pre: (pre replaceVirtualRegistersUsing: replacementMap)
		post: (post replaceVirtualRegistersUsing: replacementMap)
]
