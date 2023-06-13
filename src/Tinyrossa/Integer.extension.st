Extension { #name : #Integer }

{ #category : #'*Tinyrossa' }
Integer >> extractBitsFrom: hiBit to: loBit [
	"Extracts (hiBit,loBit) from 64bit value, starting at bit 'hiBit'. Lowest bit is bit 0,
 *   highest bit is bit 63. This method assumes the receiver is 64bit unsigned integer value.

	 Return value is also 'unsigned', that is, greater than zero.    
	"

	self assert: (self between: 0 and: 16rFFFFFFFFFFFFFFFF).
	self assert:  hiBit < 64.
	self assert: (loBit between: 0 and: hiBit).

	^ (self >> loBit) & (16rFFFFFFFFFFFFFFFF << (hiBit - loBit + 1)) bitInvert.

	"
	(16rCAFEBABE extractBitsFrom: 15 to: 8) hex
	(16rCAFE00AFFE00BABE extractBitsFrom: 47 to: 24) hex
	(16rCAFE00AFFE00BABE extractBitsFrom: 57 to: 57) hex
	"
]
