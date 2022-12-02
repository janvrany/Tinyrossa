Class {
	#name : #AJStackAlignmentTests,
	#superclass : #TestCase,
	#pools : [
		'AJx86Registers'
	],
	#category : #'AsmJit-Tests'
}

{ #category : #documentation }
AJStackAlignmentTests class >> copyright [
"
	Copyright (c) 2012-2016 Igor Stasenko
							Martin McClure
							Damien Pollet
							Camillo Bruni
							Guido Chari
				   2016-now Jan Vrany <jan.vrany [at] fit . cvut . cz>

	Permission is hereby granted, free of charge, to any person obtaining a copy
	of this software and associated documentation files (the 'Software'), to deal
	in the Software without restriction, including without limitation the rights
	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
	copies of the Software, and to permit persons to whom the Software is
	furnished to do so, subject to the following conditions:

	The above copyright notice and this permission notice shall be included in all
	copies or substantial portions of the Software.

	THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
	SOFTWARE.

"

]

{ #category : #utility }
AJStackAlignmentTests >> newAssembler [ 
	^ AJx86Assembler new

]

{ #category : #tests }
AJStackAlignmentTests >> testJumps [

	| asm callInfo |
	
	asm := self newAssembler.
	asm noStackFrame.
	
	asm jmp: #foo;
		nop;
		nop;
		nop;
		nop;
		nop;
		nop;
		nop;
		nop;
	label: #foo.
	
	^ asm generatedCode.

]

{ #category : #tests }
AJStackAlignmentTests >> testNewProtocolForAlignedCalls [

	| asm callInfo |
	
	asm := self newAssembler.
	
	
	asm cdeclCall:  [:call |

		call 
			push: EAX;
			push: EAX;
			push: 4.

		asm call: EAX.
		callInfo := call.
	] alignment: 32.
	
	
	asm generatedCode. "to analyze instructions"
	self assert: callInfo stackSize = 12.
	self assert: callInfo needsAlignment

	"Modified (format): / 15-12-2015 / 23:20:41 / Jan Vrany <jan.vrany@fit.cvut.cz>"

]
