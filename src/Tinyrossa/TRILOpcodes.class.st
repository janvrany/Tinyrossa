Class {
	#name : #TRILOpcodes,
	#superclass : #SharedPool,
	#classVars : [
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

	| UnspecifiedChildType NoType NoChildren Unspecified"Children" IndirectCallType |

	"Local constants used (generated) initialization"
	UnspecifiedChildType := TRDataTypeUnspecified new.
	NoType := Void.
	NoChildren := #().
	Unspecified"Children" := nil.
	IndirectCallType := Unspecified"Children".








	aconst := TRILOpcode from: { 'aconst' .  Address .  LoadConst .  ValueNumberShare .  LikeUse .  NoChildren  }.
	iconst := TRILOpcode from: { 'iconst' .  Int32 .  LoadConst .  ValueNumberShare .  LikeUse .  NoChildren  }.
	lconst := TRILOpcode from: { 'lconst' .  Int64 .  LoadConst .  ValueNumberShare .  LikeUse .  NoChildren  }.
	fconst := TRILOpcode from: { 'fconst' .  Float .  LoadConst .  ValueNumberShare .  LikeUse .  NoChildren  }.
	dconst := TRILOpcode from: { 'dconst' .  Double .  LoadConst .  ValueNumberShare .  LikeUse .  NoChildren  }.
	bconst := TRILOpcode from: { 'bconst' .  Int8 .  LoadConst .  ValueNumberShare .  LikeUse .  NoChildren  }.
	sconst := TRILOpcode from: { 'sconst' .  Int16 .  LoadConst .  ValueNumberShare .  LikeUse .  NoChildren  }.
	iload := TRILOpcode from: { 'iload' .  Int32 .  LoadVar |  HasSymbolRef .  ValueNumberShare |  SupportedForPRE|  MayUseSystemStack .  LikeUse .  NoChildren  }.
	fload := TRILOpcode from: { 'fload' .  Float .  LoadVar |  HasSymbolRef .  ValueNumberShare |  SupportedForPRE|  MayUseSystemStack .  LikeUse .  NoChildren  }.
	dload := TRILOpcode from: { 'dload' .  Double .  LoadVar |  HasSymbolRef .  ValueNumberShare |  SupportedForPRE|  MayUseSystemStack .  LikeUse .  NoChildren  }.
	aload := TRILOpcode from: { 'aload' .  Address .  LoadVar |  HasSymbolRef .  ValueNumberShare |  SupportedForPRE|  MayUseSystemStack .  LikeUse .  NoChildren  }.
	bload := TRILOpcode from: { 'bload' .  Int8 .  LoadVar |  HasSymbolRef .  ValueNumberShare |  SupportedForPRE|  MayUseSystemStack .  LikeUse .  NoChildren  }.
	sload := TRILOpcode from: { 'sload' .  Int16 .  LoadVar |  HasSymbolRef .  ValueNumberShare |  SupportedForPRE|  MayUseSystemStack .  LikeUse .  NoChildren  }.
	lload := TRILOpcode from: { 'lload' .  Int64 .  LoadVar |  HasSymbolRef .  ValueNumberShare |  SupportedForPRE|  MayUseSystemStack .  LikeUse .  NoChildren  }.
	irdbar := TRILOpcode from: { 'irdbar' .  Int32 .  LoadVar |  HasSymbolRef .  ValueNumberShare |  SupportedForPRE|  MayUseSystemStack |  ReadBarrierLoad .  LikeUse . {  Address } }.
	frdbar := TRILOpcode from: { 'frdbar' .  Float .  LoadVar |  HasSymbolRef .  ValueNumberShare |  SupportedForPRE|  MayUseSystemStack |  ReadBarrierLoad .  LikeUse . {  Address } }.
	drdbar := TRILOpcode from: { 'drdbar' .  Double .  LoadVar |  HasSymbolRef .  ValueNumberShare |  SupportedForPRE|  MayUseSystemStack |  ReadBarrierLoad .  LikeUse . {  Address } }.
	ardbar := TRILOpcode from: { 'ardbar' .  Address .  LoadVar |  HasSymbolRef .  ValueNumberShare |  SupportedForPRE|  MayUseSystemStack |  ReadBarrierLoad .  LikeUse . {  Address } }.
	brdbar := TRILOpcode from: { 'brdbar' .  Int8 .  LoadVar |  HasSymbolRef .  ValueNumberShare |  SupportedForPRE|  MayUseSystemStack |  ReadBarrierLoad .  LikeUse . {  Address } }.
	srdbar := TRILOpcode from: { 'srdbar' .  Int16 .  LoadVar |  HasSymbolRef .  ValueNumberShare |  SupportedForPRE|  MayUseSystemStack |  ReadBarrierLoad .  LikeUse . {  Address } }.
	lrdbar := TRILOpcode from: { 'lrdbar' .  Int64 .  LoadVar |  HasSymbolRef .  ValueNumberShare |  SupportedForPRE|  MayUseSystemStack |  ReadBarrierLoad .  LikeUse . {  Address } }.
	iloadi := TRILOpcode from: { 'iloadi' .  Int32 .  LoadVar |  Indirect |  HasSymbolRef .  ValueNumberShare |  SupportedForPRE|  MayUseSystemStack .  LikeUse . {  Address } }.
	floadi := TRILOpcode from: { 'floadi' .  Float .  LoadVar |  Indirect |  HasSymbolRef .  ValueNumberShare |  SupportedForPRE|  MayUseSystemStack .  LikeUse . {  Address } }.
	dloadi := TRILOpcode from: { 'dloadi' .  Double .  LoadVar |  Indirect |  HasSymbolRef .  ValueNumberShare |  SupportedForPRE|  MayUseSystemStack .  LikeUse . {  Address } }.
	aloadi := TRILOpcode from: { 'aloadi' .  Address .  LoadVar |  Indirect |  HasSymbolRef .  ValueNumberShare |  SupportedForPRE|  MayUseSystemStack .  LikeUse . {  Address } }.
	bloadi := TRILOpcode from: { 'bloadi' .  Int8 .  LoadVar |  Indirect |  HasSymbolRef .  ValueNumberShare |  SupportedForPRE|  MayUseSystemStack .  LikeUse . {  Address } }.
	sloadi := TRILOpcode from: { 'sloadi' .  Int16 .  LoadVar |  Indirect |  HasSymbolRef .  ValueNumberShare |  SupportedForPRE|  MayUseSystemStack .  LikeUse . {  Address } }.
	lloadi := TRILOpcode from: { 'lloadi' .  Int64 .  LoadVar |  Indirect |  HasSymbolRef .  ValueNumberShare |  SupportedForPRE|  MayUseSystemStack .  LikeUse . {  Address } }.
	irdbari := TRILOpcode from: { 'irdbari' .  Int32 .  LoadVar |  Indirect |  HasSymbolRef .  ValueNumberShare |  SupportedForPRE|  MayUseSystemStack |  ReadBarrierLoad .  LikeUse . {  Address } }.
	frdbari := TRILOpcode from: { 'frdbari' .  Float .  LoadVar |  Indirect |  HasSymbolRef .  ValueNumberShare |  SupportedForPRE|  MayUseSystemStack |  ReadBarrierLoad .  LikeUse . {  Address } }.
	drdbari := TRILOpcode from: { 'drdbari' .  Double .  LoadVar |  Indirect |  HasSymbolRef .  ValueNumberShare |  SupportedForPRE|  MayUseSystemStack |  ReadBarrierLoad .  LikeUse . {  Address } }.
	ardbari := TRILOpcode from: { 'ardbari' .  Address .  LoadVar |  Indirect |  HasSymbolRef .  ValueNumberShare |  SupportedForPRE|  MayUseSystemStack |  ReadBarrierLoad .  LikeUse . {  Address } }.
	brdbari := TRILOpcode from: { 'brdbari' .  Int8 .  LoadVar |  Indirect |  HasSymbolRef .  ValueNumberShare |  SupportedForPRE|  MayUseSystemStack |  ReadBarrierLoad .  LikeUse . {  Address } }.
	srdbari := TRILOpcode from: { 'srdbari' .  Int16 .  LoadVar |  Indirect |  HasSymbolRef .  ValueNumberShare |  SupportedForPRE|  MayUseSystemStack |  ReadBarrierLoad .  LikeUse . {  Address } }.
	lrdbari := TRILOpcode from: { 'lrdbari' .  Int64 .  LoadVar |  Indirect |  HasSymbolRef .  ValueNumberShare |  SupportedForPRE|  MayUseSystemStack |  ReadBarrierLoad .  LikeUse . {  Address } }.
	istore := TRILOpcode from: { 'istore' .  Int32 .  Store |  TreeTop |  HasSymbolRef .  ValueNumberShare|  MayUseSystemStack .  LikeDef . {  Int32 } }.
	lstore := TRILOpcode from: { 'lstore' .  Int64 .  Store |  TreeTop |  HasSymbolRef .  ValueNumberShare|  MayUseSystemStack .  LikeDef . {  Int64 } }.
	fstore := TRILOpcode from: { 'fstore' .  Float .  Store |  TreeTop |  HasSymbolRef .  ValueNumberShare|  MayUseSystemStack .  LikeDef . {  Float } }.
	dstore := TRILOpcode from: { 'dstore' .  Double .  Store |  TreeTop |  HasSymbolRef .  ValueNumberShare|  MayUseSystemStack .  LikeDef . {  Double } }.
	astore := TRILOpcode from: { 'astore' .  Address .  Store |  TreeTop |  HasSymbolRef .  ValueNumberShare|  MayUseSystemStack .  LikeDef . {  Address } }.
	bstore := TRILOpcode from: { 'bstore' .  Int8 .  Store |  TreeTop |  HasSymbolRef .  ValueNumberShare|  MayUseSystemStack .  LikeDef . {  Int8 } }.
	sstore := TRILOpcode from: { 'sstore' .  Int16 .  Store |  TreeTop |  HasSymbolRef .  ValueNumberShare|  MayUseSystemStack .  LikeDef . {  Int16 } }.
	iwrtbar := TRILOpcode from: { 'iwrtbar' .  Int32 .  Store |  TreeTop |  HasSymbolRef .  ValueNumberShare|  WriteBarrierStore|  MayUseSystemStack .  LikeDef . {  Int32 .  Address } }.
	lwrtbar := TRILOpcode from: { 'lwrtbar' .  Int64 .  Store |  TreeTop |  HasSymbolRef .  ValueNumberShare|  WriteBarrierStore|  MayUseSystemStack .  LikeDef . {  Int64 .  Address } }.
	fwrtbar := TRILOpcode from: { 'fwrtbar' .  Float .  Store |  TreeTop |  HasSymbolRef .  ValueNumberShare|  WriteBarrierStore|  MayUseSystemStack .  LikeDef . {  Float .  Address } }.
	dwrtbar := TRILOpcode from: { 'dwrtbar' .  Double .  Store |  TreeTop |  HasSymbolRef .  ValueNumberShare|  WriteBarrierStore|  MayUseSystemStack .  LikeDef . {  Double .  Address } }.
	awrtbar := TRILOpcode from: { 'awrtbar' .  Address .  Store |  TreeTop |  HasSymbolRef .  ValueNumberShare |  WriteBarrierStore|  MayUseSystemStack .  LikeDef . {  Address .  Address } }.
	bwrtbar := TRILOpcode from: { 'bwrtbar' .  Int8 .  Store |  TreeTop |  HasSymbolRef .  ValueNumberShare|  WriteBarrierStore|  MayUseSystemStack .  LikeDef . {  Int8 .  Address } }.
	swrtbar := TRILOpcode from: { 'swrtbar' .  Int16 .  Store |  TreeTop |  HasSymbolRef .  ValueNumberShare|  WriteBarrierStore|  MayUseSystemStack .  LikeDef . {  Int16 .  Address } }.
	lstorei := TRILOpcode from: { 'lstorei' .  Int64 .  Store |  Indirect |  TreeTop |  HasSymbolRef .  ValueNumberShare|  MayUseSystemStack .  LikeDef . {  Address .  Int64 } }.
	fstorei := TRILOpcode from: { 'fstorei' .  Float .  Store |  Indirect |  TreeTop |  HasSymbolRef .  ValueNumberShare|  MayUseSystemStack .  LikeDef . {  Address .  Float } }.
	dstorei := TRILOpcode from: { 'dstorei' .  Double .  Store |  Indirect |  TreeTop |  HasSymbolRef .  ValueNumberShare|  MayUseSystemStack .  LikeDef . {  Address .  Double } }.
	astorei := TRILOpcode from: { 'astorei' .  Address .  Store |  Indirect |  TreeTop |  HasSymbolRef .  ValueNumberShare|  MayUseSystemStack .  LikeDef . {  Address .  Address } }.
	bstorei := TRILOpcode from: { 'bstorei' .  Int8 .  Store |  Indirect |  TreeTop |  HasSymbolRef .  ValueNumberShare|  MayUseSystemStack .  LikeDef . {  Address .  Int8 } }.
	sstorei := TRILOpcode from: { 'sstorei' .  Int16 .  Store |  Indirect |  TreeTop |  HasSymbolRef .  ValueNumberShare|  MayUseSystemStack .  LikeDef . {  Address .  Int16 } }.
	istorei := TRILOpcode from: { 'istorei' .  Int32 .  Store |  Indirect |  TreeTop |  HasSymbolRef .  ValueNumberShare|  MayUseSystemStack .  LikeDef . {  Address .  Int32 } }.
	lwrtbari := TRILOpcode from: { 'lwrtbari' .  Int64 .  Store |  Indirect |  TreeTop |  HasSymbolRef .  ValueNumberShare |  WriteBarrierStore|  MayUseSystemStack .  LikeDef . {  Address .  Int64 .  Address } }.
	fwrtbari := TRILOpcode from: { 'fwrtbari' .  Float .  Store |  Indirect |  TreeTop |  HasSymbolRef .  ValueNumberShare |  WriteBarrierStore|  MayUseSystemStack .  LikeDef . {  Address .  Float .  Address } }.
	dwrtbari := TRILOpcode from: { 'dwrtbari' .  Double .  Store |  Indirect |  TreeTop |  HasSymbolRef .  ValueNumberShare |  WriteBarrierStore|  MayUseSystemStack .  LikeDef . {  Address .  Double .  Address } }.
	awrtbari := TRILOpcode from: { 'awrtbari' .  Address .  Store |  Indirect |  TreeTop |  HasSymbolRef .  ValueNumberShare |  WriteBarrierStore|  MayUseSystemStack .  LikeDef . {  Address .  Address .  Address } }.
	bwrtbari := TRILOpcode from: { 'bwrtbari' .  Int8 .  Store |  Indirect |  TreeTop |  HasSymbolRef .  ValueNumberShare |  WriteBarrierStore|  MayUseSystemStack .  LikeDef . {  Address .  Int8 .  Address } }.
	swrtbari := TRILOpcode from: { 'swrtbari' .  Int16 .  Store |  Indirect |  TreeTop |  HasSymbolRef .  ValueNumberShare |  WriteBarrierStore|  MayUseSystemStack .  LikeDef . {  Address .  Int16 .  Address } }.
	iwrtbari := TRILOpcode from: { 'iwrtbari' .  Int32 .  Store |  Indirect |  TreeTop |  HasSymbolRef .  ValueNumberShare |  WriteBarrierStore|  MayUseSystemStack .  LikeDef . {  Address .  Int32 .  Address } }.
	goto := TRILOpcode from: { 'goto' .  NoType .  Branch |  TreeTop . 0 . 0 .  NoChildren  }.
	ireturn := TRILOpcode from: { 'ireturn' .  Int32 .  Return |  TreeTop .  MayUseSystemStack . 0 . {  Int32 } }.
	lreturn := TRILOpcode from: { 'lreturn' .  Int64 .  Return |  TreeTop .  MayUseSystemStack . 0 . {  Int64 } }.
	freturn := TRILOpcode from: { 'freturn' .  Float .  Return |  TreeTop .  MayUseSystemStack . 0 . {  Float } }.
	dreturn := TRILOpcode from: { 'dreturn' .  Double .  Return |  TreeTop .  MayUseSystemStack . 0 . {  Double } }.
	areturn := TRILOpcode from: { 'areturn' .  Address .  Return |  TreeTop .  MayUseSystemStack . 0 . {  Address } }.
	return := TRILOpcode from: { 'return' .  NoType .  Return |  TreeTop .  MayUseSystemStack . 0 .  NoChildren  }.
	asynccheck := TRILOpcode from: { 'asynccheck' .  NoType .  TreeTop |  HasSymbolRef .  MustBeLowered|  MayUseSystemStack .  LikeDef .  Unspecified }.
	athrow := TRILOpcode from: { 'athrow' .  NoType .  TreeTop |  HasSymbolRef .  MustBeLowered |  CanRaiseException|  MayUseSystemStack . 0 .  Unspecified }.
	icall := TRILOpcode from: { 'icall' .  Int32 .  Call |  HasSymbolRef .  CanRaiseException |  SupportedForPRE|  MayUseSystemStack .  LikeUse |  LikeDef .  Unspecified }.
	lcall := TRILOpcode from: { 'lcall' .  Int64 .  Call |  HasSymbolRef .  CanRaiseException |  SupportedForPRE|  MayUseSystemStack .  LikeUse |  LikeDef .  Unspecified }.
	fcall := TRILOpcode from: { 'fcall' .  Float .  Call |  HasSymbolRef .  CanRaiseException |  SupportedForPRE|  MayUseSystemStack .  LikeUse |  LikeDef .  Unspecified }.
	dcall := TRILOpcode from: { 'dcall' .  Double .  Call |  HasSymbolRef .  CanRaiseException |  SupportedForPRE|  MayUseSystemStack .  LikeUse |  LikeDef .  Unspecified }.
	acall := TRILOpcode from: { 'acall' .  Address .  Call |  HasSymbolRef .  CanRaiseException |  SupportedForPRE|  MayUseSystemStack .  LikeUse |  LikeDef .  Unspecified }.
	call := TRILOpcode from: { 'call' .  NoType .  Call |  HasSymbolRef .  CanRaiseException |  SupportedForPRE|  MayUseSystemStack .  LikeUse |  LikeDef .  Unspecified }.
	iadd := TRILOpcode from: { 'iadd' .  Int32 .  Commutative |  Associative |  Add .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int32 . Int32 } }.
	ladd := TRILOpcode from: { 'ladd' .  Int64 .  Commutative |  Associative |  Add .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int64 . Int64 } }.
	fadd := TRILOpcode from: { 'fadd' .  Float .  Commutative |  Associative |  Add .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Float . Float } }.
	dadd := TRILOpcode from: { 'dadd' .  Double .  Commutative |  Associative |  Add .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Double . Double } }.
	badd := TRILOpcode from: { 'badd' .  Int8 .  Commutative |  Associative |  Add .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int8 . Int8 } }.
	sadd := TRILOpcode from: { 'sadd' .  Int16 .  Commutative |  Associative |  Add .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int16 . Int16 } }.
	isub := TRILOpcode from: { 'isub' .  Int32 .  Sub .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int32 . Int32 } }.
	lsub := TRILOpcode from: { 'lsub' .  Int64 .  Sub .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int64 . Int64 } }.
	fsub := TRILOpcode from: { 'fsub' .  Float .  Sub .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Float . Float } }.
	dsub := TRILOpcode from: { 'dsub' .  Double .  Sub .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Double . Double } }.
	bsub := TRILOpcode from: { 'bsub' .  Int8 .  Sub .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int8 . Int8 } }.
	ssub := TRILOpcode from: { 'ssub' .  Int16 .  Sub .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int16 . Int16 } }.
	asub := TRILOpcode from: { 'asub' .  NoType .  Sub .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Address . Address } }.
	imul := TRILOpcode from: { 'imul' .  Int32 .  Commutative |  Associative |  Mul .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int32 . Int32 } }.
	lmul := TRILOpcode from: { 'lmul' .  Int64 .  Commutative |  Associative |  Mul .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int64 . Int64 } }.
	fmul := TRILOpcode from: { 'fmul' .  Float .  Commutative |  Associative |  Mul .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Float . Float } }.
	dmul := TRILOpcode from: { 'dmul' .  Double .  Commutative |  Associative |  Mul .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Double . Double } }.
	bmul := TRILOpcode from: { 'bmul' .  Int8 .  Commutative |  Associative |  Mul .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int8 . Int8 } }.
	smul := TRILOpcode from: { 'smul' .  Int16 .  Commutative |  Associative |  Mul .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int16 . Int16 } }.
	idiv := TRILOpcode from: { 'idiv' .  Int32 .  Div .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int32 . Int32 } }.
	ldiv := TRILOpcode from: { 'ldiv' .  Int64 .  Div .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int64 . Int64 } }.
	fdiv := TRILOpcode from: { 'fdiv' .  Float .  Div .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Float . Float } }.
	ddiv := TRILOpcode from: { 'ddiv' .  Double .  Div .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Double . Double } }.
	bdiv := TRILOpcode from: { 'bdiv' .  Int8 .  Div .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int8 . Int8 } }.
	sdiv := TRILOpcode from: { 'sdiv' .  Int16 .  Div .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int16 . Int16 } }.
	iudiv := TRILOpcode from: { 'iudiv' .  Int32 .  Div .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int32 . Int32 } }.
	ludiv := TRILOpcode from: { 'ludiv' .  Int64 .  Div .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int64 . Int64 } }.
	irem := TRILOpcode from: { 'irem' .  Int32 .  Rem .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int32 . Int32 } }.
	lrem := TRILOpcode from: { 'lrem' .  Int64 .  Rem .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int64 . Int64 } }.
	frem := TRILOpcode from: { 'frem' .  Float .  Rem .  ValueNumberShare |  SupportedForPRE|  MayUseSystemStack .  LikeUse . { Float . Float } }.
	drem := TRILOpcode from: { 'drem' .  Double .  Rem .  ValueNumberShare |  SupportedForPRE|  MayUseSystemStack .  LikeUse . { Double . Double } }.
	brem := TRILOpcode from: { 'brem' .  Int8 .  Rem .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int8 . Int8 } }.
	srem := TRILOpcode from: { 'srem' .  Int16 .  Rem .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int16 . Int16 } }.
	iurem := TRILOpcode from: { 'iurem' .  Int32 .  Rem .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int32 . Int32 } }.
	ineg := TRILOpcode from: { 'ineg' .  Int32 .  Neg .  ValueNumberShare |  SupportedForPRE .  LikeUse . {  Int32 } }.
	lneg := TRILOpcode from: { 'lneg' .  Int64 .  Neg .  ValueNumberShare |  SupportedForPRE .  LikeUse . {  Int64 } }.
	fneg := TRILOpcode from: { 'fneg' .  Float .  Neg .  ValueNumberShare |  SupportedForPRE .  LikeUse . {  Float } }.
	dneg := TRILOpcode from: { 'dneg' .  Double .  Neg .  ValueNumberShare |  SupportedForPRE .  LikeUse . {  Double } }.
	bneg := TRILOpcode from: { 'bneg' .  Int8 .  Neg .  ValueNumberShare |  SupportedForPRE .  LikeUse . {  Int8 } }.
	sneg := TRILOpcode from: { 'sneg' .  Int16 .  Neg .  ValueNumberShare |  SupportedForPRE .  LikeUse . {  Int16 } }.
	iabs := TRILOpcode from: { 'iabs' .  Int32 . 0 .  ValueNumberShare |  SupportedForPRE .  LikeUse |  Abs . {  Int32 } }.
	labs := TRILOpcode from: { 'labs' .  Int64 . 0 .  ValueNumberShare |  SupportedForPRE .  LikeUse |  Abs . {  Int64 } }.
	fabs := TRILOpcode from: { 'fabs' .  Float . 0 .  ValueNumberShare |  SupportedForPRE .  LikeUse |  Abs . {  Float } }.
	dabs := TRILOpcode from: { 'dabs' .  Double . 0 .  ValueNumberShare |  SupportedForPRE .  LikeUse |  Abs . {  Double } }.
	ishl := TRILOpcode from: { 'ishl' .  Int32 .  LeftShift .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int32 . Int32 } }.
	lshl := TRILOpcode from: { 'lshl' .  Int64 .  LeftShift .  ValueNumberShare |  SupportedForPRE .  LikeUse . {  Int64 .  Int32 } }.
	bshl := TRILOpcode from: { 'bshl' .  Int8 .  LeftShift .  ValueNumberShare |  SupportedForPRE .  LikeUse . {  Int8 .  Int32 } }.
	sshl := TRILOpcode from: { 'sshl' .  Int16 .  LeftShift .  ValueNumberShare |  SupportedForPRE .  LikeUse . {  Int16 .  Int32 } }.
	ishr := TRILOpcode from: { 'ishr' .  Int32 .  RightShift .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int32 . Int32 } }.
	lshr := TRILOpcode from: { 'lshr' .  Int64 .  RightShift .  ValueNumberShare |  SupportedForPRE .  LikeUse . {  Int64 .  Int32 } }.
	bshr := TRILOpcode from: { 'bshr' .  Int8 .  RightShift .  ValueNumberShare |  SupportedForPRE .  LikeUse . {  Int8 .  Int32 } }.
	sshr := TRILOpcode from: { 'sshr' .  Int16 .  RightShift .  ValueNumberShare |  SupportedForPRE .  LikeUse . {  Int16 .  Int32 } }.
	iushr := TRILOpcode from: { 'iushr' .  Int32 .  RightShift |  ShiftLogical .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int32 . Int32 } }.
	lushr := TRILOpcode from: { 'lushr' .  Int64 .  RightShift |  ShiftLogical .  ValueNumberShare |  SupportedForPRE .  LikeUse . {  Int64 .  Int32 } }.
	bushr := TRILOpcode from: { 'bushr' .  Int8 .  RightShift |  ShiftLogical .  ValueNumberShare |  SupportedForPRE .  LikeUse . {  Int8 .  Int32 } }.
	sushr := TRILOpcode from: { 'sushr' .  Int16 .  RightShift |  ShiftLogical .  ValueNumberShare |  SupportedForPRE .  LikeUse . {  Int16 .  Int32 } }.
	irol := TRILOpcode from: { 'irol' .  Int32 . 0 .  ValueNumberShare |  SupportedForPRE |  LeftRotate . 0 . { Int32 . Int32 } }.
	lrol := TRILOpcode from: { 'lrol' .  Int64 . 0 .  ValueNumberShare |  SupportedForPRE |  LeftRotate . 0 . {  Int64 .  Int32 } }.
	iand := TRILOpcode from: { 'iand' .  Int32 .  Commutative |  Associative |  And .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int32 . Int32 } }.
	land := TRILOpcode from: { 'land' .  Int64 .  Commutative |  Associative |  And .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int64 . Int64 } }.
	band := TRILOpcode from: { 'band' .  Int8 .  Commutative |  Associative |  And .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int8 . Int8 } }.
	sand := TRILOpcode from: { 'sand' .  Int16 .  Commutative |  Associative |  And .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int16 . Int16 } }.
	ior := TRILOpcode from: { 'ior' .  Int32 .  Commutative |  Associative |  Or .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int32 . Int32 } }.
	lor := TRILOpcode from: { 'lor' .  Int64 .  Commutative |  Associative |  Or .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int64 . Int64 } }.
	bor := TRILOpcode from: { 'bor' .  Int8 .  Commutative |  Associative |  Or .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int8 . Int8 } }.
	sor := TRILOpcode from: { 'sor' .  Int16 .  Commutative |  Associative |  Or .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int16 . Int16 } }.
	ixor := TRILOpcode from: { 'ixor' .  Int32 .  Commutative |  Associative |  Xor .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int32 . Int32 } }.
	lxor := TRILOpcode from: { 'lxor' .  Int64 .  Commutative |  Associative |  Xor .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int64 . Int64 } }.
	bxor := TRILOpcode from: { 'bxor' .  Int8 .  Commutative |  Associative |  Xor .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int8 . Int8 } }.
	sxor := TRILOpcode from: { 'sxor' .  Int16 .  Commutative |  Associative |  Xor .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int16 . Int16 } }.
	i2l := TRILOpcode from: { 'i2l' .  Int64 .  Conversion .  ValueNumberShare |  SupportedForPRE |  SignExtension . 0 . {  Int32 } }.
	i2f := TRILOpcode from: { 'i2f' .  Float .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . {  Int32 } }.
	i2d := TRILOpcode from: { 'i2d' .  Double .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . {  Int32 } }.
	i2b := TRILOpcode from: { 'i2b' .  Int8 .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . {  Int32 } }.
	i2s := TRILOpcode from: { 'i2s' .  Int16 .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . {  Int32 } }.
	i2a := TRILOpcode from: { 'i2a' .  Address .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . {  Int32 } }.
	iu2l := TRILOpcode from: { 'iu2l' .  Int64 .  Conversion .  ValueNumberShare |  SupportedForPRE |  ZeroExtension . 0 . {  Int32 } }.
	iu2f := TRILOpcode from: { 'iu2f' .  Float .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . {  Int32 } }.
	iu2d := TRILOpcode from: { 'iu2d' .  Double .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . {  Int32 } }.
	iu2a := TRILOpcode from: { 'iu2a' .  Address .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . {  Int32 } }.
	l2i := TRILOpcode from: { 'l2i' .  Int32 .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . {  Int64 } }.
	l2f := TRILOpcode from: { 'l2f' .  Float .  Conversion .  ValueNumberShare |  SupportedForPRE|  MayUseSystemStack . 0 . {  Int64 } }.
	l2d := TRILOpcode from: { 'l2d' .  Double .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . {  Int64 } }.
	l2b := TRILOpcode from: { 'l2b' .  Int8 .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . {  Int64 } }.
	l2s := TRILOpcode from: { 'l2s' .  Int16 .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . {  Int64 } }.
	l2a := TRILOpcode from: { 'l2a' .  Address .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . {  Int64 } }.
	lu2f := TRILOpcode from: { 'lu2f' .  Float .  Conversion .  ValueNumberShare |  SupportedForPRE|  MayUseSystemStack . 0 . {  Int64 } }.
	lu2d := TRILOpcode from: { 'lu2d' .  Double .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . {  Int64 } }.
	lu2a := TRILOpcode from: { 'lu2a' .  Address .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . {  Int64 } }.
	f2i := TRILOpcode from: { 'f2i' .  Int32 .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . {  Float } }.
	f2l := TRILOpcode from: { 'f2l' .  Int64 .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . {  Float } }.
	f2d := TRILOpcode from: { 'f2d' .  Double .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . {  Float } }.
	f2b := TRILOpcode from: { 'f2b' .  Int8 .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . {  Float } }.
	f2s := TRILOpcode from: { 'f2s' .  Int16 .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . {  Float } }.
	d2i := TRILOpcode from: { 'd2i' .  Int32 .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . {  Double } }.
	d2l := TRILOpcode from: { 'd2l' .  Int64 .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . {  Double } }.
	d2f := TRILOpcode from: { 'd2f' .  Float .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . {  Double } }.
	d2b := TRILOpcode from: { 'd2b' .  Int8 .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . {  Double } }.
	d2s := TRILOpcode from: { 'd2s' .  Int16 .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . {  Double } }.
	b2i := TRILOpcode from: { 'b2i' .  Int32 .  Conversion .  ValueNumberShare |  SupportedForPRE |  SignExtension . 0 . {  Int8 } }.
	b2l := TRILOpcode from: { 'b2l' .  Int64 .  Conversion .  ValueNumberShare |  SupportedForPRE |  SignExtension . 0 . {  Int8 } }.
	b2f := TRILOpcode from: { 'b2f' .  Float .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . {  Int8 } }.
	b2d := TRILOpcode from: { 'b2d' .  Double .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . {  Int8 } }.
	b2s := TRILOpcode from: { 'b2s' .  Int16 .  Conversion .  ValueNumberShare |  SupportedForPRE |  SignExtension . 0 . {  Int8 } }.
	b2a := TRILOpcode from: { 'b2a' .  Address .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . {  Int8 } }.
	bu2i := TRILOpcode from: { 'bu2i' .  Int32 .  Conversion .  ValueNumberShare |  SupportedForPRE |  ZeroExtension . 0 . {  Int8 } }.
	bu2l := TRILOpcode from: { 'bu2l' .  Int64 .  Conversion .  ValueNumberShare |  SupportedForPRE |  ZeroExtension . 0 . {  Int8 } }.
	bu2f := TRILOpcode from: { 'bu2f' .  Float .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . {  Int8 } }.
	bu2d := TRILOpcode from: { 'bu2d' .  Double .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . {  Int8 } }.
	bu2s := TRILOpcode from: { 'bu2s' .  Int16 .  Conversion .  ValueNumberShare |  SupportedForPRE |  ZeroExtension . 0 . {  Int8 } }.
	bu2a := TRILOpcode from: { 'bu2a' .  Address .  Conversion .  ValueNumberShare |  SupportedForPRE |  ZeroExtension . 0 . {  Int8 } }.
	s2i := TRILOpcode from: { 's2i' .  Int32 .  Conversion .  ValueNumberShare |  SupportedForPRE |  SignExtension . 0 . {  Int16 } }.
	s2l := TRILOpcode from: { 's2l' .  Int64 .  Conversion .  ValueNumberShare |  SupportedForPRE |  SignExtension . 0 . {  Int16 } }.
	s2f := TRILOpcode from: { 's2f' .  Float .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . {  Int16 } }.
	s2d := TRILOpcode from: { 's2d' .  Double .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . {  Int16 } }.
	s2b := TRILOpcode from: { 's2b' .  Int8 .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . {  Int16 } }.
	s2a := TRILOpcode from: { 's2a' .  Address .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . {  Int16 } }.
	su2i := TRILOpcode from: { 'su2i' .  Int32 .  Conversion .  ValueNumberShare |  SupportedForPRE |  ZeroExtension . 0 . {  Int16 } }.
	su2l := TRILOpcode from: { 'su2l' .  Int64 .  Conversion .  ValueNumberShare |  SupportedForPRE |  ZeroExtension . 0 . {  Int16 } }.
	su2f := TRILOpcode from: { 'su2f' .  Float .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . {  Int16 } }.
	su2d := TRILOpcode from: { 'su2d' .  Double .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . {  Int16 } }.
	su2a := TRILOpcode from: { 'su2a' .  Address .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . {  Int16 } }.
	a2i := TRILOpcode from: { 'a2i' .  Int32 .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . {  Address } }.
	a2l := TRILOpcode from: { 'a2l' .  Int64 .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . {  Address } }.
	a2b := TRILOpcode from: { 'a2b' .  Int8 .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . {  Address } }.
	a2s := TRILOpcode from: { 'a2s' .  Int16 .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . {  Address } }.
	icmpeq := TRILOpcode from: { 'icmpeq' .  Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfEqual . { Int32 . Int32 } }.
	icmpne := TRILOpcode from: { 'icmpne' .  Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfLess |  CompareTrueIfGreater . { Int32 . Int32 } }.
	icmplt := TRILOpcode from: { 'icmplt' .  Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfLess . { Int32 . Int32 } }.
	icmpge := TRILOpcode from: { 'icmpge' .  Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfGreater |  CompareTrueIfEqual . { Int32 . Int32 } }.
	icmpgt := TRILOpcode from: { 'icmpgt' .  Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfGreater . { Int32 . Int32 } }.
	icmple := TRILOpcode from: { 'icmple' .  Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfLess |  CompareTrueIfEqual . { Int32 . Int32 } }.
	iucmplt := TRILOpcode from: { 'iucmplt' .  Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE |  UnsignedCompare .  CompareTrueIfLess . { Int32 . Int32 } }.
	iucmpge := TRILOpcode from: { 'iucmpge' .  Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE |  UnsignedCompare .  CompareTrueIfGreater |  CompareTrueIfEqual . { Int32 . Int32 } }.
	iucmpgt := TRILOpcode from: { 'iucmpgt' .  Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE |  UnsignedCompare .  CompareTrueIfGreater . { Int32 . Int32 } }.
	iucmple := TRILOpcode from: { 'iucmple' .  Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE |  UnsignedCompare .  CompareTrueIfLess |  CompareTrueIfEqual . { Int32 . Int32 } }.
	lcmpeq := TRILOpcode from: { 'lcmpeq' .  Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfEqual . { Int64 . Int64 } }.
	lcmpne := TRILOpcode from: { 'lcmpne' .  Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfLess |  CompareTrueIfGreater . { Int64 . Int64 } }.
	lcmplt := TRILOpcode from: { 'lcmplt' .  Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfLess . { Int64 . Int64 } }.
	lcmpge := TRILOpcode from: { 'lcmpge' .  Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfGreater |  CompareTrueIfEqual . { Int64 . Int64 } }.
	lcmpgt := TRILOpcode from: { 'lcmpgt' .  Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfGreater . { Int64 . Int64 } }.
	lcmple := TRILOpcode from: { 'lcmple' .  Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfLess |  CompareTrueIfEqual . { Int64 . Int64 } }.
	lucmplt := TRILOpcode from: { 'lucmplt' .  Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE |  UnsignedCompare .  CompareTrueIfLess . { Int64 . Int64 } }.
	lucmpge := TRILOpcode from: { 'lucmpge' .  Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE |  UnsignedCompare .  CompareTrueIfGreater |  CompareTrueIfEqual . { Int64 . Int64 } }.
	lucmpgt := TRILOpcode from: { 'lucmpgt' .  Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE |  UnsignedCompare .  CompareTrueIfGreater . { Int64 . Int64 } }.
	lucmple := TRILOpcode from: { 'lucmple' .  Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE |  UnsignedCompare .  CompareTrueIfLess |  CompareTrueIfEqual . { Int64 . Int64 } }.
	fcmpeq := TRILOpcode from: { 'fcmpeq' .  Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfEqual . { Float . Float } }.
	fcmpne := TRILOpcode from: { 'fcmpne' .  Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfLess |  CompareTrueIfGreater . { Float . Float } }.
	fcmplt := TRILOpcode from: { 'fcmplt' .  Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfLess . { Float . Float } }.
	fcmpge := TRILOpcode from: { 'fcmpge' .  Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfGreater |  CompareTrueIfEqual . { Float . Float } }.
	fcmpgt := TRILOpcode from: { 'fcmpgt' .  Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfGreater . { Float . Float } }.
	fcmple := TRILOpcode from: { 'fcmple' .  Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfLess |  CompareTrueIfEqual . { Float . Float } }.
	fcmpequ := TRILOpcode from: { 'fcmpequ' .  Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfEqual |  CompareTrueIfUnordered . { Float . Float } }.
	fcmpneu := TRILOpcode from: { 'fcmpneu' .  Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfLess |  CompareTrueIfGreater |  CompareTrueIfUnordered . { Float . Float } }.
	fcmpltu := TRILOpcode from: { 'fcmpltu' .  Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfLess |  CompareTrueIfUnordered . { Float . Float } }.
	fcmpgeu := TRILOpcode from: { 'fcmpgeu' .  Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfGreater |  CompareTrueIfEqual |  CompareTrueIfUnordered . { Float . Float } }.
	fcmpgtu := TRILOpcode from: { 'fcmpgtu' .  Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfGreater |  CompareTrueIfUnordered . { Float . Float } }.
	fcmpleu := TRILOpcode from: { 'fcmpleu' .  Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfLess |  CompareTrueIfEqual |  CompareTrueIfUnordered . { Float . Float } }.
	dcmpeq := TRILOpcode from: { 'dcmpeq' .  Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfEqual . { Double . Double } }.
	dcmpne := TRILOpcode from: { 'dcmpne' .  Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfLess |  CompareTrueIfGreater . { Double . Double } }.
	dcmplt := TRILOpcode from: { 'dcmplt' .  Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfLess . { Double . Double } }.
	dcmpge := TRILOpcode from: { 'dcmpge' .  Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfGreater |  CompareTrueIfEqual . { Double . Double } }.
	dcmpgt := TRILOpcode from: { 'dcmpgt' .  Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfGreater . { Double . Double } }.
	dcmple := TRILOpcode from: { 'dcmple' .  Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfLess |  CompareTrueIfEqual . { Double . Double } }.
	dcmpequ := TRILOpcode from: { 'dcmpequ' .  Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfEqual |  CompareTrueIfUnordered . { Double . Double } }.
	dcmpneu := TRILOpcode from: { 'dcmpneu' .  Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfLess |  CompareTrueIfGreater |  CompareTrueIfUnordered . { Double . Double } }.
	dcmpltu := TRILOpcode from: { 'dcmpltu' .  Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfLess |  CompareTrueIfUnordered . { Double . Double } }.
	dcmpgeu := TRILOpcode from: { 'dcmpgeu' .  Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfGreater |  CompareTrueIfEqual |  CompareTrueIfUnordered . { Double . Double } }.
	dcmpgtu := TRILOpcode from: { 'dcmpgtu' .  Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfGreater |  CompareTrueIfUnordered . { Double . Double } }.
	dcmpleu := TRILOpcode from: { 'dcmpleu' .  Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfLess |  CompareTrueIfEqual |  CompareTrueIfUnordered . { Double . Double } }.
	acmpeq := TRILOpcode from: { 'acmpeq' .  Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfEqual . { Address . Address } }.
	acmpne := TRILOpcode from: { 'acmpne' .  Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfLess |  CompareTrueIfGreater . { Address . Address } }.
	acmplt := TRILOpcode from: { 'acmplt' .  Int32 .  BooleanCompare .  ValueNumberShare |  UnsignedCompare |  SupportedForPRE .  CompareTrueIfLess . { Address . Address } }.
	acmpge := TRILOpcode from: { 'acmpge' .  Int32 .  BooleanCompare .  ValueNumberShare |  UnsignedCompare |  SupportedForPRE .  CompareTrueIfGreater |  CompareTrueIfEqual . { Address . Address } }.
	acmpgt := TRILOpcode from: { 'acmpgt' .  Int32 .  BooleanCompare .  ValueNumberShare |  UnsignedCompare |  SupportedForPRE .  CompareTrueIfGreater . { Address . Address } }.
	acmple := TRILOpcode from: { 'acmple' .  Int32 .  BooleanCompare .  ValueNumberShare |  UnsignedCompare |  SupportedForPRE .  CompareTrueIfLess |  CompareTrueIfEqual . { Address . Address } }.
	bcmpeq := TRILOpcode from: { 'bcmpeq' .  Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfEqual . { Int8 . Int8 } }.
	bcmpne := TRILOpcode from: { 'bcmpne' .  Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfLess |  CompareTrueIfGreater . { Int8 . Int8 } }.
	bcmplt := TRILOpcode from: { 'bcmplt' .  Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfLess . { Int8 . Int8 } }.
	bcmpge := TRILOpcode from: { 'bcmpge' .  Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfGreater |  CompareTrueIfEqual . { Int8 . Int8 } }.
	bcmpgt := TRILOpcode from: { 'bcmpgt' .  Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfGreater . { Int8 . Int8 } }.
	bcmple := TRILOpcode from: { 'bcmple' .  Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfLess |  CompareTrueIfEqual . { Int8 . Int8 } }.
	bucmplt := TRILOpcode from: { 'bucmplt' .  Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE |  UnsignedCompare .  CompareTrueIfLess . { Int8 . Int8 } }.
	bucmpge := TRILOpcode from: { 'bucmpge' .  Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE |  UnsignedCompare .  CompareTrueIfGreater |  CompareTrueIfEqual . { Int8 . Int8 } }.
	bucmpgt := TRILOpcode from: { 'bucmpgt' .  Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE |  UnsignedCompare .  CompareTrueIfGreater . { Int8 . Int8 } }.
	bucmple := TRILOpcode from: { 'bucmple' .  Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE |  UnsignedCompare .  CompareTrueIfLess |  CompareTrueIfEqual . { Int8 . Int8 } }.
	scmpeq := TRILOpcode from: { 'scmpeq' .  Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfEqual . { Int16 . Int16 } }.
	scmpne := TRILOpcode from: { 'scmpne' .  Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfLess |  CompareTrueIfGreater . { Int16 . Int16 } }.
	scmplt := TRILOpcode from: { 'scmplt' .  Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfLess . { Int16 . Int16 } }.
	scmpge := TRILOpcode from: { 'scmpge' .  Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfGreater |  CompareTrueIfEqual . { Int16 . Int16 } }.
	scmpgt := TRILOpcode from: { 'scmpgt' .  Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfGreater . { Int16 . Int16 } }.
	scmple := TRILOpcode from: { 'scmple' .  Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfLess |  CompareTrueIfEqual . { Int16 . Int16 } }.
	sucmplt := TRILOpcode from: { 'sucmplt' .  Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfLess . { Int16 . Int16 } }.
	sucmpge := TRILOpcode from: { 'sucmpge' .  Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfGreater |  CompareTrueIfEqual . { Int16 . Int16 } }.
	sucmpgt := TRILOpcode from: { 'sucmpgt' .  Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfGreater . { Int16 . Int16 } }.
	sucmple := TRILOpcode from: { 'sucmple' .  Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfLess |  CompareTrueIfEqual . { Int16 . Int16 } }.
	lcmp := TRILOpcode from: { 'lcmp' .  Int32 . 0 .  ValueNumberShare |  SupportedForPRE |  CondCodeComputation .  Signum . { Int64 . Int64 } }.
	fcmpl := TRILOpcode from: { 'fcmpl' .  Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfLess . { Float . Float } }.
	fcmpg := TRILOpcode from: { 'fcmpg' .  Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfGreater |  CompareTrueIfEqual . { Float . Float } }.
	dcmpl := TRILOpcode from: { 'dcmpl' .  Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfLess . { Double . Double } }.
	dcmpg := TRILOpcode from: { 'dcmpg' .  Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfGreater |  CompareTrueIfEqual . { Double . Double } }.
	ificmpeq := TRILOpcode from: { 'ificmpeq' .  NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfEqual . { Int32 . Int32 } }.
	ificmpne := TRILOpcode from: { 'ificmpne' .  NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfLess |  CompareTrueIfGreater . { Int32 . Int32 } }.
	ificmplt := TRILOpcode from: { 'ificmplt' .  NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfLess . { Int32 . Int32 } }.
	ificmpge := TRILOpcode from: { 'ificmpge' .  NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfGreater |  CompareTrueIfEqual . { Int32 . Int32 } }.
	ificmpgt := TRILOpcode from: { 'ificmpgt' .  NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfGreater . { Int32 . Int32 } }.
	ificmple := TRILOpcode from: { 'ificmple' .  NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfLess |  CompareTrueIfEqual . { Int32 . Int32 } }.
	ifiucmplt := TRILOpcode from: { 'ifiucmplt' .  NoType .  BooleanCompare |  Branch |  TreeTop .  UnsignedCompare .  CompareTrueIfLess . { Int32 . Int32 } }.
	ifiucmpge := TRILOpcode from: { 'ifiucmpge' .  NoType .  BooleanCompare |  Branch |  TreeTop .  UnsignedCompare .  CompareTrueIfGreater |  CompareTrueIfEqual . { Int32 . Int32 } }.
	ifiucmpgt := TRILOpcode from: { 'ifiucmpgt' .  NoType .  BooleanCompare |  Branch |  TreeTop .  UnsignedCompare .  CompareTrueIfGreater . { Int32 . Int32 } }.
	ifiucmple := TRILOpcode from: { 'ifiucmple' .  NoType .  BooleanCompare |  Branch |  TreeTop .  UnsignedCompare .  CompareTrueIfLess |  CompareTrueIfEqual . { Int32 . Int32 } }.
	iflcmpeq := TRILOpcode from: { 'iflcmpeq' .  NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfEqual . { Int64 . Int64 } }.
	iflcmpne := TRILOpcode from: { 'iflcmpne' .  NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfLess |  CompareTrueIfGreater . { Int64 . Int64 } }.
	iflcmplt := TRILOpcode from: { 'iflcmplt' .  NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfLess . { Int64 . Int64 } }.
	iflcmpge := TRILOpcode from: { 'iflcmpge' .  NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfGreater |  CompareTrueIfEqual . { Int64 . Int64 } }.
	iflcmpgt := TRILOpcode from: { 'iflcmpgt' .  NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfGreater . { Int64 . Int64 } }.
	iflcmple := TRILOpcode from: { 'iflcmple' .  NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfLess |  CompareTrueIfEqual . { Int64 . Int64 } }.
	iflucmplt := TRILOpcode from: { 'iflucmplt' .  NoType .  BooleanCompare |  Branch |  TreeTop .  UnsignedCompare .  CompareTrueIfLess . { Int64 . Int64 } }.
	iflucmpge := TRILOpcode from: { 'iflucmpge' .  NoType .  BooleanCompare |  Branch |  TreeTop .  UnsignedCompare .  CompareTrueIfGreater |  CompareTrueIfEqual . { Int64 . Int64 } }.
	iflucmpgt := TRILOpcode from: { 'iflucmpgt' .  NoType .  BooleanCompare |  Branch |  TreeTop .  UnsignedCompare .  CompareTrueIfGreater . { Int64 . Int64 } }.
	iflucmple := TRILOpcode from: { 'iflucmple' .  NoType .  BooleanCompare |  Branch |  TreeTop .  UnsignedCompare .  CompareTrueIfLess |  CompareTrueIfEqual . { Int64 . Int64 } }.
	iffcmpeq := TRILOpcode from: { 'iffcmpeq' .  NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfEqual . { Float . Float } }.
	iffcmpne := TRILOpcode from: { 'iffcmpne' .  NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfLess |  CompareTrueIfGreater . { Float . Float } }.
	iffcmplt := TRILOpcode from: { 'iffcmplt' .  NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfLess . { Float . Float } }.
	iffcmpge := TRILOpcode from: { 'iffcmpge' .  NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfGreater |  CompareTrueIfEqual . { Float . Float } }.
	iffcmpgt := TRILOpcode from: { 'iffcmpgt' .  NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfGreater . { Float . Float } }.
	iffcmple := TRILOpcode from: { 'iffcmple' .  NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfLess |  CompareTrueIfEqual . { Float . Float } }.
	iffcmpequ := TRILOpcode from: { 'iffcmpequ' .  NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfEqual |  CompareTrueIfUnordered . { Float . Float } }.
	iffcmpneu := TRILOpcode from: { 'iffcmpneu' .  NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfLess |  CompareTrueIfGreater |  CompareTrueIfUnordered . { Float . Float } }.
	iffcmpltu := TRILOpcode from: { 'iffcmpltu' .  NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfLess |  CompareTrueIfUnordered . { Float . Float } }.
	iffcmpgeu := TRILOpcode from: { 'iffcmpgeu' .  NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfGreater |  CompareTrueIfEqual |  CompareTrueIfUnordered . { Float . Float } }.
	iffcmpgtu := TRILOpcode from: { 'iffcmpgtu' .  NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfGreater |  CompareTrueIfUnordered . { Float . Float } }.
	iffcmpleu := TRILOpcode from: { 'iffcmpleu' .  NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfLess |  CompareTrueIfEqual |  CompareTrueIfUnordered . { Float . Float } }.
	ifdcmpeq := TRILOpcode from: { 'ifdcmpeq' .  NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfEqual . { Double . Double } }.
	ifdcmpne := TRILOpcode from: { 'ifdcmpne' .  NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfLess |  CompareTrueIfGreater . { Double . Double } }.
	ifdcmplt := TRILOpcode from: { 'ifdcmplt' .  NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfLess . { Double . Double } }.
	ifdcmpge := TRILOpcode from: { 'ifdcmpge' .  NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfGreater |  CompareTrueIfEqual . { Double . Double } }.
	ifdcmpgt := TRILOpcode from: { 'ifdcmpgt' .  NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfGreater . { Double . Double } }.
	ifdcmple := TRILOpcode from: { 'ifdcmple' .  NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfLess |  CompareTrueIfEqual . { Double . Double } }.
	ifdcmpequ := TRILOpcode from: { 'ifdcmpequ' .  NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfEqual |  CompareTrueIfUnordered . { Double . Double } }.
	ifdcmpneu := TRILOpcode from: { 'ifdcmpneu' .  NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfLess |  CompareTrueIfGreater |  CompareTrueIfUnordered . { Double . Double } }.
	ifdcmpltu := TRILOpcode from: { 'ifdcmpltu' .  NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfLess |  CompareTrueIfUnordered . { Double . Double } }.
	ifdcmpgeu := TRILOpcode from: { 'ifdcmpgeu' .  NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfGreater |  CompareTrueIfEqual |  CompareTrueIfUnordered . { Double . Double } }.
	ifdcmpgtu := TRILOpcode from: { 'ifdcmpgtu' .  NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfGreater |  CompareTrueIfUnordered . { Double . Double } }.
	ifdcmpleu := TRILOpcode from: { 'ifdcmpleu' .  NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfLess |  CompareTrueIfEqual |  CompareTrueIfUnordered . { Double . Double } }.
	ifacmpeq := TRILOpcode from: { 'ifacmpeq' .  NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfEqual . { Address . Address } }.
	ifacmpne := TRILOpcode from: { 'ifacmpne' .  NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfLess |  CompareTrueIfGreater . { Address . Address } }.
	ifacmplt := TRILOpcode from: { 'ifacmplt' .  NoType .  BooleanCompare |  Branch |  TreeTop .  UnsignedCompare .  CompareTrueIfLess . { Address . Address } }.
	ifacmpge := TRILOpcode from: { 'ifacmpge' .  NoType .  BooleanCompare |  Branch |  TreeTop .  UnsignedCompare .  CompareTrueIfGreater |  CompareTrueIfEqual . { Address . Address } }.
	ifacmpgt := TRILOpcode from: { 'ifacmpgt' .  NoType .  BooleanCompare |  Branch |  TreeTop .  UnsignedCompare .  CompareTrueIfGreater . { Address . Address } }.
	ifacmple := TRILOpcode from: { 'ifacmple' .  NoType .  BooleanCompare |  Branch |  TreeTop .  UnsignedCompare .  CompareTrueIfLess |  CompareTrueIfEqual . { Address . Address } }.
	ifbcmpeq := TRILOpcode from: { 'ifbcmpeq' .  NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfEqual . { Int8 . Int8 } }.
	ifbcmpne := TRILOpcode from: { 'ifbcmpne' .  NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfLess |  CompareTrueIfGreater . { Int8 . Int8 } }.
	ifbcmplt := TRILOpcode from: { 'ifbcmplt' .  NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfLess . { Int8 . Int8 } }.
	ifbcmpge := TRILOpcode from: { 'ifbcmpge' .  NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfGreater |  CompareTrueIfEqual . { Int8 . Int8 } }.
	ifbcmpgt := TRILOpcode from: { 'ifbcmpgt' .  NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfGreater . { Int8 . Int8 } }.
	ifbcmple := TRILOpcode from: { 'ifbcmple' .  NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfLess |  CompareTrueIfEqual . { Int8 . Int8 } }.
	ifbucmplt := TRILOpcode from: { 'ifbucmplt' .  NoType .  BooleanCompare |  Branch |  TreeTop .  UnsignedCompare .  CompareTrueIfLess . { Int8 . Int8 } }.
	ifbucmpge := TRILOpcode from: { 'ifbucmpge' .  NoType .  BooleanCompare |  Branch |  TreeTop .  UnsignedCompare .  CompareTrueIfGreater |  CompareTrueIfEqual . { Int8 . Int8 } }.
	ifbucmpgt := TRILOpcode from: { 'ifbucmpgt' .  NoType .  BooleanCompare |  Branch |  TreeTop .  UnsignedCompare .  CompareTrueIfGreater . { Int8 . Int8 } }.
	ifbucmple := TRILOpcode from: { 'ifbucmple' .  NoType .  BooleanCompare |  Branch |  TreeTop .  UnsignedCompare .  CompareTrueIfLess |  CompareTrueIfEqual . { Int8 . Int8 } }.
	ifscmpeq := TRILOpcode from: { 'ifscmpeq' .  NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfEqual . { Int16 . Int16 } }.
	ifscmpne := TRILOpcode from: { 'ifscmpne' .  NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfLess |  CompareTrueIfGreater . { Int16 . Int16 } }.
	ifscmplt := TRILOpcode from: { 'ifscmplt' .  NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfLess . { Int16 . Int16 } }.
	ifscmpge := TRILOpcode from: { 'ifscmpge' .  NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfGreater |  CompareTrueIfEqual . { Int16 . Int16 } }.
	ifscmpgt := TRILOpcode from: { 'ifscmpgt' .  NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfGreater . { Int16 . Int16 } }.
	ifscmple := TRILOpcode from: { 'ifscmple' .  NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfLess |  CompareTrueIfEqual . { Int16 . Int16 } }.
	ifsucmplt := TRILOpcode from: { 'ifsucmplt' .  NoType .  BooleanCompare |  Branch |  TreeTop .  UnsignedCompare .  CompareTrueIfLess . { Int16 . Int16 } }.
	ifsucmpge := TRILOpcode from: { 'ifsucmpge' .  NoType .  BooleanCompare |  Branch |  TreeTop .  UnsignedCompare .  CompareTrueIfGreater |  CompareTrueIfEqual . { Int16 . Int16 } }.
	ifsucmpgt := TRILOpcode from: { 'ifsucmpgt' .  NoType .  BooleanCompare |  Branch |  TreeTop .  UnsignedCompare .  CompareTrueIfGreater . { Int16 . Int16 } }.
	ifsucmple := TRILOpcode from: { 'ifsucmple' .  NoType .  BooleanCompare |  Branch |  TreeTop .  UnsignedCompare .  CompareTrueIfLess |  CompareTrueIfEqual . { Int16 . Int16 } }.
	loadaddr := TRILOpcode from: { 'loadaddr' .  Address .  HasSymbolRef .  ValueNumberShare |  SupportedForPRE|  MayUseSystemStack |  LoadAddress .  LikeUse .  NoChildren  }.
	zerochk := TRILOpcode from: { 'zerochk' .  NoType .  TreeTop |  HasSymbolRef .  CanRaiseException |  Check|  MayUseSystemStack . 0 . {  Int32 } }.
	iregload := TRILOpcode from: { 'iregload' .  Int32 .  LoadReg . 0 . 0 .  NoChildren  }.
	aregload := TRILOpcode from: { 'aregload' .  Address .  LoadReg . 0 . 0 .  NoChildren  }.
	lregload := TRILOpcode from: { 'lregload' .  Int64 .  LoadReg . 0 . 0 .  NoChildren  }.
	fregload := TRILOpcode from: { 'fregload' .  Float .  LoadReg . 0 . 0 .  NoChildren  }.
	dregload := TRILOpcode from: { 'dregload' .  Double .  LoadReg . 0 . 0 .  NoChildren  }.
	sregload := TRILOpcode from: { 'sregload' .  Int16 .  LoadReg . 0 . 0 .  NoChildren  }.
	bregload := TRILOpcode from: { 'bregload' .  Int8 .  LoadReg . 0 . 0 .  NoChildren  }.
	iregstore := TRILOpcode from: { 'iregstore' .  Int32 .  StoreReg |  TreeTop . 0 . 0 . {  Int32 } }.
	aregstore := TRILOpcode from: { 'aregstore' .  Address .  StoreReg |  TreeTop . 0 . 0 . {  Address } }.
	lregstore := TRILOpcode from: { 'lregstore' .  Int64 .  StoreReg |  TreeTop . 0 . 0 . {  Int64 } }.
	fregstore := TRILOpcode from: { 'fregstore' .  Float .  StoreReg |  TreeTop . 0 . 0 . {  Float } }.
	dregstore := TRILOpcode from: { 'dregstore' .  Double .  StoreReg |  TreeTop . 0 . 0 . {  Double } }.
	sregstore := TRILOpcode from: { 'sregstore' .  Int16 .  StoreReg |  TreeTop . 0 . 0 . {  Int16 } }.
	bregstore := TRILOpcode from: { 'bregstore' .  Int8 .  StoreReg |  TreeTop . 0 . 0 . {  Int8 } }.
	glregdeps := TRILOpcode from: { 'glregdeps' .  NoType . 0 . 0 . 0 .  Unspecified }.
	iselect := TRILOpcode from: { 'iselect' .  Int32 . 0 .  ValueNumberShare |  SupportedForPRE |  Select . 0 . {  Int32 .  Int32 .  Int32 } }.
	lselect := TRILOpcode from: { 'lselect' .  Int64 . 0 .  ValueNumberShare |  SupportedForPRE |  Select . 0 . {  Int32 .  Int64 .  Int64 } }.
	bselect := TRILOpcode from: { 'bselect' .  Int8 . 0 .  ValueNumberShare |  SupportedForPRE |  Select . 0 . {  Int32 .  Int8 .  Int8 } }.
	sselect := TRILOpcode from: { 'sselect' .  Int16 . 0 .  ValueNumberShare |  SupportedForPRE |  Select . 0 . {  Int32 .  Int16 .  Int16 } }.
	aselect := TRILOpcode from: { 'aselect' .  Address . 0 .  ValueNumberShare |  SupportedForPRE |  Select . 0 . {  Int32 .  Address .  Address } }.
	fselect := TRILOpcode from: { 'fselect' .  Float . 0 .  ValueNumberShare |  SupportedForPRE |  Select . 0 . {  Int32 .  Float .  Float } }.
	dselect := TRILOpcode from: { 'dselect' .  Double . 0 .  ValueNumberShare |  SupportedForPRE |  Select . 0 . {  Int32 .  Double .  Double } }.
	treetop := TRILOpcode from: { 'treetop' .  NoType .  TreeTop . 0 . 0 . {  UnspecifiedChildType } }.
	methodenterhook := TRILOpcode from: { 'methodenterhook' .  NoType .  TreeTop |  HasSymbolRef .  MustBeLowered|  MayUseSystemStack . 0 .  NoChildren  }.
	methodexithook := TRILOpcode from: { 'methodexithook' .  NoType .  TreeTop |  HasSymbolRef .  MustBeLowered|  MayUseSystemStack . 0 .  NoChildren  }.
	passthrough := TRILOpcode from: { 'passthrough' .  NoType . 0 .  ValueNumberShare . 0 . {  UnspecifiedChildType } }.
	compressedrefs := TRILOpcode from: { 'compressedrefs' .  Address .  TreeTop . 0 . 0 . {  UnspecifiedChildType .  Int64 } }.
	bbstart := TRILOpcode from: { 'bbstart' .  NoType .  TreeTop . 0 . 0 .  NoChildren  }.
	bbend := TRILOpcode from: { 'bbend' .  NoType .  TreeTop . 0 . 0 .  NoChildren  }.
	f2iu := TRILOpcode from: { 'f2iu' .  Int32 .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . {  Float } }.
	f2lu := TRILOpcode from: { 'f2lu' .  Int64 .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . {  Float } }.
	f2bu := TRILOpcode from: { 'f2bu' .  Int8 .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . {  Float } }.
	f2c := TRILOpcode from: { 'f2c' .  Int16 .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . {  Float } }.
	d2iu := TRILOpcode from: { 'd2iu' .  Int32 .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . {  Double } }.
	d2lu := TRILOpcode from: { 'd2lu' .  Int64 .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . {  Double } }.
	d2bu := TRILOpcode from: { 'd2bu' .  Int8 .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . {  Double } }.
	d2c := TRILOpcode from: { 'd2c' .  Int16 .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . {  Double } }.
	monent := TRILOpcode from: { 'monent' .  NoType .  TreeTop |  HasSymbolRef .  CanRaiseException|  MayUseSystemStack .  LikeDef . {  UnspecifiedChildType } }.
	monexit := TRILOpcode from: { 'monexit' .  NoType .  TreeTop |  HasSymbolRef .  CanRaiseException|  MayUseSystemStack .  LikeDef . {  UnspecifiedChildType } }.
	monexitfence := TRILOpcode from: { 'monexitfence' .  NoType .  TreeTop .  CanRaiseException|  MayUseSystemStack . 0 .  NoChildren  }.
	tstart := TRILOpcode from: { 'tstart' .  NoType .  HasSymbolRef |  TreeTop .  JumpWithMultipleTargets .  HasBranchChild . { NoType . NoType . NoType } }.
	tfinish := TRILOpcode from: { 'tfinish' .  NoType .  HasSymbolRef |  TreeTop . 0 . 0 .  NoChildren  }.
	tabort := TRILOpcode from: { 'tabort' .  NoType .  HasSymbolRef |  TreeTop . 0 . 0 .  NoChildren  }.
	instanceof := TRILOpcode from: { 'instanceof' .  Int32 .  HasSymbolRef .  MayUseSystemStack . 0 . { Address . Address } }.
	checkcast := TRILOpcode from: { 'checkcast' .  Address .  TreeTop |  HasSymbolRef .  CanRaiseException |  Check |  CheckCast|  MayUseSystemStack . 0 . { UnspecifiedChildType . UnspecifiedChildType } }.
	checkcastandnullchk := TRILOpcode from: { 'checkcastandnullchk' .  Address .  TreeTop |  HasSymbolRef .  CanRaiseException |  Check |  CheckCast|  MayUseSystemStack . 0 . { UnspecifiedChildType . UnspecifiedChildType } }.
	new := TRILOpcode from: { 'new' .  Address .  HasSymbolRef .  CanRaiseException|  MayUseSystemStack |  New .  LikeDef . {  UnspecifiedChildType } }.
	newvalue := TRILOpcode from: { 'newvalue' .  Address .  HasSymbolRef .  CanRaiseException|  MayUseSystemStack |  New .  LikeDef .  Unspecified }.
	newarray := TRILOpcode from: { 'newarray' .  Address .  HasSymbolRef .  CanRaiseException|  MayUseSystemStack |  New .  LikeDef . { UnspecifiedChildType . UnspecifiedChildType } }.
	anewarray := TRILOpcode from: { 'anewarray' .  Address .  HasSymbolRef .  CanRaiseException|  MayUseSystemStack |  New .  LikeDef . { UnspecifiedChildType . UnspecifiedChildType } }.
	variablenew := TRILOpcode from: { 'variablenew' .  Address .  HasSymbolRef .  CanRaiseException|  MayUseSystemStack .  LikeDef . {  UnspecifiedChildType } }.
	variablenewarray := TRILOpcode from: { 'variablenewarray' .  Address .  HasSymbolRef .  CanRaiseException|  MayUseSystemStack .  LikeDef . {  UnspecifiedChildType } }.
	multianewarray := TRILOpcode from: { 'multianewarray' .  Address .  HasSymbolRef .  MustBeLowered |  CanRaiseException|  MayUseSystemStack |  New .  LikeDef . {  UnspecifiedChildType } }.
	arraylength := TRILOpcode from: { 'arraylength' .  Int32 . 0 .  MustBeLowered |  ValueNumberShare |  SupportedForPRE .  ArrayLength . {  UnspecifiedChildType } }.
	contigarraylength := TRILOpcode from: { 'contigarraylength' .  Int32 . 0 .  MustBeLowered |  ValueNumberShare |  SupportedForPRE .  ArrayLength . {  UnspecifiedChildType } }.
	discontigarraylength := TRILOpcode from: { 'discontigarraylength' .  Int32 . 0 .  MustBeLowered |  ValueNumberShare |  SupportedForPRE .  ArrayLength . {  UnspecifiedChildType } }.
	icalli := TRILOpcode from: { 'icalli' .  Int32 .  Indirect |  Call |  HasSymbolRef .  CanRaiseException |  SupportedForPRE|  MayUseSystemStack .  LikeUse |  LikeDef .  IndirectCallType }.
	lcalli := TRILOpcode from: { 'lcalli' .  Int64 .  Indirect |  Call |  HasSymbolRef .  CanRaiseException |  SupportedForPRE|  MayUseSystemStack .  LikeUse |  LikeDef .  IndirectCallType }.
	fcalli := TRILOpcode from: { 'fcalli' .  Float .  Indirect |  Call |  HasSymbolRef .  CanRaiseException |  SupportedForPRE|  MayUseSystemStack .  LikeUse |  LikeDef .  IndirectCallType }.
	dcalli := TRILOpcode from: { 'dcalli' .  Double .  Indirect |  Call |  HasSymbolRef .  CanRaiseException |  SupportedForPRE|  MayUseSystemStack .  LikeUse |  LikeDef .  IndirectCallType }.
	acalli := TRILOpcode from: { 'acalli' .  Address .  Indirect |  Call |  HasSymbolRef .  CanRaiseException |  SupportedForPRE|  MayUseSystemStack .  LikeUse |  LikeDef .  IndirectCallType }.
	calli := TRILOpcode from: { 'calli' .  NoType .  Indirect |  Call |  HasSymbolRef .  CanRaiseException |  SupportedForPRE|  MayUseSystemStack .  LikeUse |  LikeDef .  IndirectCallType }.
	fence := TRILOpcode from: { 'fence' .  NoType .  TreeTop |  HasSymbolRef . 0 .  Fence |  LikeUse |  LikeDef .  NoChildren  }.
	luaddh := TRILOpcode from: { 'luaddh' .  Int64 .  Commutative |  Associative |  Add .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int64 . Int64 } }.
	aiadd := TRILOpcode from: { 'aiadd' .  Address .  Commutative |  Associative |  Add .  ValueNumberShare .  LikeUse . {  Address .  Int32 } }.
	aladd := TRILOpcode from: { 'aladd' .  Address .  Commutative |  Associative |  Add .  ValueNumberShare .  LikeUse . {  Address .  Int64 } }.
	lusubh := TRILOpcode from: { 'lusubh' .  Int64 .  Sub .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int64 . Int64 } }.
	imulh := TRILOpcode from: { 'imulh' .  Int32 .  Commutative |  Associative |  Mul .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int32 . Int32 } }.
	iumulh := TRILOpcode from: { 'iumulh' .  Int32 .  Commutative |  Associative |  Mul .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int32 . Int32 } }.
	lmulh := TRILOpcode from: { 'lmulh' .  Int64 .  Commutative |  Associative |  Mul .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int64 . Int64 } }.
	lumulh := TRILOpcode from: { 'lumulh' .  Int64 .  Commutative |  Associative |  Mul .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int64 . Int64 } }.
	ibits2f := TRILOpcode from: { 'ibits2f' .  Float . 0 .  ValueNumberShare |  SupportedForPRE . 0 . {  Int32 } }.
	fbits2i := TRILOpcode from: { 'fbits2i' .  Int32 . 0 .  ValueNumberShare |  SupportedForPRE . 0 . {  Float } }.
	lbits2d := TRILOpcode from: { 'lbits2d' .  Double . 0 .  ValueNumberShare |  SupportedForPRE . 0 . {  Int64 } }.
	dbits2l := TRILOpcode from: { 'dbits2l' .  Int64 . 0 .  ValueNumberShare |  SupportedForPRE . 0 . {  Double } }.
	lookup := TRILOpcode from: { 'lookup' .  NoType .  TreeTop |  Switch .  JumpWithMultipleTargets .  HasBranchChild .  Unspecified }.
	case := TRILOpcode from: { 'case' .  NoType .  Branch |  TreeTop . 0 . 0 .  NoChildren  }.
	table := TRILOpcode from: { 'table' .  NoType .  TreeTop |  Switch .  JumpWithMultipleTargets .  HasBranchChild .  Unspecified }.
	exceptionrangefence := TRILOpcode from: { 'exceptionrangefence' .  NoType .  TreeTop |  HasSymbolRef . 0 .  ExceptionRangeFence .  NoChildren  }.
	nullchk := TRILOpcode from: { 'nullchk' .  Address .  TreeTop |  HasSymbolRef .  ValueNumberShare |  CanRaiseException |  Check |  NullCheck|  MayUseSystemStack . 0 . {  UnspecifiedChildType } }.
	resolvechk := TRILOpcode from: { 'resolvechk' .  Address .  TreeTop |  HasSymbolRef .  ValueNumberShare |  CanRaiseException |  Check |  ResolveCheck|  MayUseSystemStack .  LikeDef . {  UnspecifiedChildType } }.
	resolveandnullchk := TRILOpcode from: { 'resolveandnullchk' .  Address .  TreeTop |  HasSymbolRef .  ValueNumberShare |  CanRaiseException |  Check |  NullCheck |  ResolveCheck|  MayUseSystemStack .  LikeDef . {  UnspecifiedChildType } }.
	divchk := TRILOpcode from: { 'divchk' .  NoType .  TreeTop |  HasSymbolRef .  CanRaiseException |  Check|  MayUseSystemStack . 0 . {  UnspecifiedChildType } }.
	overflowchk := TRILOpcode from: { 'overflowchk' .  NoType .  TreeTop |  HasSymbolRef .  Check|  MayUseSystemStack |  CanRaiseException . 0 . { UnspecifiedChildType . UnspecifiedChildType . UnspecifiedChildType } }.
	unsignedoverflowchk := TRILOpcode from: { 'unsignedoverflowchk' .  NoType .  TreeTop |  HasSymbolRef .  Check|  MayUseSystemStack |  CanRaiseException . 0 . { UnspecifiedChildType . UnspecifiedChildType . UnspecifiedChildType } }.
	bndchk := TRILOpcode from: { 'bndchk' .  Int32 .  TreeTop |  HasSymbolRef .  ValueNumberShare |  CanRaiseException |  Check |  BndCheck|  MayUseSystemStack . 0 . { UnspecifiedChildType . UnspecifiedChildType } }.
	arraycopybndchk := TRILOpcode from: { 'arraycopybndchk' .  Int32 .  TreeTop |  HasSymbolRef .  ValueNumberShare |  CanRaiseException |  Check |  BndCheck|  MayUseSystemStack . 0 . { UnspecifiedChildType . UnspecifiedChildType } }.
	bndchkwithspinechk := TRILOpcode from: { 'bndchkwithspinechk' .  Int32 .  TreeTop |  HasSymbolRef .  ValueNumberShare |  CanRaiseException |  Check |  BndCheck|  MayUseSystemStack .  SpineCheck .  Unspecified }.
	spinechk := TRILOpcode from: { 'spinechk' .  Int32 .  TreeTop |  HasSymbolRef .  ValueNumberShare |  Check .  SpineCheck .  Unspecified }.
	arraystorechk := TRILOpcode from: { 'arraystorechk' .  Address .  TreeTop |  HasSymbolRef .  ValueNumberShare |  CanRaiseException |  Check|  MayUseSystemStack . 0 . {  UnspecifiedChildType } }.
	arraychk := TRILOpcode from: { 'arraychk' .  Address .  TreeTop |  HasSymbolRef .  ValueNumberShare |  CanRaiseException |  Check|  MayUseSystemStack . 0 . { Address . Address } }.
	arraycopy := TRILOpcode from: { 'arraycopy' .  NoType .  Call |  HasSymbolRef .  MayUseSystemStack |  CanRaiseException | 0 .  LikeUse |  LikeDef |  SkipDynamicLitPoolOnInts .  Unspecified }.
	arrayset := TRILOpcode from: { 'arrayset' .  NoType .  Call |  HasSymbolRef . 0 .  LikeUse |  LikeDef |  SkipDynamicLitPoolOnInts .  Unspecified }.
	arraytranslate := TRILOpcode from: { 'arraytranslate' .  Int32 .  Call |  HasSymbolRef . 0 .  LikeUse |  LikeDef .  Unspecified }.
	arraytranslateandtest := TRILOpcode from: { 'arraytranslateandtest' .  Int32 .  Call |  HasSymbolRef .  CanRaiseException |  BndCheck .  LikeUse |  LikeDef .  Unspecified }.
	long2string := TRILOpcode from: { 'long2string' .  NoType .  Call |  HasSymbolRef . 0 .  LikeUse |  LikeDef .  Unspecified }.
	bitopmem := TRILOpcode from: { 'bitopmem' .  Int32 .  Call |  HasSymbolRef .  CondCodeComputation .  LikeUse |  LikeDef |  SkipDynamicLitPoolOnInts .  Unspecified }.
	arraycmp := TRILOpcode from: { 'arraycmp' .  Int32 .  Call |  HasSymbolRef .  CondCodeComputation .  LikeUse |  LikeDef |  SkipDynamicLitPoolOnInts . {  Address .  Address .  Int32 } }.
	allocationfence := TRILOpcode from: { 'allocationfence' .  NoType .  TreeTop . 0 . 0 .  NoChildren  }.
	loadfence := TRILOpcode from: { 'loadfence' .  NoType .  TreeTop |  HasSymbolRef . 0 .  LikeUse |  LikeDef .  Unspecified }.
	storefence := TRILOpcode from: { 'storefence' .  NoType .  TreeTop |  HasSymbolRef . 0 .  LikeUse |  LikeDef .  Unspecified }.
	fullfence := TRILOpcode from: { 'fullfence' .  NoType .  TreeTop |  HasSymbolRef . 0 .  LikeUse |  LikeDef .  Unspecified }.
	computecc := TRILOpcode from: { 'computecc' .  Int8 . 0 .  ValueNumberShare |  SupportedForPRE |  CondCodeComputation . 0 .  Unspecified }.
	butest := TRILOpcode from: { 'butest' .  Int32 . 0 .  ValueNumberShare |  SupportedForPRE |  CondCodeComputation . 0 .  Unspecified }.
	sutest := TRILOpcode from: { 'sutest' .  Int32 . 0 .  ValueNumberShare |  SupportedForPRE |  CondCodeComputation . 0 .  Unspecified }.
	bucmp := TRILOpcode from: { 'bucmp' .  Int32 . 0 .  ValueNumberShare |  SupportedForPRE |  UnsignedCompare |  CondCodeComputation .  Signum . { Int8 . Int8 } }.
	bcmp := TRILOpcode from: { 'bcmp' .  Int32 . 0 .  ValueNumberShare |  SupportedForPRE |  CondCodeComputation .  Signum . { Int8 . Int8 } }.
	sucmp := TRILOpcode from: { 'sucmp' .  Int32 . 0 .  ValueNumberShare |  SupportedForPRE |  UnsignedCompare |  CondCodeComputation .  Signum . { Int16 . Int16 } }.
	scmp := TRILOpcode from: { 'scmp' .  Int32 . 0 .  ValueNumberShare |  SupportedForPRE |  CondCodeComputation .  Signum . { Int16 . Int16 } }.
	iucmp := TRILOpcode from: { 'iucmp' .  Int32 . 0 .  ValueNumberShare |  SupportedForPRE |  UnsignedCompare |  CondCodeComputation .  Signum . { Int32 . Int32 } }.
	icmp := TRILOpcode from: { 'icmp' .  Int32 . 0 .  ValueNumberShare |  SupportedForPRE |  CondCodeComputation .  Signum . { Int32 . Int32 } }.
	lucmp := TRILOpcode from: { 'lucmp' .  Int32 . 0 .  ValueNumberShare |  SupportedForPRE |  UnsignedCompare |  CondCodeComputation .  Signum . { Int64 . Int64 } }.
	ificmpo := TRILOpcode from: { 'ificmpo' .  NoType .  BooleanCompare |  Branch |  TreeTop .  OverflowCompare . 0 . { Int32 . Int32 } }.
	ificmpno := TRILOpcode from: { 'ificmpno' .  NoType .  BooleanCompare |  Branch |  TreeTop .  OverflowCompare . 0 . { Int32 . Int32 } }.
	iflcmpo := TRILOpcode from: { 'iflcmpo' .  NoType .  BooleanCompare |  Branch |  TreeTop .  OverflowCompare . 0 . { Int64 . Int64 } }.
	iflcmpno := TRILOpcode from: { 'iflcmpno' .  NoType .  BooleanCompare |  Branch |  TreeTop .  OverflowCompare . 0 . { Int64 . Int64 } }.
	ificmno := TRILOpcode from: { 'ificmno' .  NoType .  BooleanCompare |  Branch |  TreeTop .  OverflowCompare . 0 . { Int32 . Int32 } }.
	ificmnno := TRILOpcode from: { 'ificmnno' .  NoType .  BooleanCompare |  Branch |  TreeTop .  OverflowCompare . 0 . { Int32 . Int32 } }.
	iflcmno := TRILOpcode from: { 'iflcmno' .  NoType .  BooleanCompare |  Branch |  TreeTop .  OverflowCompare . 0 . { Int64 . Int64 } }.
	iflcmnno := TRILOpcode from: { 'iflcmnno' .  NoType .  BooleanCompare |  Branch |  TreeTop .  OverflowCompare . 0 . { Int64 . Int64 } }.
	iuaddc := TRILOpcode from: { 'iuaddc' .  Int32 . 0 .  ValueNumberShare |  SupportedForPRE |  SelectAdd . 0 . { Int32 . Int32 } }.
	luaddc := TRILOpcode from: { 'luaddc' .  Int64 . 0 .  ValueNumberShare |  SupportedForPRE |  SelectAdd . 0 . { Int64 . Int64 } }.
	iusubb := TRILOpcode from: { 'iusubb' .  Int32 . 0 .  ValueNumberShare |  SupportedForPRE |  SelectSub . 0 . { Int32 . Int32 } }.
	lusubb := TRILOpcode from: { 'lusubb' .  Int64 . 0 .  ValueNumberShare |  SupportedForPRE |  SelectSub . 0 . { Int64 . Int64 } }.
	icmpset := TRILOpcode from: { 'icmpset' .  Int32 .  Call |  HasSymbolRef . 0 .  LikeUse |  LikeDef . {  Address .  Int32 .  Int32 } }.
	lcmpset := TRILOpcode from: { 'lcmpset' .  Int32 .  Call |  HasSymbolRef . 0 .  LikeUse |  LikeDef . {  Address .  Int64 .  Int64 } }.
	bztestnset := TRILOpcode from: { 'bztestnset' .  Int8 .  Call |  HasSymbolRef . 0 .  LikeUse |  LikeDef . {  Address .  UnspecifiedChildType } }.
	ibatomicor := TRILOpcode from: { 'ibatomicor' .  NoType .  LoadVar |  Store |  Indirect |  TreeTop |  HasSymbolRef .  ValueNumberShare|  MayUseSystemStack .  LikeUse |  LikeDef . {  Address .  Int8 } }.
	isatomicor := TRILOpcode from: { 'isatomicor' .  NoType .  LoadVar |  Store |  Indirect |  TreeTop |  HasSymbolRef .  ValueNumberShare|  MayUseSystemStack .  LikeUse |  LikeDef . {  Address .  Int16 } }.
	iiatomicor := TRILOpcode from: { 'iiatomicor' .  NoType .  LoadVar |  Store |  Indirect |  TreeTop |  HasSymbolRef .  ValueNumberShare|  MayUseSystemStack .  LikeUse |  LikeDef . {  Address .  Int32 } }.
	ilatomicor := TRILOpcode from: { 'ilatomicor' .  NoType .  LoadVar |  Store |  Indirect |  TreeTop |  HasSymbolRef .  ValueNumberShare|  MayUseSystemStack .  LikeUse |  LikeDef . {  Address .  Int64 } }.
	branch := TRILOpcode from: { 'branch' .  NoType .  Branch |  CompBranchOnly |  TreeTop . 0 . 0 .  NoChildren  }.
	igoto := TRILOpcode from: { 'igoto' .  NoType .  TreeTop .  JumpWithMultipleTargets . 0 . {  Address } }.
	fsqrt := TRILOpcode from: { 'fsqrt' .  Float . 0 .  ValueNumberShare |  SupportedForPRE . 0 . {  Float } }.
	dsqrt := TRILOpcode from: { 'dsqrt' .  Double . 0 .  ValueNumberShare |  SupportedForPRE . 0 . {  Double } }.
	dfloor := TRILOpcode from: { 'dfloor' .  Double . 0 .  ValueNumberShare |  SupportedForPRE . 0 . {  Double } }.
	ffloor := TRILOpcode from: { 'ffloor' .  Float . 0 .  ValueNumberShare |  SupportedForPRE . 0 . {  Float } }.
	dceil := TRILOpcode from: { 'dceil' .  Double . 0 .  ValueNumberShare |  SupportedForPRE . 0 . {  Double } }.
	fceil := TRILOpcode from: { 'fceil' .  Float . 0 .  ValueNumberShare |  SupportedForPRE . 0 . {  Float } }.
	imax := TRILOpcode from: { 'imax' .  Int32 . 0 .  ValueNumberShare |  SupportedForPRE |  Max . 0 . { Int32 . Int32 } }.
	iumax := TRILOpcode from: { 'iumax' .  Int32 . 0 .  ValueNumberShare |  SupportedForPRE |  Max . 0 . { Int32 . Int32 } }.
	lmax := TRILOpcode from: { 'lmax' .  Int64 . 0 .  ValueNumberShare |  SupportedForPRE |  Max . 0 . { Int64 . Int64 } }.
	lumax := TRILOpcode from: { 'lumax' .  Int64 . 0 .  ValueNumberShare |  SupportedForPRE |  Max . 0 . { Int64 . Int64 } }.
	fmax := TRILOpcode from: { 'fmax' .  Float . 0 .  ValueNumberShare |  SupportedForPRE |  Max . 0 . { Float . Float } }.
	dmax := TRILOpcode from: { 'dmax' .  Double . 0 .  ValueNumberShare |  SupportedForPRE |  Max . 0 . { Double . Double } }.
	imin := TRILOpcode from: { 'imin' .  Int32 . 0 .  ValueNumberShare |  SupportedForPRE |  Min . 0 . { Int32 . Int32 } }.
	iumin := TRILOpcode from: { 'iumin' .  Int32 . 0 .  ValueNumberShare |  SupportedForPRE |  Min . 0 . { Int32 . Int32 } }.
	lmin := TRILOpcode from: { 'lmin' .  Int64 . 0 .  ValueNumberShare |  SupportedForPRE |  Min . 0 . { Int64 . Int64 } }.
	lumin := TRILOpcode from: { 'lumin' .  Int64 . 0 .  ValueNumberShare |  SupportedForPRE |  Min . 0 . { Int64 . Int64 } }.
	fmin := TRILOpcode from: { 'fmin' .  Float . 0 .  ValueNumberShare |  SupportedForPRE |  Min . 0 . { Float . Float } }.
	dmin := TRILOpcode from: { 'dmin' .  Double . 0 .  ValueNumberShare |  SupportedForPRE |  Min . 0 . { Double . Double } }.
	ihbit := TRILOpcode from: { 'ihbit' .  Int32 . 0 .  SupportedForPRE . 0 .  Unspecified }.
	ilbit := TRILOpcode from: { 'ilbit' .  Int32 . 0 .  SupportedForPRE . 0 .  Unspecified }.
	inolz := TRILOpcode from: { 'inolz' .  Int32 . 0 .  SupportedForPRE . 0 .  Unspecified }.
	inotz := TRILOpcode from: { 'inotz' .  Int32 . 0 .  SupportedForPRE . 0 .  Unspecified }.
	ipopcnt := TRILOpcode from: { 'ipopcnt' .  Int32 . 0 .  SupportedForPRE . 0 .  Unspecified }.
	lhbit := TRILOpcode from: { 'lhbit' .  Int64 . 0 .  SupportedForPRE . 0 .  Unspecified }.
	llbit := TRILOpcode from: { 'llbit' .  Int64 . 0 .  SupportedForPRE . 0 .  Unspecified }.
	lnolz := TRILOpcode from: { 'lnolz' .  Int32 . 0 .  SupportedForPRE . 0 .  Unspecified }.
	lnotz := TRILOpcode from: { 'lnotz' .  Int32 . 0 .  SupportedForPRE . 0 .  Unspecified }.
	lpopcnt := TRILOpcode from: { 'lpopcnt' .  Int32 . 0 .  SupportedForPRE . 0 .  Unspecified }.
	sbyteswap := TRILOpcode from: { 'sbyteswap' .  Int16 . 0 .  ValueNumberShare |  SupportedForPRE |  ByteSwap . 0 . {  Int16 } }.
	ibyteswap := TRILOpcode from: { 'ibyteswap' .  Int32 . 0 .  ValueNumberShare |  SupportedForPRE |  ByteSwap . 0 . {  Int32 } }.
	lbyteswap := TRILOpcode from: { 'lbyteswap' .  Int64 . 0 .  ValueNumberShare |  SupportedForPRE |  ByteSwap . 0 . {  Int64 } }.
	bbitpermute := TRILOpcode from: { 'bbitpermute' .  Int8 . 0 .  ValueNumberShare |  SupportedForPRE .  LikeUse . {  Int8 .  Address .  Int32 } }.
	sbitpermute := TRILOpcode from: { 'sbitpermute' .  Int16 . 0 .  ValueNumberShare |  SupportedForPRE .  LikeUse . {  Int16 .  Address .  Int32 } }.
	ibitpermute := TRILOpcode from: { 'ibitpermute' .  Int32 . 0 .  ValueNumberShare |  SupportedForPRE .  LikeUse . {  Int32 .  Address .  Int32 } }.
	lbitpermute := TRILOpcode from: { 'lbitpermute' .  Int64 . 0 .  ValueNumberShare |  SupportedForPRE .  LikeUse . {  Int64 .  Address .  Int32 } }.
	prefetch := TRILOpcode from: { 'prefetch' .  NoType .  TreeTop |  HasSymbolRef . 0 . 0 .  Unspecified }.
]
