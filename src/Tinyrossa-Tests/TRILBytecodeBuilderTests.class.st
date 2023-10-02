Class {
	#name : #TRILBytecodeBuilderTests,
	#superclass : #TRILTestCase,
	#pools : [
		'TRDataTypes',
		'TRILOpcodes'
	],
	#category : #'Tinyrossa-Tests'
}

{ #category : #tests }
TRILBytecodeBuilderTests >> test_if_then_else [
	| func bytecodes b |

	func := TRILBytecodeFunctionBuilder forCompilation: compilation.
	func defineName: testSelector type: Int32.
	func defineParameter: 'a' type: Int32.
	func defineParameter: 'b' type: Int32.
	func defineState: TRVMOperandStack new.

	bytecodes := (1 to: 4) collect:[:i | func orphan ].

	func fallThroughTo: bytecodes first.  

	b := bytecodes first.
	b push: (b iload: 'a').
	b fallThroughTo: bytecodes second.  

	b := bytecodes second.
	b push: (b iload: 'b').
	b fallThroughTo: bytecodes third.  

	b := bytecodes third.
	b if: (b icmpeq: { b top . b top: 2 }) then: [ :then |
		then push: (then iadd: { then pop. then pop }). 
	] else: [ :else|
		else push: (else imul: { else pop. else pop }). 
	].
	b fallThroughTo: bytecodes fourth.  

	b := bytecodes fourth.  
	b ireturn: { b pop }.

	compilation optimize.
]
