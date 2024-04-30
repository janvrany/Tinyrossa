Class {
	#name : #TRILXmul2XshlTests,
	#superclass : #TRILTestCase,
	#pools : [
		'TRDataTypes',
		'TRILOpcodes'
	],
	#category : #'Tinyrossa-Tests'
}

{ #category : #running }
TRILXmul2XshlTests >> setUp [
	super setUp.
	compilation config optimizationPasses: { TRILXmul2Xshl }.
]

{ #category : #tests }
TRILXmul2XshlTests >> test_imul2ishl_01 [
	| b |

	b := TRILFunctionBuilder forCompilation: compilation.
	b defineName: testSelector type: Int32.
	b defineParameter: 'x' type: Int32.
	b ireturn: {
		b imul: {
			b iload: 'x' .
			b iconst: 2  } }.

	compilation optimize.

	self assert: compilation cfg treetops second child1 opcode = ishl.
	self assert: compilation cfg treetops second child1 child2 constant = 1.
]

{ #category : #tests }
TRILXmul2XshlTests >> test_imul2ishl_02 [
	| b |

	b := TRILFunctionBuilder forCompilation: compilation.
	b defineName: testSelector type: Int32.
	b defineParameter: 'x' type: Int32.
	b ireturn: {
		b imul: {
			b iload: 'x' .
			b iconst: 3  } }.

	compilation optimize.

	self assert: compilation cfg treetops second child1 opcode = imul.
	self assert: compilation cfg treetops second child1 child2 constant = 3.
]
