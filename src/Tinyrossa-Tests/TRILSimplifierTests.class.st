Class {
	#name : #TRILSimplifierTests,
	#superclass : #TRILTestCase,
	#pools : [
		'TRDataTypes',
		'TRILOpcodes'
	],
	#category : #'Tinyrossa-Tests'
}

{ #category : #running }
TRILSimplifierTests >> setUp [
	super setUp.
	compilation config optimizationPasses: { TRILSimplifier }.
]

{ #category : #'tests - arithmetic' }
TRILSimplifierTests >> test_simplify_arithmetic_01 [
	| b |

	b := TRILFunctionBuilder forCompilation: compilation.
	b defineName: testSelector type: Int32.
	b ireturn: {
		b iadd: {
			b iconst: 1 .
			b isub: {
				b iconst: 3.
				b iconst: 1 } } }.

	compilation optimize.

	self assert: compilation cfg treetops second child1 opcode = iconst.
	self assert: compilation cfg treetops second child1 constant = 3.
]

{ #category : #'tests - conditional branches' }
TRILSimplifierTests >> test_simplify_conditional_branches_01 [
	| b |

	b := TRILFunctionBuilder forCompilation: compilation.
	b defineName: testSelector type: Int32.
	b if: (b icmpeq: { b iconst: 1 . b iconst: 2 }) then: [ :then |
		then ireturn: { then iconst: 123 }
	] else: [ :else |
		else ireturn: { else iconst: 345 }
	].

	self assert: compilation cfg blocks size = 3.
	self assert: compilation cfg treetops second opcode = ificmpne.

	compilation optimize.

	self assert: compilation cfg blocks size == 2. "= entry, else. then block is not reachable
													since the condition never holds."
	self assert: compilation cfg treetops second opcode = goto.
]

{ #category : #'tests - conditional branches' }
TRILSimplifierTests >> test_simplify_conditional_branches_02 [
	| b |

	b := TRILFunctionBuilder forCompilation: compilation.
	b defineName: testSelector type: Int32.
	b if: (b icmpeq: { b iconst: 1 . b iconst: 1 }) then: [ :then |
		then ireturn: { then iconst: 123 }
	] else: [ :else |
		else ireturn: { else iconst: 345 }
	].

	self assert: compilation cfg blocks size = 3.
	self assert: compilation cfg treetops second opcode = ificmpne.

	compilation optimize.

	self assert: compilation cfg blocks size == 2. "= entry, then. else block is not reachable
													since the condition always holds."
	self assert: compilation cfg treetops size = 5.
	self assert: compilation cfg treetops fourth opcode = ireturn.
													"since the conditional was removed altogether."
	self assert: compilation cfg treetops fourth child1 constant = 123.
]

{ #category : #'tests - store' }
TRILSimplifierTests >> test_simplify_store_01 [
	| b |

	b := TRILFunctionBuilder forCompilation: compilation.
	b defineName: testSelector type: Int32.
	b defineAutomatic: 'X' type: Int32.
	b istore: { 
		b l2i: {
			b lconst: 1 }. 
		"-->" 'X' }.
	b ireturn: {
		b iconst: 2 }.

	self assert: compilation cfg treetops size == 4.
	self assert: compilation cfg treetops second opcode = istore.

	compilation optimize.

	self assert: compilation cfg treetops size == 3.
	self assert: compilation cfg treetops second opcode = ireturn.
]

{ #category : #'tests - store' }
TRILSimplifierTests >> test_simplify_store_02 [
	| b |

	b := TRILFunctionBuilder forCompilation: compilation.
	b defineName: testSelector type: Int32.
	b defineFunction: 'save' type: Int32.
	b defineAutomatic: 'X' type: Int32.
	b istore: { 
		b icall: { 'save' } .
		"-->" 'X' }.
	b ireturn: {
		b iconst: 2 }.

	self assert: compilation cfg treetops size == 5.
	self assert: compilation cfg treetops third opcode = istore.

	compilation optimize.

	self assert: compilation cfg treetops size == 5.
	self assert: compilation cfg treetops third opcode = treetop.
]
