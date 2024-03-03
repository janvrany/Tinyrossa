Class {
	#name : #TRILSpecification,
	#superclass : #Object,
	#instVars : [
		'prelude'
	],
	#classVars : [
		'SpecificationTable'
	],
	#pools : [
		'TRILOpcodes'
	],
	#category : #'Tinyrossa-Formal-Specification'
}

{ #category : #initialization }
TRILSpecification class >> initialize [

	TRILOpcodes initializeIfNotAlready.
	SpecificationTable := IdentityDictionary new: 550.
	TRILOpcodes bindingsDo: [:binding |
		SpecificationTable at: binding value put: binding value name asSymbol.
	].

	"
	self initialize.
	SpecificationTable do:[:sel|
		| mth |

		mth := self methodDict at: sel ifAbsent:[nil].
		(mth isNil or:[mth protocol = 'opcodes (not yet specified)']) ifTrue:[
			self compile: sel , '
	self shouldBeImplemented.
	^self specify: ',sel,' as:''
	/*@ val ',sel,' : ... */
	let ',sel,' = (...) => {
	...
	};
	''
' classified: 'opcodes (not yet specified)'
		].
	]
	"

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> a2b [
	self shouldBeImplemented.
	^self specify: a2b as:'
	/*@ val a2b : ... */
	let a2b = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> a2i [
	self shouldBeImplemented.
	^self specify: a2i as:'
	/*@ val a2i : ... */
	let a2i = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> a2l [
	self shouldBeImplemented.
	^self specify: a2l as:'
	/*@ val a2l : ... */
	let a2l = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> a2s [
	self shouldBeImplemented.
	^self specify: a2s as:'
	/*@ val a2s : ... */
	let a2s = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> acall [
	self shouldBeImplemented.
	^self specify: acall as:'
	/*@ val acall : ... */
	let acall = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> acalli [
	self shouldBeImplemented.
	^self specify: acalli as:'
	/*@ val acalli : ... */
	let acalli = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> acmpeq [
	self shouldBeImplemented.
	^self specify: acmpeq as:'
	/*@ val acmpeq : ... */
	let acmpeq = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> acmpge [
	self shouldBeImplemented.
	^self specify: acmpge as:'
	/*@ val acmpge : ... */
	let acmpge = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> acmpgt [
	self shouldBeImplemented.
	^self specify: acmpgt as:'
	/*@ val acmpgt : ... */
	let acmpgt = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> acmple [
	self shouldBeImplemented.
	^self specify: acmple as:'
	/*@ val acmple : ... */
	let acmple = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> acmplt [
	self shouldBeImplemented.
	^self specify: acmplt as:'
	/*@ val acmplt : ... */
	let acmplt = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> acmpne [
	self shouldBeImplemented.
	^self specify: acmpne as:'
	/*@ val acmpne : ... */
	let acmpne = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> aconst [
	self shouldBeImplemented.
	^self specify: aconst as:'
	/*@ val aconst : ... */
	let aconst = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> aiadd [
	self shouldBeImplemented.
	^self specify: aiadd as:'
	/*@ val aiadd : ... */
	let aiadd = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> aladd [
	self shouldBeImplemented.
	^self specify: aladd as:'
	/*@ val aladd : ... */
	let aladd = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> allocationfence [
	self shouldBeImplemented.
	^self specify: allocationfence as:'
	/*@ val allocationfence : ... */
	let allocationfence = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> aload [
	self shouldBeImplemented.
	^self specify: aload as:'
	/*@ val aload : ... */
	let aload = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> aloadi [
	self shouldBeImplemented.
	^self specify: aloadi as:'
	/*@ val aloadi : ... */
	let aloadi = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> anewarray [
	self shouldBeImplemented.
	^self specify: anewarray as:'
	/*@ val anewarray : ... */
	let anewarray = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> ardbar [
	self shouldBeImplemented.
	^self specify: ardbar as:'
	/*@ val ardbar : ... */
	let ardbar = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> ardbari [
	self shouldBeImplemented.
	^self specify: ardbari as:'
	/*@ val ardbari : ... */
	let ardbari = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> aregload [
	self shouldBeImplemented.
	^self specify: aregload as:'
	/*@ val aregload : ... */
	let aregload = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> aregstore [
	self shouldBeImplemented.
	^self specify: aregstore as:'
	/*@ val aregstore : ... */
	let aregstore = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> areturn [
	self shouldBeImplemented.
	^self specify: areturn as:'
	/*@ val areturn : ... */
	let areturn = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> arraychk [
	self shouldBeImplemented.
	^self specify: arraychk as:'
	/*@ val arraychk : ... */
	let arraychk = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> arraycmp [
	self shouldBeImplemented.
	^self specify: arraycmp as:'
	/*@ val arraycmp : ... */
	let arraycmp = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> arraycopy [
	self shouldBeImplemented.
	^self specify: arraycopy as:'
	/*@ val arraycopy : ... */
	let arraycopy = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> arraycopybndchk [
	self shouldBeImplemented.
	^self specify: arraycopybndchk as:'
	/*@ val arraycopybndchk : ... */
	let arraycopybndchk = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> arraylength [
	self shouldBeImplemented.
	^self specify: arraylength as:'
	/*@ val arraylength : ... */
	let arraylength = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> arrayset [
	self shouldBeImplemented.
	^self specify: arrayset as:'
	/*@ val arrayset : ... */
	let arrayset = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> arraystorechk [
	self shouldBeImplemented.
	^self specify: arraystorechk as:'
	/*@ val arraystorechk : ... */
	let arraystorechk = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> arraytranslate [
	self shouldBeImplemented.
	^self specify: arraytranslate as:'
	/*@ val arraytranslate : ... */
	let arraytranslate = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> arraytranslateandtest [
	self shouldBeImplemented.
	^self specify: arraytranslateandtest as:'
	/*@ val arraytranslateandtest : ... */
	let arraytranslateandtest = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> aselect [
	self shouldBeImplemented.
	^self specify: aselect as:'
	/*@ val aselect : ... */
	let aselect = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> astore [
	self shouldBeImplemented.
	^self specify: astore as:'
	/*@ val astore : ... */
	let astore = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> astorei [
	self shouldBeImplemented.
	^self specify: astorei as:'
	/*@ val astorei : ... */
	let astorei = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> asub [
	self shouldBeImplemented.
	^self specify: asub as:'
	/*@ val asub : ... */
	let asub = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> asynccheck [
	self shouldBeImplemented.
	^self specify: asynccheck as:'
	/*@ val asynccheck : ... */
	let asynccheck = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> athrow [
	self shouldBeImplemented.
	^self specify: athrow as:'
	/*@ val athrow : ... */
	let athrow = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> awrtbar [
	self shouldBeImplemented.
	^self specify: awrtbar as:'
	/*@ val awrtbar : ... */
	let awrtbar = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> awrtbari [
	self shouldBeImplemented.
	^self specify: awrtbari as:'
	/*@ val awrtbari : ... */
	let awrtbari = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> b2a [
	self shouldBeImplemented.
	^self specify: b2a as:'
	/*@ val b2a : ... */
	let b2a = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> b2d [
	self shouldBeImplemented.
	^self specify: b2d as:'
	/*@ val b2d : ... */
	let b2d = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> b2f [
	self shouldBeImplemented.
	^self specify: b2f as:'
	/*@ val b2f : ... */
	let b2f = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> b2i [
	self shouldBeImplemented.
	^self specify: b2i as:'
	/*@ val b2i : ... */
	let b2i = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> b2l [
	self shouldBeImplemented.
	^self specify: b2l as:'
	/*@ val b2l : ... */
	let b2l = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> b2s [
	self shouldBeImplemented.
	^self specify: b2s as:'
	/*@ val b2s : ... */
	let b2s = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> badd [
	self shouldBeImplemented.
	^self specify: badd as:'
	/*@ val badd : ... */
	let badd = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> band [
	self shouldBeImplemented.
	^self specify: band as:'
	/*@ val band : ... */
	let band = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> bbend [
	self shouldBeImplemented.
	^self specify: bbend as:'
	/*@ val bbend : ... */
	let bbend = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> bbitpermute [
	self shouldBeImplemented.
	^self specify: bbitpermute as:'
	/*@ val bbitpermute : ... */
	let bbitpermute = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> bbstart [
	self shouldBeImplemented.
	^self specify: bbstart as:'
	/*@ val bbstart : ... */
	let bbstart = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> bcmp [
	self shouldBeImplemented.
	^self specify: bcmp as:'
	/*@ val bcmp : ... */
	let bcmp = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> bcmpeq [
	self shouldBeImplemented.
	^self specify: bcmpeq as:'
	/*@ val bcmpeq : ... */
	let bcmpeq = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> bcmpge [
	self shouldBeImplemented.
	^self specify: bcmpge as:'
	/*@ val bcmpge : ... */
	let bcmpge = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> bcmpgt [
	self shouldBeImplemented.
	^self specify: bcmpgt as:'
	/*@ val bcmpgt : ... */
	let bcmpgt = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> bcmple [
	self shouldBeImplemented.
	^self specify: bcmple as:'
	/*@ val bcmple : ... */
	let bcmple = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> bcmplt [
	self shouldBeImplemented.
	^self specify: bcmplt as:'
	/*@ val bcmplt : ... */
	let bcmplt = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> bcmpne [
	self shouldBeImplemented.
	^self specify: bcmpne as:'
	/*@ val bcmpne : ... */
	let bcmpne = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> bconst [
	self shouldBeImplemented.
	^self specify: bconst as:'
	/*@ val bconst : ... */
	let bconst = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> bdiv [
	self shouldBeImplemented.
	^self specify: bdiv as:'
	/*@ val bdiv : ... */
	let bdiv = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> bitopmem [
	self shouldBeImplemented.
	^self specify: bitopmem as:'
	/*@ val bitopmem : ... */
	let bitopmem = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> bload [
	self shouldBeImplemented.
	^self specify: bload as:'
	/*@ val bload : ... */
	let bload = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> bloadi [
	self shouldBeImplemented.
	^self specify: bloadi as:'
	/*@ val bloadi : ... */
	let bloadi = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> bmul [
	self shouldBeImplemented.
	^self specify: bmul as:'
	/*@ val bmul : ... */
	let bmul = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> bndchk [
	self shouldBeImplemented.
	^self specify: bndchk as:'
	/*@ val bndchk : ... */
	let bndchk = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> bndchkwithspinechk [
	self shouldBeImplemented.
	^self specify: bndchkwithspinechk as:'
	/*@ val bndchkwithspinechk : ... */
	let bndchkwithspinechk = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> bneg [
	self shouldBeImplemented.
	^self specify: bneg as:'
	/*@ val bneg : ... */
	let bneg = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> bor [
	self shouldBeImplemented.
	^self specify: bor as:'
	/*@ val bor : ... */
	let bor = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> branch [
	self shouldBeImplemented.
	^self specify: branch as:'
	/*@ val branch : ... */
	let branch = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> brdbar [
	self shouldBeImplemented.
	^self specify: brdbar as:'
	/*@ val brdbar : ... */
	let brdbar = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> brdbari [
	self shouldBeImplemented.
	^self specify: brdbari as:'
	/*@ val brdbari : ... */
	let brdbari = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> bregload [
	self shouldBeImplemented.
	^self specify: bregload as:'
	/*@ val bregload : ... */
	let bregload = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> bregstore [
	self shouldBeImplemented.
	^self specify: bregstore as:'
	/*@ val bregstore : ... */
	let bregstore = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> brem [
	self shouldBeImplemented.
	^self specify: brem as:'
	/*@ val brem : ... */
	let brem = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> bselect [
	self shouldBeImplemented.
	^self specify: bselect as:'
	/*@ val bselect : ... */
	let bselect = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> bshl [
	self shouldBeImplemented.
	^self specify: bshl as:'
	/*@ val bshl : ... */
	let bshl = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> bshr [
	self shouldBeImplemented.
	^self specify: bshr as:'
	/*@ val bshr : ... */
	let bshr = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> bstore [
	self shouldBeImplemented.
	^self specify: bstore as:'
	/*@ val bstore : ... */
	let bstore = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> bstorei [
	self shouldBeImplemented.
	^self specify: bstorei as:'
	/*@ val bstorei : ... */
	let bstorei = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> bsub [
	self shouldBeImplemented.
	^self specify: bsub as:'
	/*@ val bsub : ... */
	let bsub = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> bu2a [
	self shouldBeImplemented.
	^self specify: bu2a as:'
	/*@ val bu2a : ... */
	let bu2a = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> bu2d [
	self shouldBeImplemented.
	^self specify: bu2d as:'
	/*@ val bu2d : ... */
	let bu2d = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> bu2f [
	self shouldBeImplemented.
	^self specify: bu2f as:'
	/*@ val bu2f : ... */
	let bu2f = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> bu2i [
	self shouldBeImplemented.
	^self specify: bu2i as:'
	/*@ val bu2i : ... */
	let bu2i = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> bu2l [
	self shouldBeImplemented.
	^self specify: bu2l as:'
	/*@ val bu2l : ... */
	let bu2l = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> bu2s [
	self shouldBeImplemented.
	^self specify: bu2s as:'
	/*@ val bu2s : ... */
	let bu2s = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> bucmp [
	self shouldBeImplemented.
	^self specify: bucmp as:'
	/*@ val bucmp : ... */
	let bucmp = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> bucmpge [
	self shouldBeImplemented.
	^self specify: bucmpge as:'
	/*@ val bucmpge : ... */
	let bucmpge = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> bucmpgt [
	self shouldBeImplemented.
	^self specify: bucmpgt as:'
	/*@ val bucmpgt : ... */
	let bucmpgt = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> bucmple [
	self shouldBeImplemented.
	^self specify: bucmple as:'
	/*@ val bucmple : ... */
	let bucmple = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> bucmplt [
	self shouldBeImplemented.
	^self specify: bucmplt as:'
	/*@ val bucmplt : ... */
	let bucmplt = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> bushr [
	self shouldBeImplemented.
	^self specify: bushr as:'
	/*@ val bushr : ... */
	let bushr = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> butest [
	self shouldBeImplemented.
	^self specify: butest as:'
	/*@ val butest : ... */
	let butest = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> bwrtbar [
	self shouldBeImplemented.
	^self specify: bwrtbar as:'
	/*@ val bwrtbar : ... */
	let bwrtbar = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> bwrtbari [
	self shouldBeImplemented.
	^self specify: bwrtbari as:'
	/*@ val bwrtbari : ... */
	let bwrtbari = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> bxor [
	self shouldBeImplemented.
	^self specify: bxor as:'
	/*@ val bxor : ... */
	let bxor = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> bztestnset [
	self shouldBeImplemented.
	^self specify: bztestnset as:'
	/*@ val bztestnset : ... */
	let bztestnset = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> call [
	self shouldBeImplemented.
	^self specify: call as:'
	/*@ val call : ... */
	let call = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> calli [
	self shouldBeImplemented.
	^self specify: calli as:'
	/*@ val calli : ... */
	let calli = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> case [
	self shouldBeImplemented.
	^self specify: case as:'
	/*@ val case : ... */
	let case = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> checkcast [
	self shouldBeImplemented.
	^self specify: checkcast as:'
	/*@ val checkcast : ... */
	let checkcast = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> checkcastandnullchk [
	self shouldBeImplemented.
	^self specify: checkcastandnullchk as:'
	/*@ val checkcastandnullchk : ... */
	let checkcastandnullchk = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> compressedrefs [
	self shouldBeImplemented.
	^self specify: compressedrefs as:'
	/*@ val compressedrefs : ... */
	let compressedrefs = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> computecc [
	self shouldBeImplemented.
	^self specify: computecc as:'
	/*@ val computecc : ... */
	let computecc = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> contigarraylength [
	self shouldBeImplemented.
	^self specify: contigarraylength as:'
	/*@ val contigarraylength : ... */
	let contigarraylength = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> d2b [
	self shouldBeImplemented.
	^self specify: d2b as:'
	/*@ val d2b : ... */
	let d2b = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> d2bu [
	self shouldBeImplemented.
	^self specify: d2bu as:'
	/*@ val d2bu : ... */
	let d2bu = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> d2c [
	self shouldBeImplemented.
	^self specify: d2c as:'
	/*@ val d2c : ... */
	let d2c = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> d2f [
	self shouldBeImplemented.
	^self specify: d2f as:'
	/*@ val d2f : ... */
	let d2f = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> d2i [
	self shouldBeImplemented.
	^self specify: d2i as:'
	/*@ val d2i : ... */
	let d2i = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> d2iu [
	self shouldBeImplemented.
	^self specify: d2iu as:'
	/*@ val d2iu : ... */
	let d2iu = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> d2l [
	self shouldBeImplemented.
	^self specify: d2l as:'
	/*@ val d2l : ... */
	let d2l = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> d2lu [
	self shouldBeImplemented.
	^self specify: d2lu as:'
	/*@ val d2lu : ... */
	let d2lu = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> d2s [
	self shouldBeImplemented.
	^self specify: d2s as:'
	/*@ val d2s : ... */
	let d2s = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> dabs [
	self shouldBeImplemented.
	^self specify: dabs as:'
	/*@ val dabs : ... */
	let dabs = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> dadd [
	self shouldBeImplemented.
	^self specify: dadd as:'
	/*@ val dadd : ... */
	let dadd = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> dbits2l [
	self shouldBeImplemented.
	^self specify: dbits2l as:'
	/*@ val dbits2l : ... */
	let dbits2l = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> dcall [
	self shouldBeImplemented.
	^self specify: dcall as:'
	/*@ val dcall : ... */
	let dcall = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> dcalli [
	self shouldBeImplemented.
	^self specify: dcalli as:'
	/*@ val dcalli : ... */
	let dcalli = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> dceil [
	self shouldBeImplemented.
	^self specify: dceil as:'
	/*@ val dceil : ... */
	let dceil = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> dcmpeq [
	self shouldBeImplemented.
	^self specify: dcmpeq as:'
	/*@ val dcmpeq : ... */
	let dcmpeq = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> dcmpequ [
	self shouldBeImplemented.
	^self specify: dcmpequ as:'
	/*@ val dcmpequ : ... */
	let dcmpequ = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> dcmpg [
	self shouldBeImplemented.
	^self specify: dcmpg as:'
	/*@ val dcmpg : ... */
	let dcmpg = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> dcmpge [
	self shouldBeImplemented.
	^self specify: dcmpge as:'
	/*@ val dcmpge : ... */
	let dcmpge = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> dcmpgeu [
	self shouldBeImplemented.
	^self specify: dcmpgeu as:'
	/*@ val dcmpgeu : ... */
	let dcmpgeu = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> dcmpgt [
	self shouldBeImplemented.
	^self specify: dcmpgt as:'
	/*@ val dcmpgt : ... */
	let dcmpgt = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> dcmpgtu [
	self shouldBeImplemented.
	^self specify: dcmpgtu as:'
	/*@ val dcmpgtu : ... */
	let dcmpgtu = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> dcmpl [
	self shouldBeImplemented.
	^self specify: dcmpl as:'
	/*@ val dcmpl : ... */
	let dcmpl = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> dcmple [
	self shouldBeImplemented.
	^self specify: dcmple as:'
	/*@ val dcmple : ... */
	let dcmple = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> dcmpleu [
	self shouldBeImplemented.
	^self specify: dcmpleu as:'
	/*@ val dcmpleu : ... */
	let dcmpleu = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> dcmplt [
	self shouldBeImplemented.
	^self specify: dcmplt as:'
	/*@ val dcmplt : ... */
	let dcmplt = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> dcmpltu [
	self shouldBeImplemented.
	^self specify: dcmpltu as:'
	/*@ val dcmpltu : ... */
	let dcmpltu = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> dcmpne [
	self shouldBeImplemented.
	^self specify: dcmpne as:'
	/*@ val dcmpne : ... */
	let dcmpne = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> dcmpneu [
	self shouldBeImplemented.
	^self specify: dcmpneu as:'
	/*@ val dcmpneu : ... */
	let dcmpneu = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> dconst [
	self shouldBeImplemented.
	^self specify: dconst as:'
	/*@ val dconst : ... */
	let dconst = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> ddiv [
	self shouldBeImplemented.
	^self specify: ddiv as:'
	/*@ val ddiv : ... */
	let ddiv = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> dfloor [
	self shouldBeImplemented.
	^self specify: dfloor as:'
	/*@ val dfloor : ... */
	let dfloor = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> discontigarraylength [
	self shouldBeImplemented.
	^self specify: discontigarraylength as:'
	/*@ val discontigarraylength : ... */
	let discontigarraylength = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> divchk [
	self shouldBeImplemented.
	^self specify: divchk as:'
	/*@ val divchk : ... */
	let divchk = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> dload [
	self shouldBeImplemented.
	^self specify: dload as:'
	/*@ val dload : ... */
	let dload = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> dloadi [
	self shouldBeImplemented.
	^self specify: dloadi as:'
	/*@ val dloadi : ... */
	let dloadi = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> dmax [
	self shouldBeImplemented.
	^self specify: dmax as:'
	/*@ val dmax : ... */
	let dmax = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> dmin [
	self shouldBeImplemented.
	^self specify: dmin as:'
	/*@ val dmin : ... */
	let dmin = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> dmul [
	self shouldBeImplemented.
	^self specify: dmul as:'
	/*@ val dmul : ... */
	let dmul = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> dneg [
	self shouldBeImplemented.
	^self specify: dneg as:'
	/*@ val dneg : ... */
	let dneg = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> drdbar [
	self shouldBeImplemented.
	^self specify: drdbar as:'
	/*@ val drdbar : ... */
	let drdbar = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> drdbari [
	self shouldBeImplemented.
	^self specify: drdbari as:'
	/*@ val drdbari : ... */
	let drdbari = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> dregload [
	self shouldBeImplemented.
	^self specify: dregload as:'
	/*@ val dregload : ... */
	let dregload = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> dregstore [
	self shouldBeImplemented.
	^self specify: dregstore as:'
	/*@ val dregstore : ... */
	let dregstore = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> drem [
	self shouldBeImplemented.
	^self specify: drem as:'
	/*@ val drem : ... */
	let drem = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> dreturn [
	self shouldBeImplemented.
	^self specify: dreturn as:'
	/*@ val dreturn : ... */
	let dreturn = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> dselect [
	self shouldBeImplemented.
	^self specify: dselect as:'
	/*@ val dselect : ... */
	let dselect = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> dsqrt [
	self shouldBeImplemented.
	^self specify: dsqrt as:'
	/*@ val dsqrt : ... */
	let dsqrt = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> dstore [
	self shouldBeImplemented.
	^self specify: dstore as:'
	/*@ val dstore : ... */
	let dstore = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> dstorei [
	self shouldBeImplemented.
	^self specify: dstorei as:'
	/*@ val dstorei : ... */
	let dstorei = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> dsub [
	self shouldBeImplemented.
	^self specify: dsub as:'
	/*@ val dsub : ... */
	let dsub = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> dwrtbar [
	self shouldBeImplemented.
	^self specify: dwrtbar as:'
	/*@ val dwrtbar : ... */
	let dwrtbar = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> dwrtbari [
	self shouldBeImplemented.
	^self specify: dwrtbari as:'
	/*@ val dwrtbari : ... */
	let dwrtbari = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> exceptionrangefence [
	self shouldBeImplemented.
	^self specify: exceptionrangefence as:'
	/*@ val exceptionrangefence : ... */
	let exceptionrangefence = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> f2b [
	self shouldBeImplemented.
	^self specify: f2b as:'
	/*@ val f2b : ... */
	let f2b = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> f2bu [
	self shouldBeImplemented.
	^self specify: f2bu as:'
	/*@ val f2bu : ... */
	let f2bu = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> f2c [
	self shouldBeImplemented.
	^self specify: f2c as:'
	/*@ val f2c : ... */
	let f2c = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> f2d [
	self shouldBeImplemented.
	^self specify: f2d as:'
	/*@ val f2d : ... */
	let f2d = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> f2i [
	self shouldBeImplemented.
	^self specify: f2i as:'
	/*@ val f2i : ... */
	let f2i = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> f2iu [
	self shouldBeImplemented.
	^self specify: f2iu as:'
	/*@ val f2iu : ... */
	let f2iu = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> f2l [
	self shouldBeImplemented.
	^self specify: f2l as:'
	/*@ val f2l : ... */
	let f2l = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> f2lu [
	self shouldBeImplemented.
	^self specify: f2lu as:'
	/*@ val f2lu : ... */
	let f2lu = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> f2s [
	self shouldBeImplemented.
	^self specify: f2s as:'
	/*@ val f2s : ... */
	let f2s = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> fabs [
	self shouldBeImplemented.
	^self specify: fabs as:'
	/*@ val fabs : ... */
	let fabs = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> fadd [
	self shouldBeImplemented.
	^self specify: fadd as:'
	/*@ val fadd : ... */
	let fadd = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> fbits2i [
	self shouldBeImplemented.
	^self specify: fbits2i as:'
	/*@ val fbits2i : ... */
	let fbits2i = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> fcall [
	self shouldBeImplemented.
	^self specify: fcall as:'
	/*@ val fcall : ... */
	let fcall = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> fcalli [
	self shouldBeImplemented.
	^self specify: fcalli as:'
	/*@ val fcalli : ... */
	let fcalli = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> fceil [
	self shouldBeImplemented.
	^self specify: fceil as:'
	/*@ val fceil : ... */
	let fceil = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> fcmpeq [
	self shouldBeImplemented.
	^self specify: fcmpeq as:'
	/*@ val fcmpeq : ... */
	let fcmpeq = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> fcmpequ [
	self shouldBeImplemented.
	^self specify: fcmpequ as:'
	/*@ val fcmpequ : ... */
	let fcmpequ = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> fcmpg [
	self shouldBeImplemented.
	^self specify: fcmpg as:'
	/*@ val fcmpg : ... */
	let fcmpg = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> fcmpge [
	self shouldBeImplemented.
	^self specify: fcmpge as:'
	/*@ val fcmpge : ... */
	let fcmpge = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> fcmpgeu [
	self shouldBeImplemented.
	^self specify: fcmpgeu as:'
	/*@ val fcmpgeu : ... */
	let fcmpgeu = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> fcmpgt [
	self shouldBeImplemented.
	^self specify: fcmpgt as:'
	/*@ val fcmpgt : ... */
	let fcmpgt = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> fcmpgtu [
	self shouldBeImplemented.
	^self specify: fcmpgtu as:'
	/*@ val fcmpgtu : ... */
	let fcmpgtu = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> fcmpl [
	self shouldBeImplemented.
	^self specify: fcmpl as:'
	/*@ val fcmpl : ... */
	let fcmpl = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> fcmple [
	self shouldBeImplemented.
	^self specify: fcmple as:'
	/*@ val fcmple : ... */
	let fcmple = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> fcmpleu [
	self shouldBeImplemented.
	^self specify: fcmpleu as:'
	/*@ val fcmpleu : ... */
	let fcmpleu = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> fcmplt [
	self shouldBeImplemented.
	^self specify: fcmplt as:'
	/*@ val fcmplt : ... */
	let fcmplt = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> fcmpltu [
	self shouldBeImplemented.
	^self specify: fcmpltu as:'
	/*@ val fcmpltu : ... */
	let fcmpltu = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> fcmpne [
	self shouldBeImplemented.
	^self specify: fcmpne as:'
	/*@ val fcmpne : ... */
	let fcmpne = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> fcmpneu [
	self shouldBeImplemented.
	^self specify: fcmpneu as:'
	/*@ val fcmpneu : ... */
	let fcmpneu = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> fconst [
	self shouldBeImplemented.
	^self specify: fconst as:'
	/*@ val fconst : ... */
	let fconst = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> fdiv [
	self shouldBeImplemented.
	^self specify: fdiv as:'
	/*@ val fdiv : ... */
	let fdiv = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> fence [
	self shouldBeImplemented.
	^self specify: fence as:'
	/*@ val fence : ... */
	let fence = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> ffloor [
	self shouldBeImplemented.
	^self specify: ffloor as:'
	/*@ val ffloor : ... */
	let ffloor = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> fload [
	self shouldBeImplemented.
	^self specify: fload as:'
	/*@ val fload : ... */
	let fload = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> floadi [
	self shouldBeImplemented.
	^self specify: floadi as:'
	/*@ val floadi : ... */
	let floadi = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> fmax [
	self shouldBeImplemented.
	^self specify: fmax as:'
	/*@ val fmax : ... */
	let fmax = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> fmin [
	self shouldBeImplemented.
	^self specify: fmin as:'
	/*@ val fmin : ... */
	let fmin = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> fmul [
	self shouldBeImplemented.
	^self specify: fmul as:'
	/*@ val fmul : ... */
	let fmul = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> fneg [
	self shouldBeImplemented.
	^self specify: fneg as:'
	/*@ val fneg : ... */
	let fneg = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> frdbar [
	self shouldBeImplemented.
	^self specify: frdbar as:'
	/*@ val frdbar : ... */
	let frdbar = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> frdbari [
	self shouldBeImplemented.
	^self specify: frdbari as:'
	/*@ val frdbari : ... */
	let frdbari = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> fregload [
	self shouldBeImplemented.
	^self specify: fregload as:'
	/*@ val fregload : ... */
	let fregload = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> fregstore [
	self shouldBeImplemented.
	^self specify: fregstore as:'
	/*@ val fregstore : ... */
	let fregstore = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> frem [
	self shouldBeImplemented.
	^self specify: frem as:'
	/*@ val frem : ... */
	let frem = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> freturn [
	self shouldBeImplemented.
	^self specify: freturn as:'
	/*@ val freturn : ... */
	let freturn = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> fselect [
	self shouldBeImplemented.
	^self specify: fselect as:'
	/*@ val fselect : ... */
	let fselect = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> fsqrt [
	self shouldBeImplemented.
	^self specify: fsqrt as:'
	/*@ val fsqrt : ... */
	let fsqrt = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> fstore [
	self shouldBeImplemented.
	^self specify: fstore as:'
	/*@ val fstore : ... */
	let fstore = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> fstorei [
	self shouldBeImplemented.
	^self specify: fstorei as:'
	/*@ val fstorei : ... */
	let fstorei = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> fsub [
	self shouldBeImplemented.
	^self specify: fsub as:'
	/*@ val fsub : ... */
	let fsub = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> fullfence [
	self shouldBeImplemented.
	^self specify: fullfence as:'
	/*@ val fullfence : ... */
	let fullfence = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> fwrtbar [
	self shouldBeImplemented.
	^self specify: fwrtbar as:'
	/*@ val fwrtbar : ... */
	let fwrtbar = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> fwrtbari [
	self shouldBeImplemented.
	^self specify: fwrtbari as:'
	/*@ val fwrtbari : ... */
	let fwrtbari = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> glregdeps [
	self shouldBeImplemented.
	^self specify: glregdeps as:'
	/*@ val glregdeps : ... */
	let glregdeps = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> goto [
	self shouldBeImplemented.
	^self specify: goto as:'
	/*@ val goto : ... */
	let goto = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> i2a [
	self shouldBeImplemented.
	^self specify: i2a as:'
	/*@ val i2a : ... */
	let i2a = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> i2b [
	self shouldBeImplemented.
	^self specify: i2b as:'
	/*@ val i2b : ... */
	let i2b = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> i2d [
	self shouldBeImplemented.
	^self specify: i2d as:'
	/*@ val i2d : ... */
	let i2d = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> i2f [
	self shouldBeImplemented.
	^self specify: i2f as:'
	/*@ val i2f : ... */
	let i2f = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> i2l [
	self shouldBeImplemented.
	^self specify: i2l as:'
	/*@ val i2l : ... */
	let i2l = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> i2s [
	self shouldBeImplemented.
	^self specify: i2s as:'
	/*@ val i2s : ... */
	let i2s = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> iabs [
	self shouldBeImplemented.
	^self specify: iabs as:'
	/*@ val iabs : ... */
	let iabs = (...) => {
	...
	};
	'

]

{ #category : #opcodes }
TRILSpecification >> iadd [
	^self specify: iadd as:'
	/*@ reflect iadd : Int32 => Int32 => Int32 / [zero] */
	let rec iadd = (c1,c2) => {
		bvadd32(c1,c2)
	};
'

	"
	TRILSpecification new specify: iadd
	"
]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> iand [
	self shouldBeImplemented.
	^self specify: iand as:'
	/*@ val iand : ... */
	let iand = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> ibatomicor [
	self shouldBeImplemented.
	^self specify: ibatomicor as:'
	/*@ val ibatomicor : ... */
	let ibatomicor = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> ibitpermute [
	self shouldBeImplemented.
	^self specify: ibitpermute as:'
	/*@ val ibitpermute : ... */
	let ibitpermute = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> ibits2f [
	self shouldBeImplemented.
	^self specify: ibits2f as:'
	/*@ val ibits2f : ... */
	let ibits2f = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> ibyteswap [
	self shouldBeImplemented.
	^self specify: ibyteswap as:'
	/*@ val ibyteswap : ... */
	let ibyteswap = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> icall [
	self shouldBeImplemented.
	^self specify: icall as:'
	/*@ val icall : ... */
	let icall = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> icalli [
	self shouldBeImplemented.
	^self specify: icalli as:'
	/*@ val icalli : ... */
	let icalli = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> icmp [
	self shouldBeImplemented.
	^self specify: icmp as:'
	/*@ val icmp : ... */
	let icmp = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> icmpeq [
	self shouldBeImplemented.
	^self specify: icmpeq as:'
	/*@ val icmpeq : ... */
	let icmpeq = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> icmpge [
	self shouldBeImplemented.
	^self specify: icmpge as:'
	/*@ val icmpge : ... */
	let icmpge = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> icmpgt [
	self shouldBeImplemented.
	^self specify: icmpgt as:'
	/*@ val icmpgt : ... */
	let icmpgt = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> icmple [
	self shouldBeImplemented.
	^self specify: icmple as:'
	/*@ val icmple : ... */
	let icmple = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> icmplt [
	self shouldBeImplemented.
	^self specify: icmplt as:'
	/*@ val icmplt : ... */
	let icmplt = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> icmpne [
	self shouldBeImplemented.
	^self specify: icmpne as:'
	/*@ val icmpne : ... */
	let icmpne = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> icmpset [
	self shouldBeImplemented.
	^self specify: icmpset as:'
	/*@ val icmpset : ... */
	let icmpset = (...) => {
	...
	};
	'

]

{ #category : #opcodes }
TRILSpecification >> iconst [
	^self specify: iconst as: '
/*@ reflect iconst : Int32 => Int32 / [zero] */
let rec     iconst = (c) => {
	c
};'
]

{ #category : #opcodes }
TRILSpecification >> idiv [
	^self specify: idiv as:'
	/*@ val idiv : c1:Int32 => c2:Int32 => Int32[r|r === (c1 / c2)] */
	let     idiv = (c1,c2) => {
		bvdiv32(c1,c2)
	};
'

	"
	TRILSpecification new specify: idiv
	"
]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> ifacmpeq [
	self shouldBeImplemented.
	^self specify: ifacmpeq as:'
	/*@ val ifacmpeq : ... */
	let ifacmpeq = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> ifacmpge [
	self shouldBeImplemented.
	^self specify: ifacmpge as:'
	/*@ val ifacmpge : ... */
	let ifacmpge = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> ifacmpgt [
	self shouldBeImplemented.
	^self specify: ifacmpgt as:'
	/*@ val ifacmpgt : ... */
	let ifacmpgt = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> ifacmple [
	self shouldBeImplemented.
	^self specify: ifacmple as:'
	/*@ val ifacmple : ... */
	let ifacmple = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> ifacmplt [
	self shouldBeImplemented.
	^self specify: ifacmplt as:'
	/*@ val ifacmplt : ... */
	let ifacmplt = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> ifacmpne [
	self shouldBeImplemented.
	^self specify: ifacmpne as:'
	/*@ val ifacmpne : ... */
	let ifacmpne = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> ifbcmpeq [
	self shouldBeImplemented.
	^self specify: ifbcmpeq as:'
	/*@ val ifbcmpeq : ... */
	let ifbcmpeq = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> ifbcmpge [
	self shouldBeImplemented.
	^self specify: ifbcmpge as:'
	/*@ val ifbcmpge : ... */
	let ifbcmpge = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> ifbcmpgt [
	self shouldBeImplemented.
	^self specify: ifbcmpgt as:'
	/*@ val ifbcmpgt : ... */
	let ifbcmpgt = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> ifbcmple [
	self shouldBeImplemented.
	^self specify: ifbcmple as:'
	/*@ val ifbcmple : ... */
	let ifbcmple = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> ifbcmplt [
	self shouldBeImplemented.
	^self specify: ifbcmplt as:'
	/*@ val ifbcmplt : ... */
	let ifbcmplt = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> ifbcmpne [
	self shouldBeImplemented.
	^self specify: ifbcmpne as:'
	/*@ val ifbcmpne : ... */
	let ifbcmpne = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> ifbucmpge [
	self shouldBeImplemented.
	^self specify: ifbucmpge as:'
	/*@ val ifbucmpge : ... */
	let ifbucmpge = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> ifbucmpgt [
	self shouldBeImplemented.
	^self specify: ifbucmpgt as:'
	/*@ val ifbucmpgt : ... */
	let ifbucmpgt = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> ifbucmple [
	self shouldBeImplemented.
	^self specify: ifbucmple as:'
	/*@ val ifbucmple : ... */
	let ifbucmple = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> ifbucmplt [
	self shouldBeImplemented.
	^self specify: ifbucmplt as:'
	/*@ val ifbucmplt : ... */
	let ifbucmplt = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> ifdcmpeq [
	self shouldBeImplemented.
	^self specify: ifdcmpeq as:'
	/*@ val ifdcmpeq : ... */
	let ifdcmpeq = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> ifdcmpequ [
	self shouldBeImplemented.
	^self specify: ifdcmpequ as:'
	/*@ val ifdcmpequ : ... */
	let ifdcmpequ = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> ifdcmpge [
	self shouldBeImplemented.
	^self specify: ifdcmpge as:'
	/*@ val ifdcmpge : ... */
	let ifdcmpge = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> ifdcmpgeu [
	self shouldBeImplemented.
	^self specify: ifdcmpgeu as:'
	/*@ val ifdcmpgeu : ... */
	let ifdcmpgeu = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> ifdcmpgt [
	self shouldBeImplemented.
	^self specify: ifdcmpgt as:'
	/*@ val ifdcmpgt : ... */
	let ifdcmpgt = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> ifdcmpgtu [
	self shouldBeImplemented.
	^self specify: ifdcmpgtu as:'
	/*@ val ifdcmpgtu : ... */
	let ifdcmpgtu = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> ifdcmple [
	self shouldBeImplemented.
	^self specify: ifdcmple as:'
	/*@ val ifdcmple : ... */
	let ifdcmple = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> ifdcmpleu [
	self shouldBeImplemented.
	^self specify: ifdcmpleu as:'
	/*@ val ifdcmpleu : ... */
	let ifdcmpleu = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> ifdcmplt [
	self shouldBeImplemented.
	^self specify: ifdcmplt as:'
	/*@ val ifdcmplt : ... */
	let ifdcmplt = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> ifdcmpltu [
	self shouldBeImplemented.
	^self specify: ifdcmpltu as:'
	/*@ val ifdcmpltu : ... */
	let ifdcmpltu = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> ifdcmpne [
	self shouldBeImplemented.
	^self specify: ifdcmpne as:'
	/*@ val ifdcmpne : ... */
	let ifdcmpne = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> ifdcmpneu [
	self shouldBeImplemented.
	^self specify: ifdcmpneu as:'
	/*@ val ifdcmpneu : ... */
	let ifdcmpneu = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> iffcmpeq [
	self shouldBeImplemented.
	^self specify: iffcmpeq as:'
	/*@ val iffcmpeq : ... */
	let iffcmpeq = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> iffcmpequ [
	self shouldBeImplemented.
	^self specify: iffcmpequ as:'
	/*@ val iffcmpequ : ... */
	let iffcmpequ = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> iffcmpge [
	self shouldBeImplemented.
	^self specify: iffcmpge as:'
	/*@ val iffcmpge : ... */
	let iffcmpge = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> iffcmpgeu [
	self shouldBeImplemented.
	^self specify: iffcmpgeu as:'
	/*@ val iffcmpgeu : ... */
	let iffcmpgeu = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> iffcmpgt [
	self shouldBeImplemented.
	^self specify: iffcmpgt as:'
	/*@ val iffcmpgt : ... */
	let iffcmpgt = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> iffcmpgtu [
	self shouldBeImplemented.
	^self specify: iffcmpgtu as:'
	/*@ val iffcmpgtu : ... */
	let iffcmpgtu = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> iffcmple [
	self shouldBeImplemented.
	^self specify: iffcmple as:'
	/*@ val iffcmple : ... */
	let iffcmple = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> iffcmpleu [
	self shouldBeImplemented.
	^self specify: iffcmpleu as:'
	/*@ val iffcmpleu : ... */
	let iffcmpleu = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> iffcmplt [
	self shouldBeImplemented.
	^self specify: iffcmplt as:'
	/*@ val iffcmplt : ... */
	let iffcmplt = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> iffcmpltu [
	self shouldBeImplemented.
	^self specify: iffcmpltu as:'
	/*@ val iffcmpltu : ... */
	let iffcmpltu = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> iffcmpne [
	self shouldBeImplemented.
	^self specify: iffcmpne as:'
	/*@ val iffcmpne : ... */
	let iffcmpne = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> iffcmpneu [
	self shouldBeImplemented.
	^self specify: iffcmpneu as:'
	/*@ val iffcmpneu : ... */
	let iffcmpneu = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> ificmnno [
	self shouldBeImplemented.
	^self specify: ificmnno as:'
	/*@ val ificmnno : ... */
	let ificmnno = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> ificmno [
	self shouldBeImplemented.
	^self specify: ificmno as:'
	/*@ val ificmno : ... */
	let ificmno = (...) => {
	...
	};
	'

]

{ #category : #opcodes }
TRILSpecification >> ificmpeq [
	^self specify: ificmpeq as:'
	/*@ reflect ificmpeq : Int32 => Int32 => bool */
	let     ificmpeq = (c1,c2) => {
		bveq32(c1 , c2)
	};
	'

]

{ #category : #opcodes }
TRILSpecification >> ificmpge [
	^self specify: ificmpge as:'
	/*@ reflect ificmpge : Int32 => Int32 => bool */
	let     ificmpge = (c1,c2) => {
		bvge32(c1 , c2)
	};
	'

]

{ #category : #opcodes }
TRILSpecification >> ificmpgt [
	^self specify: ificmpgt as:'
	/*@ reflect ificmpgt : Int32 => Int32 => bool */
	let rec ificmpgt = (c1,c2) => {
		bvgt32(c1 , c2)
	};
	'

]

{ #category : #opcodes }
TRILSpecification >> ificmple [
	^self specify: ificmple as:'
	/*@ reflect ificmple : Int32 => Int32 => bool */
	let     ificmple = (c1,c2) => {
		bvle32(c1 , c2)
	};
	'

]

{ #category : #opcodes }
TRILSpecification >> ificmplt [
	^self specify: ificmplt as:'
	/*@ reflect ificmplt : Int32 => Int32 => bool */
	let     ificmplt = (c1,c2) => {
		bvlt32(c1 , c2)
	};
	'

]

{ #category : #opcodes }
TRILSpecification >> ificmpne [
	^self specify: ificmpne as:'
	/*@ reflect ificmpne : Int32 => Int32 => bool */
	let     ificmpne = (c1,c2) => {
		bvne32(c1 , c2)
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> ificmpno [
	self shouldBeImplemented.
	^self specify: ificmpno as:'
	/*@ val ificmpno : ... */
	let ificmpno = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> ificmpo [
	self shouldBeImplemented.
	^self specify: ificmpo as:'
	/*@ val ificmpo : ... */
	let ificmpo = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> ifiucmpge [
	self shouldBeImplemented.
	^self specify: ifiucmpge as:'
	/*@ val ifiucmpge : ... */
	let ifiucmpge = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> ifiucmpgt [
	self shouldBeImplemented.
	^self specify: ifiucmpgt as:'
	/*@ val ifiucmpgt : ... */
	let ifiucmpgt = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> ifiucmple [
	self shouldBeImplemented.
	^self specify: ifiucmple as:'
	/*@ val ifiucmple : ... */
	let ifiucmple = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> ifiucmplt [
	self shouldBeImplemented.
	^self specify: ifiucmplt as:'
	/*@ val ifiucmplt : ... */
	let ifiucmplt = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> iflcmnno [
	self shouldBeImplemented.
	^self specify: iflcmnno as:'
	/*@ val iflcmnno : ... */
	let iflcmnno = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> iflcmno [
	self shouldBeImplemented.
	^self specify: iflcmno as:'
	/*@ val iflcmno : ... */
	let iflcmno = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> iflcmpeq [
	self shouldBeImplemented.
	^self specify: iflcmpeq as:'
	/*@ val iflcmpeq : ... */
	let iflcmpeq = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> iflcmpge [
	self shouldBeImplemented.
	^self specify: iflcmpge as:'
	/*@ val iflcmpge : ... */
	let iflcmpge = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> iflcmpgt [
	self shouldBeImplemented.
	^self specify: iflcmpgt as:'
	/*@ val iflcmpgt : ... */
	let iflcmpgt = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> iflcmple [
	self shouldBeImplemented.
	^self specify: iflcmple as:'
	/*@ val iflcmple : ... */
	let iflcmple = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> iflcmplt [
	self shouldBeImplemented.
	^self specify: iflcmplt as:'
	/*@ val iflcmplt : ... */
	let iflcmplt = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> iflcmpne [
	self shouldBeImplemented.
	^self specify: iflcmpne as:'
	/*@ val iflcmpne : ... */
	let iflcmpne = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> iflcmpno [
	self shouldBeImplemented.
	^self specify: iflcmpno as:'
	/*@ val iflcmpno : ... */
	let iflcmpno = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> iflcmpo [
	self shouldBeImplemented.
	^self specify: iflcmpo as:'
	/*@ val iflcmpo : ... */
	let iflcmpo = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> iflucmpge [
	self shouldBeImplemented.
	^self specify: iflucmpge as:'
	/*@ val iflucmpge : ... */
	let iflucmpge = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> iflucmpgt [
	self shouldBeImplemented.
	^self specify: iflucmpgt as:'
	/*@ val iflucmpgt : ... */
	let iflucmpgt = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> iflucmple [
	self shouldBeImplemented.
	^self specify: iflucmple as:'
	/*@ val iflucmple : ... */
	let iflucmple = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> iflucmplt [
	self shouldBeImplemented.
	^self specify: iflucmplt as:'
	/*@ val iflucmplt : ... */
	let iflucmplt = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> ifscmpeq [
	self shouldBeImplemented.
	^self specify: ifscmpeq as:'
	/*@ val ifscmpeq : ... */
	let ifscmpeq = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> ifscmpge [
	self shouldBeImplemented.
	^self specify: ifscmpge as:'
	/*@ val ifscmpge : ... */
	let ifscmpge = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> ifscmpgt [
	self shouldBeImplemented.
	^self specify: ifscmpgt as:'
	/*@ val ifscmpgt : ... */
	let ifscmpgt = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> ifscmple [
	self shouldBeImplemented.
	^self specify: ifscmple as:'
	/*@ val ifscmple : ... */
	let ifscmple = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> ifscmplt [
	self shouldBeImplemented.
	^self specify: ifscmplt as:'
	/*@ val ifscmplt : ... */
	let ifscmplt = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> ifscmpne [
	self shouldBeImplemented.
	^self specify: ifscmpne as:'
	/*@ val ifscmpne : ... */
	let ifscmpne = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> ifsucmpge [
	self shouldBeImplemented.
	^self specify: ifsucmpge as:'
	/*@ val ifsucmpge : ... */
	let ifsucmpge = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> ifsucmpgt [
	self shouldBeImplemented.
	^self specify: ifsucmpgt as:'
	/*@ val ifsucmpgt : ... */
	let ifsucmpgt = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> ifsucmple [
	self shouldBeImplemented.
	^self specify: ifsucmple as:'
	/*@ val ifsucmple : ... */
	let ifsucmple = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> ifsucmplt [
	self shouldBeImplemented.
	^self specify: ifsucmplt as:'
	/*@ val ifsucmplt : ... */
	let ifsucmplt = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> igoto [
	self shouldBeImplemented.
	^self specify: igoto as:'
	/*@ val igoto : ... */
	let igoto = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> ihbit [
	self shouldBeImplemented.
	^self specify: ihbit as:'
	/*@ val ihbit : ... */
	let ihbit = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> iiatomicor [
	self shouldBeImplemented.
	^self specify: iiatomicor as:'
	/*@ val iiatomicor : ... */
	let iiatomicor = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> ilatomicor [
	self shouldBeImplemented.
	^self specify: ilatomicor as:'
	/*@ val ilatomicor : ... */
	let ilatomicor = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> ilbit [
	self shouldBeImplemented.
	^self specify: ilbit as:'
	/*@ val ilbit : ... */
	let ilbit = (...) => {
	...
	};
	'

]

{ #category : #opcodes }
TRILSpecification >> iload [
	^self specify: iload as:'
	/*@ reflect iload : Int32 => Int32 / [zero] */
	let rec iload = (s) => {
		s
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> iloadi [
	self shouldBeImplemented.
	^self specify: iloadi as:'
	/*@ val iloadi : ... */
	let iloadi = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> imax [
	self shouldBeImplemented.
	^self specify: imax as:'
	/*@ val imax : ... */
	let imax = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> imin [
	self shouldBeImplemented.
	^self specify: imin as:'
	/*@ val imin : ... */
	let imin = (...) => {
	...
	};
	'

]

{ #category : #opcodes }
TRILSpecification >> imul [
	^self specify: imul as:'
	/*@ reflect imul : Int32 => Int32 => Int32 / [zero] */
	let rec imul = (c1,c2) => {
		bvmul32(c1,c2)
	};
	'

	"
	TRILSpecification new specify: imul
	"
]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> imulh [
	self shouldBeImplemented.
	^self specify: imulh as:'
	/*@ val imulh : ... */
	let imulh = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> ineg [
	self shouldBeImplemented.
	^self specify: ineg as:'
	/*@ val ineg : ... */
	let ineg = (...) => {
	...
	};
	'

]

{ #category : #initialization }
TRILSpecification >> initialize [
	prelude := Prog empty.
	prelude options: #(#'check-termination').
	"
	prelude := ΛκParser parse:'
	[--check-termination]

	⟦val zero : int[v | v===0]⟧
	 let zero = 0;
	'.
	"
]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> inolz [
	self shouldBeImplemented.
	^self specify: inolz as:'
	/*@ val inolz : ... */
	let inolz = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> inotz [
	self shouldBeImplemented.
	^self specify: inotz as:'
	/*@ val inotz : ... */
	let inotz = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> instanceof [
	self shouldBeImplemented.
	^self specify: instanceof as:'
	/*@ val instanceof : ... */
	let instanceof = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> invalid [
	self shouldBeImplemented.
	^self specify: invalid as:'
	/*@ val invalid : ... */
	let invalid = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> ior [
	self shouldBeImplemented.
	^self specify: ior as:'
	/*@ val ior : ... */
	let ior = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> ipopcnt [
	self shouldBeImplemented.
	^self specify: ipopcnt as:'
	/*@ val ipopcnt : ... */
	let ipopcnt = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> irdbar [
	self shouldBeImplemented.
	^self specify: irdbar as:'
	/*@ val irdbar : ... */
	let irdbar = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> irdbari [
	self shouldBeImplemented.
	^self specify: irdbari as:'
	/*@ val irdbari : ... */
	let irdbari = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> iregload [
	self shouldBeImplemented.
	^self specify: iregload as:'
	/*@ val iregload : ... */
	let iregload = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> iregstore [
	self shouldBeImplemented.
	^self specify: iregstore as:'
	/*@ val iregstore : ... */
	let iregstore = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> irem [
	self shouldBeImplemented.
	^self specify: irem as:'
	/*@ val irem : ... */
	let irem = (...) => {
	...
	};
	'

]

{ #category : #opcodes }
TRILSpecification >> ireturn [
	^self specify: ireturn as:'
	/*@ reflect ireturn : Int32 => Int32 / [zero] */
	let rec ireturn = (c1) => {
		c1
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> irol [
	self shouldBeImplemented.
	^self specify: irol as:'
	/*@ val irol : ... */
	let irol = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> isatomicor [
	self shouldBeImplemented.
	^self specify: isatomicor as:'
	/*@ val isatomicor : ... */
	let isatomicor = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> iselect [
	self shouldBeImplemented.
	^self specify: iselect as:'
	/*@ val iselect : ... */
	let iselect = (...) => {
	...
	};
	'

]

{ #category : #opcodes }
TRILSpecification >> ishl [
	^self specify: ishl as:'
	/*@ reflect ishl : Int32 => Int32 => Int32 / [zero] */
	let rec ishl = (c1,c2) => {
		bvshl32(c1,c2)
	};
'

	"
	TRILSpecification new specify: ishl
	"
]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> ishr [
	self shouldBeImplemented.
	^self specify: ishr as:'
	/*@ val ishr : ... */
	let ishr = (...) => {
	...
	};
	'

]

{ #category : #opcodes }
TRILSpecification >> istore [
	^self specify: istore as:'
	/*@ reflect istore : Int32 => Int32 / [zero] */
	let rec istore = (s) => {
		s
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> istorei [
	self shouldBeImplemented.
	^self specify: istorei as:'
	/*@ val istorei : ... */
	let istorei = (...) => {
	...
	};
	'

]

{ #category : #opcodes }
TRILSpecification >> isub [
	^self specify: isub as:'
	/*@ reflect isub : Int32 => Int32 => Int32 / [zero] */
	let rec isub = (c1,c2) => {
		bvsub32(c1,c2)
	};
'

	"
	TRILSpecification new specify: isub
	"
]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> iu2a [
	self shouldBeImplemented.
	^self specify: iu2a as:'
	/*@ val iu2a : ... */
	let iu2a = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> iu2d [
	self shouldBeImplemented.
	^self specify: iu2d as:'
	/*@ val iu2d : ... */
	let iu2d = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> iu2f [
	self shouldBeImplemented.
	^self specify: iu2f as:'
	/*@ val iu2f : ... */
	let iu2f = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> iu2l [
	self shouldBeImplemented.
	^self specify: iu2l as:'
	/*@ val iu2l : ... */
	let iu2l = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> iuaddc [
	self shouldBeImplemented.
	^self specify: iuaddc as:'
	/*@ val iuaddc : ... */
	let iuaddc = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> iucmp [
	self shouldBeImplemented.
	^self specify: iucmp as:'
	/*@ val iucmp : ... */
	let iucmp = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> iucmpge [
	self shouldBeImplemented.
	^self specify: iucmpge as:'
	/*@ val iucmpge : ... */
	let iucmpge = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> iucmpgt [
	self shouldBeImplemented.
	^self specify: iucmpgt as:'
	/*@ val iucmpgt : ... */
	let iucmpgt = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> iucmple [
	self shouldBeImplemented.
	^self specify: iucmple as:'
	/*@ val iucmple : ... */
	let iucmple = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> iucmplt [
	self shouldBeImplemented.
	^self specify: iucmplt as:'
	/*@ val iucmplt : ... */
	let iucmplt = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> iudiv [
	self shouldBeImplemented.
	^self specify: iudiv as:'
	/*@ val iudiv : ... */
	let iudiv = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> iumax [
	self shouldBeImplemented.
	^self specify: iumax as:'
	/*@ val iumax : ... */
	let iumax = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> iumin [
	self shouldBeImplemented.
	^self specify: iumin as:'
	/*@ val iumin : ... */
	let iumin = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> iumulh [
	self shouldBeImplemented.
	^self specify: iumulh as:'
	/*@ val iumulh : ... */
	let iumulh = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> iurem [
	self shouldBeImplemented.
	^self specify: iurem as:'
	/*@ val iurem : ... */
	let iurem = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> iushr [
	self shouldBeImplemented.
	^self specify: iushr as:'
	/*@ val iushr : ... */
	let iushr = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> iusubb [
	self shouldBeImplemented.
	^self specify: iusubb as:'
	/*@ val iusubb : ... */
	let iusubb = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> iwrtbar [
	self shouldBeImplemented.
	^self specify: iwrtbar as:'
	/*@ val iwrtbar : ... */
	let iwrtbar = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> iwrtbari [
	self shouldBeImplemented.
	^self specify: iwrtbari as:'
	/*@ val iwrtbari : ... */
	let iwrtbari = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> ixor [
	self shouldBeImplemented.
	^self specify: ixor as:'
	/*@ val ixor : ... */
	let ixor = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> l2a [
	self shouldBeImplemented.
	^self specify: l2a as:'
	/*@ val l2a : ... */
	let l2a = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> l2b [
	self shouldBeImplemented.
	^self specify: l2b as:'
	/*@ val l2b : ... */
	let l2b = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> l2d [
	self shouldBeImplemented.
	^self specify: l2d as:'
	/*@ val l2d : ... */
	let l2d = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> l2f [
	self shouldBeImplemented.
	^self specify: l2f as:'
	/*@ val l2f : ... */
	let l2f = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> l2i [
	self shouldBeImplemented.
	^self specify: l2i as:'
	/*@ val l2i : ... */
	let l2i = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> l2s [
	self shouldBeImplemented.
	^self specify: l2s as:'
	/*@ val l2s : ... */
	let l2s = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> labs [
	self shouldBeImplemented.
	^self specify: labs as:'
	/*@ val labs : ... */
	let labs = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> ladd [
	self shouldBeImplemented.
	^self specify: ladd as:'
	/*@ val ladd : ... */
	let ladd = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> land [
	self shouldBeImplemented.
	^self specify: land as:'
	/*@ val land : ... */
	let land = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> lbitpermute [
	self shouldBeImplemented.
	^self specify: lbitpermute as:'
	/*@ val lbitpermute : ... */
	let lbitpermute = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> lbits2d [
	self shouldBeImplemented.
	^self specify: lbits2d as:'
	/*@ val lbits2d : ... */
	let lbits2d = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> lbyteswap [
	self shouldBeImplemented.
	^self specify: lbyteswap as:'
	/*@ val lbyteswap : ... */
	let lbyteswap = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> lcall [
	self shouldBeImplemented.
	^self specify: lcall as:'
	/*@ val lcall : ... */
	let lcall = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> lcalli [
	self shouldBeImplemented.
	^self specify: lcalli as:'
	/*@ val lcalli : ... */
	let lcalli = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> lcmp [
	self shouldBeImplemented.
	^self specify: lcmp as:'
	/*@ val lcmp : ... */
	let lcmp = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> lcmpeq [
	self shouldBeImplemented.
	^self specify: lcmpeq as:'
	/*@ val lcmpeq : ... */
	let lcmpeq = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> lcmpge [
	self shouldBeImplemented.
	^self specify: lcmpge as:'
	/*@ val lcmpge : ... */
	let lcmpge = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> lcmpgt [
	self shouldBeImplemented.
	^self specify: lcmpgt as:'
	/*@ val lcmpgt : ... */
	let lcmpgt = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> lcmple [
	self shouldBeImplemented.
	^self specify: lcmple as:'
	/*@ val lcmple : ... */
	let lcmple = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> lcmplt [
	self shouldBeImplemented.
	^self specify: lcmplt as:'
	/*@ val lcmplt : ... */
	let lcmplt = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> lcmpne [
	self shouldBeImplemented.
	^self specify: lcmpne as:'
	/*@ val lcmpne : ... */
	let lcmpne = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> lcmpset [
	self shouldBeImplemented.
	^self specify: lcmpset as:'
	/*@ val lcmpset : ... */
	let lcmpset = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> lconst [
	self shouldBeImplemented.
	^self specify: lconst as:'
	/*@ val lconst : ... */
	let lconst = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> ldiv [
	self shouldBeImplemented.
	^self specify: ldiv as:'
	/*@ val ldiv : ... */
	let ldiv = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> lhbit [
	self shouldBeImplemented.
	^self specify: lhbit as:'
	/*@ val lhbit : ... */
	let lhbit = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> llbit [
	self shouldBeImplemented.
	^self specify: llbit as:'
	/*@ val llbit : ... */
	let llbit = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> lload [
	self shouldBeImplemented.
	^self specify: lload as:'
	/*@ val lload : ... */
	let lload = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> lloadi [
	self shouldBeImplemented.
	^self specify: lloadi as:'
	/*@ val lloadi : ... */
	let lloadi = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> lmax [
	self shouldBeImplemented.
	^self specify: lmax as:'
	/*@ val lmax : ... */
	let lmax = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> lmin [
	self shouldBeImplemented.
	^self specify: lmin as:'
	/*@ val lmin : ... */
	let lmin = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> lmul [
	self shouldBeImplemented.
	^self specify: lmul as:'
	/*@ val lmul : ... */
	let lmul = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> lmulh [
	self shouldBeImplemented.
	^self specify: lmulh as:'
	/*@ val lmulh : ... */
	let lmulh = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> lneg [
	self shouldBeImplemented.
	^self specify: lneg as:'
	/*@ val lneg : ... */
	let lneg = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> lnolz [
	self shouldBeImplemented.
	^self specify: lnolz as:'
	/*@ val lnolz : ... */
	let lnolz = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> lnotz [
	self shouldBeImplemented.
	^self specify: lnotz as:'
	/*@ val lnotz : ... */
	let lnotz = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> loadaddr [
	self shouldBeImplemented.
	^self specify: loadaddr as:'
	/*@ val loadaddr : ... */
	let loadaddr = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> loadfence [
	self shouldBeImplemented.
	^self specify: loadfence as:'
	/*@ val loadfence : ... */
	let loadfence = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> long2string [
	self shouldBeImplemented.
	^self specify: long2string as:'
	/*@ val long2string : ... */
	let long2string = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> lookup [
	self shouldBeImplemented.
	^self specify: lookup as:'
	/*@ val lookup : ... */
	let lookup = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> lor [
	self shouldBeImplemented.
	^self specify: lor as:'
	/*@ val lor : ... */
	let lor = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> lpopcnt [
	self shouldBeImplemented.
	^self specify: lpopcnt as:'
	/*@ val lpopcnt : ... */
	let lpopcnt = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> lrdbar [
	self shouldBeImplemented.
	^self specify: lrdbar as:'
	/*@ val lrdbar : ... */
	let lrdbar = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> lrdbari [
	self shouldBeImplemented.
	^self specify: lrdbari as:'
	/*@ val lrdbari : ... */
	let lrdbari = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> lregload [
	self shouldBeImplemented.
	^self specify: lregload as:'
	/*@ val lregload : ... */
	let lregload = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> lregstore [
	self shouldBeImplemented.
	^self specify: lregstore as:'
	/*@ val lregstore : ... */
	let lregstore = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> lrem [
	self shouldBeImplemented.
	^self specify: lrem as:'
	/*@ val lrem : ... */
	let lrem = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> lreturn [
	self shouldBeImplemented.
	^self specify: lreturn as:'
	/*@ val lreturn : ... */
	let lreturn = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> lrol [
	self shouldBeImplemented.
	^self specify: lrol as:'
	/*@ val lrol : ... */
	let lrol = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> lselect [
	self shouldBeImplemented.
	^self specify: lselect as:'
	/*@ val lselect : ... */
	let lselect = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> lshl [
	self shouldBeImplemented.
	^self specify: lshl as:'
	/*@ val lshl : ... */
	let lshl = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> lshr [
	self shouldBeImplemented.
	^self specify: lshr as:'
	/*@ val lshr : ... */
	let lshr = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> lstore [
	self shouldBeImplemented.
	^self specify: lstore as:'
	/*@ val lstore : ... */
	let lstore = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> lstorei [
	self shouldBeImplemented.
	^self specify: lstorei as:'
	/*@ val lstorei : ... */
	let lstorei = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> lsub [
	self shouldBeImplemented.
	^self specify: lsub as:'
	/*@ val lsub : ... */
	let lsub = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> lu2a [
	self shouldBeImplemented.
	^self specify: lu2a as:'
	/*@ val lu2a : ... */
	let lu2a = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> lu2d [
	self shouldBeImplemented.
	^self specify: lu2d as:'
	/*@ val lu2d : ... */
	let lu2d = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> lu2f [
	self shouldBeImplemented.
	^self specify: lu2f as:'
	/*@ val lu2f : ... */
	let lu2f = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> luaddc [
	self shouldBeImplemented.
	^self specify: luaddc as:'
	/*@ val luaddc : ... */
	let luaddc = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> luaddh [
	self shouldBeImplemented.
	^self specify: luaddh as:'
	/*@ val luaddh : ... */
	let luaddh = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> lucmp [
	self shouldBeImplemented.
	^self specify: lucmp as:'
	/*@ val lucmp : ... */
	let lucmp = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> lucmpge [
	self shouldBeImplemented.
	^self specify: lucmpge as:'
	/*@ val lucmpge : ... */
	let lucmpge = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> lucmpgt [
	self shouldBeImplemented.
	^self specify: lucmpgt as:'
	/*@ val lucmpgt : ... */
	let lucmpgt = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> lucmple [
	self shouldBeImplemented.
	^self specify: lucmple as:'
	/*@ val lucmple : ... */
	let lucmple = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> lucmplt [
	self shouldBeImplemented.
	^self specify: lucmplt as:'
	/*@ val lucmplt : ... */
	let lucmplt = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> ludiv [
	self shouldBeImplemented.
	^self specify: ludiv as:'
	/*@ val ludiv : ... */
	let ludiv = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> lumax [
	self shouldBeImplemented.
	^self specify: lumax as:'
	/*@ val lumax : ... */
	let lumax = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> lumin [
	self shouldBeImplemented.
	^self specify: lumin as:'
	/*@ val lumin : ... */
	let lumin = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> lumulh [
	self shouldBeImplemented.
	^self specify: lumulh as:'
	/*@ val lumulh : ... */
	let lumulh = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> lushr [
	self shouldBeImplemented.
	^self specify: lushr as:'
	/*@ val lushr : ... */
	let lushr = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> lusubb [
	self shouldBeImplemented.
	^self specify: lusubb as:'
	/*@ val lusubb : ... */
	let lusubb = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> lusubh [
	self shouldBeImplemented.
	^self specify: lusubh as:'
	/*@ val lusubh : ... */
	let lusubh = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> lwrtbar [
	self shouldBeImplemented.
	^self specify: lwrtbar as:'
	/*@ val lwrtbar : ... */
	let lwrtbar = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> lwrtbari [
	self shouldBeImplemented.
	^self specify: lwrtbari as:'
	/*@ val lwrtbari : ... */
	let lwrtbari = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> lxor [
	self shouldBeImplemented.
	^self specify: lxor as:'
	/*@ val lxor : ... */
	let lxor = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> methodenterhook [
	self shouldBeImplemented.
	^self specify: methodenterhook as:'
	/*@ val methodenterhook : ... */
	let methodenterhook = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> methodexithook [
	self shouldBeImplemented.
	^self specify: methodexithook as:'
	/*@ val methodexithook : ... */
	let methodexithook = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> monent [
	self shouldBeImplemented.
	^self specify: monent as:'
	/*@ val monent : ... */
	let monent = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> monexit [
	self shouldBeImplemented.
	^self specify: monexit as:'
	/*@ val monexit : ... */
	let monexit = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> monexitfence [
	self shouldBeImplemented.
	^self specify: monexitfence as:'
	/*@ val monexitfence : ... */
	let monexitfence = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> multianewarray [
	self shouldBeImplemented.
	^self specify: multianewarray as:'
	/*@ val multianewarray : ... */
	let multianewarray = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> new [
	self shouldBeImplemented.
	^self specify: new as:'
	/*@ val new : ... */
	let new = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> newarray [
	self shouldBeImplemented.
	^self specify: newarray as:'
	/*@ val newarray : ... */
	let newarray = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> newvalue [
	self shouldBeImplemented.
	^self specify: newvalue as:'
	/*@ val newvalue : ... */
	let newvalue = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> nullchk [
	self shouldBeImplemented.
	^self specify: nullchk as:'
	/*@ val nullchk : ... */
	let nullchk = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> overflowchk [
	self shouldBeImplemented.
	^self specify: overflowchk as:'
	/*@ val overflowchk : ... */
	let overflowchk = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> passthrough [
	self shouldBeImplemented.
	^self specify: passthrough as:'
	/*@ val passthrough : ... */
	let passthrough = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> prefetch [
	self shouldBeImplemented.
	^self specify: prefetch as:'
	/*@ val prefetch : ... */
	let prefetch = (...) => {
	...
	};
	'

]

{ #category : #accessing }
TRILSpecification >> prog [
	"Return Sprite's `Prog` containing specification of opcodes"

	^TRILOpcodes all inject: prelude into: [ :all :opcode |
		| spec |

		spec := [ self specify: opcode ] on: ShouldBeImplemented do:[:e| Prog empty ].
		all , spec.
	]

	"
	TRILSpecification new prog
	TRILSpecification new prog solve
	"
]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> resolveandnullchk [
	self shouldBeImplemented.
	^self specify: resolveandnullchk as:'
	/*@ val resolveandnullchk : ... */
	let resolveandnullchk = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> resolvechk [
	self shouldBeImplemented.
	^self specify: resolvechk as:'
	/*@ val resolvechk : ... */
	let resolvechk = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> return [
	self shouldBeImplemented.
	^self specify: return as:'
	/*@ val return : ... */
	let return = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> s2a [
	self shouldBeImplemented.
	^self specify: s2a as:'
	/*@ val s2a : ... */
	let s2a = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> s2b [
	self shouldBeImplemented.
	^self specify: s2b as:'
	/*@ val s2b : ... */
	let s2b = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> s2d [
	self shouldBeImplemented.
	^self specify: s2d as:'
	/*@ val s2d : ... */
	let s2d = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> s2f [
	self shouldBeImplemented.
	^self specify: s2f as:'
	/*@ val s2f : ... */
	let s2f = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> s2i [
	self shouldBeImplemented.
	^self specify: s2i as:'
	/*@ val s2i : ... */
	let s2i = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> s2l [
	self shouldBeImplemented.
	^self specify: s2l as:'
	/*@ val s2l : ... */
	let s2l = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> sadd [
	self shouldBeImplemented.
	^self specify: sadd as:'
	/*@ val sadd : ... */
	let sadd = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> sand [
	self shouldBeImplemented.
	^self specify: sand as:'
	/*@ val sand : ... */
	let sand = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> sbitpermute [
	self shouldBeImplemented.
	^self specify: sbitpermute as:'
	/*@ val sbitpermute : ... */
	let sbitpermute = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> sbyteswap [
	self shouldBeImplemented.
	^self specify: sbyteswap as:'
	/*@ val sbyteswap : ... */
	let sbyteswap = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> scmp [
	self shouldBeImplemented.
	^self specify: scmp as:'
	/*@ val scmp : ... */
	let scmp = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> scmpeq [
	self shouldBeImplemented.
	^self specify: scmpeq as:'
	/*@ val scmpeq : ... */
	let scmpeq = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> scmpge [
	self shouldBeImplemented.
	^self specify: scmpge as:'
	/*@ val scmpge : ... */
	let scmpge = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> scmpgt [
	self shouldBeImplemented.
	^self specify: scmpgt as:'
	/*@ val scmpgt : ... */
	let scmpgt = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> scmple [
	self shouldBeImplemented.
	^self specify: scmple as:'
	/*@ val scmple : ... */
	let scmple = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> scmplt [
	self shouldBeImplemented.
	^self specify: scmplt as:'
	/*@ val scmplt : ... */
	let scmplt = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> scmpne [
	self shouldBeImplemented.
	^self specify: scmpne as:'
	/*@ val scmpne : ... */
	let scmpne = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> sconst [
	self shouldBeImplemented.
	^self specify: sconst as:'
	/*@ val sconst : ... */
	let sconst = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> sdiv [
	self shouldBeImplemented.
	^self specify: sdiv as:'
	/*@ val sdiv : ... */
	let sdiv = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> sload [
	self shouldBeImplemented.
	^self specify: sload as:'
	/*@ val sload : ... */
	let sload = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> sloadi [
	self shouldBeImplemented.
	^self specify: sloadi as:'
	/*@ val sloadi : ... */
	let sloadi = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> smul [
	self shouldBeImplemented.
	^self specify: smul as:'
	/*@ val smul : ... */
	let smul = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> sneg [
	self shouldBeImplemented.
	^self specify: sneg as:'
	/*@ val sneg : ... */
	let sneg = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> sor [
	self shouldBeImplemented.
	^self specify: sor as:'
	/*@ val sor : ... */
	let sor = (...) => {
	...
	};
	'

]

{ #category : #private }
TRILSpecification >> specify: opcode [
	^self perform: (SpecificationTable at: opcode)
]

{ #category : #private }
TRILSpecification >> specify: opcode as: specification [
	| spec |
		
	spec := TRILSpecificationParser parse:	specification.
	self assert: spec expr isLet.
	self assert: spec expr decl bind id = opcode name.
	^spec
	
	"
	TRILSpecification new specify: iadd
	"
]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> spinechk [
	self shouldBeImplemented.
	^self specify: spinechk as:'
	/*@ val spinechk : ... */
	let spinechk = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> srdbar [
	self shouldBeImplemented.
	^self specify: srdbar as:'
	/*@ val srdbar : ... */
	let srdbar = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> srdbari [
	self shouldBeImplemented.
	^self specify: srdbari as:'
	/*@ val srdbari : ... */
	let srdbari = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> sregload [
	self shouldBeImplemented.
	^self specify: sregload as:'
	/*@ val sregload : ... */
	let sregload = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> sregstore [
	self shouldBeImplemented.
	^self specify: sregstore as:'
	/*@ val sregstore : ... */
	let sregstore = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> srem [
	self shouldBeImplemented.
	^self specify: srem as:'
	/*@ val srem : ... */
	let srem = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> sselect [
	self shouldBeImplemented.
	^self specify: sselect as:'
	/*@ val sselect : ... */
	let sselect = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> sshl [
	self shouldBeImplemented.
	^self specify: sshl as:'
	/*@ val sshl : ... */
	let sshl = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> sshr [
	self shouldBeImplemented.
	^self specify: sshr as:'
	/*@ val sshr : ... */
	let sshr = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> sstore [
	self shouldBeImplemented.
	^self specify: sstore as:'
	/*@ val sstore : ... */
	let sstore = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> sstorei [
	self shouldBeImplemented.
	^self specify: sstorei as:'
	/*@ val sstorei : ... */
	let sstorei = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> ssub [
	self shouldBeImplemented.
	^self specify: ssub as:'
	/*@ val ssub : ... */
	let ssub = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> storefence [
	self shouldBeImplemented.
	^self specify: storefence as:'
	/*@ val storefence : ... */
	let storefence = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> su2a [
	self shouldBeImplemented.
	^self specify: su2a as:'
	/*@ val su2a : ... */
	let su2a = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> su2d [
	self shouldBeImplemented.
	^self specify: su2d as:'
	/*@ val su2d : ... */
	let su2d = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> su2f [
	self shouldBeImplemented.
	^self specify: su2f as:'
	/*@ val su2f : ... */
	let su2f = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> su2i [
	self shouldBeImplemented.
	^self specify: su2i as:'
	/*@ val su2i : ... */
	let su2i = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> su2l [
	self shouldBeImplemented.
	^self specify: su2l as:'
	/*@ val su2l : ... */
	let su2l = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> sucmp [
	self shouldBeImplemented.
	^self specify: sucmp as:'
	/*@ val sucmp : ... */
	let sucmp = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> sucmpge [
	self shouldBeImplemented.
	^self specify: sucmpge as:'
	/*@ val sucmpge : ... */
	let sucmpge = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> sucmpgt [
	self shouldBeImplemented.
	^self specify: sucmpgt as:'
	/*@ val sucmpgt : ... */
	let sucmpgt = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> sucmple [
	self shouldBeImplemented.
	^self specify: sucmple as:'
	/*@ val sucmple : ... */
	let sucmple = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> sucmplt [
	self shouldBeImplemented.
	^self specify: sucmplt as:'
	/*@ val sucmplt : ... */
	let sucmplt = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> sushr [
	self shouldBeImplemented.
	^self specify: sushr as:'
	/*@ val sushr : ... */
	let sushr = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> sutest [
	self shouldBeImplemented.
	^self specify: sutest as:'
	/*@ val sutest : ... */
	let sutest = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> swrtbar [
	self shouldBeImplemented.
	^self specify: swrtbar as:'
	/*@ val swrtbar : ... */
	let swrtbar = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> swrtbari [
	self shouldBeImplemented.
	^self specify: swrtbari as:'
	/*@ val swrtbari : ... */
	let swrtbari = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> sxor [
	self shouldBeImplemented.
	^self specify: sxor as:'
	/*@ val sxor : ... */
	let sxor = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> table [
	self shouldBeImplemented.
	^self specify: table as:'
	/*@ val table : ... */
	let table = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> tabort [
	self shouldBeImplemented.
	^self specify: tabort as:'
	/*@ val tabort : ... */
	let tabort = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> tfinish [
	self shouldBeImplemented.
	^self specify: tfinish as:'
	/*@ val tfinish : ... */
	let tfinish = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> treetop [
	self shouldBeImplemented.
	^self specify: treetop as:'
	/*@ val treetop : ... */
	let treetop = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> tstart [
	self shouldBeImplemented.
	^self specify: tstart as:'
	/*@ val tstart : ... */
	let tstart = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> unsignedoverflowchk [
	self shouldBeImplemented.
	^self specify: unsignedoverflowchk as:'
	/*@ val unsignedoverflowchk : ... */
	let unsignedoverflowchk = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> variablenew [
	self shouldBeImplemented.
	^self specify: variablenew as:'
	/*@ val variablenew : ... */
	let variablenew = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> variablenewarray [
	self shouldBeImplemented.
	^self specify: variablenewarray as:'
	/*@ val variablenewarray : ... */
	let variablenewarray = (...) => {
	...
	};
	'

]

{ #category : #'opcodes (not yet specified)' }
TRILSpecification >> zerochk [
	self shouldBeImplemented.
	^self specify: zerochk as:'
	/*@ val zerochk : ... */
	let zerochk = (...) => {
	...
	};
	'

]
