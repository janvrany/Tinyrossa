Class {
	#name : #TRILOpcodes,
	#superclass : #SharedPool,
	#classVars : [
		'invalid',
		'aconst',
		'iconst',
		'lconst',
		'fconst',
		'dconst',
		'bconst',
		'sconst',
		'iload',
		'fload',
		'dload',
		'aload',
		'bload',
		'sload',
		'lload',
		'irdbar',
		'frdbar',
		'drdbar',
		'ardbar',
		'brdbar',
		'srdbar',
		'lrdbar',
		'iloadi',
		'floadi',
		'dloadi',
		'aloadi',
		'bloadi',
		'sloadi',
		'lloadi',
		'irdbari',
		'frdbari',
		'drdbari',
		'ardbari',
		'brdbari',
		'srdbari',
		'lrdbari',
		'istore',
		'lstore',
		'fstore',
		'dstore',
		'astore',
		'bstore',
		'sstore',
		'iwrtbar',
		'lwrtbar',
		'fwrtbar',
		'dwrtbar',
		'awrtbar',
		'bwrtbar',
		'swrtbar',
		'lstorei',
		'fstorei',
		'dstorei',
		'astorei',
		'bstorei',
		'sstorei',
		'istorei',
		'lwrtbari',
		'fwrtbari',
		'dwrtbari',
		'awrtbari',
		'bwrtbari',
		'swrtbari',
		'iwrtbari',
		'goto',
		'ireturn',
		'lreturn',
		'freturn',
		'dreturn',
		'areturn',
		'return',
		'asynccheck',
		'athrow',
		'icall',
		'lcall',
		'fcall',
		'dcall',
		'acall',
		'call',
		'iadd',
		'ladd',
		'fadd',
		'dadd',
		'badd',
		'sadd',
		'isub',
		'lsub',
		'fsub',
		'dsub',
		'bsub',
		'ssub',
		'asub',
		'imul',
		'lmul',
		'fmul',
		'dmul',
		'bmul',
		'smul',
		'idiv',
		'ldiv',
		'fdiv',
		'ddiv',
		'bdiv',
		'sdiv',
		'iudiv',
		'ludiv',
		'irem',
		'lrem',
		'frem',
		'drem',
		'brem',
		'srem',
		'iurem',
		'ineg',
		'lneg',
		'fneg',
		'dneg',
		'bneg',
		'sneg',
		'iabs',
		'labs',
		'fabs',
		'dabs',
		'ishl',
		'lshl',
		'bshl',
		'sshl',
		'ishr',
		'lshr',
		'bshr',
		'sshr',
		'iushr',
		'lushr',
		'bushr',
		'sushr',
		'irol',
		'lrol',
		'iand',
		'land',
		'band',
		'sand',
		'ior',
		'lor',
		'bor',
		'sor',
		'ixor',
		'lxor',
		'bxor',
		'sxor',
		'i2l',
		'i2f',
		'i2d',
		'i2b',
		'i2s',
		'i2a',
		'iu2l',
		'iu2f',
		'iu2d',
		'iu2a',
		'l2i',
		'l2f',
		'l2d',
		'l2b',
		'l2s',
		'l2a',
		'lu2f',
		'lu2d',
		'lu2a',
		'f2i',
		'f2l',
		'f2d',
		'f2b',
		'f2s',
		'd2i',
		'd2l',
		'd2f',
		'd2b',
		'd2s',
		'b2i',
		'b2l',
		'b2f',
		'b2d',
		'b2s',
		'b2a',
		'bu2i',
		'bu2l',
		'bu2f',
		'bu2d',
		'bu2s',
		'bu2a',
		's2i',
		's2l',
		's2f',
		's2d',
		's2b',
		's2a',
		'su2i',
		'su2l',
		'su2f',
		'su2d',
		'su2a',
		'a2i',
		'a2l',
		'a2b',
		'a2s',
		'icmpeq',
		'icmpne',
		'icmplt',
		'icmpge',
		'icmpgt',
		'icmple',
		'iucmplt',
		'iucmpge',
		'iucmpgt',
		'iucmple',
		'lcmpeq',
		'lcmpne',
		'lcmplt',
		'lcmpge',
		'lcmpgt',
		'lcmple',
		'lucmplt',
		'lucmpge',
		'lucmpgt',
		'lucmple',
		'fcmpeq',
		'fcmpne',
		'fcmplt',
		'fcmpge',
		'fcmpgt',
		'fcmple',
		'fcmpequ',
		'fcmpneu',
		'fcmpltu',
		'fcmpgeu',
		'fcmpgtu',
		'fcmpleu',
		'dcmpeq',
		'dcmpne',
		'dcmplt',
		'dcmpge',
		'dcmpgt',
		'dcmple',
		'dcmpequ',
		'dcmpneu',
		'dcmpltu',
		'dcmpgeu',
		'dcmpgtu',
		'dcmpleu',
		'acmpeq',
		'acmpne',
		'acmplt',
		'acmpge',
		'acmpgt',
		'acmple',
		'bcmpeq',
		'bcmpne',
		'bcmplt',
		'bcmpge',
		'bcmpgt',
		'bcmple',
		'bucmplt',
		'bucmpge',
		'bucmpgt',
		'bucmple',
		'scmpeq',
		'scmpne',
		'scmplt',
		'scmpge',
		'scmpgt',
		'scmple',
		'sucmplt',
		'sucmpge',
		'sucmpgt',
		'sucmple',
		'lcmp',
		'fcmpl',
		'fcmpg',
		'dcmpl',
		'dcmpg',
		'ificmpeq',
		'ificmpne',
		'ificmplt',
		'ificmpge',
		'ificmpgt',
		'ificmple',
		'ifiucmplt',
		'ifiucmpge',
		'ifiucmpgt',
		'ifiucmple',
		'iflcmpeq',
		'iflcmpne',
		'iflcmplt',
		'iflcmpge',
		'iflcmpgt',
		'iflcmple',
		'iflucmplt',
		'iflucmpge',
		'iflucmpgt',
		'iflucmple',
		'iffcmpeq',
		'iffcmpne',
		'iffcmplt',
		'iffcmpge',
		'iffcmpgt',
		'iffcmple',
		'iffcmpequ',
		'iffcmpneu',
		'iffcmpltu',
		'iffcmpgeu',
		'iffcmpgtu',
		'iffcmpleu',
		'ifdcmpeq',
		'ifdcmpne',
		'ifdcmplt',
		'ifdcmpge',
		'ifdcmpgt',
		'ifdcmple',
		'ifdcmpequ',
		'ifdcmpneu',
		'ifdcmpltu',
		'ifdcmpgeu',
		'ifdcmpgtu',
		'ifdcmpleu',
		'ifacmpeq',
		'ifacmpne',
		'ifacmplt',
		'ifacmpge',
		'ifacmpgt',
		'ifacmple',
		'ifbcmpeq',
		'ifbcmpne',
		'ifbcmplt',
		'ifbcmpge',
		'ifbcmpgt',
		'ifbcmple',
		'ifbucmplt',
		'ifbucmpge',
		'ifbucmpgt',
		'ifbucmple',
		'ifscmpeq',
		'ifscmpne',
		'ifscmplt',
		'ifscmpge',
		'ifscmpgt',
		'ifscmple',
		'ifsucmplt',
		'ifsucmpge',
		'ifsucmpgt',
		'ifsucmple',
		'loadaddr',
		'zerochk',
		'iregload',
		'aregload',
		'lregload',
		'fregload',
		'dregload',
		'sregload',
		'bregload',
		'iregstore',
		'aregstore',
		'lregstore',
		'fregstore',
		'dregstore',
		'sregstore',
		'bregstore',
		'glregdeps',
		'iselect',
		'lselect',
		'bselect',
		'sselect',
		'aselect',
		'fselect',
		'dselect',
		'treetop',
		'methodenterhook',
		'methodexithook',
		'passthrough',
		'compressedrefs',
		'bbstart',
		'bbend',
		'f2iu',
		'f2lu',
		'f2bu',
		'f2c',
		'd2iu',
		'd2lu',
		'd2bu',
		'd2c',
		'monent',
		'monexit',
		'monexitfence',
		'tstart',
		'tfinish',
		'tabort',
		'instanceof',
		'checkcast',
		'checkcastandnullchk',
		'new',
		'newvalue',
		'newarray',
		'anewarray',
		'variablenew',
		'variablenewarray',
		'multianewarray',
		'arraylength',
		'contigarraylength',
		'discontigarraylength',
		'icalli',
		'lcalli',
		'fcalli',
		'dcalli',
		'acalli',
		'calli',
		'fence',
		'luaddh',
		'aiadd',
		'aladd',
		'lusubh',
		'imulh',
		'iumulh',
		'lmulh',
		'lumulh',
		'ibits2f',
		'fbits2i',
		'lbits2d',
		'dbits2l',
		'lookup',
		'case',
		'table',
		'exceptionrangefence',
		'nullchk',
		'resolvechk',
		'resolveandnullchk',
		'divchk',
		'overflowchk',
		'unsignedoverflowchk',
		'bndchk',
		'arraycopybndchk',
		'bndchkwithspinechk',
		'spinechk',
		'arraystorechk',
		'arraychk',
		'arraycopy',
		'arrayset',
		'arraytranslate',
		'arraytranslateandtest',
		'long2string',
		'bitopmem',
		'arraycmp',
		'allocationfence',
		'loadfence',
		'storefence',
		'fullfence',
		'computecc',
		'butest',
		'sutest',
		'bucmp',
		'bcmp',
		'sucmp',
		'scmp',
		'iucmp',
		'icmp',
		'lucmp',
		'ificmpo',
		'ificmpno',
		'iflcmpo',
		'iflcmpno',
		'ificmno',
		'ificmnno',
		'iflcmno',
		'iflcmnno',
		'iuaddc',
		'luaddc',
		'iusubb',
		'lusubb',
		'icmpset',
		'lcmpset',
		'bztestnset',
		'ibatomicor',
		'isatomicor',
		'iiatomicor',
		'ilatomicor',
		'branch',
		'igoto',
		'fsqrt',
		'dsqrt',
		'dfloor',
		'ffloor',
		'dceil',
		'fceil',
		'imax',
		'iumax',
		'lmax',
		'lumax',
		'fmax',
		'dmax',
		'imin',
		'iumin',
		'lmin',
		'lumin',
		'fmin',
		'dmin',
		'ihbit',
		'ilbit',
		'inolz',
		'inotz',
		'ipopcnt',
		'lhbit',
		'llbit',
		'lnolz',
		'lnotz',
		'lpopcnt',
		'sbyteswap',
		'ibyteswap',
		'lbyteswap',
		'bbitpermute',
		'sbitpermute',
		'ibitpermute',
		'lbitpermute',
		'prefetch'
	],
	#pools : [
		'TRDataTypes',
		'TRILOpcodeProps1',
		'TRILOpcodeProps2',
		'TRILOpcodeProps3'
	],
	#category : #'Tinyrossa-IL'
}

{ #category : #accessing }
TRILOpcodes class >> all [
	"Return all available TRIL opcodes"

	^ self classVarNames collect: [ :name | self classVarAt: name ]

	"
	TRILOpcodes all
	"
]

{ #category : #initialization }
TRILOpcodes class >> initialize [
	"Automatically generated by opcodesgen. DO NOT EDIT!"

	| unspecifiedChildType  |

	unspecifiedChildType := TRDataTypeUnspecified new.

	"The real initialization is split over multiple methods so
	 they fit into Opensmalltalk VM limits for number of literals
	 and so on. Sigh."
	self initialize00: unspecifiedChildType.
	self initialize01: unspecifiedChildType.
	self initialize02: unspecifiedChildType.
	self initialize03: unspecifiedChildType.
	self initialize04: unspecifiedChildType.
	self initialize05: unspecifiedChildType.
	self initialize06: unspecifiedChildType.
	self initialize07: unspecifiedChildType.
	self initialize08a: unspecifiedChildType.
	self initialize08b: unspecifiedChildType.
	self initialize09a: unspecifiedChildType.
	self initialize09b: unspecifiedChildType.
	self initialize10a: unspecifiedChildType.
	self initialize10b: unspecifiedChildType.
	self initialize11: unspecifiedChildType.
]

{ #category : #initialization }
TRILOpcodes class >> initialize00: UnspecifiedChildType [
	"Automatically generated by opcodesgen. DO NOT EDIT!"

	| NoType NoChildren Unspecified"Children" IndirectCallType BadILOp |

	NoType := Void.
	NoChildren := #().
	Unspecified"Children" := nil.
	IndirectCallType := Unspecified"Children".
	BadILOp := invalid.


	"000" invalid := TRILOpcode new.







	"001" aconst := TRILOpcode new.
	"002" iconst := TRILOpcode new.
	"003" lconst := TRILOpcode new.
	"004" fconst := TRILOpcode new.
	"005" dconst := TRILOpcode new.
	"006" bconst := TRILOpcode new.
	"007" sconst := TRILOpcode new.
	"008" iload := TRILOpcode new.
	"009" fload := TRILOpcode new.
	"010" dload := TRILOpcode new.
	"011" aload := TRILOpcode new.
	"012" bload := TRILOpcode new.
	"013" sload := TRILOpcode new.
	"014" lload := TRILOpcode new.
	"015" irdbar := TRILOpcode new.
	"016" frdbar := TRILOpcode new.
	"017" drdbar := TRILOpcode new.
	"018" ardbar := TRILOpcode new.
	"019" brdbar := TRILOpcode new.
	"020" srdbar := TRILOpcode new.
	"021" lrdbar := TRILOpcode new.
	"022" iloadi := TRILOpcode new.
	"023" floadi := TRILOpcode new.
	"024" dloadi := TRILOpcode new.
	"025" aloadi := TRILOpcode new.
	"026" bloadi := TRILOpcode new.
	"027" sloadi := TRILOpcode new.
	"028" lloadi := TRILOpcode new.
	"029" irdbari := TRILOpcode new.
	"030" frdbari := TRILOpcode new.
	"031" drdbari := TRILOpcode new.
	"032" ardbari := TRILOpcode new.
	"033" brdbari := TRILOpcode new.
	"034" srdbari := TRILOpcode new.
	"035" lrdbari := TRILOpcode new.
	"036" istore := TRILOpcode new.
	"037" lstore := TRILOpcode new.
	"038" fstore := TRILOpcode new.
	"039" dstore := TRILOpcode new.
	"040" astore := TRILOpcode new.
	"041" bstore := TRILOpcode new.
	"042" sstore := TRILOpcode new.
	"043" iwrtbar := TRILOpcode new.
	"044" lwrtbar := TRILOpcode new.
	"045" fwrtbar := TRILOpcode new.
	"046" dwrtbar := TRILOpcode new.
	"047" awrtbar := TRILOpcode new.
	"048" bwrtbar := TRILOpcode new.
	"049" swrtbar := TRILOpcode new.
	"050" lstorei := TRILOpcode new.
	"051" fstorei := TRILOpcode new.
	"052" dstorei := TRILOpcode new.
	"053" astorei := TRILOpcode new.
	"054" bstorei := TRILOpcode new.
	"055" sstorei := TRILOpcode new.
	"056" istorei := TRILOpcode new.
	"057" lwrtbari := TRILOpcode new.
	"058" fwrtbari := TRILOpcode new.
	"059" dwrtbari := TRILOpcode new.
	"060" awrtbari := TRILOpcode new.
	"061" bwrtbari := TRILOpcode new.
	"062" swrtbari := TRILOpcode new.
	"063" iwrtbari := TRILOpcode new.
	"064" goto := TRILOpcode new.
	"065" ireturn := TRILOpcode new.
	"066" lreturn := TRILOpcode new.
	"067" freturn := TRILOpcode new.
	"068" dreturn := TRILOpcode new.
	"069" areturn := TRILOpcode new.
	"070" return := TRILOpcode new.
	"071" asynccheck := TRILOpcode new.
	"072" athrow := TRILOpcode new.
	"073" icall := TRILOpcode new.
	"074" lcall := TRILOpcode new.
	"075" fcall := TRILOpcode new.
	"076" dcall := TRILOpcode new.
	"077" acall := TRILOpcode new.
	"078" call := TRILOpcode new.
	"079" iadd := TRILOpcode new.
	"080" ladd := TRILOpcode new.
	"081" fadd := TRILOpcode new.
	"082" dadd := TRILOpcode new.
	"083" badd := TRILOpcode new.
	"084" sadd := TRILOpcode new.
	"085" isub := TRILOpcode new.
	"086" lsub := TRILOpcode new.
	"087" fsub := TRILOpcode new.
	"088" dsub := TRILOpcode new.
	"089" bsub := TRILOpcode new.
	"090" ssub := TRILOpcode new.
	"091" asub := TRILOpcode new.
	"092" imul := TRILOpcode new.
	"093" lmul := TRILOpcode new.
	"094" fmul := TRILOpcode new.
	"095" dmul := TRILOpcode new.
	"096" bmul := TRILOpcode new.
	"097" smul := TRILOpcode new.
	"098" idiv := TRILOpcode new.
	"099" ldiv := TRILOpcode new.
]

{ #category : #initialization }
TRILOpcodes class >> initialize01: UnspecifiedChildType [
	"Automatically generated by opcodesgen. DO NOT EDIT!"

	| NoType NoChildren Unspecified"Children" IndirectCallType BadILOp |

	NoType := Void.
	NoChildren := #().
	Unspecified"Children" := nil.
	IndirectCallType := Unspecified"Children".
	BadILOp := invalid.












































































































	"100" fdiv := TRILOpcode new.
	"101" ddiv := TRILOpcode new.
	"102" bdiv := TRILOpcode new.
	"103" sdiv := TRILOpcode new.
	"104" iudiv := TRILOpcode new.
	"105" ludiv := TRILOpcode new.
	"106" irem := TRILOpcode new.
	"107" lrem := TRILOpcode new.
	"108" frem := TRILOpcode new.
	"109" drem := TRILOpcode new.
	"110" brem := TRILOpcode new.
	"111" srem := TRILOpcode new.
	"112" iurem := TRILOpcode new.
	"113" ineg := TRILOpcode new.
	"114" lneg := TRILOpcode new.
	"115" fneg := TRILOpcode new.
	"116" dneg := TRILOpcode new.
	"117" bneg := TRILOpcode new.
	"118" sneg := TRILOpcode new.
	"119" iabs := TRILOpcode new.
	"120" labs := TRILOpcode new.
	"121" fabs := TRILOpcode new.
	"122" dabs := TRILOpcode new.
	"123" ishl := TRILOpcode new.
	"124" lshl := TRILOpcode new.
	"125" bshl := TRILOpcode new.
	"126" sshl := TRILOpcode new.
	"127" ishr := TRILOpcode new.
	"128" lshr := TRILOpcode new.
	"129" bshr := TRILOpcode new.
	"130" sshr := TRILOpcode new.
	"131" iushr := TRILOpcode new.
	"132" lushr := TRILOpcode new.
	"133" bushr := TRILOpcode new.
	"134" sushr := TRILOpcode new.
	"135" irol := TRILOpcode new.
	"136" lrol := TRILOpcode new.
	"137" iand := TRILOpcode new.
	"138" land := TRILOpcode new.
	"139" band := TRILOpcode new.
	"140" sand := TRILOpcode new.
	"141" ior := TRILOpcode new.
	"142" lor := TRILOpcode new.
	"143" bor := TRILOpcode new.
	"144" sor := TRILOpcode new.
	"145" ixor := TRILOpcode new.
	"146" lxor := TRILOpcode new.
	"147" bxor := TRILOpcode new.
	"148" sxor := TRILOpcode new.
	"149" i2l := TRILOpcode new.
	"150" i2f := TRILOpcode new.
	"151" i2d := TRILOpcode new.
	"152" i2b := TRILOpcode new.
	"153" i2s := TRILOpcode new.
	"154" i2a := TRILOpcode new.
	"155" iu2l := TRILOpcode new.
	"156" iu2f := TRILOpcode new.
	"157" iu2d := TRILOpcode new.
	"158" iu2a := TRILOpcode new.
	"159" l2i := TRILOpcode new.
	"160" l2f := TRILOpcode new.
	"161" l2d := TRILOpcode new.
	"162" l2b := TRILOpcode new.
	"163" l2s := TRILOpcode new.
	"164" l2a := TRILOpcode new.
	"165" lu2f := TRILOpcode new.
	"166" lu2d := TRILOpcode new.
	"167" lu2a := TRILOpcode new.
	"168" f2i := TRILOpcode new.
	"169" f2l := TRILOpcode new.
	"170" f2d := TRILOpcode new.
	"171" f2b := TRILOpcode new.
	"172" f2s := TRILOpcode new.
	"173" d2i := TRILOpcode new.
	"174" d2l := TRILOpcode new.
	"175" d2f := TRILOpcode new.
	"176" d2b := TRILOpcode new.
	"177" d2s := TRILOpcode new.
	"178" b2i := TRILOpcode new.
	"179" b2l := TRILOpcode new.
	"180" b2f := TRILOpcode new.
	"181" b2d := TRILOpcode new.
	"182" b2s := TRILOpcode new.
	"183" b2a := TRILOpcode new.
	"184" bu2i := TRILOpcode new.
	"185" bu2l := TRILOpcode new.
	"186" bu2f := TRILOpcode new.
	"187" bu2d := TRILOpcode new.
	"188" bu2s := TRILOpcode new.
	"189" bu2a := TRILOpcode new.
	"190" s2i := TRILOpcode new.
	"191" s2l := TRILOpcode new.
	"192" s2f := TRILOpcode new.
	"193" s2d := TRILOpcode new.
	"194" s2b := TRILOpcode new.
	"195" s2a := TRILOpcode new.
	"196" su2i := TRILOpcode new.
	"197" su2l := TRILOpcode new.
	"198" su2f := TRILOpcode new.
	"199" su2d := TRILOpcode new.
]

{ #category : #initialization }
TRILOpcodes class >> initialize02: UnspecifiedChildType [
	"Automatically generated by opcodesgen. DO NOT EDIT!"

	| NoType NoChildren Unspecified"Children" IndirectCallType BadILOp |

	NoType := Void.
	NoChildren := #().
	Unspecified"Children" := nil.
	IndirectCallType := Unspecified"Children".
	BadILOp := invalid.
















































































































































































































	"200" su2a := TRILOpcode new.
	"201" a2i := TRILOpcode new.
	"202" a2l := TRILOpcode new.
	"203" a2b := TRILOpcode new.
	"204" a2s := TRILOpcode new.
	"205" icmpeq := TRILOpcode new.
	"206" icmpne := TRILOpcode new.
	"207" icmplt := TRILOpcode new.
	"208" icmpge := TRILOpcode new.
	"209" icmpgt := TRILOpcode new.
	"210" icmple := TRILOpcode new.
	"211" iucmplt := TRILOpcode new.
	"212" iucmpge := TRILOpcode new.
	"213" iucmpgt := TRILOpcode new.
	"214" iucmple := TRILOpcode new.
	"215" lcmpeq := TRILOpcode new.
	"216" lcmpne := TRILOpcode new.
	"217" lcmplt := TRILOpcode new.
	"218" lcmpge := TRILOpcode new.
	"219" lcmpgt := TRILOpcode new.
	"220" lcmple := TRILOpcode new.
	"221" lucmplt := TRILOpcode new.
	"222" lucmpge := TRILOpcode new.
	"223" lucmpgt := TRILOpcode new.
	"224" lucmple := TRILOpcode new.
	"225" fcmpeq := TRILOpcode new.
	"226" fcmpne := TRILOpcode new.
	"227" fcmplt := TRILOpcode new.
	"228" fcmpge := TRILOpcode new.
	"229" fcmpgt := TRILOpcode new.
	"230" fcmple := TRILOpcode new.
	"231" fcmpequ := TRILOpcode new.
	"232" fcmpneu := TRILOpcode new.
	"233" fcmpltu := TRILOpcode new.
	"234" fcmpgeu := TRILOpcode new.
	"235" fcmpgtu := TRILOpcode new.
	"236" fcmpleu := TRILOpcode new.
	"237" dcmpeq := TRILOpcode new.
	"238" dcmpne := TRILOpcode new.
	"239" dcmplt := TRILOpcode new.
	"240" dcmpge := TRILOpcode new.
	"241" dcmpgt := TRILOpcode new.
	"242" dcmple := TRILOpcode new.
	"243" dcmpequ := TRILOpcode new.
	"244" dcmpneu := TRILOpcode new.
	"245" dcmpltu := TRILOpcode new.
	"246" dcmpgeu := TRILOpcode new.
	"247" dcmpgtu := TRILOpcode new.
	"248" dcmpleu := TRILOpcode new.
	"249" acmpeq := TRILOpcode new.
	"250" acmpne := TRILOpcode new.
	"251" acmplt := TRILOpcode new.
	"252" acmpge := TRILOpcode new.
	"253" acmpgt := TRILOpcode new.
	"254" acmple := TRILOpcode new.
	"255" bcmpeq := TRILOpcode new.
	"256" bcmpne := TRILOpcode new.
	"257" bcmplt := TRILOpcode new.
	"258" bcmpge := TRILOpcode new.
	"259" bcmpgt := TRILOpcode new.
	"260" bcmple := TRILOpcode new.
	"261" bucmplt := TRILOpcode new.
	"262" bucmpge := TRILOpcode new.
	"263" bucmpgt := TRILOpcode new.
	"264" bucmple := TRILOpcode new.
	"265" scmpeq := TRILOpcode new.
	"266" scmpne := TRILOpcode new.
	"267" scmplt := TRILOpcode new.
	"268" scmpge := TRILOpcode new.
	"269" scmpgt := TRILOpcode new.
	"270" scmple := TRILOpcode new.
	"271" sucmplt := TRILOpcode new.
	"272" sucmpge := TRILOpcode new.
	"273" sucmpgt := TRILOpcode new.
	"274" sucmple := TRILOpcode new.
	"275" lcmp := TRILOpcode new.
	"276" fcmpl := TRILOpcode new.
	"277" fcmpg := TRILOpcode new.
	"278" dcmpl := TRILOpcode new.
	"279" dcmpg := TRILOpcode new.
	"280" ificmpeq := TRILOpcode new.
	"281" ificmpne := TRILOpcode new.
	"282" ificmplt := TRILOpcode new.
	"283" ificmpge := TRILOpcode new.
	"284" ificmpgt := TRILOpcode new.
	"285" ificmple := TRILOpcode new.
	"286" ifiucmplt := TRILOpcode new.
	"287" ifiucmpge := TRILOpcode new.
	"288" ifiucmpgt := TRILOpcode new.
	"289" ifiucmple := TRILOpcode new.
	"290" iflcmpeq := TRILOpcode new.
	"291" iflcmpne := TRILOpcode new.
	"292" iflcmplt := TRILOpcode new.
	"293" iflcmpge := TRILOpcode new.
	"294" iflcmpgt := TRILOpcode new.
	"295" iflcmple := TRILOpcode new.
	"296" iflucmplt := TRILOpcode new.
	"297" iflucmpge := TRILOpcode new.
	"298" iflucmpgt := TRILOpcode new.
	"299" iflucmple := TRILOpcode new.
]

{ #category : #initialization }
TRILOpcodes class >> initialize03: UnspecifiedChildType [
	"Automatically generated by opcodesgen. DO NOT EDIT!"

	| NoType NoChildren Unspecified"Children" IndirectCallType BadILOp |

	NoType := Void.
	NoChildren := #().
	Unspecified"Children" := nil.
	IndirectCallType := Unspecified"Children".
	BadILOp := invalid.




















































































































































































































































































































	"300" iffcmpeq := TRILOpcode new.
	"301" iffcmpne := TRILOpcode new.
	"302" iffcmplt := TRILOpcode new.
	"303" iffcmpge := TRILOpcode new.
	"304" iffcmpgt := TRILOpcode new.
	"305" iffcmple := TRILOpcode new.
	"306" iffcmpequ := TRILOpcode new.
	"307" iffcmpneu := TRILOpcode new.
	"308" iffcmpltu := TRILOpcode new.
	"309" iffcmpgeu := TRILOpcode new.
	"310" iffcmpgtu := TRILOpcode new.
	"311" iffcmpleu := TRILOpcode new.
	"312" ifdcmpeq := TRILOpcode new.
	"313" ifdcmpne := TRILOpcode new.
	"314" ifdcmplt := TRILOpcode new.
	"315" ifdcmpge := TRILOpcode new.
	"316" ifdcmpgt := TRILOpcode new.
	"317" ifdcmple := TRILOpcode new.
	"318" ifdcmpequ := TRILOpcode new.
	"319" ifdcmpneu := TRILOpcode new.
	"320" ifdcmpltu := TRILOpcode new.
	"321" ifdcmpgeu := TRILOpcode new.
	"322" ifdcmpgtu := TRILOpcode new.
	"323" ifdcmpleu := TRILOpcode new.
	"324" ifacmpeq := TRILOpcode new.
	"325" ifacmpne := TRILOpcode new.
	"326" ifacmplt := TRILOpcode new.
	"327" ifacmpge := TRILOpcode new.
	"328" ifacmpgt := TRILOpcode new.
	"329" ifacmple := TRILOpcode new.
	"330" ifbcmpeq := TRILOpcode new.
	"331" ifbcmpne := TRILOpcode new.
	"332" ifbcmplt := TRILOpcode new.
	"333" ifbcmpge := TRILOpcode new.
	"334" ifbcmpgt := TRILOpcode new.
	"335" ifbcmple := TRILOpcode new.
	"336" ifbucmplt := TRILOpcode new.
	"337" ifbucmpge := TRILOpcode new.
	"338" ifbucmpgt := TRILOpcode new.
	"339" ifbucmple := TRILOpcode new.
	"340" ifscmpeq := TRILOpcode new.
	"341" ifscmpne := TRILOpcode new.
	"342" ifscmplt := TRILOpcode new.
	"343" ifscmpge := TRILOpcode new.
	"344" ifscmpgt := TRILOpcode new.
	"345" ifscmple := TRILOpcode new.
	"346" ifsucmplt := TRILOpcode new.
	"347" ifsucmpge := TRILOpcode new.
	"348" ifsucmpgt := TRILOpcode new.
	"349" ifsucmple := TRILOpcode new.
	"350" loadaddr := TRILOpcode new.
	"351" zerochk := TRILOpcode new.
	"352" iregload := TRILOpcode new.
	"353" aregload := TRILOpcode new.
	"354" lregload := TRILOpcode new.
	"355" fregload := TRILOpcode new.
	"356" dregload := TRILOpcode new.
	"357" sregload := TRILOpcode new.
	"358" bregload := TRILOpcode new.
	"359" iregstore := TRILOpcode new.
	"360" aregstore := TRILOpcode new.
	"361" lregstore := TRILOpcode new.
	"362" fregstore := TRILOpcode new.
	"363" dregstore := TRILOpcode new.
	"364" sregstore := TRILOpcode new.
	"365" bregstore := TRILOpcode new.
	"366" glregdeps := TRILOpcode new.
	"367" iselect := TRILOpcode new.
	"368" lselect := TRILOpcode new.
	"369" bselect := TRILOpcode new.
	"370" sselect := TRILOpcode new.
	"371" aselect := TRILOpcode new.
	"372" fselect := TRILOpcode new.
	"373" dselect := TRILOpcode new.
	"374" treetop := TRILOpcode new.
	"375" methodenterhook := TRILOpcode new.
	"376" methodexithook := TRILOpcode new.
	"377" passthrough := TRILOpcode new.
	"378" compressedrefs := TRILOpcode new.
	"379" bbstart := TRILOpcode new.
	"380" bbend := TRILOpcode new.
	"381" f2iu := TRILOpcode new.
	"382" f2lu := TRILOpcode new.
	"383" f2bu := TRILOpcode new.
	"384" f2c := TRILOpcode new.
	"385" d2iu := TRILOpcode new.
	"386" d2lu := TRILOpcode new.
	"387" d2bu := TRILOpcode new.
	"388" d2c := TRILOpcode new.
	"389" monent := TRILOpcode new.
	"390" monexit := TRILOpcode new.
	"391" monexitfence := TRILOpcode new.
	"392" tstart := TRILOpcode new.
	"393" tfinish := TRILOpcode new.
	"394" tabort := TRILOpcode new.
	"395" instanceof := TRILOpcode new.
	"396" checkcast := TRILOpcode new.
	"397" checkcastandnullchk := TRILOpcode new.
	"398" new := TRILOpcode new.
	"399" newvalue := TRILOpcode new.
]

{ #category : #initialization }
TRILOpcodes class >> initialize04: UnspecifiedChildType [
	"Automatically generated by opcodesgen. DO NOT EDIT!"

	| NoType NoChildren Unspecified"Children" IndirectCallType BadILOp |

	NoType := Void.
	NoChildren := #().
	Unspecified"Children" := nil.
	IndirectCallType := Unspecified"Children".
	BadILOp := invalid.
























































































































































































































































































































































































































	"400" newarray := TRILOpcode new.
	"401" anewarray := TRILOpcode new.
	"402" variablenew := TRILOpcode new.
	"403" variablenewarray := TRILOpcode new.
	"404" multianewarray := TRILOpcode new.
	"405" arraylength := TRILOpcode new.
	"406" contigarraylength := TRILOpcode new.
	"407" discontigarraylength := TRILOpcode new.
	"408" icalli := TRILOpcode new.
	"409" lcalli := TRILOpcode new.
	"410" fcalli := TRILOpcode new.
	"411" dcalli := TRILOpcode new.
	"412" acalli := TRILOpcode new.
	"413" calli := TRILOpcode new.
	"414" fence := TRILOpcode new.
	"415" luaddh := TRILOpcode new.
	"416" aiadd := TRILOpcode new.
	"417" aladd := TRILOpcode new.
	"418" lusubh := TRILOpcode new.
	"419" imulh := TRILOpcode new.
	"420" iumulh := TRILOpcode new.
	"421" lmulh := TRILOpcode new.
	"422" lumulh := TRILOpcode new.
	"423" ibits2f := TRILOpcode new.
	"424" fbits2i := TRILOpcode new.
	"425" lbits2d := TRILOpcode new.
	"426" dbits2l := TRILOpcode new.
	"427" lookup := TRILOpcode new.
	"428" case := TRILOpcode new.
	"429" table := TRILOpcode new.
	"430" exceptionrangefence := TRILOpcode new.
	"431" nullchk := TRILOpcode new.
	"432" resolvechk := TRILOpcode new.
	"433" resolveandnullchk := TRILOpcode new.
	"434" divchk := TRILOpcode new.
	"435" overflowchk := TRILOpcode new.
	"436" unsignedoverflowchk := TRILOpcode new.
	"437" bndchk := TRILOpcode new.
	"438" arraycopybndchk := TRILOpcode new.
	"439" bndchkwithspinechk := TRILOpcode new.
	"440" spinechk := TRILOpcode new.
	"441" arraystorechk := TRILOpcode new.
	"442" arraychk := TRILOpcode new.
	"443" arraycopy := TRILOpcode new.
	"444" arrayset := TRILOpcode new.
	"445" arraytranslate := TRILOpcode new.
	"446" arraytranslateandtest := TRILOpcode new.
	"447" long2string := TRILOpcode new.
	"448" bitopmem := TRILOpcode new.
	"449" arraycmp := TRILOpcode new.
	"450" allocationfence := TRILOpcode new.
	"451" loadfence := TRILOpcode new.
	"452" storefence := TRILOpcode new.
	"453" fullfence := TRILOpcode new.
	"454" computecc := TRILOpcode new.
	"455" butest := TRILOpcode new.
	"456" sutest := TRILOpcode new.
	"457" bucmp := TRILOpcode new.
	"458" bcmp := TRILOpcode new.
	"459" sucmp := TRILOpcode new.
	"460" scmp := TRILOpcode new.
	"461" iucmp := TRILOpcode new.
	"462" icmp := TRILOpcode new.
	"463" lucmp := TRILOpcode new.
	"464" ificmpo := TRILOpcode new.
	"465" ificmpno := TRILOpcode new.
	"466" iflcmpo := TRILOpcode new.
	"467" iflcmpno := TRILOpcode new.
	"468" ificmno := TRILOpcode new.
	"469" ificmnno := TRILOpcode new.
	"470" iflcmno := TRILOpcode new.
	"471" iflcmnno := TRILOpcode new.
	"472" iuaddc := TRILOpcode new.
	"473" luaddc := TRILOpcode new.
	"474" iusubb := TRILOpcode new.
	"475" lusubb := TRILOpcode new.
	"476" icmpset := TRILOpcode new.
	"477" lcmpset := TRILOpcode new.
	"478" bztestnset := TRILOpcode new.
	"479" ibatomicor := TRILOpcode new.
	"480" isatomicor := TRILOpcode new.
	"481" iiatomicor := TRILOpcode new.
	"482" ilatomicor := TRILOpcode new.
	"483" branch := TRILOpcode new.
	"484" igoto := TRILOpcode new.
	"485" fsqrt := TRILOpcode new.
	"486" dsqrt := TRILOpcode new.
	"487" dfloor := TRILOpcode new.
	"488" ffloor := TRILOpcode new.
	"489" dceil := TRILOpcode new.
	"490" fceil := TRILOpcode new.
	"491" imax := TRILOpcode new.
	"492" iumax := TRILOpcode new.
	"493" lmax := TRILOpcode new.
	"494" lumax := TRILOpcode new.
	"495" fmax := TRILOpcode new.
	"496" dmax := TRILOpcode new.
	"497" imin := TRILOpcode new.
	"498" iumin := TRILOpcode new.
	"499" lmin := TRILOpcode new.
]

{ #category : #initialization }
TRILOpcodes class >> initialize05: UnspecifiedChildType [
	"Automatically generated by opcodesgen. DO NOT EDIT!"

	| NoType NoChildren Unspecified"Children" IndirectCallType BadILOp |

	NoType := Void.
	NoChildren := #().
	Unspecified"Children" := nil.
	IndirectCallType := Unspecified"Children".
	BadILOp := invalid.




























































































































































































































































































































































































































































































































	"500" lumin := TRILOpcode new.
	"501" fmin := TRILOpcode new.
	"502" dmin := TRILOpcode new.
	"503" ihbit := TRILOpcode new.
	"504" ilbit := TRILOpcode new.
	"505" inolz := TRILOpcode new.
	"506" inotz := TRILOpcode new.
	"507" ipopcnt := TRILOpcode new.
	"508" lhbit := TRILOpcode new.
	"509" llbit := TRILOpcode new.
	"510" lnolz := TRILOpcode new.
	"511" lnotz := TRILOpcode new.
	"512" lpopcnt := TRILOpcode new.
	"513" sbyteswap := TRILOpcode new.
	"514" ibyteswap := TRILOpcode new.
	"515" lbyteswap := TRILOpcode new.
	"516" bbitpermute := TRILOpcode new.
	"517" sbitpermute := TRILOpcode new.
	"518" ibitpermute := TRILOpcode new.
	"519" lbitpermute := TRILOpcode new.
	"520" prefetch := TRILOpcode new.
]

{ #category : #initialization }
TRILOpcodes class >> initialize06: UnspecifiedChildType [
	"Automatically generated by opcodesgen. DO NOT EDIT!"

	| NoType NoChildren Unspecified"Children" IndirectCallType BadILOp |

	NoType := Void.
	NoChildren := #().
	Unspecified"Children" := nil.
	IndirectCallType := Unspecified"Children".
	BadILOp := invalid.


	"000" invalid initializeFrom: { 'invalid' . NoType . 0 . 0 . 0 . Unspecified . BadILOp . BadILOp . BadILOp . BadILOp }.







	"001" aconst initializeFrom: { 'aconst' . Address . LoadConst . ValueNumberShare . LikeUse . NoChildren  . BadILOp . BadILOp . BadILOp . BadILOp }.
	"002" iconst initializeFrom: { 'iconst' . Int32 . LoadConst . ValueNumberShare . LikeUse . NoChildren  . BadILOp . BadILOp . BadILOp . BadILOp }.
	"003" lconst initializeFrom: { 'lconst' . Int64 . LoadConst . ValueNumberShare . LikeUse . NoChildren  . BadILOp . BadILOp . BadILOp . BadILOp }.
	"004" fconst initializeFrom: { 'fconst' . Float . LoadConst . ValueNumberShare . LikeUse . NoChildren  . BadILOp . BadILOp . BadILOp . BadILOp }.
	"005" dconst initializeFrom: { 'dconst' . Double . LoadConst . ValueNumberShare . LikeUse . NoChildren  . BadILOp . BadILOp . BadILOp . BadILOp }.
	"006" bconst initializeFrom: { 'bconst' . Int8 . LoadConst . ValueNumberShare . LikeUse . NoChildren  . BadILOp . BadILOp . BadILOp . BadILOp }.
	"007" sconst initializeFrom: { 'sconst' . Int16 . LoadConst . ValueNumberShare . LikeUse . NoChildren  . BadILOp . BadILOp . BadILOp . BadILOp }.
	"008" iload initializeFrom: { 'iload' . Int32 . LoadVar |  HasSymbolRef . ValueNumberShare |  SupportedForPRE|  MayUseSystemStack . LikeUse . NoChildren  . BadILOp . BadILOp . BadILOp . BadILOp }.
	"009" fload initializeFrom: { 'fload' . Float . LoadVar |  HasSymbolRef . ValueNumberShare |  SupportedForPRE|  MayUseSystemStack . LikeUse . NoChildren  . BadILOp . BadILOp . BadILOp . BadILOp }.
	"010" dload initializeFrom: { 'dload' . Double . LoadVar |  HasSymbolRef . ValueNumberShare |  SupportedForPRE|  MayUseSystemStack . LikeUse . NoChildren  . BadILOp . BadILOp . BadILOp . BadILOp }.
	"011" aload initializeFrom: { 'aload' . Address . LoadVar |  HasSymbolRef . ValueNumberShare |  SupportedForPRE|  MayUseSystemStack . LikeUse . NoChildren  . BadILOp . BadILOp . BadILOp . BadILOp }.
	"012" bload initializeFrom: { 'bload' . Int8 . LoadVar |  HasSymbolRef . ValueNumberShare |  SupportedForPRE|  MayUseSystemStack . LikeUse . NoChildren  . BadILOp . BadILOp . BadILOp . BadILOp }.
	"013" sload initializeFrom: { 'sload' . Int16 . LoadVar |  HasSymbolRef . ValueNumberShare |  SupportedForPRE|  MayUseSystemStack . LikeUse . NoChildren  . BadILOp . BadILOp . BadILOp . BadILOp }.
	"014" lload initializeFrom: { 'lload' . Int64 . LoadVar |  HasSymbolRef . ValueNumberShare |  SupportedForPRE|  MayUseSystemStack . LikeUse . NoChildren  . BadILOp . BadILOp . BadILOp . BadILOp }.
	"015" irdbar initializeFrom: { 'irdbar' . Int32 . LoadVar |  HasSymbolRef . ValueNumberShare |  SupportedForPRE|  MayUseSystemStack |  ReadBarrierLoad . LikeUse . { Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"016" frdbar initializeFrom: { 'frdbar' . Float . LoadVar |  HasSymbolRef . ValueNumberShare |  SupportedForPRE|  MayUseSystemStack |  ReadBarrierLoad . LikeUse . { Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"017" drdbar initializeFrom: { 'drdbar' . Double . LoadVar |  HasSymbolRef . ValueNumberShare |  SupportedForPRE|  MayUseSystemStack |  ReadBarrierLoad . LikeUse . { Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"018" ardbar initializeFrom: { 'ardbar' . Address . LoadVar |  HasSymbolRef . ValueNumberShare |  SupportedForPRE|  MayUseSystemStack |  ReadBarrierLoad . LikeUse . { Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"019" brdbar initializeFrom: { 'brdbar' . Int8 . LoadVar |  HasSymbolRef . ValueNumberShare |  SupportedForPRE|  MayUseSystemStack |  ReadBarrierLoad . LikeUse . { Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"020" srdbar initializeFrom: { 'srdbar' . Int16 . LoadVar |  HasSymbolRef . ValueNumberShare |  SupportedForPRE|  MayUseSystemStack |  ReadBarrierLoad . LikeUse . { Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"021" lrdbar initializeFrom: { 'lrdbar' . Int64 . LoadVar |  HasSymbolRef . ValueNumberShare |  SupportedForPRE|  MayUseSystemStack |  ReadBarrierLoad . LikeUse . { Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"022" iloadi initializeFrom: { 'iloadi' . Int32 . LoadVar |  Indirect |  HasSymbolRef . ValueNumberShare |  SupportedForPRE|  MayUseSystemStack . LikeUse . { Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"023" floadi initializeFrom: { 'floadi' . Float . LoadVar |  Indirect |  HasSymbolRef . ValueNumberShare |  SupportedForPRE|  MayUseSystemStack . LikeUse . { Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"024" dloadi initializeFrom: { 'dloadi' . Double . LoadVar |  Indirect |  HasSymbolRef . ValueNumberShare |  SupportedForPRE|  MayUseSystemStack . LikeUse . { Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"025" aloadi initializeFrom: { 'aloadi' . Address . LoadVar |  Indirect |  HasSymbolRef . ValueNumberShare |  SupportedForPRE|  MayUseSystemStack . LikeUse . { Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"026" bloadi initializeFrom: { 'bloadi' . Int8 . LoadVar |  Indirect |  HasSymbolRef . ValueNumberShare |  SupportedForPRE|  MayUseSystemStack . LikeUse . { Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"027" sloadi initializeFrom: { 'sloadi' . Int16 . LoadVar |  Indirect |  HasSymbolRef . ValueNumberShare |  SupportedForPRE|  MayUseSystemStack . LikeUse . { Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"028" lloadi initializeFrom: { 'lloadi' . Int64 . LoadVar |  Indirect |  HasSymbolRef . ValueNumberShare |  SupportedForPRE|  MayUseSystemStack . LikeUse . { Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"029" irdbari initializeFrom: { 'irdbari' . Int32 . LoadVar |  Indirect |  HasSymbolRef . ValueNumberShare |  SupportedForPRE|  MayUseSystemStack |  ReadBarrierLoad . LikeUse . { Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"030" frdbari initializeFrom: { 'frdbari' . Float . LoadVar |  Indirect |  HasSymbolRef . ValueNumberShare |  SupportedForPRE|  MayUseSystemStack |  ReadBarrierLoad . LikeUse . { Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"031" drdbari initializeFrom: { 'drdbari' . Double . LoadVar |  Indirect |  HasSymbolRef . ValueNumberShare |  SupportedForPRE|  MayUseSystemStack |  ReadBarrierLoad . LikeUse . { Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"032" ardbari initializeFrom: { 'ardbari' . Address . LoadVar |  Indirect |  HasSymbolRef . ValueNumberShare |  SupportedForPRE|  MayUseSystemStack |  ReadBarrierLoad . LikeUse . { Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"033" brdbari initializeFrom: { 'brdbari' . Int8 . LoadVar |  Indirect |  HasSymbolRef . ValueNumberShare |  SupportedForPRE|  MayUseSystemStack |  ReadBarrierLoad . LikeUse . { Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"034" srdbari initializeFrom: { 'srdbari' . Int16 . LoadVar |  Indirect |  HasSymbolRef . ValueNumberShare |  SupportedForPRE|  MayUseSystemStack |  ReadBarrierLoad . LikeUse . { Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"035" lrdbari initializeFrom: { 'lrdbari' . Int64 . LoadVar |  Indirect |  HasSymbolRef . ValueNumberShare |  SupportedForPRE|  MayUseSystemStack |  ReadBarrierLoad . LikeUse . { Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"036" istore initializeFrom: { 'istore' . Int32 . Store |  TreeTop |  HasSymbolRef . ValueNumberShare|  MayUseSystemStack . LikeDef . { Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"037" lstore initializeFrom: { 'lstore' . Int64 . Store |  TreeTop |  HasSymbolRef . ValueNumberShare|  MayUseSystemStack . LikeDef . { Int64 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"038" fstore initializeFrom: { 'fstore' . Float . Store |  TreeTop |  HasSymbolRef . ValueNumberShare|  MayUseSystemStack . LikeDef . { Float } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"039" dstore initializeFrom: { 'dstore' . Double . Store |  TreeTop |  HasSymbolRef . ValueNumberShare|  MayUseSystemStack . LikeDef . { Double } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"040" astore initializeFrom: { 'astore' . Address . Store |  TreeTop |  HasSymbolRef . ValueNumberShare|  MayUseSystemStack . LikeDef . { Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"041" bstore initializeFrom: { 'bstore' . Int8 . Store |  TreeTop |  HasSymbolRef . ValueNumberShare|  MayUseSystemStack . LikeDef . { Int8 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"042" sstore initializeFrom: { 'sstore' . Int16 . Store |  TreeTop |  HasSymbolRef . ValueNumberShare|  MayUseSystemStack . LikeDef . { Int16 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"043" iwrtbar initializeFrom: { 'iwrtbar' . Int32 . Store |  TreeTop |  HasSymbolRef . ValueNumberShare|  WriteBarrierStore|  MayUseSystemStack . LikeDef . { Int32 . Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"044" lwrtbar initializeFrom: { 'lwrtbar' . Int64 . Store |  TreeTop |  HasSymbolRef . ValueNumberShare|  WriteBarrierStore|  MayUseSystemStack . LikeDef . { Int64 . Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"045" fwrtbar initializeFrom: { 'fwrtbar' . Float . Store |  TreeTop |  HasSymbolRef . ValueNumberShare|  WriteBarrierStore|  MayUseSystemStack . LikeDef . { Float . Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"046" dwrtbar initializeFrom: { 'dwrtbar' . Double . Store |  TreeTop |  HasSymbolRef . ValueNumberShare|  WriteBarrierStore|  MayUseSystemStack . LikeDef . { Double . Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"047" awrtbar initializeFrom: { 'awrtbar' . Address . Store |  TreeTop |  HasSymbolRef . ValueNumberShare |  WriteBarrierStore|  MayUseSystemStack . LikeDef . { Address . Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"048" bwrtbar initializeFrom: { 'bwrtbar' . Int8 . Store |  TreeTop |  HasSymbolRef . ValueNumberShare|  WriteBarrierStore|  MayUseSystemStack . LikeDef . { Int8 . Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"049" swrtbar initializeFrom: { 'swrtbar' . Int16 . Store |  TreeTop |  HasSymbolRef . ValueNumberShare|  WriteBarrierStore|  MayUseSystemStack . LikeDef . { Int16 . Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"050" lstorei initializeFrom: { 'lstorei' . Int64 . Store |  Indirect |  TreeTop |  HasSymbolRef . ValueNumberShare|  MayUseSystemStack . LikeDef . { Address . Int64 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"051" fstorei initializeFrom: { 'fstorei' . Float . Store |  Indirect |  TreeTop |  HasSymbolRef . ValueNumberShare|  MayUseSystemStack . LikeDef . { Address . Float } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"052" dstorei initializeFrom: { 'dstorei' . Double . Store |  Indirect |  TreeTop |  HasSymbolRef . ValueNumberShare|  MayUseSystemStack . LikeDef . { Address . Double } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"053" astorei initializeFrom: { 'astorei' . Address . Store |  Indirect |  TreeTop |  HasSymbolRef . ValueNumberShare|  MayUseSystemStack . LikeDef . { Address . Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"054" bstorei initializeFrom: { 'bstorei' . Int8 . Store |  Indirect |  TreeTop |  HasSymbolRef . ValueNumberShare|  MayUseSystemStack . LikeDef . { Address . Int8 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"055" sstorei initializeFrom: { 'sstorei' . Int16 . Store |  Indirect |  TreeTop |  HasSymbolRef . ValueNumberShare|  MayUseSystemStack . LikeDef . { Address . Int16 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"056" istorei initializeFrom: { 'istorei' . Int32 . Store |  Indirect |  TreeTop |  HasSymbolRef . ValueNumberShare|  MayUseSystemStack . LikeDef . { Address . Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"057" lwrtbari initializeFrom: { 'lwrtbari' . Int64 . Store |  Indirect |  TreeTop |  HasSymbolRef . ValueNumberShare |  WriteBarrierStore|  MayUseSystemStack . LikeDef . { Address . Int64 . Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"058" fwrtbari initializeFrom: { 'fwrtbari' . Float . Store |  Indirect |  TreeTop |  HasSymbolRef . ValueNumberShare |  WriteBarrierStore|  MayUseSystemStack . LikeDef . { Address . Float . Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"059" dwrtbari initializeFrom: { 'dwrtbari' . Double . Store |  Indirect |  TreeTop |  HasSymbolRef . ValueNumberShare |  WriteBarrierStore|  MayUseSystemStack . LikeDef . { Address . Double . Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"060" awrtbari initializeFrom: { 'awrtbari' . Address . Store |  Indirect |  TreeTop |  HasSymbolRef . ValueNumberShare |  WriteBarrierStore|  MayUseSystemStack . LikeDef . { Address . Address . Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"061" bwrtbari initializeFrom: { 'bwrtbari' . Int8 . Store |  Indirect |  TreeTop |  HasSymbolRef . ValueNumberShare |  WriteBarrierStore|  MayUseSystemStack . LikeDef . { Address . Int8 . Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"062" swrtbari initializeFrom: { 'swrtbari' . Int16 . Store |  Indirect |  TreeTop |  HasSymbolRef . ValueNumberShare |  WriteBarrierStore|  MayUseSystemStack . LikeDef . { Address . Int16 . Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"063" iwrtbari initializeFrom: { 'iwrtbari' . Int32 . Store |  Indirect |  TreeTop |  HasSymbolRef . ValueNumberShare |  WriteBarrierStore|  MayUseSystemStack . LikeDef . { Address . Int32 . Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"064" goto initializeFrom: { 'goto' . NoType . Branch |  TreeTop . 0 . 0 . NoChildren  . BadILOp . BadILOp . BadILOp . BadILOp }.
	"065" ireturn initializeFrom: { 'ireturn' . Int32 . Return |  TreeTop . MayUseSystemStack . 0 . {  UnspecifiedChildType } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"066" lreturn initializeFrom: { 'lreturn' . Int64 . Return |  TreeTop . MayUseSystemStack . 0 . { Int64 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"067" freturn initializeFrom: { 'freturn' . Float . Return |  TreeTop . MayUseSystemStack . 0 . { Float } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"068" dreturn initializeFrom: { 'dreturn' . Double . Return |  TreeTop . MayUseSystemStack . 0 . { Double } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"069" areturn initializeFrom: { 'areturn' . Address . Return |  TreeTop . MayUseSystemStack . 0 . { Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"070" return initializeFrom: { 'return' . NoType . Return |  TreeTop . MayUseSystemStack . 0 . NoChildren  . BadILOp . BadILOp . BadILOp . BadILOp }.
	"071" asynccheck initializeFrom: { 'asynccheck' . NoType . TreeTop |  HasSymbolRef . MustBeLowered|  MayUseSystemStack . LikeDef . Unspecified . BadILOp . BadILOp . BadILOp . BadILOp }.
	"072" athrow initializeFrom: { 'athrow' . NoType . TreeTop |  HasSymbolRef . MustBeLowered |  CanRaiseException|  MayUseSystemStack . 0 . Unspecified . BadILOp . BadILOp . BadILOp . BadILOp }.
	"073" icall initializeFrom: { 'icall' . Int32 . Call |  HasSymbolRef . CanRaiseException |  SupportedForPRE|  MayUseSystemStack . LikeUse |  LikeDef . Unspecified . BadILOp . BadILOp . BadILOp . BadILOp }.
	"074" lcall initializeFrom: { 'lcall' . Int64 . Call |  HasSymbolRef . CanRaiseException |  SupportedForPRE|  MayUseSystemStack . LikeUse |  LikeDef . Unspecified . BadILOp . BadILOp . BadILOp . BadILOp }.
	"075" fcall initializeFrom: { 'fcall' . Float . Call |  HasSymbolRef . CanRaiseException |  SupportedForPRE|  MayUseSystemStack . LikeUse |  LikeDef . Unspecified . BadILOp . BadILOp . BadILOp . BadILOp }.
	"076" dcall initializeFrom: { 'dcall' . Double . Call |  HasSymbolRef . CanRaiseException |  SupportedForPRE|  MayUseSystemStack . LikeUse |  LikeDef . Unspecified . BadILOp . BadILOp . BadILOp . BadILOp }.
	"077" acall initializeFrom: { 'acall' . Address . Call |  HasSymbolRef . CanRaiseException |  SupportedForPRE|  MayUseSystemStack . LikeUse |  LikeDef . Unspecified . BadILOp . BadILOp . BadILOp . BadILOp }.
	"078" call initializeFrom: { 'call' . NoType . Call |  HasSymbolRef . CanRaiseException |  SupportedForPRE|  MayUseSystemStack . LikeUse |  LikeDef . Unspecified . BadILOp . BadILOp . BadILOp . BadILOp }.
	"079" iadd initializeFrom: { 'iadd' . Int32 . Commutative |  Associative |  Add . ValueNumberShare |  SupportedForPRE . LikeUse . { Int32 . Int32 } . iadd . BadILOp . BadILOp . BadILOp }.
	"080" ladd initializeFrom: { 'ladd' . Int64 . Commutative |  Associative |  Add . ValueNumberShare |  SupportedForPRE . LikeUse . { Int64 . Int64 } . ladd . BadILOp . BadILOp . BadILOp }.
	"081" fadd initializeFrom: { 'fadd' . Float . Commutative |  Associative |  Add . ValueNumberShare |  SupportedForPRE . LikeUse . { Float . Float } . fadd . BadILOp . BadILOp . BadILOp }.
	"082" dadd initializeFrom: { 'dadd' . Double . Commutative |  Associative |  Add . ValueNumberShare |  SupportedForPRE . LikeUse . { Double . Double } . dadd . BadILOp . BadILOp . BadILOp }.
	"083" badd initializeFrom: { 'badd' . Int8 . Commutative |  Associative |  Add . ValueNumberShare |  SupportedForPRE . LikeUse . { Int8 . Int8 } . badd . BadILOp . BadILOp . BadILOp }.
	"084" sadd initializeFrom: { 'sadd' . Int16 . Commutative |  Associative |  Add . ValueNumberShare |  SupportedForPRE . LikeUse . { Int16 . Int16 } . sadd . BadILOp . BadILOp . BadILOp }.
	"085" isub initializeFrom: { 'isub' . Int32 . Sub . ValueNumberShare |  SupportedForPRE . LikeUse . { Int32 . Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"086" lsub initializeFrom: { 'lsub' . Int64 . Sub . ValueNumberShare |  SupportedForPRE . LikeUse . { Int64 . Int64 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"087" fsub initializeFrom: { 'fsub' . Float . Sub . ValueNumberShare |  SupportedForPRE . LikeUse . { Float . Float } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"088" dsub initializeFrom: { 'dsub' . Double . Sub . ValueNumberShare |  SupportedForPRE . LikeUse . { Double . Double } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"089" bsub initializeFrom: { 'bsub' . Int8 . Sub . ValueNumberShare |  SupportedForPRE . LikeUse . { Int8 . Int8 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"090" ssub initializeFrom: { 'ssub' . Int16 . Sub . ValueNumberShare |  SupportedForPRE . LikeUse . { Int16 . Int16 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"091" asub initializeFrom: { 'asub' . NoType . Sub . ValueNumberShare |  SupportedForPRE . LikeUse . { Address . Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"092" imul initializeFrom: { 'imul' . Int32 . Commutative |  Associative |  Mul . ValueNumberShare |  SupportedForPRE . LikeUse . { Int32 . Int32 } . imul . BadILOp . BadILOp . BadILOp }.
	"093" lmul initializeFrom: { 'lmul' . Int64 . Commutative |  Associative |  Mul . ValueNumberShare |  SupportedForPRE . LikeUse . { Int64 . Int64 } . lmul . BadILOp . BadILOp . BadILOp }.
	"094" fmul initializeFrom: { 'fmul' . Float . Commutative |  Associative |  Mul . ValueNumberShare |  SupportedForPRE . LikeUse . { Float . Float } . fmul . BadILOp . BadILOp . BadILOp }.
	"095" dmul initializeFrom: { 'dmul' . Double . Commutative |  Associative |  Mul . ValueNumberShare |  SupportedForPRE . LikeUse . { Double . Double } . dmul . BadILOp . BadILOp . BadILOp }.
	"096" bmul initializeFrom: { 'bmul' . Int8 . Commutative |  Associative |  Mul . ValueNumberShare |  SupportedForPRE . LikeUse . { Int8 . Int8 } . bmul . BadILOp . BadILOp . BadILOp }.
	"097" smul initializeFrom: { 'smul' . Int16 . Commutative |  Associative |  Mul . ValueNumberShare |  SupportedForPRE . LikeUse . { Int16 . Int16 } . smul . BadILOp . BadILOp . BadILOp }.
	"098" idiv initializeFrom: { 'idiv' . Int32 . Div . ValueNumberShare |  SupportedForPRE . LikeUse . { Int32 . Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"099" ldiv initializeFrom: { 'ldiv' . Int64 . Div . ValueNumberShare |  SupportedForPRE . LikeUse . { Int64 . Int64 } . BadILOp . BadILOp . BadILOp . BadILOp }.
]

{ #category : #initialization }
TRILOpcodes class >> initialize07: UnspecifiedChildType [
	"Automatically generated by opcodesgen. DO NOT EDIT!"

	| NoType NoChildren Unspecified"Children" IndirectCallType BadILOp |

	NoType := Void.
	NoChildren := #().
	Unspecified"Children" := nil.
	IndirectCallType := Unspecified"Children".
	BadILOp := invalid.












































































































	"100" fdiv initializeFrom: { 'fdiv' . Float . Div . ValueNumberShare |  SupportedForPRE . LikeUse . { Float . Float } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"101" ddiv initializeFrom: { 'ddiv' . Double . Div . ValueNumberShare |  SupportedForPRE . LikeUse . { Double . Double } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"102" bdiv initializeFrom: { 'bdiv' . Int8 . Div . ValueNumberShare |  SupportedForPRE . LikeUse . { Int8 . Int8 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"103" sdiv initializeFrom: { 'sdiv' . Int16 . Div . ValueNumberShare |  SupportedForPRE . LikeUse . { Int16 . Int16 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"104" iudiv initializeFrom: { 'iudiv' . Int32 . Div . ValueNumberShare |  SupportedForPRE . LikeUse . { Int32 . Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"105" ludiv initializeFrom: { 'ludiv' . Int64 . Div . ValueNumberShare |  SupportedForPRE . LikeUse . { Int64 . Int64 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"106" irem initializeFrom: { 'irem' . Int32 . Rem . ValueNumberShare |  SupportedForPRE . LikeUse . { Int32 . Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"107" lrem initializeFrom: { 'lrem' . Int64 . Rem . ValueNumberShare |  SupportedForPRE . LikeUse . { Int64 . Int64 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"108" frem initializeFrom: { 'frem' . Float . Rem . ValueNumberShare |  SupportedForPRE|  MayUseSystemStack . LikeUse . { Float . Float } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"109" drem initializeFrom: { 'drem' . Double . Rem . ValueNumberShare |  SupportedForPRE|  MayUseSystemStack . LikeUse . { Double . Double } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"110" brem initializeFrom: { 'brem' . Int8 . Rem . ValueNumberShare |  SupportedForPRE . LikeUse . { Int8 . Int8 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"111" srem initializeFrom: { 'srem' . Int16 . Rem . ValueNumberShare |  SupportedForPRE . LikeUse . { Int16 . Int16 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"112" iurem initializeFrom: { 'iurem' . Int32 . Rem . ValueNumberShare |  SupportedForPRE . LikeUse . { Int32 . Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"113" ineg initializeFrom: { 'ineg' . Int32 . Neg . ValueNumberShare |  SupportedForPRE . LikeUse . { Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"114" lneg initializeFrom: { 'lneg' . Int64 . Neg . ValueNumberShare |  SupportedForPRE . LikeUse . { Int64 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"115" fneg initializeFrom: { 'fneg' . Float . Neg . ValueNumberShare |  SupportedForPRE . LikeUse . { Float } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"116" dneg initializeFrom: { 'dneg' . Double . Neg . ValueNumberShare |  SupportedForPRE . LikeUse . { Double } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"117" bneg initializeFrom: { 'bneg' . Int8 . Neg . ValueNumberShare |  SupportedForPRE . LikeUse . { Int8 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"118" sneg initializeFrom: { 'sneg' . Int16 . Neg . ValueNumberShare |  SupportedForPRE . LikeUse . { Int16 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"119" iabs initializeFrom: { 'iabs' . Int32 . 0 . ValueNumberShare |  SupportedForPRE . LikeUse |  Abs . { Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"120" labs initializeFrom: { 'labs' . Int64 . 0 . ValueNumberShare |  SupportedForPRE . LikeUse |  Abs . { Int64 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"121" fabs initializeFrom: { 'fabs' . Float . 0 . ValueNumberShare |  SupportedForPRE . LikeUse |  Abs . { Float } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"122" dabs initializeFrom: { 'dabs' . Double . 0 . ValueNumberShare |  SupportedForPRE . LikeUse |  Abs . { Double } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"123" ishl initializeFrom: { 'ishl' . Int32 . LeftShift . ValueNumberShare |  SupportedForPRE . LikeUse . { Int32 . Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"124" lshl initializeFrom: { 'lshl' . Int64 . LeftShift . ValueNumberShare |  SupportedForPRE . LikeUse . { Int64 . Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"125" bshl initializeFrom: { 'bshl' . Int8 . LeftShift . ValueNumberShare |  SupportedForPRE . LikeUse . { Int8 . Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"126" sshl initializeFrom: { 'sshl' . Int16 . LeftShift . ValueNumberShare |  SupportedForPRE . LikeUse . { Int16 . Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"127" ishr initializeFrom: { 'ishr' . Int32 . RightShift . ValueNumberShare |  SupportedForPRE . LikeUse . { Int32 . Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"128" lshr initializeFrom: { 'lshr' . Int64 . RightShift . ValueNumberShare |  SupportedForPRE . LikeUse . { Int64 . Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"129" bshr initializeFrom: { 'bshr' . Int8 . RightShift . ValueNumberShare |  SupportedForPRE . LikeUse . { Int8 . Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"130" sshr initializeFrom: { 'sshr' . Int16 . RightShift . ValueNumberShare |  SupportedForPRE . LikeUse . { Int16 . Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"131" iushr initializeFrom: { 'iushr' . Int32 . RightShift |  ShiftLogical . ValueNumberShare |  SupportedForPRE . LikeUse . { Int32 . Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"132" lushr initializeFrom: { 'lushr' . Int64 . RightShift |  ShiftLogical . ValueNumberShare |  SupportedForPRE . LikeUse . { Int64 . Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"133" bushr initializeFrom: { 'bushr' . Int8 . RightShift |  ShiftLogical . ValueNumberShare |  SupportedForPRE . LikeUse . { Int8 . Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"134" sushr initializeFrom: { 'sushr' . Int16 . RightShift |  ShiftLogical . ValueNumberShare |  SupportedForPRE . LikeUse . { Int16 . Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"135" irol initializeFrom: { 'irol' . Int32 . 0 . ValueNumberShare |  SupportedForPRE |  LeftRotate . 0 . { Int32 . Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"136" lrol initializeFrom: { 'lrol' . Int64 . 0 . ValueNumberShare |  SupportedForPRE |  LeftRotate . 0 . { Int64 . Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"137" iand initializeFrom: { 'iand' . Int32 . Commutative |  Associative |  And . ValueNumberShare |  SupportedForPRE . LikeUse . { Int32 . Int32 } . iand . BadILOp . BadILOp . BadILOp }.
	"138" land initializeFrom: { 'land' . Int64 . Commutative |  Associative |  And . ValueNumberShare |  SupportedForPRE . LikeUse . { Int64 . Int64 } . land . BadILOp . BadILOp . BadILOp }.
	"139" band initializeFrom: { 'band' . Int8 . Commutative |  Associative |  And . ValueNumberShare |  SupportedForPRE . LikeUse . { Int8 . Int8 } . band . BadILOp . BadILOp . BadILOp }.
	"140" sand initializeFrom: { 'sand' . Int16 . Commutative |  Associative |  And . ValueNumberShare |  SupportedForPRE . LikeUse . { Int16 . Int16 } . sand . BadILOp . BadILOp . BadILOp }.
	"141" ior initializeFrom: { 'ior' . Int32 . Commutative |  Associative |  Or . ValueNumberShare |  SupportedForPRE . LikeUse . { Int32 . Int32 } . ior . BadILOp . BadILOp . BadILOp }.
	"142" lor initializeFrom: { 'lor' . Int64 . Commutative |  Associative |  Or . ValueNumberShare |  SupportedForPRE . LikeUse . { Int64 . Int64 } . lor . BadILOp . BadILOp . BadILOp }.
	"143" bor initializeFrom: { 'bor' . Int8 . Commutative |  Associative |  Or . ValueNumberShare |  SupportedForPRE . LikeUse . { Int8 . Int8 } . bor . BadILOp . BadILOp . BadILOp }.
	"144" sor initializeFrom: { 'sor' . Int16 . Commutative |  Associative |  Or . ValueNumberShare |  SupportedForPRE . LikeUse . { Int16 . Int16 } . sor . BadILOp . BadILOp . BadILOp }.
	"145" ixor initializeFrom: { 'ixor' . Int32 . Commutative |  Associative |  Xor . ValueNumberShare |  SupportedForPRE . LikeUse . { Int32 . Int32 } . ixor . BadILOp . BadILOp . BadILOp }.
	"146" lxor initializeFrom: { 'lxor' . Int64 . Commutative |  Associative |  Xor . ValueNumberShare |  SupportedForPRE . LikeUse . { Int64 . Int64 } . lxor . BadILOp . BadILOp . BadILOp }.
	"147" bxor initializeFrom: { 'bxor' . Int8 . Commutative |  Associative |  Xor . ValueNumberShare |  SupportedForPRE . LikeUse . { Int8 . Int8 } . bxor . BadILOp . BadILOp . BadILOp }.
	"148" sxor initializeFrom: { 'sxor' . Int16 . Commutative |  Associative |  Xor . ValueNumberShare |  SupportedForPRE . LikeUse . { Int16 . Int16 } . sxor . BadILOp . BadILOp . BadILOp }.
	"149" i2l initializeFrom: { 'i2l' . Int64 . Conversion . ValueNumberShare |  SupportedForPRE |  SignExtension . 0 . { Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"150" i2f initializeFrom: { 'i2f' . Float . Conversion . ValueNumberShare |  SupportedForPRE . 0 . { Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"151" i2d initializeFrom: { 'i2d' . Double . Conversion . ValueNumberShare |  SupportedForPRE . 0 . { Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"152" i2b initializeFrom: { 'i2b' . Int8 . Conversion . ValueNumberShare |  SupportedForPRE . 0 . { Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"153" i2s initializeFrom: { 'i2s' . Int16 . Conversion . ValueNumberShare |  SupportedForPRE . 0 . { Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"154" i2a initializeFrom: { 'i2a' . Address . Conversion . ValueNumberShare |  SupportedForPRE . 0 . { Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"155" iu2l initializeFrom: { 'iu2l' . Int64 . Conversion . ValueNumberShare |  SupportedForPRE |  ZeroExtension . 0 . { Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"156" iu2f initializeFrom: { 'iu2f' . Float . Conversion . ValueNumberShare |  SupportedForPRE . 0 . { Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"157" iu2d initializeFrom: { 'iu2d' . Double . Conversion . ValueNumberShare |  SupportedForPRE . 0 . { Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"158" iu2a initializeFrom: { 'iu2a' . Address . Conversion . ValueNumberShare |  SupportedForPRE . 0 . { Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"159" l2i initializeFrom: { 'l2i' . Int32 . Conversion . ValueNumberShare |  SupportedForPRE . 0 . { Int64 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"160" l2f initializeFrom: { 'l2f' . Float . Conversion . ValueNumberShare |  SupportedForPRE|  MayUseSystemStack . 0 . { Int64 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"161" l2d initializeFrom: { 'l2d' . Double . Conversion . ValueNumberShare |  SupportedForPRE . 0 . { Int64 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"162" l2b initializeFrom: { 'l2b' . Int8 . Conversion . ValueNumberShare |  SupportedForPRE . 0 . { Int64 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"163" l2s initializeFrom: { 'l2s' . Int16 . Conversion . ValueNumberShare |  SupportedForPRE . 0 . { Int64 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"164" l2a initializeFrom: { 'l2a' . Address . Conversion . ValueNumberShare |  SupportedForPRE . 0 . { Int64 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"165" lu2f initializeFrom: { 'lu2f' . Float . Conversion . ValueNumberShare |  SupportedForPRE|  MayUseSystemStack . 0 . { Int64 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"166" lu2d initializeFrom: { 'lu2d' . Double . Conversion . ValueNumberShare |  SupportedForPRE . 0 . { Int64 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"167" lu2a initializeFrom: { 'lu2a' . Address . Conversion . ValueNumberShare |  SupportedForPRE . 0 . { Int64 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"168" f2i initializeFrom: { 'f2i' . Int32 . Conversion . ValueNumberShare |  SupportedForPRE . 0 . { Float } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"169" f2l initializeFrom: { 'f2l' . Int64 . Conversion . ValueNumberShare |  SupportedForPRE . 0 . { Float } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"170" f2d initializeFrom: { 'f2d' . Double . Conversion . ValueNumberShare |  SupportedForPRE . 0 . { Float } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"171" f2b initializeFrom: { 'f2b' . Int8 . Conversion . ValueNumberShare |  SupportedForPRE . 0 . { Float } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"172" f2s initializeFrom: { 'f2s' . Int16 . Conversion . ValueNumberShare |  SupportedForPRE . 0 . { Float } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"173" d2i initializeFrom: { 'd2i' . Int32 . Conversion . ValueNumberShare |  SupportedForPRE . 0 . { Double } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"174" d2l initializeFrom: { 'd2l' . Int64 . Conversion . ValueNumberShare |  SupportedForPRE . 0 . { Double } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"175" d2f initializeFrom: { 'd2f' . Float . Conversion . ValueNumberShare |  SupportedForPRE . 0 . { Double } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"176" d2b initializeFrom: { 'd2b' . Int8 . Conversion . ValueNumberShare |  SupportedForPRE . 0 . { Double } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"177" d2s initializeFrom: { 'd2s' . Int16 . Conversion . ValueNumberShare |  SupportedForPRE . 0 . { Double } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"178" b2i initializeFrom: { 'b2i' . Int32 . Conversion . ValueNumberShare |  SupportedForPRE |  SignExtension . 0 . { Int8 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"179" b2l initializeFrom: { 'b2l' . Int64 . Conversion . ValueNumberShare |  SupportedForPRE |  SignExtension . 0 . { Int8 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"180" b2f initializeFrom: { 'b2f' . Float . Conversion . ValueNumberShare |  SupportedForPRE . 0 . { Int8 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"181" b2d initializeFrom: { 'b2d' . Double . Conversion . ValueNumberShare |  SupportedForPRE . 0 . { Int8 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"182" b2s initializeFrom: { 'b2s' . Int16 . Conversion . ValueNumberShare |  SupportedForPRE |  SignExtension . 0 . { Int8 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"183" b2a initializeFrom: { 'b2a' . Address . Conversion . ValueNumberShare |  SupportedForPRE . 0 . { Int8 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"184" bu2i initializeFrom: { 'bu2i' . Int32 . Conversion . ValueNumberShare |  SupportedForPRE |  ZeroExtension . 0 . { Int8 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"185" bu2l initializeFrom: { 'bu2l' . Int64 . Conversion . ValueNumberShare |  SupportedForPRE |  ZeroExtension . 0 . { Int8 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"186" bu2f initializeFrom: { 'bu2f' . Float . Conversion . ValueNumberShare |  SupportedForPRE . 0 . { Int8 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"187" bu2d initializeFrom: { 'bu2d' . Double . Conversion . ValueNumberShare |  SupportedForPRE . 0 . { Int8 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"188" bu2s initializeFrom: { 'bu2s' . Int16 . Conversion . ValueNumberShare |  SupportedForPRE |  ZeroExtension . 0 . { Int8 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"189" bu2a initializeFrom: { 'bu2a' . Address . Conversion . ValueNumberShare |  SupportedForPRE |  ZeroExtension . 0 . { Int8 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"190" s2i initializeFrom: { 's2i' . Int32 . Conversion . ValueNumberShare |  SupportedForPRE |  SignExtension . 0 . { Int16 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"191" s2l initializeFrom: { 's2l' . Int64 . Conversion . ValueNumberShare |  SupportedForPRE |  SignExtension . 0 . { Int16 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"192" s2f initializeFrom: { 's2f' . Float . Conversion . ValueNumberShare |  SupportedForPRE . 0 . { Int16 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"193" s2d initializeFrom: { 's2d' . Double . Conversion . ValueNumberShare |  SupportedForPRE . 0 . { Int16 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"194" s2b initializeFrom: { 's2b' . Int8 . Conversion . ValueNumberShare |  SupportedForPRE . 0 . { Int16 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"195" s2a initializeFrom: { 's2a' . Address . Conversion . ValueNumberShare |  SupportedForPRE . 0 . { Int16 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"196" su2i initializeFrom: { 'su2i' . Int32 . Conversion . ValueNumberShare |  SupportedForPRE |  ZeroExtension . 0 . { Int16 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"197" su2l initializeFrom: { 'su2l' . Int64 . Conversion . ValueNumberShare |  SupportedForPRE |  ZeroExtension . 0 . { Int16 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"198" su2f initializeFrom: { 'su2f' . Float . Conversion . ValueNumberShare |  SupportedForPRE . 0 . { Int16 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"199" su2d initializeFrom: { 'su2d' . Double . Conversion . ValueNumberShare |  SupportedForPRE . 0 . { Int16 } . BadILOp . BadILOp . BadILOp . BadILOp }.
]

{ #category : #initialization }
TRILOpcodes class >> initialize08a: UnspecifiedChildType [
	"Automatically generated by opcodesgen. DO NOT EDIT!"

	| NoType NoChildren Unspecified"Children" IndirectCallType BadILOp |

	NoType := Void.
	NoChildren := #().
	Unspecified"Children" := nil.
	IndirectCallType := Unspecified"Children".
	BadILOp := invalid.
















































































































































































































	"200" su2a initializeFrom: { 'su2a' . Address . Conversion . ValueNumberShare |  SupportedForPRE . 0 . { Int16 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"201" a2i initializeFrom: { 'a2i' . Int32 . Conversion . ValueNumberShare |  SupportedForPRE . 0 . { Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"202" a2l initializeFrom: { 'a2l' . Int64 . Conversion . ValueNumberShare |  SupportedForPRE . 0 . { Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"203" a2b initializeFrom: { 'a2b' . Int8 . Conversion . ValueNumberShare |  SupportedForPRE . 0 . { Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"204" a2s initializeFrom: { 'a2s' . Int16 . Conversion . ValueNumberShare |  SupportedForPRE . 0 . { Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"205" icmpeq initializeFrom: { 'icmpeq' . Int32 . BooleanCompare . ValueNumberShare |  SupportedForPRE . CompareTrueIfEqual . { Int32 . Int32 } . icmpeq . icmpne . BadILOp . ificmpeq }.
	"206" icmpne initializeFrom: { 'icmpne' . Int32 . BooleanCompare . ValueNumberShare |  SupportedForPRE . CompareTrueIfLess |  CompareTrueIfGreater . { Int32 . Int32 } . icmpne . icmpeq . BadILOp . ificmpne }.
	"207" icmplt initializeFrom: { 'icmplt' . Int32 . BooleanCompare . ValueNumberShare |  SupportedForPRE . CompareTrueIfLess . { Int32 . Int32 } . icmpgt . icmpge . BadILOp . ificmplt }.
	"208" icmpge initializeFrom: { 'icmpge' . Int32 . BooleanCompare . ValueNumberShare |  SupportedForPRE . CompareTrueIfGreater |  CompareTrueIfEqual . { Int32 . Int32 } . icmple . icmplt . BadILOp . ificmpge }.
	"209" icmpgt initializeFrom: { 'icmpgt' . Int32 . BooleanCompare . ValueNumberShare |  SupportedForPRE . CompareTrueIfGreater . { Int32 . Int32 } . icmplt . icmple . BadILOp . ificmpgt }.
	"210" icmple initializeFrom: { 'icmple' . Int32 . BooleanCompare . ValueNumberShare |  SupportedForPRE . CompareTrueIfLess |  CompareTrueIfEqual . { Int32 . Int32 } . icmpge . icmpgt . BadILOp . ificmple }.
	"211" iucmplt initializeFrom: { 'iucmplt' . Int32 . BooleanCompare . ValueNumberShare |  SupportedForPRE |  UnsignedCompare . CompareTrueIfLess . { Int32 . Int32 } . iucmpgt . iucmpge . BadILOp . ifiucmplt }.
	"212" iucmpge initializeFrom: { 'iucmpge' . Int32 . BooleanCompare . ValueNumberShare |  SupportedForPRE |  UnsignedCompare . CompareTrueIfGreater |  CompareTrueIfEqual . { Int32 . Int32 } . iucmple . iucmplt . BadILOp . ifiucmpge }.
	"213" iucmpgt initializeFrom: { 'iucmpgt' . Int32 . BooleanCompare . ValueNumberShare |  SupportedForPRE |  UnsignedCompare . CompareTrueIfGreater . { Int32 . Int32 } . iucmplt . iucmple . BadILOp . ifiucmpgt }.
	"214" iucmple initializeFrom: { 'iucmple' . Int32 . BooleanCompare . ValueNumberShare |  SupportedForPRE |  UnsignedCompare . CompareTrueIfLess |  CompareTrueIfEqual . { Int32 . Int32 } . iucmpge . iucmpgt . BadILOp . ifiucmple }.
	"215" lcmpeq initializeFrom: { 'lcmpeq' . Int32 . BooleanCompare . ValueNumberShare |  SupportedForPRE . CompareTrueIfEqual . { Int64 . Int64 } . lcmpeq . lcmpne . BadILOp . iflcmpeq }.
	"216" lcmpne initializeFrom: { 'lcmpne' . Int32 . BooleanCompare . ValueNumberShare |  SupportedForPRE . CompareTrueIfLess |  CompareTrueIfGreater . { Int64 . Int64 } . lcmpne . lcmpeq . BadILOp . iflcmpne }.
	"217" lcmplt initializeFrom: { 'lcmplt' . Int32 . BooleanCompare . ValueNumberShare |  SupportedForPRE . CompareTrueIfLess . { Int64 . Int64 } . lcmpgt . lcmpge . BadILOp . iflcmplt }.
	"218" lcmpge initializeFrom: { 'lcmpge' . Int32 . BooleanCompare . ValueNumberShare |  SupportedForPRE . CompareTrueIfGreater |  CompareTrueIfEqual . { Int64 . Int64 } . lcmple . lcmplt . BadILOp . iflcmpge }.
	"219" lcmpgt initializeFrom: { 'lcmpgt' . Int32 . BooleanCompare . ValueNumberShare |  SupportedForPRE . CompareTrueIfGreater . { Int64 . Int64 } . lcmplt . lcmple . BadILOp . iflcmpgt }.
	"220" lcmple initializeFrom: { 'lcmple' . Int32 . BooleanCompare . ValueNumberShare |  SupportedForPRE . CompareTrueIfLess |  CompareTrueIfEqual . { Int64 . Int64 } . lcmpge . lcmpgt . BadILOp . iflcmple }.
	"221" lucmplt initializeFrom: { 'lucmplt' . Int32 . BooleanCompare . ValueNumberShare |  SupportedForPRE |  UnsignedCompare . CompareTrueIfLess . { Int64 . Int64 } . lucmpgt . lucmpge . BadILOp . iflucmplt }.
	"222" lucmpge initializeFrom: { 'lucmpge' . Int32 . BooleanCompare . ValueNumberShare |  SupportedForPRE |  UnsignedCompare . CompareTrueIfGreater |  CompareTrueIfEqual . { Int64 . Int64 } . lucmple . lucmplt . BadILOp . iflucmpge }.
	"223" lucmpgt initializeFrom: { 'lucmpgt' . Int32 . BooleanCompare . ValueNumberShare |  SupportedForPRE |  UnsignedCompare . CompareTrueIfGreater . { Int64 . Int64 } . lucmplt . lucmple . BadILOp . iflucmpgt }.
	"224" lucmple initializeFrom: { 'lucmple' . Int32 . BooleanCompare . ValueNumberShare |  SupportedForPRE |  UnsignedCompare . CompareTrueIfLess |  CompareTrueIfEqual . { Int64 . Int64 } . lucmpge . lucmpgt . BadILOp . iflucmple }.
	"225" fcmpeq initializeFrom: { 'fcmpeq' . Int32 . BooleanCompare . ValueNumberShare |  SupportedForPRE . CompareTrueIfEqual . { Float . Float } . fcmpeq . fcmpneu . BadILOp . iffcmpeq }.
	"226" fcmpne initializeFrom: { 'fcmpne' . Int32 . BooleanCompare . ValueNumberShare |  SupportedForPRE . CompareTrueIfLess |  CompareTrueIfGreater . { Float . Float } . fcmpne . fcmpequ . BadILOp . iffcmpne }.
	"227" fcmplt initializeFrom: { 'fcmplt' . Int32 . BooleanCompare . ValueNumberShare |  SupportedForPRE . CompareTrueIfLess . { Float . Float } . fcmpgt . fcmpgeu . BadILOp . iffcmplt }.
	"228" fcmpge initializeFrom: { 'fcmpge' . Int32 . BooleanCompare . ValueNumberShare |  SupportedForPRE . CompareTrueIfGreater |  CompareTrueIfEqual . { Float . Float } . fcmple . fcmpltu . BadILOp . iffcmpge }.
	"229" fcmpgt initializeFrom: { 'fcmpgt' . Int32 . BooleanCompare . ValueNumberShare |  SupportedForPRE . CompareTrueIfGreater . { Float . Float } . fcmplt . fcmpleu . BadILOp . iffcmpgt }.
	"230" fcmple initializeFrom: { 'fcmple' . Int32 . BooleanCompare . ValueNumberShare |  SupportedForPRE . CompareTrueIfLess |  CompareTrueIfEqual . { Float . Float } . fcmpge . fcmpgtu . BadILOp . iffcmple }.
	"231" fcmpequ initializeFrom: { 'fcmpequ' . Int32 . BooleanCompare . ValueNumberShare |  SupportedForPRE . CompareTrueIfEqual |  CompareTrueIfUnordered . { Float . Float } . fcmpequ . fcmpne . BadILOp . iffcmpequ }.
	"232" fcmpneu initializeFrom: { 'fcmpneu' . Int32 . BooleanCompare . ValueNumberShare |  SupportedForPRE . CompareTrueIfLess |  CompareTrueIfGreater |  CompareTrueIfUnordered . { Float . Float } . fcmpneu . fcmpeq . BadILOp . iffcmpneu }.
	"233" fcmpltu initializeFrom: { 'fcmpltu' . Int32 . BooleanCompare . ValueNumberShare |  SupportedForPRE . CompareTrueIfLess |  CompareTrueIfUnordered . { Float . Float } . fcmpgtu . fcmpge . BadILOp . iffcmpltu }.
	"234" fcmpgeu initializeFrom: { 'fcmpgeu' . Int32 . BooleanCompare . ValueNumberShare |  SupportedForPRE . CompareTrueIfGreater |  CompareTrueIfEqual |  CompareTrueIfUnordered . { Float . Float } . fcmpleu . fcmplt . BadILOp . iffcmpgeu }.
	"235" fcmpgtu initializeFrom: { 'fcmpgtu' . Int32 . BooleanCompare . ValueNumberShare |  SupportedForPRE . CompareTrueIfGreater |  CompareTrueIfUnordered . { Float . Float } . fcmpltu . fcmple . BadILOp . iffcmpgtu }.
	"236" fcmpleu initializeFrom: { 'fcmpleu' . Int32 . BooleanCompare . ValueNumberShare |  SupportedForPRE . CompareTrueIfLess |  CompareTrueIfEqual |  CompareTrueIfUnordered . { Float . Float } . fcmpgeu . fcmpgt . BadILOp . iffcmpleu }.
	"237" dcmpeq initializeFrom: { 'dcmpeq' . Int32 . BooleanCompare . ValueNumberShare |  SupportedForPRE . CompareTrueIfEqual . { Double . Double } . dcmpeq . dcmpneu . BadILOp . ifdcmpeq }.
	"238" dcmpne initializeFrom: { 'dcmpne' . Int32 . BooleanCompare . ValueNumberShare |  SupportedForPRE . CompareTrueIfLess |  CompareTrueIfGreater . { Double . Double } . dcmpne . dcmpequ . BadILOp . ifdcmpne }.
	"239" dcmplt initializeFrom: { 'dcmplt' . Int32 . BooleanCompare . ValueNumberShare |  SupportedForPRE . CompareTrueIfLess . { Double . Double } . dcmpgt . dcmpgeu . BadILOp . ifdcmplt }.
	"240" dcmpge initializeFrom: { 'dcmpge' . Int32 . BooleanCompare . ValueNumberShare |  SupportedForPRE . CompareTrueIfGreater |  CompareTrueIfEqual . { Double . Double } . dcmple . dcmpltu . BadILOp . ifdcmpge }.
	"241" dcmpgt initializeFrom: { 'dcmpgt' . Int32 . BooleanCompare . ValueNumberShare |  SupportedForPRE . CompareTrueIfGreater . { Double . Double } . dcmplt . dcmpleu . BadILOp . ifdcmpgt }.
	"242" dcmple initializeFrom: { 'dcmple' . Int32 . BooleanCompare . ValueNumberShare |  SupportedForPRE . CompareTrueIfLess |  CompareTrueIfEqual . { Double . Double } . dcmpge . dcmpgtu . BadILOp . ifdcmple }.
	"243" dcmpequ initializeFrom: { 'dcmpequ' . Int32 . BooleanCompare . ValueNumberShare |  SupportedForPRE . CompareTrueIfEqual |  CompareTrueIfUnordered . { Double . Double } . dcmpequ . dcmpne . BadILOp . ifdcmpequ }.
	"244" dcmpneu initializeFrom: { 'dcmpneu' . Int32 . BooleanCompare . ValueNumberShare |  SupportedForPRE . CompareTrueIfLess |  CompareTrueIfGreater |  CompareTrueIfUnordered . { Double . Double } . dcmpneu . dcmpeq . BadILOp . ifdcmpneu }.
	"245" dcmpltu initializeFrom: { 'dcmpltu' . Int32 . BooleanCompare . ValueNumberShare |  SupportedForPRE . CompareTrueIfLess |  CompareTrueIfUnordered . { Double . Double } . dcmpgtu . dcmpge . BadILOp . ifdcmpltu }.
	"246" dcmpgeu initializeFrom: { 'dcmpgeu' . Int32 . BooleanCompare . ValueNumberShare |  SupportedForPRE . CompareTrueIfGreater |  CompareTrueIfEqual |  CompareTrueIfUnordered . { Double . Double } . dcmpleu . dcmplt . BadILOp . ifdcmpgeu }.
	"247" dcmpgtu initializeFrom: { 'dcmpgtu' . Int32 . BooleanCompare . ValueNumberShare |  SupportedForPRE . CompareTrueIfGreater |  CompareTrueIfUnordered . { Double . Double } . dcmpltu . dcmple . BadILOp . ifdcmpgtu }.
	"248" dcmpleu initializeFrom: { 'dcmpleu' . Int32 . BooleanCompare . ValueNumberShare |  SupportedForPRE . CompareTrueIfLess |  CompareTrueIfEqual |  CompareTrueIfUnordered . { Double . Double } . dcmpgeu . dcmpgt . BadILOp . ifdcmpleu }.
	"249" acmpeq initializeFrom: { 'acmpeq' . Int32 . BooleanCompare . ValueNumberShare |  SupportedForPRE . CompareTrueIfEqual . { Address . Address } . acmpeq . acmpne . BadILOp . ifacmpeq }.
]

{ #category : #initialization }
TRILOpcodes class >> initialize08b: UnspecifiedChildType [
	"Automatically generated by opcodesgen. DO NOT EDIT!"

	| NoType NoChildren Unspecified"Children" IndirectCallType BadILOp |

	NoType := Void.
	NoChildren := #().
	Unspecified"Children" := nil.
	IndirectCallType := Unspecified"Children".
	BadILOp := invalid.


































































































































































































































































	"250" acmpne initializeFrom: { 'acmpne' . Int32 . BooleanCompare . ValueNumberShare |  SupportedForPRE . CompareTrueIfLess |  CompareTrueIfGreater . { Address . Address } . acmpne . acmpeq . BadILOp . ifacmpne }.
	"251" acmplt initializeFrom: { 'acmplt' . Int32 . BooleanCompare . ValueNumberShare |  UnsignedCompare |  SupportedForPRE . CompareTrueIfLess . { Address . Address } . acmpgt . acmpge . BadILOp . ifacmplt }.
	"252" acmpge initializeFrom: { 'acmpge' . Int32 . BooleanCompare . ValueNumberShare |  UnsignedCompare |  SupportedForPRE . CompareTrueIfGreater |  CompareTrueIfEqual . { Address . Address } . acmple . acmplt . BadILOp . ifacmpge }.
	"253" acmpgt initializeFrom: { 'acmpgt' . Int32 . BooleanCompare . ValueNumberShare |  UnsignedCompare |  SupportedForPRE . CompareTrueIfGreater . { Address . Address } . acmplt . acmple . BadILOp . ifacmpgt }.
	"254" acmple initializeFrom: { 'acmple' . Int32 . BooleanCompare . ValueNumberShare |  UnsignedCompare |  SupportedForPRE . CompareTrueIfLess |  CompareTrueIfEqual . { Address . Address } . acmpge . acmpgt . BadILOp . ifacmple }.
	"255" bcmpeq initializeFrom: { 'bcmpeq' . Int32 . BooleanCompare . ValueNumberShare |  SupportedForPRE . CompareTrueIfEqual . { Int8 . Int8 } . bcmpeq . bcmpne . BadILOp . ifbcmpeq }.
	"256" bcmpne initializeFrom: { 'bcmpne' . Int32 . BooleanCompare . ValueNumberShare |  SupportedForPRE . CompareTrueIfLess |  CompareTrueIfGreater . { Int8 . Int8 } . bcmpne . bcmpeq . BadILOp . ifbcmpne }.
	"257" bcmplt initializeFrom: { 'bcmplt' . Int32 . BooleanCompare . ValueNumberShare |  SupportedForPRE . CompareTrueIfLess . { Int8 . Int8 } . bcmpgt . bcmpge . BadILOp . ifbcmplt }.
	"258" bcmpge initializeFrom: { 'bcmpge' . Int32 . BooleanCompare . ValueNumberShare |  SupportedForPRE . CompareTrueIfGreater |  CompareTrueIfEqual . { Int8 . Int8 } . bcmple . bcmplt . BadILOp . ifbcmpge }.
	"259" bcmpgt initializeFrom: { 'bcmpgt' . Int32 . BooleanCompare . ValueNumberShare |  SupportedForPRE . CompareTrueIfGreater . { Int8 . Int8 } . bcmplt . bcmple . BadILOp . ifbcmpgt }.
	"260" bcmple initializeFrom: { 'bcmple' . Int32 . BooleanCompare . ValueNumberShare |  SupportedForPRE . CompareTrueIfLess |  CompareTrueIfEqual . { Int8 . Int8 } . bcmpge . bcmpgt . BadILOp . ifbcmple }.
	"261" bucmplt initializeFrom: { 'bucmplt' . Int32 . BooleanCompare . ValueNumberShare |  SupportedForPRE |  UnsignedCompare . CompareTrueIfLess . { Int8 . Int8 } . bucmpgt . bucmpge . BadILOp . ifbucmplt }.
	"262" bucmpge initializeFrom: { 'bucmpge' . Int32 . BooleanCompare . ValueNumberShare |  SupportedForPRE |  UnsignedCompare . CompareTrueIfGreater |  CompareTrueIfEqual . { Int8 . Int8 } . bucmple . bucmplt . BadILOp . ifbucmpge }.
	"263" bucmpgt initializeFrom: { 'bucmpgt' . Int32 . BooleanCompare . ValueNumberShare |  SupportedForPRE |  UnsignedCompare . CompareTrueIfGreater . { Int8 . Int8 } . bucmplt . bucmple . BadILOp . ifbucmpgt }.
	"264" bucmple initializeFrom: { 'bucmple' . Int32 . BooleanCompare . ValueNumberShare |  SupportedForPRE |  UnsignedCompare . CompareTrueIfLess |  CompareTrueIfEqual . { Int8 . Int8 } . bucmpge . bucmpgt . BadILOp . ifbucmple }.
	"265" scmpeq initializeFrom: { 'scmpeq' . Int32 . BooleanCompare . ValueNumberShare |  SupportedForPRE . CompareTrueIfEqual . { Int16 . Int16 } . scmpeq . scmpne . BadILOp . ifscmpeq }.
	"266" scmpne initializeFrom: { 'scmpne' . Int32 . BooleanCompare . ValueNumberShare |  SupportedForPRE . CompareTrueIfLess |  CompareTrueIfGreater . { Int16 . Int16 } . scmpne . scmpeq . BadILOp . ifscmpne }.
	"267" scmplt initializeFrom: { 'scmplt' . Int32 . BooleanCompare . ValueNumberShare |  SupportedForPRE . CompareTrueIfLess . { Int16 . Int16 } . scmpgt . scmpge . BadILOp . ifscmplt }.
	"268" scmpge initializeFrom: { 'scmpge' . Int32 . BooleanCompare . ValueNumberShare |  SupportedForPRE . CompareTrueIfGreater |  CompareTrueIfEqual . { Int16 . Int16 } . scmple . scmplt . BadILOp . ifscmpge }.
	"269" scmpgt initializeFrom: { 'scmpgt' . Int32 . BooleanCompare . ValueNumberShare |  SupportedForPRE . CompareTrueIfGreater . { Int16 . Int16 } . scmplt . scmple . BadILOp . ifscmpgt }.
	"270" scmple initializeFrom: { 'scmple' . Int32 . BooleanCompare . ValueNumberShare |  SupportedForPRE . CompareTrueIfLess |  CompareTrueIfEqual . { Int16 . Int16 } . scmpge . scmpgt . BadILOp . ifscmple }.
	"271" sucmplt initializeFrom: { 'sucmplt' . Int32 . BooleanCompare . ValueNumberShare |  SupportedForPRE . CompareTrueIfLess . { Int16 . Int16 } . sucmpgt . sucmpge . BadILOp . ifsucmplt }.
	"272" sucmpge initializeFrom: { 'sucmpge' . Int32 . BooleanCompare . ValueNumberShare |  SupportedForPRE . CompareTrueIfGreater |  CompareTrueIfEqual . { Int16 . Int16 } . sucmple . sucmplt . BadILOp . ifsucmpge }.
	"273" sucmpgt initializeFrom: { 'sucmpgt' . Int32 . BooleanCompare . ValueNumberShare |  SupportedForPRE . CompareTrueIfGreater . { Int16 . Int16 } . sucmplt . sucmple . BadILOp . ifsucmpgt }.
	"274" sucmple initializeFrom: { 'sucmple' . Int32 . BooleanCompare . ValueNumberShare |  SupportedForPRE . CompareTrueIfLess |  CompareTrueIfEqual . { Int16 . Int16 } . sucmpge . sucmpgt . BadILOp . ifsucmple }.
	"275" lcmp initializeFrom: { 'lcmp' . Int32 . 0 . ValueNumberShare |  SupportedForPRE |  CondCodeComputation . Signum . { Int64 . Int64 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"276" fcmpl initializeFrom: { 'fcmpl' . Int32 . BooleanCompare . ValueNumberShare |  SupportedForPRE . CompareTrueIfLess . { Float . Float } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"277" fcmpg initializeFrom: { 'fcmpg' . Int32 . BooleanCompare . ValueNumberShare |  SupportedForPRE . CompareTrueIfGreater |  CompareTrueIfEqual . { Float . Float } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"278" dcmpl initializeFrom: { 'dcmpl' . Int32 . BooleanCompare . ValueNumberShare |  SupportedForPRE . CompareTrueIfLess . { Double . Double } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"279" dcmpg initializeFrom: { 'dcmpg' . Int32 . BooleanCompare . ValueNumberShare |  SupportedForPRE . CompareTrueIfGreater |  CompareTrueIfEqual . { Double . Double } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"280" ificmpeq initializeFrom: { 'ificmpeq' . NoType . BooleanCompare |  Branch |  TreeTop . 0 . CompareTrueIfEqual . { Int32 . Int32 } . ificmpeq . ificmpne . icmpeq . BadILOp }.
	"281" ificmpne initializeFrom: { 'ificmpne' . NoType . BooleanCompare |  Branch |  TreeTop . 0 . CompareTrueIfLess |  CompareTrueIfGreater . { Int32 . Int32 } . ificmpne . ificmpeq . icmpne . BadILOp }.
	"282" ificmplt initializeFrom: { 'ificmplt' . NoType . BooleanCompare |  Branch |  TreeTop . 0 . CompareTrueIfLess . { Int32 . Int32 } . ificmpgt . ificmpge . icmplt . BadILOp }.
	"283" ificmpge initializeFrom: { 'ificmpge' . NoType . BooleanCompare |  Branch |  TreeTop . 0 . CompareTrueIfGreater |  CompareTrueIfEqual . { Int32 . Int32 } . ificmple . ificmplt . icmpge . BadILOp }.
	"284" ificmpgt initializeFrom: { 'ificmpgt' . NoType . BooleanCompare |  Branch |  TreeTop . 0 . CompareTrueIfGreater . { Int32 . Int32 } . ificmplt . ificmple . icmpgt . BadILOp }.
	"285" ificmple initializeFrom: { 'ificmple' . NoType . BooleanCompare |  Branch |  TreeTop . 0 . CompareTrueIfLess |  CompareTrueIfEqual . { Int32 . Int32 } . ificmpge . ificmpgt . icmple . BadILOp }.
	"286" ifiucmplt initializeFrom: { 'ifiucmplt' . NoType . BooleanCompare |  Branch |  TreeTop . UnsignedCompare . CompareTrueIfLess . { Int32 . Int32 } . ifiucmpgt . ifiucmpge . iucmplt . BadILOp }.
	"287" ifiucmpge initializeFrom: { 'ifiucmpge' . NoType . BooleanCompare |  Branch |  TreeTop . UnsignedCompare . CompareTrueIfGreater |  CompareTrueIfEqual . { Int32 . Int32 } . ifiucmple . ifiucmplt . iucmpge . BadILOp }.
	"288" ifiucmpgt initializeFrom: { 'ifiucmpgt' . NoType . BooleanCompare |  Branch |  TreeTop . UnsignedCompare . CompareTrueIfGreater . { Int32 . Int32 } . ifiucmplt . ifiucmple . iucmpgt . BadILOp }.
	"289" ifiucmple initializeFrom: { 'ifiucmple' . NoType . BooleanCompare |  Branch |  TreeTop . UnsignedCompare . CompareTrueIfLess |  CompareTrueIfEqual . { Int32 . Int32 } . ifiucmpge . ifiucmpgt . iucmple . BadILOp }.
	"290" iflcmpeq initializeFrom: { 'iflcmpeq' . NoType . BooleanCompare |  Branch |  TreeTop . 0 . CompareTrueIfEqual . { Int64 . Int64 } . iflcmpeq . iflcmpne . lcmpeq . BadILOp }.
	"291" iflcmpne initializeFrom: { 'iflcmpne' . NoType . BooleanCompare |  Branch |  TreeTop . 0 . CompareTrueIfLess |  CompareTrueIfGreater . { Int64 . Int64 } . iflcmpne . iflcmpeq . lcmpne . BadILOp }.
	"292" iflcmplt initializeFrom: { 'iflcmplt' . NoType . BooleanCompare |  Branch |  TreeTop . 0 . CompareTrueIfLess . { Int64 . Int64 } . iflcmpgt . iflcmpge . lcmplt . BadILOp }.
	"293" iflcmpge initializeFrom: { 'iflcmpge' . NoType . BooleanCompare |  Branch |  TreeTop . 0 . CompareTrueIfGreater |  CompareTrueIfEqual . { Int64 . Int64 } . iflcmple . iflcmplt . lcmpge . BadILOp }.
	"294" iflcmpgt initializeFrom: { 'iflcmpgt' . NoType . BooleanCompare |  Branch |  TreeTop . 0 . CompareTrueIfGreater . { Int64 . Int64 } . iflcmplt . iflcmple . lcmpgt . BadILOp }.
	"295" iflcmple initializeFrom: { 'iflcmple' . NoType . BooleanCompare |  Branch |  TreeTop . 0 . CompareTrueIfLess |  CompareTrueIfEqual . { Int64 . Int64 } . iflcmpge . iflcmpgt . lcmple . BadILOp }.
	"296" iflucmplt initializeFrom: { 'iflucmplt' . NoType . BooleanCompare |  Branch |  TreeTop . UnsignedCompare . CompareTrueIfLess . { Int64 . Int64 } . iflucmpgt . iflucmpge . lucmplt . BadILOp }.
	"297" iflucmpge initializeFrom: { 'iflucmpge' . NoType . BooleanCompare |  Branch |  TreeTop . UnsignedCompare . CompareTrueIfGreater |  CompareTrueIfEqual . { Int64 . Int64 } . iflucmple . iflucmplt . lucmpge . BadILOp }.
	"298" iflucmpgt initializeFrom: { 'iflucmpgt' . NoType . BooleanCompare |  Branch |  TreeTop . UnsignedCompare . CompareTrueIfGreater . { Int64 . Int64 } . iflucmplt . iflucmple . lucmpgt . BadILOp }.
	"299" iflucmple initializeFrom: { 'iflucmple' . NoType . BooleanCompare |  Branch |  TreeTop . UnsignedCompare . CompareTrueIfLess |  CompareTrueIfEqual . { Int64 . Int64 } . iflucmpge . iflucmpgt . lucmple . BadILOp }.
]

{ #category : #initialization }
TRILOpcodes class >> initialize09a: UnspecifiedChildType [
	"Automatically generated by opcodesgen. DO NOT EDIT!"

	| NoType NoChildren Unspecified"Children" IndirectCallType BadILOp |

	NoType := Void.
	NoChildren := #().
	Unspecified"Children" := nil.
	IndirectCallType := Unspecified"Children".
	BadILOp := invalid.




















































































































































































































































































































	"300" iffcmpeq initializeFrom: { 'iffcmpeq' . NoType . BooleanCompare |  Branch |  TreeTop . 0 . CompareTrueIfEqual . { Float . Float } . iffcmpeq . iffcmpneu . fcmpeq . BadILOp }.
	"301" iffcmpne initializeFrom: { 'iffcmpne' . NoType . BooleanCompare |  Branch |  TreeTop . 0 . CompareTrueIfLess |  CompareTrueIfGreater . { Float . Float } . iffcmpne . iffcmpequ . fcmpne . BadILOp }.
	"302" iffcmplt initializeFrom: { 'iffcmplt' . NoType . BooleanCompare |  Branch |  TreeTop . 0 . CompareTrueIfLess . { Float . Float } . iffcmpgt . iffcmpgeu . fcmplt . BadILOp }.
	"303" iffcmpge initializeFrom: { 'iffcmpge' . NoType . BooleanCompare |  Branch |  TreeTop . 0 . CompareTrueIfGreater |  CompareTrueIfEqual . { Float . Float } . iffcmple . iffcmpltu . fcmpge . BadILOp }.
	"304" iffcmpgt initializeFrom: { 'iffcmpgt' . NoType . BooleanCompare |  Branch |  TreeTop . 0 . CompareTrueIfGreater . { Float . Float } . iffcmplt . iffcmpleu . fcmpgt . BadILOp }.
	"305" iffcmple initializeFrom: { 'iffcmple' . NoType . BooleanCompare |  Branch |  TreeTop . 0 . CompareTrueIfLess |  CompareTrueIfEqual . { Float . Float } . iffcmpge . iffcmpgtu . fcmple . BadILOp }.
	"306" iffcmpequ initializeFrom: { 'iffcmpequ' . NoType . BooleanCompare |  Branch |  TreeTop . 0 . CompareTrueIfEqual |  CompareTrueIfUnordered . { Float . Float } . iffcmpequ . iffcmpne . fcmpequ . BadILOp }.
	"307" iffcmpneu initializeFrom: { 'iffcmpneu' . NoType . BooleanCompare |  Branch |  TreeTop . 0 . CompareTrueIfLess |  CompareTrueIfGreater |  CompareTrueIfUnordered . { Float . Float } . iffcmpneu . iffcmpeq . fcmpneu . BadILOp }.
	"308" iffcmpltu initializeFrom: { 'iffcmpltu' . NoType . BooleanCompare |  Branch |  TreeTop . 0 . CompareTrueIfLess |  CompareTrueIfUnordered . { Float . Float } . iffcmpgtu . iffcmpge . fcmpltu . BadILOp }.
	"309" iffcmpgeu initializeFrom: { 'iffcmpgeu' . NoType . BooleanCompare |  Branch |  TreeTop . 0 . CompareTrueIfGreater |  CompareTrueIfEqual |  CompareTrueIfUnordered . { Float . Float } . iffcmpleu . iffcmplt . fcmpgeu . BadILOp }.
	"310" iffcmpgtu initializeFrom: { 'iffcmpgtu' . NoType . BooleanCompare |  Branch |  TreeTop . 0 . CompareTrueIfGreater |  CompareTrueIfUnordered . { Float . Float } . iffcmpltu . iffcmple . fcmpgtu . BadILOp }.
	"311" iffcmpleu initializeFrom: { 'iffcmpleu' . NoType . BooleanCompare |  Branch |  TreeTop . 0 . CompareTrueIfLess |  CompareTrueIfEqual |  CompareTrueIfUnordered . { Float . Float } . iffcmpgeu . iffcmpgt . fcmpleu . BadILOp }.
	"312" ifdcmpeq initializeFrom: { 'ifdcmpeq' . NoType . BooleanCompare |  Branch |  TreeTop . 0 . CompareTrueIfEqual . { Double . Double } . ifdcmpeq . ifdcmpneu . dcmpeq . BadILOp }.
	"313" ifdcmpne initializeFrom: { 'ifdcmpne' . NoType . BooleanCompare |  Branch |  TreeTop . 0 . CompareTrueIfLess |  CompareTrueIfGreater . { Double . Double } . ifdcmpne . ifdcmpequ . dcmpne . BadILOp }.
	"314" ifdcmplt initializeFrom: { 'ifdcmplt' . NoType . BooleanCompare |  Branch |  TreeTop . 0 . CompareTrueIfLess . { Double . Double } . ifdcmpgt . ifdcmpgeu . dcmplt . BadILOp }.
	"315" ifdcmpge initializeFrom: { 'ifdcmpge' . NoType . BooleanCompare |  Branch |  TreeTop . 0 . CompareTrueIfGreater |  CompareTrueIfEqual . { Double . Double } . ifdcmple . ifdcmpltu . dcmpge . BadILOp }.
	"316" ifdcmpgt initializeFrom: { 'ifdcmpgt' . NoType . BooleanCompare |  Branch |  TreeTop . 0 . CompareTrueIfGreater . { Double . Double } . ifdcmplt . ifdcmpleu . dcmpgt . BadILOp }.
	"317" ifdcmple initializeFrom: { 'ifdcmple' . NoType . BooleanCompare |  Branch |  TreeTop . 0 . CompareTrueIfLess |  CompareTrueIfEqual . { Double . Double } . ifdcmpge . ifdcmpgtu . dcmple . BadILOp }.
	"318" ifdcmpequ initializeFrom: { 'ifdcmpequ' . NoType . BooleanCompare |  Branch |  TreeTop . 0 . CompareTrueIfEqual |  CompareTrueIfUnordered . { Double . Double } . ifdcmpequ . ifdcmpne . dcmpequ . BadILOp }.
	"319" ifdcmpneu initializeFrom: { 'ifdcmpneu' . NoType . BooleanCompare |  Branch |  TreeTop . 0 . CompareTrueIfLess |  CompareTrueIfGreater |  CompareTrueIfUnordered . { Double . Double } . ifdcmpneu . ifdcmpeq . dcmpneu . BadILOp }.
	"320" ifdcmpltu initializeFrom: { 'ifdcmpltu' . NoType . BooleanCompare |  Branch |  TreeTop . 0 . CompareTrueIfLess |  CompareTrueIfUnordered . { Double . Double } . ifdcmpgtu . ifdcmpge . dcmpltu . BadILOp }.
	"321" ifdcmpgeu initializeFrom: { 'ifdcmpgeu' . NoType . BooleanCompare |  Branch |  TreeTop . 0 . CompareTrueIfGreater |  CompareTrueIfEqual |  CompareTrueIfUnordered . { Double . Double } . ifdcmpleu . ifdcmplt . dcmpgeu . BadILOp }.
	"322" ifdcmpgtu initializeFrom: { 'ifdcmpgtu' . NoType . BooleanCompare |  Branch |  TreeTop . 0 . CompareTrueIfGreater |  CompareTrueIfUnordered . { Double . Double } . ifdcmpltu . ifdcmple . dcmpgtu . BadILOp }.
	"323" ifdcmpleu initializeFrom: { 'ifdcmpleu' . NoType . BooleanCompare |  Branch |  TreeTop . 0 . CompareTrueIfLess |  CompareTrueIfEqual |  CompareTrueIfUnordered . { Double . Double } . ifdcmpgeu . ifdcmpgt . dcmpleu . BadILOp }.
	"324" ifacmpeq initializeFrom: { 'ifacmpeq' . NoType . BooleanCompare |  Branch |  TreeTop . 0 . CompareTrueIfEqual . { Address . Address } . ifacmpeq . ifacmpne . acmpeq . BadILOp }.
	"325" ifacmpne initializeFrom: { 'ifacmpne' . NoType . BooleanCompare |  Branch |  TreeTop . 0 . CompareTrueIfLess |  CompareTrueIfGreater . { Address . Address } . ifacmpne . ifacmpeq . acmpne . BadILOp }.
	"326" ifacmplt initializeFrom: { 'ifacmplt' . NoType . BooleanCompare |  Branch |  TreeTop . UnsignedCompare . CompareTrueIfLess . { Address . Address } . ifacmpgt . ifacmpge . acmplt . BadILOp }.
	"327" ifacmpge initializeFrom: { 'ifacmpge' . NoType . BooleanCompare |  Branch |  TreeTop . UnsignedCompare . CompareTrueIfGreater |  CompareTrueIfEqual . { Address . Address } . ifacmple . ifacmplt . acmpge . BadILOp }.
	"328" ifacmpgt initializeFrom: { 'ifacmpgt' . NoType . BooleanCompare |  Branch |  TreeTop . UnsignedCompare . CompareTrueIfGreater . { Address . Address } . ifacmplt . ifacmple . acmpgt . BadILOp }.
	"329" ifacmple initializeFrom: { 'ifacmple' . NoType . BooleanCompare |  Branch |  TreeTop . UnsignedCompare . CompareTrueIfLess |  CompareTrueIfEqual . { Address . Address } . ifacmpge . ifacmpgt . acmple . BadILOp }.
	"330" ifbcmpeq initializeFrom: { 'ifbcmpeq' . NoType . BooleanCompare |  Branch |  TreeTop . 0 . CompareTrueIfEqual . { Int8 . Int8 } . ifbcmpeq . ifbcmpne . bcmpeq . BadILOp }.
	"331" ifbcmpne initializeFrom: { 'ifbcmpne' . NoType . BooleanCompare |  Branch |  TreeTop . 0 . CompareTrueIfLess |  CompareTrueIfGreater . { Int8 . Int8 } . ifbcmpne . ifbcmpeq . bcmpne . BadILOp }.
	"332" ifbcmplt initializeFrom: { 'ifbcmplt' . NoType . BooleanCompare |  Branch |  TreeTop . 0 . CompareTrueIfLess . { Int8 . Int8 } . ifbcmpgt . ifbcmpge . bcmplt . BadILOp }.
	"333" ifbcmpge initializeFrom: { 'ifbcmpge' . NoType . BooleanCompare |  Branch |  TreeTop . 0 . CompareTrueIfGreater |  CompareTrueIfEqual . { Int8 . Int8 } . ifbcmple . ifbcmplt . bcmpge . BadILOp }.
	"334" ifbcmpgt initializeFrom: { 'ifbcmpgt' . NoType . BooleanCompare |  Branch |  TreeTop . 0 . CompareTrueIfGreater . { Int8 . Int8 } . ifbcmplt . ifbcmple . bcmpgt . BadILOp }.
	"335" ifbcmple initializeFrom: { 'ifbcmple' . NoType . BooleanCompare |  Branch |  TreeTop . 0 . CompareTrueIfLess |  CompareTrueIfEqual . { Int8 . Int8 } . ifbcmpge . ifbcmpgt . bcmple . BadILOp }.
	"336" ifbucmplt initializeFrom: { 'ifbucmplt' . NoType . BooleanCompare |  Branch |  TreeTop . UnsignedCompare . CompareTrueIfLess . { Int8 . Int8 } . ifbucmpgt . ifbucmpge . bucmplt . BadILOp }.
	"337" ifbucmpge initializeFrom: { 'ifbucmpge' . NoType . BooleanCompare |  Branch |  TreeTop . UnsignedCompare . CompareTrueIfGreater |  CompareTrueIfEqual . { Int8 . Int8 } . ifbucmple . ifbucmplt . bucmpge . BadILOp }.
	"338" ifbucmpgt initializeFrom: { 'ifbucmpgt' . NoType . BooleanCompare |  Branch |  TreeTop . UnsignedCompare . CompareTrueIfGreater . { Int8 . Int8 } . ifbucmplt . ifbucmple . bucmpgt . BadILOp }.
	"339" ifbucmple initializeFrom: { 'ifbucmple' . NoType . BooleanCompare |  Branch |  TreeTop . UnsignedCompare . CompareTrueIfLess |  CompareTrueIfEqual . { Int8 . Int8 } . ifbucmpge . ifbucmpgt . bucmple . BadILOp }.
	"340" ifscmpeq initializeFrom: { 'ifscmpeq' . NoType . BooleanCompare |  Branch |  TreeTop . 0 . CompareTrueIfEqual . { Int16 . Int16 } . ifscmpeq . ifscmpne . scmpeq . BadILOp }.
	"341" ifscmpne initializeFrom: { 'ifscmpne' . NoType . BooleanCompare |  Branch |  TreeTop . 0 . CompareTrueIfLess |  CompareTrueIfGreater . { Int16 . Int16 } . ifscmpne . ifscmpeq . scmpne . BadILOp }.
	"342" ifscmplt initializeFrom: { 'ifscmplt' . NoType . BooleanCompare |  Branch |  TreeTop . 0 . CompareTrueIfLess . { Int16 . Int16 } . ifscmpgt . ifscmpge . scmplt . BadILOp }.
	"343" ifscmpge initializeFrom: { 'ifscmpge' . NoType . BooleanCompare |  Branch |  TreeTop . 0 . CompareTrueIfGreater |  CompareTrueIfEqual . { Int16 . Int16 } . ifscmple . ifscmplt . scmpge . BadILOp }.
	"344" ifscmpgt initializeFrom: { 'ifscmpgt' . NoType . BooleanCompare |  Branch |  TreeTop . 0 . CompareTrueIfGreater . { Int16 . Int16 } . ifscmplt . ifscmple . scmpgt . BadILOp }.
	"345" ifscmple initializeFrom: { 'ifscmple' . NoType . BooleanCompare |  Branch |  TreeTop . 0 . CompareTrueIfLess |  CompareTrueIfEqual . { Int16 . Int16 } . ifscmpge . ifscmpgt . scmple . BadILOp }.
	"346" ifsucmplt initializeFrom: { 'ifsucmplt' . NoType . BooleanCompare |  Branch |  TreeTop . UnsignedCompare . CompareTrueIfLess . { Int16 . Int16 } . ifsucmpgt . ifsucmpge . sucmplt . BadILOp }.
	"347" ifsucmpge initializeFrom: { 'ifsucmpge' . NoType . BooleanCompare |  Branch |  TreeTop . UnsignedCompare . CompareTrueIfGreater |  CompareTrueIfEqual . { Int16 . Int16 } . ifsucmple . ifsucmplt . sucmpge . BadILOp }.
	"348" ifsucmpgt initializeFrom: { 'ifsucmpgt' . NoType . BooleanCompare |  Branch |  TreeTop . UnsignedCompare . CompareTrueIfGreater . { Int16 . Int16 } . ifsucmplt . ifsucmple . sucmpgt . BadILOp }.
	"349" ifsucmple initializeFrom: { 'ifsucmple' . NoType . BooleanCompare |  Branch |  TreeTop . UnsignedCompare . CompareTrueIfLess |  CompareTrueIfEqual . { Int16 . Int16 } . ifsucmpge . ifsucmpgt . sucmple . BadILOp }.
]

{ #category : #initialization }
TRILOpcodes class >> initialize09b: UnspecifiedChildType [
	"Automatically generated by opcodesgen. DO NOT EDIT!"

	| NoType NoChildren Unspecified"Children" IndirectCallType BadILOp |

	NoType := Void.
	NoChildren := #().
	Unspecified"Children" := nil.
	IndirectCallType := Unspecified"Children".
	BadILOp := invalid.






































































































































































































































































































































































	"350" loadaddr initializeFrom: { 'loadaddr' . Address . HasSymbolRef . ValueNumberShare |  SupportedForPRE|  MayUseSystemStack |  LoadAddress . LikeUse . NoChildren  . BadILOp . BadILOp . BadILOp . BadILOp }.
	"351" zerochk initializeFrom: { 'zerochk' . NoType . TreeTop |  HasSymbolRef . CanRaiseException |  Check|  MayUseSystemStack . 0 . { Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"352" iregload initializeFrom: { 'iregload' . Int32 . LoadReg . 0 . 0 . NoChildren  . BadILOp . BadILOp . BadILOp . BadILOp }.
	"353" aregload initializeFrom: { 'aregload' . Address . LoadReg . 0 . 0 . NoChildren  . BadILOp . BadILOp . BadILOp . BadILOp }.
	"354" lregload initializeFrom: { 'lregload' . Int64 . LoadReg . 0 . 0 . NoChildren  . BadILOp . BadILOp . BadILOp . BadILOp }.
	"355" fregload initializeFrom: { 'fregload' . Float . LoadReg . 0 . 0 . NoChildren  . BadILOp . BadILOp . BadILOp . BadILOp }.
	"356" dregload initializeFrom: { 'dregload' . Double . LoadReg . 0 . 0 . NoChildren  . BadILOp . BadILOp . BadILOp . BadILOp }.
	"357" sregload initializeFrom: { 'sregload' . Int16 . LoadReg . 0 . 0 . NoChildren  . BadILOp . BadILOp . BadILOp . BadILOp }.
	"358" bregload initializeFrom: { 'bregload' . Int8 . LoadReg . 0 . 0 . NoChildren  . BadILOp . BadILOp . BadILOp . BadILOp }.
	"359" iregstore initializeFrom: { 'iregstore' . Int32 . StoreReg |  TreeTop . 0 . 0 . { Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"360" aregstore initializeFrom: { 'aregstore' . Address . StoreReg |  TreeTop . 0 . 0 . { Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"361" lregstore initializeFrom: { 'lregstore' . Int64 . StoreReg |  TreeTop . 0 . 0 . { Int64 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"362" fregstore initializeFrom: { 'fregstore' . Float . StoreReg |  TreeTop . 0 . 0 . { Float } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"363" dregstore initializeFrom: { 'dregstore' . Double . StoreReg |  TreeTop . 0 . 0 . { Double } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"364" sregstore initializeFrom: { 'sregstore' . Int16 . StoreReg |  TreeTop . 0 . 0 . { Int16 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"365" bregstore initializeFrom: { 'bregstore' . Int8 . StoreReg |  TreeTop . 0 . 0 . { Int8 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"366" glregdeps initializeFrom: { 'glregdeps' . NoType . 0 . 0 . 0 . Unspecified . BadILOp . BadILOp . BadILOp . BadILOp }.
	"367" iselect initializeFrom: { 'iselect' . Int32 . 0 . ValueNumberShare |  SupportedForPRE |  Select . 0 . { Int32 . Int32 . Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"368" lselect initializeFrom: { 'lselect' . Int64 . 0 . ValueNumberShare |  SupportedForPRE |  Select . 0 . { Int32 . Int64 . Int64 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"369" bselect initializeFrom: { 'bselect' . Int8 . 0 . ValueNumberShare |  SupportedForPRE |  Select . 0 . { Int32 . Int8 . Int8 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"370" sselect initializeFrom: { 'sselect' . Int16 . 0 . ValueNumberShare |  SupportedForPRE |  Select . 0 . { Int32 . Int16 . Int16 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"371" aselect initializeFrom: { 'aselect' . Address . 0 . ValueNumberShare |  SupportedForPRE |  Select . 0 . { Int32 . Address . Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"372" fselect initializeFrom: { 'fselect' . Float . 0 . ValueNumberShare |  SupportedForPRE |  Select . 0 . { Int32 . Float . Float } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"373" dselect initializeFrom: { 'dselect' . Double . 0 . ValueNumberShare |  SupportedForPRE |  Select . 0 . { Int32 . Double . Double } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"374" treetop initializeFrom: { 'treetop' . NoType . TreeTop . 0 . 0 . {  UnspecifiedChildType } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"375" methodenterhook initializeFrom: { 'methodenterhook' . NoType . TreeTop |  HasSymbolRef . MustBeLowered|  MayUseSystemStack . 0 . NoChildren  . BadILOp . BadILOp . BadILOp . BadILOp }.
	"376" methodexithook initializeFrom: { 'methodexithook' . NoType . TreeTop |  HasSymbolRef . MustBeLowered|  MayUseSystemStack . 0 . NoChildren  . BadILOp . BadILOp . BadILOp . BadILOp }.
	"377" passthrough initializeFrom: { 'passthrough' . NoType . 0 . ValueNumberShare . 0 . {  UnspecifiedChildType } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"378" compressedrefs initializeFrom: { 'compressedrefs' . Address . TreeTop . 0 . 0 . {  UnspecifiedChildType . Int64 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"379" bbstart initializeFrom: { 'bbstart' . NoType . TreeTop . 0 . 0 . NoChildren  . BadILOp . BadILOp . BadILOp . BadILOp }.
	"380" bbend initializeFrom: { 'bbend' . NoType . TreeTop . 0 . 0 . NoChildren  . BadILOp . BadILOp . BadILOp . BadILOp }.
	"381" f2iu initializeFrom: { 'f2iu' . Int32 . Conversion . ValueNumberShare |  SupportedForPRE . 0 . { Float } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"382" f2lu initializeFrom: { 'f2lu' . Int64 . Conversion . ValueNumberShare |  SupportedForPRE . 0 . { Float } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"383" f2bu initializeFrom: { 'f2bu' . Int8 . Conversion . ValueNumberShare |  SupportedForPRE . 0 . { Float } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"384" f2c initializeFrom: { 'f2c' . Int16 . Conversion . ValueNumberShare |  SupportedForPRE . 0 . { Float } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"385" d2iu initializeFrom: { 'd2iu' . Int32 . Conversion . ValueNumberShare |  SupportedForPRE . 0 . { Double } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"386" d2lu initializeFrom: { 'd2lu' . Int64 . Conversion . ValueNumberShare |  SupportedForPRE . 0 . { Double } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"387" d2bu initializeFrom: { 'd2bu' . Int8 . Conversion . ValueNumberShare |  SupportedForPRE . 0 . { Double } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"388" d2c initializeFrom: { 'd2c' . Int16 . Conversion . ValueNumberShare |  SupportedForPRE . 0 . { Double } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"389" monent initializeFrom: { 'monent' . NoType . TreeTop |  HasSymbolRef . CanRaiseException|  MayUseSystemStack . LikeDef . {  UnspecifiedChildType } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"390" monexit initializeFrom: { 'monexit' . NoType . TreeTop |  HasSymbolRef . CanRaiseException|  MayUseSystemStack . LikeDef . {  UnspecifiedChildType } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"391" monexitfence initializeFrom: { 'monexitfence' . NoType . TreeTop . CanRaiseException|  MayUseSystemStack . 0 . NoChildren  . BadILOp . BadILOp . BadILOp . BadILOp }.
	"392" tstart initializeFrom: { 'tstart' . NoType . HasSymbolRef |  TreeTop . JumpWithMultipleTargets . HasBranchChild . { NoType . NoType . NoType } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"393" tfinish initializeFrom: { 'tfinish' . NoType . HasSymbolRef |  TreeTop . 0 . 0 . NoChildren  . BadILOp . BadILOp . BadILOp . BadILOp }.
	"394" tabort initializeFrom: { 'tabort' . NoType . HasSymbolRef |  TreeTop . 0 . 0 . NoChildren  . BadILOp . BadILOp . BadILOp . BadILOp }.
	"395" instanceof initializeFrom: { 'instanceof' . Int32 . HasSymbolRef . MayUseSystemStack . 0 . { Address . Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"396" checkcast initializeFrom: { 'checkcast' . Address . TreeTop |  HasSymbolRef . CanRaiseException |  Check |  CheckCast|  MayUseSystemStack . 0 . { UnspecifiedChildType . UnspecifiedChildType } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"397" checkcastandnullchk initializeFrom: { 'checkcastandnullchk' . Address . TreeTop |  HasSymbolRef . CanRaiseException |  Check |  CheckCast|  MayUseSystemStack . 0 . { UnspecifiedChildType . UnspecifiedChildType } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"398" new initializeFrom: { 'new' . Address . HasSymbolRef . CanRaiseException|  MayUseSystemStack |  New . LikeDef . {  UnspecifiedChildType } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"399" newvalue initializeFrom: { 'newvalue' . Address . HasSymbolRef . CanRaiseException|  MayUseSystemStack |  New . LikeDef . Unspecified . BadILOp . BadILOp . BadILOp . BadILOp }.
]

{ #category : #initialization }
TRILOpcodes class >> initialize10a: UnspecifiedChildType [
	"Automatically generated by opcodesgen. DO NOT EDIT!"

	| NoType NoChildren Unspecified"Children" IndirectCallType BadILOp |

	NoType := Void.
	NoChildren := #().
	Unspecified"Children" := nil.
	IndirectCallType := Unspecified"Children".
	BadILOp := invalid.
























































































































































































































































































































































































































	"400" newarray initializeFrom: { 'newarray' . Address . HasSymbolRef . CanRaiseException|  MayUseSystemStack |  New . LikeDef . { UnspecifiedChildType . UnspecifiedChildType } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"401" anewarray initializeFrom: { 'anewarray' . Address . HasSymbolRef . CanRaiseException|  MayUseSystemStack |  New . LikeDef . { UnspecifiedChildType . UnspecifiedChildType } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"402" variablenew initializeFrom: { 'variablenew' . Address . HasSymbolRef . CanRaiseException|  MayUseSystemStack . LikeDef . {  UnspecifiedChildType } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"403" variablenewarray initializeFrom: { 'variablenewarray' . Address . HasSymbolRef . CanRaiseException|  MayUseSystemStack . LikeDef . {  UnspecifiedChildType } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"404" multianewarray initializeFrom: { 'multianewarray' . Address . HasSymbolRef . MustBeLowered |  CanRaiseException|  MayUseSystemStack |  New . LikeDef . {  UnspecifiedChildType } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"405" arraylength initializeFrom: { 'arraylength' . Int32 . 0 . MustBeLowered |  ValueNumberShare |  SupportedForPRE . ArrayLength . {  UnspecifiedChildType } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"406" contigarraylength initializeFrom: { 'contigarraylength' . Int32 . 0 . MustBeLowered |  ValueNumberShare |  SupportedForPRE . ArrayLength . {  UnspecifiedChildType } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"407" discontigarraylength initializeFrom: { 'discontigarraylength' . Int32 . 0 . MustBeLowered |  ValueNumberShare |  SupportedForPRE . ArrayLength . {  UnspecifiedChildType } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"408" icalli initializeFrom: { 'icalli' . Int32 . Indirect |  Call |  HasSymbolRef . CanRaiseException |  SupportedForPRE|  MayUseSystemStack . LikeUse |  LikeDef . IndirectCallType . BadILOp . BadILOp . BadILOp . BadILOp }.
	"409" lcalli initializeFrom: { 'lcalli' . Int64 . Indirect |  Call |  HasSymbolRef . CanRaiseException |  SupportedForPRE|  MayUseSystemStack . LikeUse |  LikeDef . IndirectCallType . BadILOp . BadILOp . BadILOp . BadILOp }.
	"410" fcalli initializeFrom: { 'fcalli' . Float . Indirect |  Call |  HasSymbolRef . CanRaiseException |  SupportedForPRE|  MayUseSystemStack . LikeUse |  LikeDef . IndirectCallType . BadILOp . BadILOp . BadILOp . BadILOp }.
	"411" dcalli initializeFrom: { 'dcalli' . Double . Indirect |  Call |  HasSymbolRef . CanRaiseException |  SupportedForPRE|  MayUseSystemStack . LikeUse |  LikeDef . IndirectCallType . BadILOp . BadILOp . BadILOp . BadILOp }.
	"412" acalli initializeFrom: { 'acalli' . Address . Indirect |  Call |  HasSymbolRef . CanRaiseException |  SupportedForPRE|  MayUseSystemStack . LikeUse |  LikeDef . IndirectCallType . BadILOp . BadILOp . BadILOp . BadILOp }.
	"413" calli initializeFrom: { 'calli' . NoType . Indirect |  Call |  HasSymbolRef . CanRaiseException |  SupportedForPRE|  MayUseSystemStack . LikeUse |  LikeDef . IndirectCallType . BadILOp . BadILOp . BadILOp . BadILOp }.
	"414" fence initializeFrom: { 'fence' . NoType . TreeTop |  HasSymbolRef . 0 . Fence |  LikeUse |  LikeDef . NoChildren  . BadILOp . BadILOp . BadILOp . BadILOp }.
	"415" luaddh initializeFrom: { 'luaddh' . Int64 . Commutative |  Associative |  Add . ValueNumberShare |  SupportedForPRE . LikeUse . { Int64 . Int64 } . luaddh . BadILOp . BadILOp . BadILOp }.
	"416" aiadd initializeFrom: { 'aiadd' . Address . Commutative |  Associative |  Add . ValueNumberShare . LikeUse . { Address . Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"417" aladd initializeFrom: { 'aladd' . Address . Commutative |  Associative |  Add . ValueNumberShare . LikeUse . { Address . Int64 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"418" lusubh initializeFrom: { 'lusubh' . Int64 . Sub . ValueNumberShare |  SupportedForPRE . LikeUse . { Int64 . Int64 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"419" imulh initializeFrom: { 'imulh' . Int32 . Commutative |  Associative |  Mul . ValueNumberShare |  SupportedForPRE . LikeUse . { Int32 . Int32 } . imulh . BadILOp . BadILOp . BadILOp }.
	"420" iumulh initializeFrom: { 'iumulh' . Int32 . Commutative |  Associative |  Mul . ValueNumberShare |  SupportedForPRE . LikeUse . { Int32 . Int32 } . iumulh . BadILOp . BadILOp . BadILOp }.
	"421" lmulh initializeFrom: { 'lmulh' . Int64 . Commutative |  Associative |  Mul . ValueNumberShare |  SupportedForPRE . LikeUse . { Int64 . Int64 } . lmulh . BadILOp . BadILOp . BadILOp }.
	"422" lumulh initializeFrom: { 'lumulh' . Int64 . Commutative |  Associative |  Mul . ValueNumberShare |  SupportedForPRE . LikeUse . { Int64 . Int64 } . lumulh . BadILOp . BadILOp . BadILOp }.
	"423" ibits2f initializeFrom: { 'ibits2f' . Float . 0 . ValueNumberShare |  SupportedForPRE . 0 . { Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"424" fbits2i initializeFrom: { 'fbits2i' . Int32 . 0 . ValueNumberShare |  SupportedForPRE . 0 . { Float } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"425" lbits2d initializeFrom: { 'lbits2d' . Double . 0 . ValueNumberShare |  SupportedForPRE . 0 . { Int64 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"426" dbits2l initializeFrom: { 'dbits2l' . Int64 . 0 . ValueNumberShare |  SupportedForPRE . 0 . { Double } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"427" lookup initializeFrom: { 'lookup' . NoType . TreeTop |  Switch . JumpWithMultipleTargets . HasBranchChild . Unspecified . BadILOp . BadILOp . BadILOp . BadILOp }.
	"428" case initializeFrom: { 'case' . NoType . Branch |  TreeTop . 0 . 0 . NoChildren  . BadILOp . BadILOp . BadILOp . BadILOp }.
	"429" table initializeFrom: { 'table' . NoType . TreeTop |  Switch . JumpWithMultipleTargets . HasBranchChild . Unspecified . BadILOp . BadILOp . BadILOp . BadILOp }.
	"430" exceptionrangefence initializeFrom: { 'exceptionrangefence' . NoType . TreeTop |  HasSymbolRef . 0 . ExceptionRangeFence . NoChildren  . BadILOp . BadILOp . BadILOp . BadILOp }.
	"431" nullchk initializeFrom: { 'nullchk' . Address . TreeTop |  HasSymbolRef . ValueNumberShare |  CanRaiseException |  Check |  NullCheck|  MayUseSystemStack . 0 . {  UnspecifiedChildType } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"432" resolvechk initializeFrom: { 'resolvechk' . Address . TreeTop |  HasSymbolRef . ValueNumberShare |  CanRaiseException |  Check |  ResolveCheck|  MayUseSystemStack . LikeDef . {  UnspecifiedChildType } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"433" resolveandnullchk initializeFrom: { 'resolveandnullchk' . Address . TreeTop |  HasSymbolRef . ValueNumberShare |  CanRaiseException |  Check |  NullCheck |  ResolveCheck|  MayUseSystemStack . LikeDef . {  UnspecifiedChildType } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"434" divchk initializeFrom: { 'divchk' . NoType . TreeTop |  HasSymbolRef . CanRaiseException |  Check|  MayUseSystemStack . 0 . {  UnspecifiedChildType } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"435" overflowchk initializeFrom: { 'overflowchk' . NoType . TreeTop |  HasSymbolRef . Check|  MayUseSystemStack |  CanRaiseException . 0 . { UnspecifiedChildType . UnspecifiedChildType . UnspecifiedChildType } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"436" unsignedoverflowchk initializeFrom: { 'unsignedoverflowchk' . NoType . TreeTop |  HasSymbolRef . Check|  MayUseSystemStack |  CanRaiseException . 0 . { UnspecifiedChildType . UnspecifiedChildType . UnspecifiedChildType } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"437" bndchk initializeFrom: { 'bndchk' . Int32 . TreeTop |  HasSymbolRef . ValueNumberShare |  CanRaiseException |  Check |  BndCheck|  MayUseSystemStack . 0 . { UnspecifiedChildType . UnspecifiedChildType } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"438" arraycopybndchk initializeFrom: { 'arraycopybndchk' . Int32 . TreeTop |  HasSymbolRef . ValueNumberShare |  CanRaiseException |  Check |  BndCheck|  MayUseSystemStack . 0 . { UnspecifiedChildType . UnspecifiedChildType } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"439" bndchkwithspinechk initializeFrom: { 'bndchkwithspinechk' . Int32 . TreeTop |  HasSymbolRef . ValueNumberShare |  CanRaiseException |  Check |  BndCheck|  MayUseSystemStack . SpineCheck . Unspecified . BadILOp . BadILOp . BadILOp . BadILOp }.
	"440" spinechk initializeFrom: { 'spinechk' . Int32 . TreeTop |  HasSymbolRef . ValueNumberShare |  Check . SpineCheck . Unspecified . BadILOp . BadILOp . BadILOp . BadILOp }.
	"441" arraystorechk initializeFrom: { 'arraystorechk' . Address . TreeTop |  HasSymbolRef . ValueNumberShare |  CanRaiseException |  Check|  MayUseSystemStack . 0 . {  UnspecifiedChildType } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"442" arraychk initializeFrom: { 'arraychk' . Address . TreeTop |  HasSymbolRef . ValueNumberShare |  CanRaiseException |  Check|  MayUseSystemStack . 0 . { Address . Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"443" arraycopy initializeFrom: { 'arraycopy' . NoType . Call |  HasSymbolRef . MayUseSystemStack |  CanRaiseException | 0 . LikeUse |  LikeDef |  SkipDynamicLitPoolOnInts . Unspecified . BadILOp . BadILOp . BadILOp . BadILOp }.
	"444" arrayset initializeFrom: { 'arrayset' . NoType . Call |  HasSymbolRef . 0 . LikeUse |  LikeDef |  SkipDynamicLitPoolOnInts . Unspecified . BadILOp . BadILOp . BadILOp . BadILOp }.
	"445" arraytranslate initializeFrom: { 'arraytranslate' . Int32 . Call |  HasSymbolRef . 0 . LikeUse |  LikeDef . Unspecified . BadILOp . BadILOp . BadILOp . BadILOp }.
	"446" arraytranslateandtest initializeFrom: { 'arraytranslateandtest' . Int32 . Call |  HasSymbolRef . CanRaiseException |  BndCheck . LikeUse |  LikeDef . Unspecified . BadILOp . BadILOp . BadILOp . BadILOp }.
	"447" long2string initializeFrom: { 'long2string' . NoType . Call |  HasSymbolRef . 0 . LikeUse |  LikeDef . Unspecified . BadILOp . BadILOp . BadILOp . BadILOp }.
	"448" bitopmem initializeFrom: { 'bitopmem' . Int32 . Call |  HasSymbolRef . CondCodeComputation . LikeUse |  LikeDef |  SkipDynamicLitPoolOnInts . Unspecified . BadILOp . BadILOp . BadILOp . BadILOp }.
	"449" arraycmp initializeFrom: { 'arraycmp' . Int32 . Call |  HasSymbolRef . CondCodeComputation . LikeUse |  LikeDef |  SkipDynamicLitPoolOnInts . { Address . Address . Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
]

{ #category : #initialization }
TRILOpcodes class >> initialize10b: UnspecifiedChildType [
	"Automatically generated by opcodesgen. DO NOT EDIT!"

	| NoType NoChildren Unspecified"Children" IndirectCallType BadILOp |

	NoType := Void.
	NoChildren := #().
	Unspecified"Children" := nil.
	IndirectCallType := Unspecified"Children".
	BadILOp := invalid.










































































































































































































































































































































































































































































	"450" allocationfence initializeFrom: { 'allocationfence' . NoType . TreeTop . 0 . 0 . NoChildren  . BadILOp . BadILOp . BadILOp . BadILOp }.
	"451" loadfence initializeFrom: { 'loadfence' . NoType . TreeTop |  HasSymbolRef . 0 . LikeUse |  LikeDef . Unspecified . BadILOp . BadILOp . BadILOp . BadILOp }.
	"452" storefence initializeFrom: { 'storefence' . NoType . TreeTop |  HasSymbolRef . 0 . LikeUse |  LikeDef . Unspecified . BadILOp . BadILOp . BadILOp . BadILOp }.
	"453" fullfence initializeFrom: { 'fullfence' . NoType . TreeTop |  HasSymbolRef . 0 . LikeUse |  LikeDef . Unspecified . BadILOp . BadILOp . BadILOp . BadILOp }.
	"454" computecc initializeFrom: { 'computecc' . Int8 . 0 . ValueNumberShare |  SupportedForPRE |  CondCodeComputation . 0 . Unspecified . BadILOp . BadILOp . BadILOp . BadILOp }.
	"455" butest initializeFrom: { 'butest' . Int32 . 0 . ValueNumberShare |  SupportedForPRE |  CondCodeComputation . 0 . Unspecified . BadILOp . BadILOp . BadILOp . BadILOp }.
	"456" sutest initializeFrom: { 'sutest' . Int32 . 0 . ValueNumberShare |  SupportedForPRE |  CondCodeComputation . 0 . Unspecified . BadILOp . BadILOp . BadILOp . BadILOp }.
	"457" bucmp initializeFrom: { 'bucmp' . Int32 . 0 . ValueNumberShare |  SupportedForPRE |  UnsignedCompare |  CondCodeComputation . Signum . { Int8 . Int8 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"458" bcmp initializeFrom: { 'bcmp' . Int32 . 0 . ValueNumberShare |  SupportedForPRE |  CondCodeComputation . Signum . { Int8 . Int8 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"459" sucmp initializeFrom: { 'sucmp' . Int32 . 0 . ValueNumberShare |  SupportedForPRE |  UnsignedCompare |  CondCodeComputation . Signum . { Int16 . Int16 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"460" scmp initializeFrom: { 'scmp' . Int32 . 0 . ValueNumberShare |  SupportedForPRE |  CondCodeComputation . Signum . { Int16 . Int16 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"461" iucmp initializeFrom: { 'iucmp' . Int32 . 0 . ValueNumberShare |  SupportedForPRE |  UnsignedCompare |  CondCodeComputation . Signum . { Int32 . Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"462" icmp initializeFrom: { 'icmp' . Int32 . 0 . ValueNumberShare |  SupportedForPRE |  CondCodeComputation . Signum . { Int32 . Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"463" lucmp initializeFrom: { 'lucmp' . Int32 . 0 . ValueNumberShare |  SupportedForPRE |  UnsignedCompare |  CondCodeComputation . Signum . { Int64 . Int64 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"464" ificmpo initializeFrom: { 'ificmpo' . NoType . BooleanCompare |  Branch |  TreeTop . OverflowCompare . 0 . { Int32 . Int32 } . BadILOp . ificmpno . BadILOp . BadILOp }.
	"465" ificmpno initializeFrom: { 'ificmpno' . NoType . BooleanCompare |  Branch |  TreeTop . OverflowCompare . 0 . { Int32 . Int32 } . BadILOp . ificmpo . BadILOp . BadILOp }.
	"466" iflcmpo initializeFrom: { 'iflcmpo' . NoType . BooleanCompare |  Branch |  TreeTop . OverflowCompare . 0 . { Int64 . Int64 } . BadILOp . iflcmpno . BadILOp . BadILOp }.
	"467" iflcmpno initializeFrom: { 'iflcmpno' . NoType . BooleanCompare |  Branch |  TreeTop . OverflowCompare . 0 . { Int64 . Int64 } . BadILOp . iflcmpo . BadILOp . BadILOp }.
	"468" ificmno initializeFrom: { 'ificmno' . NoType . BooleanCompare |  Branch |  TreeTop . OverflowCompare . 0 . { Int32 . Int32 } . BadILOp . ificmnno . BadILOp . BadILOp }.
	"469" ificmnno initializeFrom: { 'ificmnno' . NoType . BooleanCompare |  Branch |  TreeTop . OverflowCompare . 0 . { Int32 . Int32 } . BadILOp . ificmno . BadILOp . BadILOp }.
	"470" iflcmno initializeFrom: { 'iflcmno' . NoType . BooleanCompare |  Branch |  TreeTop . OverflowCompare . 0 . { Int64 . Int64 } . BadILOp . iflcmnno . BadILOp . BadILOp }.
	"471" iflcmnno initializeFrom: { 'iflcmnno' . NoType . BooleanCompare |  Branch |  TreeTop . OverflowCompare . 0 . { Int64 . Int64 } . BadILOp . iflcmno . BadILOp . BadILOp }.
	"472" iuaddc initializeFrom: { 'iuaddc' . Int32 . 0 . ValueNumberShare |  SupportedForPRE |  SelectAdd . 0 . { Int32 . Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"473" luaddc initializeFrom: { 'luaddc' . Int64 . 0 . ValueNumberShare |  SupportedForPRE |  SelectAdd . 0 . { Int64 . Int64 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"474" iusubb initializeFrom: { 'iusubb' . Int32 . 0 . ValueNumberShare |  SupportedForPRE |  SelectSub . 0 . { Int32 . Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"475" lusubb initializeFrom: { 'lusubb' . Int64 . 0 . ValueNumberShare |  SupportedForPRE |  SelectSub . 0 . { Int64 . Int64 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"476" icmpset initializeFrom: { 'icmpset' . Int32 . Call |  HasSymbolRef . 0 . LikeUse |  LikeDef . { Address . Int32 . Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"477" lcmpset initializeFrom: { 'lcmpset' . Int32 . Call |  HasSymbolRef . 0 . LikeUse |  LikeDef . { Address . Int64 . Int64 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"478" bztestnset initializeFrom: { 'bztestnset' . Int8 . Call |  HasSymbolRef . 0 . LikeUse |  LikeDef . { Address .  UnspecifiedChildType } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"479" ibatomicor initializeFrom: { 'ibatomicor' . NoType . LoadVar |  Store |  Indirect |  TreeTop |  HasSymbolRef . ValueNumberShare|  MayUseSystemStack . LikeUse |  LikeDef . { Address . Int8 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"480" isatomicor initializeFrom: { 'isatomicor' . NoType . LoadVar |  Store |  Indirect |  TreeTop |  HasSymbolRef . ValueNumberShare|  MayUseSystemStack . LikeUse |  LikeDef . { Address . Int16 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"481" iiatomicor initializeFrom: { 'iiatomicor' . NoType . LoadVar |  Store |  Indirect |  TreeTop |  HasSymbolRef . ValueNumberShare|  MayUseSystemStack . LikeUse |  LikeDef . { Address . Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"482" ilatomicor initializeFrom: { 'ilatomicor' . NoType . LoadVar |  Store |  Indirect |  TreeTop |  HasSymbolRef . ValueNumberShare|  MayUseSystemStack . LikeUse |  LikeDef . { Address . Int64 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"483" branch initializeFrom: { 'branch' . NoType . Branch |  CompBranchOnly |  TreeTop . 0 . 0 . NoChildren  . BadILOp . BadILOp . BadILOp . BadILOp }.
	"484" igoto initializeFrom: { 'igoto' . NoType . TreeTop . JumpWithMultipleTargets . 0 . { Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"485" fsqrt initializeFrom: { 'fsqrt' . Float . 0 . ValueNumberShare |  SupportedForPRE . 0 . { Float } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"486" dsqrt initializeFrom: { 'dsqrt' . Double . 0 . ValueNumberShare |  SupportedForPRE . 0 . { Double } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"487" dfloor initializeFrom: { 'dfloor' . Double . 0 . ValueNumberShare |  SupportedForPRE . 0 . { Double } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"488" ffloor initializeFrom: { 'ffloor' . Float . 0 . ValueNumberShare |  SupportedForPRE . 0 . { Float } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"489" dceil initializeFrom: { 'dceil' . Double . 0 . ValueNumberShare |  SupportedForPRE . 0 . { Double } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"490" fceil initializeFrom: { 'fceil' . Float . 0 . ValueNumberShare |  SupportedForPRE . 0 . { Float } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"491" imax initializeFrom: { 'imax' . Int32 . 0 . ValueNumberShare |  SupportedForPRE |  Max . 0 . { Int32 . Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"492" iumax initializeFrom: { 'iumax' . Int32 . 0 . ValueNumberShare |  SupportedForPRE |  Max . 0 . { Int32 . Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"493" lmax initializeFrom: { 'lmax' . Int64 . 0 . ValueNumberShare |  SupportedForPRE |  Max . 0 . { Int64 . Int64 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"494" lumax initializeFrom: { 'lumax' . Int64 . 0 . ValueNumberShare |  SupportedForPRE |  Max . 0 . { Int64 . Int64 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"495" fmax initializeFrom: { 'fmax' . Float . 0 . ValueNumberShare |  SupportedForPRE |  Max . 0 . { Float . Float } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"496" dmax initializeFrom: { 'dmax' . Double . 0 . ValueNumberShare |  SupportedForPRE |  Max . 0 . { Double . Double } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"497" imin initializeFrom: { 'imin' . Int32 . 0 . ValueNumberShare |  SupportedForPRE |  Min . 0 . { Int32 . Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"498" iumin initializeFrom: { 'iumin' . Int32 . 0 . ValueNumberShare |  SupportedForPRE |  Min . 0 . { Int32 . Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"499" lmin initializeFrom: { 'lmin' . Int64 . 0 . ValueNumberShare |  SupportedForPRE |  Min . 0 . { Int64 . Int64 } . BadILOp . BadILOp . BadILOp . BadILOp }.
]

{ #category : #initialization }
TRILOpcodes class >> initialize11: UnspecifiedChildType [
	"Automatically generated by opcodesgen. DO NOT EDIT!"

	| NoType NoChildren Unspecified"Children" IndirectCallType BadILOp |

	NoType := Void.
	NoChildren := #().
	Unspecified"Children" := nil.
	IndirectCallType := Unspecified"Children".
	BadILOp := invalid.




























































































































































































































































































































































































































































































































	"500" lumin initializeFrom: { 'lumin' . Int64 . 0 . ValueNumberShare |  SupportedForPRE |  Min . 0 . { Int64 . Int64 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"501" fmin initializeFrom: { 'fmin' . Float . 0 . ValueNumberShare |  SupportedForPRE |  Min . 0 . { Float . Float } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"502" dmin initializeFrom: { 'dmin' . Double . 0 . ValueNumberShare |  SupportedForPRE |  Min . 0 . { Double . Double } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"503" ihbit initializeFrom: { 'ihbit' . Int32 . 0 . SupportedForPRE . 0 . Unspecified . BadILOp . BadILOp . BadILOp . BadILOp }.
	"504" ilbit initializeFrom: { 'ilbit' . Int32 . 0 . SupportedForPRE . 0 . Unspecified . BadILOp . BadILOp . BadILOp . BadILOp }.
	"505" inolz initializeFrom: { 'inolz' . Int32 . 0 . SupportedForPRE . 0 . Unspecified . BadILOp . BadILOp . BadILOp . BadILOp }.
	"506" inotz initializeFrom: { 'inotz' . Int32 . 0 . SupportedForPRE . 0 . Unspecified . BadILOp . BadILOp . BadILOp . BadILOp }.
	"507" ipopcnt initializeFrom: { 'ipopcnt' . Int32 . 0 . SupportedForPRE . 0 . Unspecified . BadILOp . BadILOp . BadILOp . BadILOp }.
	"508" lhbit initializeFrom: { 'lhbit' . Int64 . 0 . SupportedForPRE . 0 . Unspecified . BadILOp . BadILOp . BadILOp . BadILOp }.
	"509" llbit initializeFrom: { 'llbit' . Int64 . 0 . SupportedForPRE . 0 . Unspecified . BadILOp . BadILOp . BadILOp . BadILOp }.
	"510" lnolz initializeFrom: { 'lnolz' . Int32 . 0 . SupportedForPRE . 0 . Unspecified . BadILOp . BadILOp . BadILOp . BadILOp }.
	"511" lnotz initializeFrom: { 'lnotz' . Int32 . 0 . SupportedForPRE . 0 . Unspecified . BadILOp . BadILOp . BadILOp . BadILOp }.
	"512" lpopcnt initializeFrom: { 'lpopcnt' . Int32 . 0 . SupportedForPRE . 0 . Unspecified . BadILOp . BadILOp . BadILOp . BadILOp }.
	"513" sbyteswap initializeFrom: { 'sbyteswap' . Int16 . 0 . ValueNumberShare |  SupportedForPRE |  ByteSwap . 0 . { Int16 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"514" ibyteswap initializeFrom: { 'ibyteswap' . Int32 . 0 . ValueNumberShare |  SupportedForPRE |  ByteSwap . 0 . { Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"515" lbyteswap initializeFrom: { 'lbyteswap' . Int64 . 0 . ValueNumberShare |  SupportedForPRE |  ByteSwap . 0 . { Int64 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"516" bbitpermute initializeFrom: { 'bbitpermute' . Int8 . 0 . ValueNumberShare |  SupportedForPRE . LikeUse . { Int8 . Address . Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"517" sbitpermute initializeFrom: { 'sbitpermute' . Int16 . 0 . ValueNumberShare |  SupportedForPRE . LikeUse . { Int16 . Address . Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"518" ibitpermute initializeFrom: { 'ibitpermute' . Int32 . 0 . ValueNumberShare |  SupportedForPRE . LikeUse . { Int32 . Address . Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"519" lbitpermute initializeFrom: { 'lbitpermute' . Int64 . 0 . ValueNumberShare |  SupportedForPRE . LikeUse . { Int64 . Address . Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	"520" prefetch initializeFrom: { 'prefetch' . NoType . TreeTop |  HasSymbolRef . 0 . 0 . Unspecified . BadILOp . BadILOp . BadILOp . BadILOp }.
]
