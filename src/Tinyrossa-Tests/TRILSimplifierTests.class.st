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
