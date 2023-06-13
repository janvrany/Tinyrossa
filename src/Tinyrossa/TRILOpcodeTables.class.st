Class {
	#name : #TRILOpcodeTables,
	#superclass : #TRSharedPool,
	#classVars : [
		'LoadOpcodes',
		'StoreOpcodes',
		'ConstOpcodes'
	],
	#pools : [
		'TRILOpcodes',
		'TRDataTypes'
	],
	#category : #'Tinyrossa-IL'
}

{ #category : #initialization }
TRILOpcodeTables class >> initialize [
	TRDataTypes initializeIfNotAlready. 
	TRILOpcodes initializeIfNotAlready.

	LoadOpcodes := SmallDictionary newFromPairs: {
		Int8    . bload .
		Int16   . sload .
		Int32   . iload .
		Int64   . iload .
		Address . aload .
		Float   . fload .
		Double  . dload .
		Void    . invalid .            
	}.

	StoreOpcodes := SmallDictionary newFromPairs: {
		Int8    . bstore .
		Int16   . sstore .
		Int32   . istore .
		Int64   . istore .
		Address . astore .
		Float   . fstore .
		Double  . dstore .
		Void    . invalid .            
	}.

	ConstOpcodes := SmallDictionary newFromPairs: {
		Int8    . bconst .
		Int16   . sconst .
		Int32   . iconst .
		Int64   . iconst .
		Address . aconst .
		Float   . fconst .
		Double  . dconst .
		Void    . invalid .            
	}.
]
