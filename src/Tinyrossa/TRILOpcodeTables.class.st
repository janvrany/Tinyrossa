Class {
	#name : #TRILOpcodeTables,
	#superclass : #TRSharedPool,
	#classVars : [
		'ArithmeticOpcodes',
		'CompareOpcodes',
		'ConstOpcodes',
		'LoadOpcodes',
		'StoreOpcodes'
	],
	#pools : [
		'TRDataTypes',
		'TRILOpcodeProps1',
		'TRILOpcodeProps3',
		'TRILOpcodes'
	],
	#category : #'Tinyrossa-IL'
}

{ #category : #initialization }
TRILOpcodeTables class >> initialize [
	| LT LE EQ GE GT NE |

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

	LT := CompareTrueIfLess.
	LE := CompareTrueIfLess | CompareTrueIfEqual.
	EQ := CompareTrueIfEqual.
	GE := CompareTrueIfGreater | CompareTrueIfEqual.
	GE := CompareTrueIfGreater.
	NE := CompareTrueIfLess | CompareTrueIfGreater.

	CompareOpcodes := SmallDictionary newFromPairs: {
		Int8    . SmallDictionary newFromPairs: {
					LT  . bcmplt .
					LE  . bcmple .
					EQ  . bcmpeq .
					GE  . bcmpge .
					GT  . bcmpgt .
					NE  . bcmpne .
				  }.
		Int16   . SmallDictionary newFromPairs: {
					LT  . scmplt .
					LE  . scmple .
					EQ  . scmpeq .
					GE  . scmpge .
					GT  . scmpgt .
					NE  . scmpne .
				  }.
		Int32   . SmallDictionary newFromPairs: {
					LT  . icmplt .
					LE  . icmple .
					EQ  . icmpeq .
					GE  . icmpge .
					GT  . icmpgt .
					NE  . icmpne .
				  }.
		Int64   . SmallDictionary newFromPairs: {
					LT  . lcmplt .
					LE  . lcmple .
					EQ  . lcmpeq .
					GE  . lcmpge .
					GT  . lcmpgt .
					NE  . lcmpne .
				  }.
		Address . SmallDictionary newFromPairs: {
					LT  . acmplt .
					LE  . acmple .
					EQ  . acmpeq .
					GE  . acmpge .
					GT  . acmpgt .
					NE  . acmpne .
				  }.
		Float   . SmallDictionary newFromPairs: {
					LT  . fcmplt .
					LE  . fcmple .
					EQ  . fcmpeq .
					GE  . fcmpge .
					GT  . fcmpgt .
					NE  . fcmpne .
				  }.
		Double  . SmallDictionary newFromPairs: {
					LT  . dcmplt .
					LE  . dcmple .
					EQ  . dcmpeq .
					GE  . dcmpge .
					GT  . dcmpgt .
					NE  . dcmpne .
				  }.
		Void    . SmallDictionary newFromPairs: {
					LT  . invalid .
					LE  . invalid .
					EQ  . invalid .
					GE  . invalid .
					GT  . invalid .
					NE  . invalid .
				  }.
	}.

	ArithmeticOpcodes := SmallDictionary newFromPairs: {
		Int8    . SmallDictionary newFromPairs: {
					Add  . badd .
					Sub  . bsub .
					Mul  . bmul .
					Div  . bdiv .
					Rem  . brem .
				  }.
		Int16   . SmallDictionary newFromPairs: {
					Add  . sadd .
					Sub  . ssub .
					Mul  . smul .
					Div  . sdiv .
					Rem  . srem .
				  }.
		Int32   . SmallDictionary newFromPairs: {
					Add  . iadd .
					Sub  . isub .
					Mul  . imul .
					Div  . idiv .
					Rem  . irem .
				  }.
		Int64   . SmallDictionary newFromPairs: {
					Add  . ladd .
					Sub  . lsub .
					Mul  . lmul .
					Div  . ldiv .
					Rem  . lrem .
				  }.
		Address . SmallDictionary newFromPairs: {
					Add  . invalid .
					Sub  . asub .
					Mul  . invalid .
					Div  . invalid .
					Rem  . invalid .
				  }.
		Float   . SmallDictionary newFromPairs: {
					Add  . fadd .
					Sub  . fsub .
					Mul  . fmul .
					Div  . fdiv .
					Rem  . invalid .
				  }.
		Double  . SmallDictionary newFromPairs: {
					Add  . dadd .
					Sub  . dsub .
					Mul  . dmul .
					Div  . ddiv .
					Rem  . invalid .
				  }.
		Void    . SmallDictionary newFromPairs: {
					Add  . invalid .
					Sub  . invalid .
					Mul  . invalid .
					Div  . invalid .
					Rem  . invalid .
				  }.
	}.
]
