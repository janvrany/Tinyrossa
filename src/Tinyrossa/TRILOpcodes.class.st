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

	| UnspecifiedChildType NoType NoChildren Unspecified"Children" IndirectCallType BadILOp |

	"Local constants used (generated) initialization"
	UnspecifiedChildType := TRDataTypeUnspecified new.
	NoType := Void.
	NoChildren := #().
	Unspecified"Children" := nil.
	IndirectCallType := Unspecified"Children".

	invalid := BadILOp := TRILOpcode new.









	aconst := TRILOpcode new.
	iconst := TRILOpcode new.
	lconst := TRILOpcode new.
	fconst := TRILOpcode new.
	dconst := TRILOpcode new.
	bconst := TRILOpcode new.
	sconst := TRILOpcode new.
	iload := TRILOpcode new.
	fload := TRILOpcode new.
	dload := TRILOpcode new.
	aload := TRILOpcode new.
	bload := TRILOpcode new.
	sload := TRILOpcode new.
	lload := TRILOpcode new.
	irdbar := TRILOpcode new.
	frdbar := TRILOpcode new.
	drdbar := TRILOpcode new.
	ardbar := TRILOpcode new.
	brdbar := TRILOpcode new.
	srdbar := TRILOpcode new.
	lrdbar := TRILOpcode new.
	iloadi := TRILOpcode new.
	floadi := TRILOpcode new.
	dloadi := TRILOpcode new.
	aloadi := TRILOpcode new.
	bloadi := TRILOpcode new.
	sloadi := TRILOpcode new.
	lloadi := TRILOpcode new.
	irdbari := TRILOpcode new.
	frdbari := TRILOpcode new.
	drdbari := TRILOpcode new.
	ardbari := TRILOpcode new.
	brdbari := TRILOpcode new.
	srdbari := TRILOpcode new.
	lrdbari := TRILOpcode new.
	istore := TRILOpcode new.
	lstore := TRILOpcode new.
	fstore := TRILOpcode new.
	dstore := TRILOpcode new.
	astore := TRILOpcode new.
	bstore := TRILOpcode new.
	sstore := TRILOpcode new.
	iwrtbar := TRILOpcode new.
	lwrtbar := TRILOpcode new.
	fwrtbar := TRILOpcode new.
	dwrtbar := TRILOpcode new.
	awrtbar := TRILOpcode new.
	bwrtbar := TRILOpcode new.
	swrtbar := TRILOpcode new.
	lstorei := TRILOpcode new.
	fstorei := TRILOpcode new.
	dstorei := TRILOpcode new.
	astorei := TRILOpcode new.
	bstorei := TRILOpcode new.
	sstorei := TRILOpcode new.
	istorei := TRILOpcode new.
	lwrtbari := TRILOpcode new.
	fwrtbari := TRILOpcode new.
	dwrtbari := TRILOpcode new.
	awrtbari := TRILOpcode new.
	bwrtbari := TRILOpcode new.
	swrtbari := TRILOpcode new.
	iwrtbari := TRILOpcode new.
	goto := TRILOpcode new.
	ireturn := TRILOpcode new.
	lreturn := TRILOpcode new.
	freturn := TRILOpcode new.
	dreturn := TRILOpcode new.
	areturn := TRILOpcode new.
	return := TRILOpcode new.
	asynccheck := TRILOpcode new.
	athrow := TRILOpcode new.
	icall := TRILOpcode new.
	lcall := TRILOpcode new.
	fcall := TRILOpcode new.
	dcall := TRILOpcode new.
	acall := TRILOpcode new.
	call := TRILOpcode new.
	iadd := TRILOpcode new.
	ladd := TRILOpcode new.
	fadd := TRILOpcode new.
	dadd := TRILOpcode new.
	badd := TRILOpcode new.
	sadd := TRILOpcode new.
	isub := TRILOpcode new.
	lsub := TRILOpcode new.
	fsub := TRILOpcode new.
	dsub := TRILOpcode new.
	bsub := TRILOpcode new.
	ssub := TRILOpcode new.
	asub := TRILOpcode new.
	imul := TRILOpcode new.
	lmul := TRILOpcode new.
	fmul := TRILOpcode new.
	dmul := TRILOpcode new.
	bmul := TRILOpcode new.
	smul := TRILOpcode new.
	idiv := TRILOpcode new.
	ldiv := TRILOpcode new.
	fdiv := TRILOpcode new.
	ddiv := TRILOpcode new.
	bdiv := TRILOpcode new.
	sdiv := TRILOpcode new.
	iudiv := TRILOpcode new.
	ludiv := TRILOpcode new.
	irem := TRILOpcode new.
	lrem := TRILOpcode new.
	frem := TRILOpcode new.
	drem := TRILOpcode new.
	brem := TRILOpcode new.
	srem := TRILOpcode new.
	iurem := TRILOpcode new.
	ineg := TRILOpcode new.
	lneg := TRILOpcode new.
	fneg := TRILOpcode new.
	dneg := TRILOpcode new.
	bneg := TRILOpcode new.
	sneg := TRILOpcode new.
	iabs := TRILOpcode new.
	labs := TRILOpcode new.
	fabs := TRILOpcode new.
	dabs := TRILOpcode new.
	ishl := TRILOpcode new.
	lshl := TRILOpcode new.
	bshl := TRILOpcode new.
	sshl := TRILOpcode new.
	ishr := TRILOpcode new.
	lshr := TRILOpcode new.
	bshr := TRILOpcode new.
	sshr := TRILOpcode new.
	iushr := TRILOpcode new.
	lushr := TRILOpcode new.
	bushr := TRILOpcode new.
	sushr := TRILOpcode new.
	irol := TRILOpcode new.
	lrol := TRILOpcode new.
	iand := TRILOpcode new.
	land := TRILOpcode new.
	band := TRILOpcode new.
	sand := TRILOpcode new.
	ior := TRILOpcode new.
	lor := TRILOpcode new.
	bor := TRILOpcode new.
	sor := TRILOpcode new.
	ixor := TRILOpcode new.
	lxor := TRILOpcode new.
	bxor := TRILOpcode new.
	sxor := TRILOpcode new.
	i2l := TRILOpcode new.
	i2f := TRILOpcode new.
	i2d := TRILOpcode new.
	i2b := TRILOpcode new.
	i2s := TRILOpcode new.
	i2a := TRILOpcode new.
	iu2l := TRILOpcode new.
	iu2f := TRILOpcode new.
	iu2d := TRILOpcode new.
	iu2a := TRILOpcode new.
	l2i := TRILOpcode new.
	l2f := TRILOpcode new.
	l2d := TRILOpcode new.
	l2b := TRILOpcode new.
	l2s := TRILOpcode new.
	l2a := TRILOpcode new.
	lu2f := TRILOpcode new.
	lu2d := TRILOpcode new.
	lu2a := TRILOpcode new.
	f2i := TRILOpcode new.
	f2l := TRILOpcode new.
	f2d := TRILOpcode new.
	f2b := TRILOpcode new.
	f2s := TRILOpcode new.
	d2i := TRILOpcode new.
	d2l := TRILOpcode new.
	d2f := TRILOpcode new.
	d2b := TRILOpcode new.
	d2s := TRILOpcode new.
	b2i := TRILOpcode new.
	b2l := TRILOpcode new.
	b2f := TRILOpcode new.
	b2d := TRILOpcode new.
	b2s := TRILOpcode new.
	b2a := TRILOpcode new.
	bu2i := TRILOpcode new.
	bu2l := TRILOpcode new.
	bu2f := TRILOpcode new.
	bu2d := TRILOpcode new.
	bu2s := TRILOpcode new.
	bu2a := TRILOpcode new.
	s2i := TRILOpcode new.
	s2l := TRILOpcode new.
	s2f := TRILOpcode new.
	s2d := TRILOpcode new.
	s2b := TRILOpcode new.
	s2a := TRILOpcode new.
	su2i := TRILOpcode new.
	su2l := TRILOpcode new.
	su2f := TRILOpcode new.
	su2d := TRILOpcode new.
	su2a := TRILOpcode new.
	a2i := TRILOpcode new.
	a2l := TRILOpcode new.
	a2b := TRILOpcode new.
	a2s := TRILOpcode new.
	icmpeq := TRILOpcode new.
	icmpne := TRILOpcode new.
	icmplt := TRILOpcode new.
	icmpge := TRILOpcode new.
	icmpgt := TRILOpcode new.
	icmple := TRILOpcode new.
	iucmplt := TRILOpcode new.
	iucmpge := TRILOpcode new.
	iucmpgt := TRILOpcode new.
	iucmple := TRILOpcode new.
	lcmpeq := TRILOpcode new.
	lcmpne := TRILOpcode new.
	lcmplt := TRILOpcode new.
	lcmpge := TRILOpcode new.
	lcmpgt := TRILOpcode new.
	lcmple := TRILOpcode new.
	lucmplt := TRILOpcode new.
	lucmpge := TRILOpcode new.
	lucmpgt := TRILOpcode new.
	lucmple := TRILOpcode new.
	fcmpeq := TRILOpcode new.
	fcmpne := TRILOpcode new.
	fcmplt := TRILOpcode new.
	fcmpge := TRILOpcode new.
	fcmpgt := TRILOpcode new.
	fcmple := TRILOpcode new.
	fcmpequ := TRILOpcode new.
	fcmpneu := TRILOpcode new.
	fcmpltu := TRILOpcode new.
	fcmpgeu := TRILOpcode new.
	fcmpgtu := TRILOpcode new.
	fcmpleu := TRILOpcode new.
	dcmpeq := TRILOpcode new.
	dcmpne := TRILOpcode new.
	dcmplt := TRILOpcode new.
	dcmpge := TRILOpcode new.
	dcmpgt := TRILOpcode new.
	dcmple := TRILOpcode new.
	dcmpequ := TRILOpcode new.
	dcmpneu := TRILOpcode new.
	dcmpltu := TRILOpcode new.
	dcmpgeu := TRILOpcode new.
	dcmpgtu := TRILOpcode new.
	dcmpleu := TRILOpcode new.
	acmpeq := TRILOpcode new.
	acmpne := TRILOpcode new.
	acmplt := TRILOpcode new.
	acmpge := TRILOpcode new.
	acmpgt := TRILOpcode new.
	acmple := TRILOpcode new.
	bcmpeq := TRILOpcode new.
	bcmpne := TRILOpcode new.
	bcmplt := TRILOpcode new.
	bcmpge := TRILOpcode new.
	bcmpgt := TRILOpcode new.
	bcmple := TRILOpcode new.
	bucmplt := TRILOpcode new.
	bucmpge := TRILOpcode new.
	bucmpgt := TRILOpcode new.
	bucmple := TRILOpcode new.
	scmpeq := TRILOpcode new.
	scmpne := TRILOpcode new.
	scmplt := TRILOpcode new.
	scmpge := TRILOpcode new.
	scmpgt := TRILOpcode new.
	scmple := TRILOpcode new.
	sucmplt := TRILOpcode new.
	sucmpge := TRILOpcode new.
	sucmpgt := TRILOpcode new.
	sucmple := TRILOpcode new.
	lcmp := TRILOpcode new.
	fcmpl := TRILOpcode new.
	fcmpg := TRILOpcode new.
	dcmpl := TRILOpcode new.
	dcmpg := TRILOpcode new.
	ificmpeq := TRILOpcode new.
	ificmpne := TRILOpcode new.
	ificmplt := TRILOpcode new.
	ificmpge := TRILOpcode new.
	ificmpgt := TRILOpcode new.
	ificmple := TRILOpcode new.
	ifiucmplt := TRILOpcode new.
	ifiucmpge := TRILOpcode new.
	ifiucmpgt := TRILOpcode new.
	ifiucmple := TRILOpcode new.
	iflcmpeq := TRILOpcode new.
	iflcmpne := TRILOpcode new.
	iflcmplt := TRILOpcode new.
	iflcmpge := TRILOpcode new.
	iflcmpgt := TRILOpcode new.
	iflcmple := TRILOpcode new.
	iflucmplt := TRILOpcode new.
	iflucmpge := TRILOpcode new.
	iflucmpgt := TRILOpcode new.
	iflucmple := TRILOpcode new.
	iffcmpeq := TRILOpcode new.
	iffcmpne := TRILOpcode new.
	iffcmplt := TRILOpcode new.
	iffcmpge := TRILOpcode new.
	iffcmpgt := TRILOpcode new.
	iffcmple := TRILOpcode new.
	iffcmpequ := TRILOpcode new.
	iffcmpneu := TRILOpcode new.
	iffcmpltu := TRILOpcode new.
	iffcmpgeu := TRILOpcode new.
	iffcmpgtu := TRILOpcode new.
	iffcmpleu := TRILOpcode new.
	ifdcmpeq := TRILOpcode new.
	ifdcmpne := TRILOpcode new.
	ifdcmplt := TRILOpcode new.
	ifdcmpge := TRILOpcode new.
	ifdcmpgt := TRILOpcode new.
	ifdcmple := TRILOpcode new.
	ifdcmpequ := TRILOpcode new.
	ifdcmpneu := TRILOpcode new.
	ifdcmpltu := TRILOpcode new.
	ifdcmpgeu := TRILOpcode new.
	ifdcmpgtu := TRILOpcode new.
	ifdcmpleu := TRILOpcode new.
	ifacmpeq := TRILOpcode new.
	ifacmpne := TRILOpcode new.
	ifacmplt := TRILOpcode new.
	ifacmpge := TRILOpcode new.
	ifacmpgt := TRILOpcode new.
	ifacmple := TRILOpcode new.
	ifbcmpeq := TRILOpcode new.
	ifbcmpne := TRILOpcode new.
	ifbcmplt := TRILOpcode new.
	ifbcmpge := TRILOpcode new.
	ifbcmpgt := TRILOpcode new.
	ifbcmple := TRILOpcode new.
	ifbucmplt := TRILOpcode new.
	ifbucmpge := TRILOpcode new.
	ifbucmpgt := TRILOpcode new.
	ifbucmple := TRILOpcode new.
	ifscmpeq := TRILOpcode new.
	ifscmpne := TRILOpcode new.
	ifscmplt := TRILOpcode new.
	ifscmpge := TRILOpcode new.
	ifscmpgt := TRILOpcode new.
	ifscmple := TRILOpcode new.
	ifsucmplt := TRILOpcode new.
	ifsucmpge := TRILOpcode new.
	ifsucmpgt := TRILOpcode new.
	ifsucmple := TRILOpcode new.
	loadaddr := TRILOpcode new.
	zerochk := TRILOpcode new.
	iregload := TRILOpcode new.
	aregload := TRILOpcode new.
	lregload := TRILOpcode new.
	fregload := TRILOpcode new.
	dregload := TRILOpcode new.
	sregload := TRILOpcode new.
	bregload := TRILOpcode new.
	iregstore := TRILOpcode new.
	aregstore := TRILOpcode new.
	lregstore := TRILOpcode new.
	fregstore := TRILOpcode new.
	dregstore := TRILOpcode new.
	sregstore := TRILOpcode new.
	bregstore := TRILOpcode new.
	glregdeps := TRILOpcode new.
	iselect := TRILOpcode new.
	lselect := TRILOpcode new.
	bselect := TRILOpcode new.
	sselect := TRILOpcode new.
	aselect := TRILOpcode new.
	fselect := TRILOpcode new.
	dselect := TRILOpcode new.
	treetop := TRILOpcode new.
	methodenterhook := TRILOpcode new.
	methodexithook := TRILOpcode new.
	passthrough := TRILOpcode new.
	compressedrefs := TRILOpcode new.
	bbstart := TRILOpcode new.
	bbend := TRILOpcode new.
	f2iu := TRILOpcode new.
	f2lu := TRILOpcode new.
	f2bu := TRILOpcode new.
	f2c := TRILOpcode new.
	d2iu := TRILOpcode new.
	d2lu := TRILOpcode new.
	d2bu := TRILOpcode new.
	d2c := TRILOpcode new.
	monent := TRILOpcode new.
	monexit := TRILOpcode new.
	monexitfence := TRILOpcode new.
	tstart := TRILOpcode new.
	tfinish := TRILOpcode new.
	tabort := TRILOpcode new.
	instanceof := TRILOpcode new.
	checkcast := TRILOpcode new.
	checkcastandnullchk := TRILOpcode new.
	new := TRILOpcode new.
	newvalue := TRILOpcode new.
	newarray := TRILOpcode new.
	anewarray := TRILOpcode new.
	variablenew := TRILOpcode new.
	variablenewarray := TRILOpcode new.
	multianewarray := TRILOpcode new.
	arraylength := TRILOpcode new.
	contigarraylength := TRILOpcode new.
	discontigarraylength := TRILOpcode new.
	icalli := TRILOpcode new.
	lcalli := TRILOpcode new.
	fcalli := TRILOpcode new.
	dcalli := TRILOpcode new.
	acalli := TRILOpcode new.
	calli := TRILOpcode new.
	fence := TRILOpcode new.
	luaddh := TRILOpcode new.
	aiadd := TRILOpcode new.
	aladd := TRILOpcode new.
	lusubh := TRILOpcode new.
	imulh := TRILOpcode new.
	iumulh := TRILOpcode new.
	lmulh := TRILOpcode new.
	lumulh := TRILOpcode new.
	ibits2f := TRILOpcode new.
	fbits2i := TRILOpcode new.
	lbits2d := TRILOpcode new.
	dbits2l := TRILOpcode new.
	lookup := TRILOpcode new.
	case := TRILOpcode new.
	table := TRILOpcode new.
	exceptionrangefence := TRILOpcode new.
	nullchk := TRILOpcode new.
	resolvechk := TRILOpcode new.
	resolveandnullchk := TRILOpcode new.
	divchk := TRILOpcode new.
	overflowchk := TRILOpcode new.
	unsignedoverflowchk := TRILOpcode new.
	bndchk := TRILOpcode new.
	arraycopybndchk := TRILOpcode new.
	bndchkwithspinechk := TRILOpcode new.
	spinechk := TRILOpcode new.
	arraystorechk := TRILOpcode new.
	arraychk := TRILOpcode new.
	arraycopy := TRILOpcode new.
	arrayset := TRILOpcode new.
	arraytranslate := TRILOpcode new.
	arraytranslateandtest := TRILOpcode new.
	long2string := TRILOpcode new.
	bitopmem := TRILOpcode new.
	arraycmp := TRILOpcode new.
	allocationfence := TRILOpcode new.
	loadfence := TRILOpcode new.
	storefence := TRILOpcode new.
	fullfence := TRILOpcode new.
	computecc := TRILOpcode new.
	butest := TRILOpcode new.
	sutest := TRILOpcode new.
	bucmp := TRILOpcode new.
	bcmp := TRILOpcode new.
	sucmp := TRILOpcode new.
	scmp := TRILOpcode new.
	iucmp := TRILOpcode new.
	icmp := TRILOpcode new.
	lucmp := TRILOpcode new.
	ificmpo := TRILOpcode new.
	ificmpno := TRILOpcode new.
	iflcmpo := TRILOpcode new.
	iflcmpno := TRILOpcode new.
	ificmno := TRILOpcode new.
	ificmnno := TRILOpcode new.
	iflcmno := TRILOpcode new.
	iflcmnno := TRILOpcode new.
	iuaddc := TRILOpcode new.
	luaddc := TRILOpcode new.
	iusubb := TRILOpcode new.
	lusubb := TRILOpcode new.
	icmpset := TRILOpcode new.
	lcmpset := TRILOpcode new.
	bztestnset := TRILOpcode new.
	ibatomicor := TRILOpcode new.
	isatomicor := TRILOpcode new.
	iiatomicor := TRILOpcode new.
	ilatomicor := TRILOpcode new.
	branch := TRILOpcode new.
	igoto := TRILOpcode new.
	fsqrt := TRILOpcode new.
	dsqrt := TRILOpcode new.
	dfloor := TRILOpcode new.
	ffloor := TRILOpcode new.
	dceil := TRILOpcode new.
	fceil := TRILOpcode new.
	imax := TRILOpcode new.
	iumax := TRILOpcode new.
	lmax := TRILOpcode new.
	lumax := TRILOpcode new.
	fmax := TRILOpcode new.
	dmax := TRILOpcode new.
	imin := TRILOpcode new.
	iumin := TRILOpcode new.
	lmin := TRILOpcode new.
	lumin := TRILOpcode new.
	fmin := TRILOpcode new.
	dmin := TRILOpcode new.
	ihbit := TRILOpcode new.
	ilbit := TRILOpcode new.
	inolz := TRILOpcode new.
	inotz := TRILOpcode new.
	ipopcnt := TRILOpcode new.
	lhbit := TRILOpcode new.
	llbit := TRILOpcode new.
	lnolz := TRILOpcode new.
	lnotz := TRILOpcode new.
	lpopcnt := TRILOpcode new.
	sbyteswap := TRILOpcode new.
	ibyteswap := TRILOpcode new.
	lbyteswap := TRILOpcode new.
	bbitpermute := TRILOpcode new.
	sbitpermute := TRILOpcode new.
	ibitpermute := TRILOpcode new.
	lbitpermute := TRILOpcode new.
	prefetch := TRILOpcode new.




	invalid initializeFrom: { 'invalid' . NoType . 0 . 0 . 0 . Unspecified . BadILOp . BadILOp . BadILOp . BadILOp }.







	aconst initializeFrom: { 'aconst' . Address .  LoadConst .  ValueNumberShare .  LikeUse .  NoChildren  . BadILOp . BadILOp . BadILOp . BadILOp }.
	iconst initializeFrom: { 'iconst' . Int32 .  LoadConst .  ValueNumberShare .  LikeUse .  NoChildren  . BadILOp . BadILOp . BadILOp . BadILOp }.
	lconst initializeFrom: { 'lconst' . Int64 .  LoadConst .  ValueNumberShare .  LikeUse .  NoChildren  . BadILOp . BadILOp . BadILOp . BadILOp }.
	fconst initializeFrom: { 'fconst' . Float .  LoadConst .  ValueNumberShare .  LikeUse .  NoChildren  . BadILOp . BadILOp . BadILOp . BadILOp }.
	dconst initializeFrom: { 'dconst' . Double .  LoadConst .  ValueNumberShare .  LikeUse .  NoChildren  . BadILOp . BadILOp . BadILOp . BadILOp }.
	bconst initializeFrom: { 'bconst' . Int8 .  LoadConst .  ValueNumberShare .  LikeUse .  NoChildren  . BadILOp . BadILOp . BadILOp . BadILOp }.
	sconst initializeFrom: { 'sconst' . Int16 .  LoadConst .  ValueNumberShare .  LikeUse .  NoChildren  . BadILOp . BadILOp . BadILOp . BadILOp }.
	iload initializeFrom: { 'iload' . Int32 .  LoadVar |  HasSymbolRef .  ValueNumberShare |  SupportedForPRE|  MayUseSystemStack .  LikeUse .  NoChildren  . BadILOp . BadILOp . BadILOp . BadILOp }.
	fload initializeFrom: { 'fload' . Float .  LoadVar |  HasSymbolRef .  ValueNumberShare |  SupportedForPRE|  MayUseSystemStack .  LikeUse .  NoChildren  . BadILOp . BadILOp . BadILOp . BadILOp }.
	dload initializeFrom: { 'dload' . Double .  LoadVar |  HasSymbolRef .  ValueNumberShare |  SupportedForPRE|  MayUseSystemStack .  LikeUse .  NoChildren  . BadILOp . BadILOp . BadILOp . BadILOp }.
	aload initializeFrom: { 'aload' . Address .  LoadVar |  HasSymbolRef .  ValueNumberShare |  SupportedForPRE|  MayUseSystemStack .  LikeUse .  NoChildren  . BadILOp . BadILOp . BadILOp . BadILOp }.
	bload initializeFrom: { 'bload' . Int8 .  LoadVar |  HasSymbolRef .  ValueNumberShare |  SupportedForPRE|  MayUseSystemStack .  LikeUse .  NoChildren  . BadILOp . BadILOp . BadILOp . BadILOp }.
	sload initializeFrom: { 'sload' . Int16 .  LoadVar |  HasSymbolRef .  ValueNumberShare |  SupportedForPRE|  MayUseSystemStack .  LikeUse .  NoChildren  . BadILOp . BadILOp . BadILOp . BadILOp }.
	lload initializeFrom: { 'lload' . Int64 .  LoadVar |  HasSymbolRef .  ValueNumberShare |  SupportedForPRE|  MayUseSystemStack .  LikeUse .  NoChildren  . BadILOp . BadILOp . BadILOp . BadILOp }.
	irdbar initializeFrom: { 'irdbar' . Int32 .  LoadVar |  HasSymbolRef .  ValueNumberShare |  SupportedForPRE|  MayUseSystemStack |  ReadBarrierLoad .  LikeUse . { Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	frdbar initializeFrom: { 'frdbar' . Float .  LoadVar |  HasSymbolRef .  ValueNumberShare |  SupportedForPRE|  MayUseSystemStack |  ReadBarrierLoad .  LikeUse . { Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	drdbar initializeFrom: { 'drdbar' . Double .  LoadVar |  HasSymbolRef .  ValueNumberShare |  SupportedForPRE|  MayUseSystemStack |  ReadBarrierLoad .  LikeUse . { Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	ardbar initializeFrom: { 'ardbar' . Address .  LoadVar |  HasSymbolRef .  ValueNumberShare |  SupportedForPRE|  MayUseSystemStack |  ReadBarrierLoad .  LikeUse . { Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	brdbar initializeFrom: { 'brdbar' . Int8 .  LoadVar |  HasSymbolRef .  ValueNumberShare |  SupportedForPRE|  MayUseSystemStack |  ReadBarrierLoad .  LikeUse . { Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	srdbar initializeFrom: { 'srdbar' . Int16 .  LoadVar |  HasSymbolRef .  ValueNumberShare |  SupportedForPRE|  MayUseSystemStack |  ReadBarrierLoad .  LikeUse . { Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	lrdbar initializeFrom: { 'lrdbar' . Int64 .  LoadVar |  HasSymbolRef .  ValueNumberShare |  SupportedForPRE|  MayUseSystemStack |  ReadBarrierLoad .  LikeUse . { Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	iloadi initializeFrom: { 'iloadi' . Int32 .  LoadVar |  Indirect |  HasSymbolRef .  ValueNumberShare |  SupportedForPRE|  MayUseSystemStack .  LikeUse . { Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	floadi initializeFrom: { 'floadi' . Float .  LoadVar |  Indirect |  HasSymbolRef .  ValueNumberShare |  SupportedForPRE|  MayUseSystemStack .  LikeUse . { Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	dloadi initializeFrom: { 'dloadi' . Double .  LoadVar |  Indirect |  HasSymbolRef .  ValueNumberShare |  SupportedForPRE|  MayUseSystemStack .  LikeUse . { Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	aloadi initializeFrom: { 'aloadi' . Address .  LoadVar |  Indirect |  HasSymbolRef .  ValueNumberShare |  SupportedForPRE|  MayUseSystemStack .  LikeUse . { Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	bloadi initializeFrom: { 'bloadi' . Int8 .  LoadVar |  Indirect |  HasSymbolRef .  ValueNumberShare |  SupportedForPRE|  MayUseSystemStack .  LikeUse . { Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	sloadi initializeFrom: { 'sloadi' . Int16 .  LoadVar |  Indirect |  HasSymbolRef .  ValueNumberShare |  SupportedForPRE|  MayUseSystemStack .  LikeUse . { Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	lloadi initializeFrom: { 'lloadi' . Int64 .  LoadVar |  Indirect |  HasSymbolRef .  ValueNumberShare |  SupportedForPRE|  MayUseSystemStack .  LikeUse . { Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	irdbari initializeFrom: { 'irdbari' . Int32 .  LoadVar |  Indirect |  HasSymbolRef .  ValueNumberShare |  SupportedForPRE|  MayUseSystemStack |  ReadBarrierLoad .  LikeUse . { Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	frdbari initializeFrom: { 'frdbari' . Float .  LoadVar |  Indirect |  HasSymbolRef .  ValueNumberShare |  SupportedForPRE|  MayUseSystemStack |  ReadBarrierLoad .  LikeUse . { Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	drdbari initializeFrom: { 'drdbari' . Double .  LoadVar |  Indirect |  HasSymbolRef .  ValueNumberShare |  SupportedForPRE|  MayUseSystemStack |  ReadBarrierLoad .  LikeUse . { Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	ardbari initializeFrom: { 'ardbari' . Address .  LoadVar |  Indirect |  HasSymbolRef .  ValueNumberShare |  SupportedForPRE|  MayUseSystemStack |  ReadBarrierLoad .  LikeUse . { Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	brdbari initializeFrom: { 'brdbari' . Int8 .  LoadVar |  Indirect |  HasSymbolRef .  ValueNumberShare |  SupportedForPRE|  MayUseSystemStack |  ReadBarrierLoad .  LikeUse . { Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	srdbari initializeFrom: { 'srdbari' . Int16 .  LoadVar |  Indirect |  HasSymbolRef .  ValueNumberShare |  SupportedForPRE|  MayUseSystemStack |  ReadBarrierLoad .  LikeUse . { Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	lrdbari initializeFrom: { 'lrdbari' . Int64 .  LoadVar |  Indirect |  HasSymbolRef .  ValueNumberShare |  SupportedForPRE|  MayUseSystemStack |  ReadBarrierLoad .  LikeUse . { Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	istore initializeFrom: { 'istore' . Int32 .  Store |  TreeTop |  HasSymbolRef .  ValueNumberShare|  MayUseSystemStack .  LikeDef . { Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	lstore initializeFrom: { 'lstore' . Int64 .  Store |  TreeTop |  HasSymbolRef .  ValueNumberShare|  MayUseSystemStack .  LikeDef . { Int64 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	fstore initializeFrom: { 'fstore' . Float .  Store |  TreeTop |  HasSymbolRef .  ValueNumberShare|  MayUseSystemStack .  LikeDef . { Float } . BadILOp . BadILOp . BadILOp . BadILOp }.
	dstore initializeFrom: { 'dstore' . Double .  Store |  TreeTop |  HasSymbolRef .  ValueNumberShare|  MayUseSystemStack .  LikeDef . { Double } . BadILOp . BadILOp . BadILOp . BadILOp }.
	astore initializeFrom: { 'astore' . Address .  Store |  TreeTop |  HasSymbolRef .  ValueNumberShare|  MayUseSystemStack .  LikeDef . { Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	bstore initializeFrom: { 'bstore' . Int8 .  Store |  TreeTop |  HasSymbolRef .  ValueNumberShare|  MayUseSystemStack .  LikeDef . { Int8 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	sstore initializeFrom: { 'sstore' . Int16 .  Store |  TreeTop |  HasSymbolRef .  ValueNumberShare|  MayUseSystemStack .  LikeDef . { Int16 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	iwrtbar initializeFrom: { 'iwrtbar' . Int32 .  Store |  TreeTop |  HasSymbolRef .  ValueNumberShare|  WriteBarrierStore|  MayUseSystemStack .  LikeDef . { Int32 . Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	lwrtbar initializeFrom: { 'lwrtbar' . Int64 .  Store |  TreeTop |  HasSymbolRef .  ValueNumberShare|  WriteBarrierStore|  MayUseSystemStack .  LikeDef . { Int64 . Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	fwrtbar initializeFrom: { 'fwrtbar' . Float .  Store |  TreeTop |  HasSymbolRef .  ValueNumberShare|  WriteBarrierStore|  MayUseSystemStack .  LikeDef . { Float . Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	dwrtbar initializeFrom: { 'dwrtbar' . Double .  Store |  TreeTop |  HasSymbolRef .  ValueNumberShare|  WriteBarrierStore|  MayUseSystemStack .  LikeDef . { Double . Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	awrtbar initializeFrom: { 'awrtbar' . Address .  Store |  TreeTop |  HasSymbolRef .  ValueNumberShare |  WriteBarrierStore|  MayUseSystemStack .  LikeDef . { Address . Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	bwrtbar initializeFrom: { 'bwrtbar' . Int8 .  Store |  TreeTop |  HasSymbolRef .  ValueNumberShare|  WriteBarrierStore|  MayUseSystemStack .  LikeDef . { Int8 . Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	swrtbar initializeFrom: { 'swrtbar' . Int16 .  Store |  TreeTop |  HasSymbolRef .  ValueNumberShare|  WriteBarrierStore|  MayUseSystemStack .  LikeDef . { Int16 . Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	lstorei initializeFrom: { 'lstorei' . Int64 .  Store |  Indirect |  TreeTop |  HasSymbolRef .  ValueNumberShare|  MayUseSystemStack .  LikeDef . { Address . Int64 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	fstorei initializeFrom: { 'fstorei' . Float .  Store |  Indirect |  TreeTop |  HasSymbolRef .  ValueNumberShare|  MayUseSystemStack .  LikeDef . { Address . Float } . BadILOp . BadILOp . BadILOp . BadILOp }.
	dstorei initializeFrom: { 'dstorei' . Double .  Store |  Indirect |  TreeTop |  HasSymbolRef .  ValueNumberShare|  MayUseSystemStack .  LikeDef . { Address . Double } . BadILOp . BadILOp . BadILOp . BadILOp }.
	astorei initializeFrom: { 'astorei' . Address .  Store |  Indirect |  TreeTop |  HasSymbolRef .  ValueNumberShare|  MayUseSystemStack .  LikeDef . { Address . Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	bstorei initializeFrom: { 'bstorei' . Int8 .  Store |  Indirect |  TreeTop |  HasSymbolRef .  ValueNumberShare|  MayUseSystemStack .  LikeDef . { Address . Int8 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	sstorei initializeFrom: { 'sstorei' . Int16 .  Store |  Indirect |  TreeTop |  HasSymbolRef .  ValueNumberShare|  MayUseSystemStack .  LikeDef . { Address . Int16 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	istorei initializeFrom: { 'istorei' . Int32 .  Store |  Indirect |  TreeTop |  HasSymbolRef .  ValueNumberShare|  MayUseSystemStack .  LikeDef . { Address . Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	lwrtbari initializeFrom: { 'lwrtbari' . Int64 .  Store |  Indirect |  TreeTop |  HasSymbolRef .  ValueNumberShare |  WriteBarrierStore|  MayUseSystemStack .  LikeDef . { Address . Int64 . Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	fwrtbari initializeFrom: { 'fwrtbari' . Float .  Store |  Indirect |  TreeTop |  HasSymbolRef .  ValueNumberShare |  WriteBarrierStore|  MayUseSystemStack .  LikeDef . { Address . Float . Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	dwrtbari initializeFrom: { 'dwrtbari' . Double .  Store |  Indirect |  TreeTop |  HasSymbolRef .  ValueNumberShare |  WriteBarrierStore|  MayUseSystemStack .  LikeDef . { Address . Double . Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	awrtbari initializeFrom: { 'awrtbari' . Address .  Store |  Indirect |  TreeTop |  HasSymbolRef .  ValueNumberShare |  WriteBarrierStore|  MayUseSystemStack .  LikeDef . { Address . Address . Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	bwrtbari initializeFrom: { 'bwrtbari' . Int8 .  Store |  Indirect |  TreeTop |  HasSymbolRef .  ValueNumberShare |  WriteBarrierStore|  MayUseSystemStack .  LikeDef . { Address . Int8 . Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	swrtbari initializeFrom: { 'swrtbari' . Int16 .  Store |  Indirect |  TreeTop |  HasSymbolRef .  ValueNumberShare |  WriteBarrierStore|  MayUseSystemStack .  LikeDef . { Address . Int16 . Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	iwrtbari initializeFrom: { 'iwrtbari' . Int32 .  Store |  Indirect |  TreeTop |  HasSymbolRef .  ValueNumberShare |  WriteBarrierStore|  MayUseSystemStack .  LikeDef . { Address . Int32 . Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	goto initializeFrom: { 'goto' . NoType .  Branch |  TreeTop . 0 . 0 .  NoChildren  . BadILOp . BadILOp . BadILOp . BadILOp }.
	ireturn initializeFrom: { 'ireturn' . Int32 .  Return |  TreeTop .  MayUseSystemStack . 0 . {  UnspecifiedChildType } . BadILOp . BadILOp . BadILOp . BadILOp }.
	lreturn initializeFrom: { 'lreturn' . Int64 .  Return |  TreeTop .  MayUseSystemStack . 0 . { Int64 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	freturn initializeFrom: { 'freturn' . Float .  Return |  TreeTop .  MayUseSystemStack . 0 . { Float } . BadILOp . BadILOp . BadILOp . BadILOp }.
	dreturn initializeFrom: { 'dreturn' . Double .  Return |  TreeTop .  MayUseSystemStack . 0 . { Double } . BadILOp . BadILOp . BadILOp . BadILOp }.
	areturn initializeFrom: { 'areturn' . Address .  Return |  TreeTop .  MayUseSystemStack . 0 . { Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	return initializeFrom: { 'return' . NoType .  Return |  TreeTop .  MayUseSystemStack . 0 .  NoChildren  . BadILOp . BadILOp . BadILOp . BadILOp }.
	asynccheck initializeFrom: { 'asynccheck' . NoType .  TreeTop |  HasSymbolRef .  MustBeLowered|  MayUseSystemStack .  LikeDef .  Unspecified . BadILOp . BadILOp . BadILOp . BadILOp }.
	athrow initializeFrom: { 'athrow' . NoType .  TreeTop |  HasSymbolRef .  MustBeLowered |  CanRaiseException|  MayUseSystemStack . 0 .  Unspecified . BadILOp . BadILOp . BadILOp . BadILOp }.
	icall initializeFrom: { 'icall' . Int32 .  Call |  HasSymbolRef .  CanRaiseException |  SupportedForPRE|  MayUseSystemStack .  LikeUse |  LikeDef .  Unspecified . BadILOp . BadILOp . BadILOp . BadILOp }.
	lcall initializeFrom: { 'lcall' . Int64 .  Call |  HasSymbolRef .  CanRaiseException |  SupportedForPRE|  MayUseSystemStack .  LikeUse |  LikeDef .  Unspecified . BadILOp . BadILOp . BadILOp . BadILOp }.
	fcall initializeFrom: { 'fcall' . Float .  Call |  HasSymbolRef .  CanRaiseException |  SupportedForPRE|  MayUseSystemStack .  LikeUse |  LikeDef .  Unspecified . BadILOp . BadILOp . BadILOp . BadILOp }.
	dcall initializeFrom: { 'dcall' . Double .  Call |  HasSymbolRef .  CanRaiseException |  SupportedForPRE|  MayUseSystemStack .  LikeUse |  LikeDef .  Unspecified . BadILOp . BadILOp . BadILOp . BadILOp }.
	acall initializeFrom: { 'acall' . Address .  Call |  HasSymbolRef .  CanRaiseException |  SupportedForPRE|  MayUseSystemStack .  LikeUse |  LikeDef .  Unspecified . BadILOp . BadILOp . BadILOp . BadILOp }.
	call initializeFrom: { 'call' . NoType .  Call |  HasSymbolRef .  CanRaiseException |  SupportedForPRE|  MayUseSystemStack .  LikeUse |  LikeDef .  Unspecified . BadILOp . BadILOp . BadILOp . BadILOp }.
	iadd initializeFrom: { 'iadd' . Int32 .  Commutative |  Associative |  Add .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int32 . Int32 } . iadd . BadILOp . BadILOp . BadILOp }.
	ladd initializeFrom: { 'ladd' . Int64 .  Commutative |  Associative |  Add .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int64 . Int64 } . ladd . BadILOp . BadILOp . BadILOp }.
	fadd initializeFrom: { 'fadd' . Float .  Commutative |  Associative |  Add .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Float . Float } . fadd . BadILOp . BadILOp . BadILOp }.
	dadd initializeFrom: { 'dadd' . Double .  Commutative |  Associative |  Add .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Double . Double } . dadd . BadILOp . BadILOp . BadILOp }.
	badd initializeFrom: { 'badd' . Int8 .  Commutative |  Associative |  Add .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int8 . Int8 } . badd . BadILOp . BadILOp . BadILOp }.
	sadd initializeFrom: { 'sadd' . Int16 .  Commutative |  Associative |  Add .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int16 . Int16 } . sadd . BadILOp . BadILOp . BadILOp }.
	isub initializeFrom: { 'isub' . Int32 .  Sub .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int32 . Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	lsub initializeFrom: { 'lsub' . Int64 .  Sub .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int64 . Int64 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	fsub initializeFrom: { 'fsub' . Float .  Sub .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Float . Float } . BadILOp . BadILOp . BadILOp . BadILOp }.
	dsub initializeFrom: { 'dsub' . Double .  Sub .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Double . Double } . BadILOp . BadILOp . BadILOp . BadILOp }.
	bsub initializeFrom: { 'bsub' . Int8 .  Sub .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int8 . Int8 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	ssub initializeFrom: { 'ssub' . Int16 .  Sub .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int16 . Int16 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	asub initializeFrom: { 'asub' . NoType .  Sub .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Address . Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	imul initializeFrom: { 'imul' . Int32 .  Commutative |  Associative |  Mul .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int32 . Int32 } . imul . BadILOp . BadILOp . BadILOp }.
	lmul initializeFrom: { 'lmul' . Int64 .  Commutative |  Associative |  Mul .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int64 . Int64 } . lmul . BadILOp . BadILOp . BadILOp }.
	fmul initializeFrom: { 'fmul' . Float .  Commutative |  Associative |  Mul .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Float . Float } . fmul . BadILOp . BadILOp . BadILOp }.
	dmul initializeFrom: { 'dmul' . Double .  Commutative |  Associative |  Mul .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Double . Double } . dmul . BadILOp . BadILOp . BadILOp }.
	bmul initializeFrom: { 'bmul' . Int8 .  Commutative |  Associative |  Mul .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int8 . Int8 } . bmul . BadILOp . BadILOp . BadILOp }.
	smul initializeFrom: { 'smul' . Int16 .  Commutative |  Associative |  Mul .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int16 . Int16 } . smul . BadILOp . BadILOp . BadILOp }.
	idiv initializeFrom: { 'idiv' . Int32 .  Div .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int32 . Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	ldiv initializeFrom: { 'ldiv' . Int64 .  Div .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int64 . Int64 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	fdiv initializeFrom: { 'fdiv' . Float .  Div .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Float . Float } . BadILOp . BadILOp . BadILOp . BadILOp }.
	ddiv initializeFrom: { 'ddiv' . Double .  Div .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Double . Double } . BadILOp . BadILOp . BadILOp . BadILOp }.
	bdiv initializeFrom: { 'bdiv' . Int8 .  Div .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int8 . Int8 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	sdiv initializeFrom: { 'sdiv' . Int16 .  Div .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int16 . Int16 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	iudiv initializeFrom: { 'iudiv' . Int32 .  Div .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int32 . Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	ludiv initializeFrom: { 'ludiv' . Int64 .  Div .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int64 . Int64 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	irem initializeFrom: { 'irem' . Int32 .  Rem .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int32 . Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	lrem initializeFrom: { 'lrem' . Int64 .  Rem .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int64 . Int64 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	frem initializeFrom: { 'frem' . Float .  Rem .  ValueNumberShare |  SupportedForPRE|  MayUseSystemStack .  LikeUse . { Float . Float } . BadILOp . BadILOp . BadILOp . BadILOp }.
	drem initializeFrom: { 'drem' . Double .  Rem .  ValueNumberShare |  SupportedForPRE|  MayUseSystemStack .  LikeUse . { Double . Double } . BadILOp . BadILOp . BadILOp . BadILOp }.
	brem initializeFrom: { 'brem' . Int8 .  Rem .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int8 . Int8 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	srem initializeFrom: { 'srem' . Int16 .  Rem .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int16 . Int16 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	iurem initializeFrom: { 'iurem' . Int32 .  Rem .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int32 . Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	ineg initializeFrom: { 'ineg' . Int32 .  Neg .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	lneg initializeFrom: { 'lneg' . Int64 .  Neg .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int64 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	fneg initializeFrom: { 'fneg' . Float .  Neg .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Float } . BadILOp . BadILOp . BadILOp . BadILOp }.
	dneg initializeFrom: { 'dneg' . Double .  Neg .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Double } . BadILOp . BadILOp . BadILOp . BadILOp }.
	bneg initializeFrom: { 'bneg' . Int8 .  Neg .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int8 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	sneg initializeFrom: { 'sneg' . Int16 .  Neg .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int16 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	iabs initializeFrom: { 'iabs' . Int32 . 0 .  ValueNumberShare |  SupportedForPRE .  LikeUse |  Abs . { Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	labs initializeFrom: { 'labs' . Int64 . 0 .  ValueNumberShare |  SupportedForPRE .  LikeUse |  Abs . { Int64 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	fabs initializeFrom: { 'fabs' . Float . 0 .  ValueNumberShare |  SupportedForPRE .  LikeUse |  Abs . { Float } . BadILOp . BadILOp . BadILOp . BadILOp }.
	dabs initializeFrom: { 'dabs' . Double . 0 .  ValueNumberShare |  SupportedForPRE .  LikeUse |  Abs . { Double } . BadILOp . BadILOp . BadILOp . BadILOp }.
	ishl initializeFrom: { 'ishl' . Int32 .  LeftShift .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int32 . Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	lshl initializeFrom: { 'lshl' . Int64 .  LeftShift .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int64 . Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	bshl initializeFrom: { 'bshl' . Int8 .  LeftShift .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int8 . Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	sshl initializeFrom: { 'sshl' . Int16 .  LeftShift .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int16 . Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	ishr initializeFrom: { 'ishr' . Int32 .  RightShift .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int32 . Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	lshr initializeFrom: { 'lshr' . Int64 .  RightShift .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int64 . Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	bshr initializeFrom: { 'bshr' . Int8 .  RightShift .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int8 . Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	sshr initializeFrom: { 'sshr' . Int16 .  RightShift .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int16 . Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	iushr initializeFrom: { 'iushr' . Int32 .  RightShift |  ShiftLogical .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int32 . Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	lushr initializeFrom: { 'lushr' . Int64 .  RightShift |  ShiftLogical .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int64 . Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	bushr initializeFrom: { 'bushr' . Int8 .  RightShift |  ShiftLogical .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int8 . Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	sushr initializeFrom: { 'sushr' . Int16 .  RightShift |  ShiftLogical .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int16 . Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	irol initializeFrom: { 'irol' . Int32 . 0 .  ValueNumberShare |  SupportedForPRE |  LeftRotate . 0 . { Int32 . Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	lrol initializeFrom: { 'lrol' . Int64 . 0 .  ValueNumberShare |  SupportedForPRE |  LeftRotate . 0 . { Int64 . Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	iand initializeFrom: { 'iand' . Int32 .  Commutative |  Associative |  And .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int32 . Int32 } . iand . BadILOp . BadILOp . BadILOp }.
	land initializeFrom: { 'land' . Int64 .  Commutative |  Associative |  And .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int64 . Int64 } . land . BadILOp . BadILOp . BadILOp }.
	band initializeFrom: { 'band' . Int8 .  Commutative |  Associative |  And .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int8 . Int8 } . band . BadILOp . BadILOp . BadILOp }.
	sand initializeFrom: { 'sand' . Int16 .  Commutative |  Associative |  And .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int16 . Int16 } . sand . BadILOp . BadILOp . BadILOp }.
	ior initializeFrom: { 'ior' . Int32 .  Commutative |  Associative |  Or .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int32 . Int32 } . ior . BadILOp . BadILOp . BadILOp }.
	lor initializeFrom: { 'lor' . Int64 .  Commutative |  Associative |  Or .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int64 . Int64 } . lor . BadILOp . BadILOp . BadILOp }.
	bor initializeFrom: { 'bor' . Int8 .  Commutative |  Associative |  Or .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int8 . Int8 } . bor . BadILOp . BadILOp . BadILOp }.
	sor initializeFrom: { 'sor' . Int16 .  Commutative |  Associative |  Or .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int16 . Int16 } . sor . BadILOp . BadILOp . BadILOp }.
	ixor initializeFrom: { 'ixor' . Int32 .  Commutative |  Associative |  Xor .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int32 . Int32 } . ixor . BadILOp . BadILOp . BadILOp }.
	lxor initializeFrom: { 'lxor' . Int64 .  Commutative |  Associative |  Xor .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int64 . Int64 } . lxor . BadILOp . BadILOp . BadILOp }.
	bxor initializeFrom: { 'bxor' . Int8 .  Commutative |  Associative |  Xor .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int8 . Int8 } . bxor . BadILOp . BadILOp . BadILOp }.
	sxor initializeFrom: { 'sxor' . Int16 .  Commutative |  Associative |  Xor .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int16 . Int16 } . sxor . BadILOp . BadILOp . BadILOp }.
	i2l initializeFrom: { 'i2l' . Int64 .  Conversion .  ValueNumberShare |  SupportedForPRE |  SignExtension . 0 . { Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	i2f initializeFrom: { 'i2f' . Float .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . { Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	i2d initializeFrom: { 'i2d' . Double .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . { Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	i2b initializeFrom: { 'i2b' . Int8 .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . { Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	i2s initializeFrom: { 'i2s' . Int16 .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . { Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	i2a initializeFrom: { 'i2a' . Address .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . { Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	iu2l initializeFrom: { 'iu2l' . Int64 .  Conversion .  ValueNumberShare |  SupportedForPRE |  ZeroExtension . 0 . { Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	iu2f initializeFrom: { 'iu2f' . Float .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . { Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	iu2d initializeFrom: { 'iu2d' . Double .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . { Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	iu2a initializeFrom: { 'iu2a' . Address .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . { Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	l2i initializeFrom: { 'l2i' . Int32 .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . { Int64 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	l2f initializeFrom: { 'l2f' . Float .  Conversion .  ValueNumberShare |  SupportedForPRE|  MayUseSystemStack . 0 . { Int64 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	l2d initializeFrom: { 'l2d' . Double .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . { Int64 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	l2b initializeFrom: { 'l2b' . Int8 .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . { Int64 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	l2s initializeFrom: { 'l2s' . Int16 .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . { Int64 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	l2a initializeFrom: { 'l2a' . Address .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . { Int64 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	lu2f initializeFrom: { 'lu2f' . Float .  Conversion .  ValueNumberShare |  SupportedForPRE|  MayUseSystemStack . 0 . { Int64 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	lu2d initializeFrom: { 'lu2d' . Double .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . { Int64 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	lu2a initializeFrom: { 'lu2a' . Address .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . { Int64 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	f2i initializeFrom: { 'f2i' . Int32 .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . { Float } . BadILOp . BadILOp . BadILOp . BadILOp }.
	f2l initializeFrom: { 'f2l' . Int64 .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . { Float } . BadILOp . BadILOp . BadILOp . BadILOp }.
	f2d initializeFrom: { 'f2d' . Double .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . { Float } . BadILOp . BadILOp . BadILOp . BadILOp }.
	f2b initializeFrom: { 'f2b' . Int8 .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . { Float } . BadILOp . BadILOp . BadILOp . BadILOp }.
	f2s initializeFrom: { 'f2s' . Int16 .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . { Float } . BadILOp . BadILOp . BadILOp . BadILOp }.
	d2i initializeFrom: { 'd2i' . Int32 .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . { Double } . BadILOp . BadILOp . BadILOp . BadILOp }.
	d2l initializeFrom: { 'd2l' . Int64 .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . { Double } . BadILOp . BadILOp . BadILOp . BadILOp }.
	d2f initializeFrom: { 'd2f' . Float .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . { Double } . BadILOp . BadILOp . BadILOp . BadILOp }.
	d2b initializeFrom: { 'd2b' . Int8 .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . { Double } . BadILOp . BadILOp . BadILOp . BadILOp }.
	d2s initializeFrom: { 'd2s' . Int16 .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . { Double } . BadILOp . BadILOp . BadILOp . BadILOp }.
	b2i initializeFrom: { 'b2i' . Int32 .  Conversion .  ValueNumberShare |  SupportedForPRE |  SignExtension . 0 . { Int8 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	b2l initializeFrom: { 'b2l' . Int64 .  Conversion .  ValueNumberShare |  SupportedForPRE |  SignExtension . 0 . { Int8 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	b2f initializeFrom: { 'b2f' . Float .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . { Int8 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	b2d initializeFrom: { 'b2d' . Double .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . { Int8 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	b2s initializeFrom: { 'b2s' . Int16 .  Conversion .  ValueNumberShare |  SupportedForPRE |  SignExtension . 0 . { Int8 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	b2a initializeFrom: { 'b2a' . Address .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . { Int8 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	bu2i initializeFrom: { 'bu2i' . Int32 .  Conversion .  ValueNumberShare |  SupportedForPRE |  ZeroExtension . 0 . { Int8 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	bu2l initializeFrom: { 'bu2l' . Int64 .  Conversion .  ValueNumberShare |  SupportedForPRE |  ZeroExtension . 0 . { Int8 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	bu2f initializeFrom: { 'bu2f' . Float .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . { Int8 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	bu2d initializeFrom: { 'bu2d' . Double .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . { Int8 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	bu2s initializeFrom: { 'bu2s' . Int16 .  Conversion .  ValueNumberShare |  SupportedForPRE |  ZeroExtension . 0 . { Int8 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	bu2a initializeFrom: { 'bu2a' . Address .  Conversion .  ValueNumberShare |  SupportedForPRE |  ZeroExtension . 0 . { Int8 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	s2i initializeFrom: { 's2i' . Int32 .  Conversion .  ValueNumberShare |  SupportedForPRE |  SignExtension . 0 . { Int16 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	s2l initializeFrom: { 's2l' . Int64 .  Conversion .  ValueNumberShare |  SupportedForPRE |  SignExtension . 0 . { Int16 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	s2f initializeFrom: { 's2f' . Float .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . { Int16 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	s2d initializeFrom: { 's2d' . Double .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . { Int16 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	s2b initializeFrom: { 's2b' . Int8 .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . { Int16 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	s2a initializeFrom: { 's2a' . Address .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . { Int16 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	su2i initializeFrom: { 'su2i' . Int32 .  Conversion .  ValueNumberShare |  SupportedForPRE |  ZeroExtension . 0 . { Int16 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	su2l initializeFrom: { 'su2l' . Int64 .  Conversion .  ValueNumberShare |  SupportedForPRE |  ZeroExtension . 0 . { Int16 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	su2f initializeFrom: { 'su2f' . Float .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . { Int16 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	su2d initializeFrom: { 'su2d' . Double .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . { Int16 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	su2a initializeFrom: { 'su2a' . Address .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . { Int16 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	a2i initializeFrom: { 'a2i' . Int32 .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . { Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	a2l initializeFrom: { 'a2l' . Int64 .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . { Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	a2b initializeFrom: { 'a2b' . Int8 .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . { Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	a2s initializeFrom: { 'a2s' . Int16 .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . { Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	icmpeq initializeFrom: { 'icmpeq' . Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfEqual . { Int32 . Int32 } . icmpeq . icmpne . BadILOp . ificmpeq }.
	icmpne initializeFrom: { 'icmpne' . Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfLess |  CompareTrueIfGreater . { Int32 . Int32 } . icmpne . icmpeq . BadILOp . ificmpne }.
	icmplt initializeFrom: { 'icmplt' . Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfLess . { Int32 . Int32 } . icmpgt . icmpge . BadILOp . ificmplt }.
	icmpge initializeFrom: { 'icmpge' . Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfGreater |  CompareTrueIfEqual . { Int32 . Int32 } . icmple . icmplt . BadILOp . ificmpge }.
	icmpgt initializeFrom: { 'icmpgt' . Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfGreater . { Int32 . Int32 } . icmplt . icmple . BadILOp . ificmpgt }.
	icmple initializeFrom: { 'icmple' . Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfLess |  CompareTrueIfEqual . { Int32 . Int32 } . icmpge . icmpgt . BadILOp . ificmple }.
	iucmplt initializeFrom: { 'iucmplt' . Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE |  UnsignedCompare .  CompareTrueIfLess . { Int32 . Int32 } . iucmpgt . iucmpge . BadILOp . ifiucmplt }.
	iucmpge initializeFrom: { 'iucmpge' . Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE |  UnsignedCompare .  CompareTrueIfGreater |  CompareTrueIfEqual . { Int32 . Int32 } . iucmple . iucmplt . BadILOp . ifiucmpge }.
	iucmpgt initializeFrom: { 'iucmpgt' . Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE |  UnsignedCompare .  CompareTrueIfGreater . { Int32 . Int32 } . iucmplt . iucmple . BadILOp . ifiucmpgt }.
	iucmple initializeFrom: { 'iucmple' . Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE |  UnsignedCompare .  CompareTrueIfLess |  CompareTrueIfEqual . { Int32 . Int32 } . iucmpge . iucmpgt . BadILOp . ifiucmple }.
	lcmpeq initializeFrom: { 'lcmpeq' . Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfEqual . { Int64 . Int64 } . lcmpeq . lcmpne . BadILOp . iflcmpeq }.
	lcmpne initializeFrom: { 'lcmpne' . Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfLess |  CompareTrueIfGreater . { Int64 . Int64 } . lcmpne . lcmpeq . BadILOp . iflcmpne }.
	lcmplt initializeFrom: { 'lcmplt' . Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfLess . { Int64 . Int64 } . lcmpgt . lcmpge . BadILOp . iflcmplt }.
	lcmpge initializeFrom: { 'lcmpge' . Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfGreater |  CompareTrueIfEqual . { Int64 . Int64 } . lcmple . lcmplt . BadILOp . iflcmpge }.
	lcmpgt initializeFrom: { 'lcmpgt' . Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfGreater . { Int64 . Int64 } . lcmplt . lcmple . BadILOp . iflcmpgt }.
	lcmple initializeFrom: { 'lcmple' . Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfLess |  CompareTrueIfEqual . { Int64 . Int64 } . lcmpge . lcmpgt . BadILOp . iflcmple }.
	lucmplt initializeFrom: { 'lucmplt' . Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE |  UnsignedCompare .  CompareTrueIfLess . { Int64 . Int64 } . lucmpgt . lucmpge . BadILOp . iflucmplt }.
	lucmpge initializeFrom: { 'lucmpge' . Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE |  UnsignedCompare .  CompareTrueIfGreater |  CompareTrueIfEqual . { Int64 . Int64 } . lucmple . lucmplt . BadILOp . iflucmpge }.
	lucmpgt initializeFrom: { 'lucmpgt' . Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE |  UnsignedCompare .  CompareTrueIfGreater . { Int64 . Int64 } . lucmplt . lucmple . BadILOp . iflucmpgt }.
	lucmple initializeFrom: { 'lucmple' . Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE |  UnsignedCompare .  CompareTrueIfLess |  CompareTrueIfEqual . { Int64 . Int64 } . lucmpge . lucmpgt . BadILOp . iflucmple }.
	fcmpeq initializeFrom: { 'fcmpeq' . Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfEqual . { Float . Float } . fcmpeq . fcmpneu . BadILOp . iffcmpeq }.
	fcmpne initializeFrom: { 'fcmpne' . Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfLess |  CompareTrueIfGreater . { Float . Float } . fcmpne . fcmpequ . BadILOp . iffcmpne }.
	fcmplt initializeFrom: { 'fcmplt' . Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfLess . { Float . Float } . fcmpgt . fcmpgeu . BadILOp . iffcmplt }.
	fcmpge initializeFrom: { 'fcmpge' . Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfGreater |  CompareTrueIfEqual . { Float . Float } . fcmple . fcmpltu . BadILOp . iffcmpge }.
	fcmpgt initializeFrom: { 'fcmpgt' . Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfGreater . { Float . Float } . fcmplt . fcmpleu . BadILOp . iffcmpgt }.
	fcmple initializeFrom: { 'fcmple' . Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfLess |  CompareTrueIfEqual . { Float . Float } . fcmpge . fcmpgtu . BadILOp . iffcmple }.
	fcmpequ initializeFrom: { 'fcmpequ' . Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfEqual |  CompareTrueIfUnordered . { Float . Float } . fcmpequ . fcmpne . BadILOp . iffcmpequ }.
	fcmpneu initializeFrom: { 'fcmpneu' . Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfLess |  CompareTrueIfGreater |  CompareTrueIfUnordered . { Float . Float } . fcmpneu . fcmpeq . BadILOp . iffcmpneu }.
	fcmpltu initializeFrom: { 'fcmpltu' . Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfLess |  CompareTrueIfUnordered . { Float . Float } . fcmpgtu . fcmpge . BadILOp . iffcmpltu }.
	fcmpgeu initializeFrom: { 'fcmpgeu' . Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfGreater |  CompareTrueIfEqual |  CompareTrueIfUnordered . { Float . Float } . fcmpleu . fcmplt . BadILOp . iffcmpgeu }.
	fcmpgtu initializeFrom: { 'fcmpgtu' . Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfGreater |  CompareTrueIfUnordered . { Float . Float } . fcmpltu . fcmple . BadILOp . iffcmpgtu }.
	fcmpleu initializeFrom: { 'fcmpleu' . Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfLess |  CompareTrueIfEqual |  CompareTrueIfUnordered . { Float . Float } . fcmpgeu . fcmpgt . BadILOp . iffcmpleu }.
	dcmpeq initializeFrom: { 'dcmpeq' . Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfEqual . { Double . Double } . dcmpeq . dcmpneu . BadILOp . ifdcmpeq }.
	dcmpne initializeFrom: { 'dcmpne' . Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfLess |  CompareTrueIfGreater . { Double . Double } . dcmpne . dcmpequ . BadILOp . ifdcmpne }.
	dcmplt initializeFrom: { 'dcmplt' . Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfLess . { Double . Double } . dcmpgt . dcmpgeu . BadILOp . ifdcmplt }.
	dcmpge initializeFrom: { 'dcmpge' . Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfGreater |  CompareTrueIfEqual . { Double . Double } . dcmple . dcmpltu . BadILOp . ifdcmpge }.
	dcmpgt initializeFrom: { 'dcmpgt' . Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfGreater . { Double . Double } . dcmplt . dcmpleu . BadILOp . ifdcmpgt }.
	dcmple initializeFrom: { 'dcmple' . Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfLess |  CompareTrueIfEqual . { Double . Double } . dcmpge . dcmpgtu . BadILOp . ifdcmple }.
	dcmpequ initializeFrom: { 'dcmpequ' . Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfEqual |  CompareTrueIfUnordered . { Double . Double } . dcmpequ . dcmpne . BadILOp . ifdcmpequ }.
	dcmpneu initializeFrom: { 'dcmpneu' . Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfLess |  CompareTrueIfGreater |  CompareTrueIfUnordered . { Double . Double } . dcmpneu . dcmpeq . BadILOp . ifdcmpneu }.
	dcmpltu initializeFrom: { 'dcmpltu' . Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfLess |  CompareTrueIfUnordered . { Double . Double } . dcmpgtu . dcmpge . BadILOp . ifdcmpltu }.
	dcmpgeu initializeFrom: { 'dcmpgeu' . Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfGreater |  CompareTrueIfEqual |  CompareTrueIfUnordered . { Double . Double } . dcmpleu . dcmplt . BadILOp . ifdcmpgeu }.
	dcmpgtu initializeFrom: { 'dcmpgtu' . Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfGreater |  CompareTrueIfUnordered . { Double . Double } . dcmpltu . dcmple . BadILOp . ifdcmpgtu }.
	dcmpleu initializeFrom: { 'dcmpleu' . Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfLess |  CompareTrueIfEqual |  CompareTrueIfUnordered . { Double . Double } . dcmpgeu . dcmpgt . BadILOp . ifdcmpleu }.
	acmpeq initializeFrom: { 'acmpeq' . Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfEqual . { Address . Address } . acmpeq . acmpne . BadILOp . ifacmpeq }.
	acmpne initializeFrom: { 'acmpne' . Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfLess |  CompareTrueIfGreater . { Address . Address } . acmpne . acmpeq . BadILOp . ifacmpne }.
	acmplt initializeFrom: { 'acmplt' . Int32 .  BooleanCompare .  ValueNumberShare |  UnsignedCompare |  SupportedForPRE .  CompareTrueIfLess . { Address . Address } . acmpgt . acmpge . BadILOp . ifacmplt }.
	acmpge initializeFrom: { 'acmpge' . Int32 .  BooleanCompare .  ValueNumberShare |  UnsignedCompare |  SupportedForPRE .  CompareTrueIfGreater |  CompareTrueIfEqual . { Address . Address } . acmple . acmplt . BadILOp . ifacmpge }.
	acmpgt initializeFrom: { 'acmpgt' . Int32 .  BooleanCompare .  ValueNumberShare |  UnsignedCompare |  SupportedForPRE .  CompareTrueIfGreater . { Address . Address } . acmplt . acmple . BadILOp . ifacmpgt }.
	acmple initializeFrom: { 'acmple' . Int32 .  BooleanCompare .  ValueNumberShare |  UnsignedCompare |  SupportedForPRE .  CompareTrueIfLess |  CompareTrueIfEqual . { Address . Address } . acmpge . acmpgt . BadILOp . ifacmple }.
	bcmpeq initializeFrom: { 'bcmpeq' . Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfEqual . { Int8 . Int8 } . bcmpeq . bcmpne . BadILOp . ifbcmpeq }.
	bcmpne initializeFrom: { 'bcmpne' . Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfLess |  CompareTrueIfGreater . { Int8 . Int8 } . bcmpne . bcmpeq . BadILOp . ifbcmpne }.
	bcmplt initializeFrom: { 'bcmplt' . Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfLess . { Int8 . Int8 } . bcmpgt . bcmpge . BadILOp . ifbcmplt }.
	bcmpge initializeFrom: { 'bcmpge' . Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfGreater |  CompareTrueIfEqual . { Int8 . Int8 } . bcmple . bcmplt . BadILOp . ifbcmpge }.
	bcmpgt initializeFrom: { 'bcmpgt' . Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfGreater . { Int8 . Int8 } . bcmplt . bcmple . BadILOp . ifbcmpgt }.
	bcmple initializeFrom: { 'bcmple' . Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfLess |  CompareTrueIfEqual . { Int8 . Int8 } . bcmpge . bcmpgt . BadILOp . ifbcmple }.
	bucmplt initializeFrom: { 'bucmplt' . Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE |  UnsignedCompare .  CompareTrueIfLess . { Int8 . Int8 } . bucmpgt . bucmpge . BadILOp . ifbucmplt }.
	bucmpge initializeFrom: { 'bucmpge' . Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE |  UnsignedCompare .  CompareTrueIfGreater |  CompareTrueIfEqual . { Int8 . Int8 } . bucmple . bucmplt . BadILOp . ifbucmpge }.
	bucmpgt initializeFrom: { 'bucmpgt' . Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE |  UnsignedCompare .  CompareTrueIfGreater . { Int8 . Int8 } . bucmplt . bucmple . BadILOp . ifbucmpgt }.
	bucmple initializeFrom: { 'bucmple' . Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE |  UnsignedCompare .  CompareTrueIfLess |  CompareTrueIfEqual . { Int8 . Int8 } . bucmpge . bucmpgt . BadILOp . ifbucmple }.
	scmpeq initializeFrom: { 'scmpeq' . Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfEqual . { Int16 . Int16 } . scmpeq . scmpne . BadILOp . ifscmpeq }.
	scmpne initializeFrom: { 'scmpne' . Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfLess |  CompareTrueIfGreater . { Int16 . Int16 } . scmpne . scmpeq . BadILOp . ifscmpne }.
	scmplt initializeFrom: { 'scmplt' . Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfLess . { Int16 . Int16 } . scmpgt . scmpge . BadILOp . ifscmplt }.
	scmpge initializeFrom: { 'scmpge' . Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfGreater |  CompareTrueIfEqual . { Int16 . Int16 } . scmple . scmplt . BadILOp . ifscmpge }.
	scmpgt initializeFrom: { 'scmpgt' . Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfGreater . { Int16 . Int16 } . scmplt . scmple . BadILOp . ifscmpgt }.
	scmple initializeFrom: { 'scmple' . Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfLess |  CompareTrueIfEqual . { Int16 . Int16 } . scmpge . scmpgt . BadILOp . ifscmple }.
	sucmplt initializeFrom: { 'sucmplt' . Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfLess . { Int16 . Int16 } . sucmpgt . sucmpge . BadILOp . ifsucmplt }.
	sucmpge initializeFrom: { 'sucmpge' . Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfGreater |  CompareTrueIfEqual . { Int16 . Int16 } . sucmple . sucmplt . BadILOp . ifsucmpge }.
	sucmpgt initializeFrom: { 'sucmpgt' . Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfGreater . { Int16 . Int16 } . sucmplt . sucmple . BadILOp . ifsucmpgt }.
	sucmple initializeFrom: { 'sucmple' . Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfLess |  CompareTrueIfEqual . { Int16 . Int16 } . sucmpge . sucmpgt . BadILOp . ifsucmple }.
	lcmp initializeFrom: { 'lcmp' . Int32 . 0 .  ValueNumberShare |  SupportedForPRE |  CondCodeComputation .  Signum . { Int64 . Int64 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	fcmpl initializeFrom: { 'fcmpl' . Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfLess . { Float . Float } . BadILOp . BadILOp . BadILOp . BadILOp }.
	fcmpg initializeFrom: { 'fcmpg' . Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfGreater |  CompareTrueIfEqual . { Float . Float } . BadILOp . BadILOp . BadILOp . BadILOp }.
	dcmpl initializeFrom: { 'dcmpl' . Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfLess . { Double . Double } . BadILOp . BadILOp . BadILOp . BadILOp }.
	dcmpg initializeFrom: { 'dcmpg' . Int32 .  BooleanCompare .  ValueNumberShare |  SupportedForPRE .  CompareTrueIfGreater |  CompareTrueIfEqual . { Double . Double } . BadILOp . BadILOp . BadILOp . BadILOp }.
	ificmpeq initializeFrom: { 'ificmpeq' . NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfEqual . { Int32 . Int32 } . ificmpeq . ificmpne . icmpeq . BadILOp }.
	ificmpne initializeFrom: { 'ificmpne' . NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfLess |  CompareTrueIfGreater . { Int32 . Int32 } . ificmpne . ificmpeq . icmpne . BadILOp }.
	ificmplt initializeFrom: { 'ificmplt' . NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfLess . { Int32 . Int32 } . ificmpgt . ificmpge . icmplt . BadILOp }.
	ificmpge initializeFrom: { 'ificmpge' . NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfGreater |  CompareTrueIfEqual . { Int32 . Int32 } . ificmple . ificmplt . icmpge . BadILOp }.
	ificmpgt initializeFrom: { 'ificmpgt' . NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfGreater . { Int32 . Int32 } . ificmplt . ificmple . icmpgt . BadILOp }.
	ificmple initializeFrom: { 'ificmple' . NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfLess |  CompareTrueIfEqual . { Int32 . Int32 } . ificmpge . ificmpgt . icmple . BadILOp }.
	ifiucmplt initializeFrom: { 'ifiucmplt' . NoType .  BooleanCompare |  Branch |  TreeTop .  UnsignedCompare .  CompareTrueIfLess . { Int32 . Int32 } . ifiucmpgt . ifiucmpge . iucmplt . BadILOp }.
	ifiucmpge initializeFrom: { 'ifiucmpge' . NoType .  BooleanCompare |  Branch |  TreeTop .  UnsignedCompare .  CompareTrueIfGreater |  CompareTrueIfEqual . { Int32 . Int32 } . ifiucmple . ifiucmplt . iucmpge . BadILOp }.
	ifiucmpgt initializeFrom: { 'ifiucmpgt' . NoType .  BooleanCompare |  Branch |  TreeTop .  UnsignedCompare .  CompareTrueIfGreater . { Int32 . Int32 } . ifiucmplt . ifiucmple . iucmpgt . BadILOp }.
	ifiucmple initializeFrom: { 'ifiucmple' . NoType .  BooleanCompare |  Branch |  TreeTop .  UnsignedCompare .  CompareTrueIfLess |  CompareTrueIfEqual . { Int32 . Int32 } . ifiucmpge . ifiucmpgt . iucmple . BadILOp }.
	iflcmpeq initializeFrom: { 'iflcmpeq' . NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfEqual . { Int64 . Int64 } . iflcmpeq . iflcmpne . lcmpeq . BadILOp }.
	iflcmpne initializeFrom: { 'iflcmpne' . NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfLess |  CompareTrueIfGreater . { Int64 . Int64 } . iflcmpne . iflcmpeq . lcmpne . BadILOp }.
	iflcmplt initializeFrom: { 'iflcmplt' . NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfLess . { Int64 . Int64 } . iflcmpgt . iflcmpge . lcmplt . BadILOp }.
	iflcmpge initializeFrom: { 'iflcmpge' . NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfGreater |  CompareTrueIfEqual . { Int64 . Int64 } . iflcmple . iflcmplt . lcmpge . BadILOp }.
	iflcmpgt initializeFrom: { 'iflcmpgt' . NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfGreater . { Int64 . Int64 } . iflcmplt . iflcmple . lcmpgt . BadILOp }.
	iflcmple initializeFrom: { 'iflcmple' . NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfLess |  CompareTrueIfEqual . { Int64 . Int64 } . iflcmpge . iflcmpgt . lcmple . BadILOp }.
	iflucmplt initializeFrom: { 'iflucmplt' . NoType .  BooleanCompare |  Branch |  TreeTop .  UnsignedCompare .  CompareTrueIfLess . { Int64 . Int64 } . iflucmpgt . iflucmpge . lucmplt . BadILOp }.
	iflucmpge initializeFrom: { 'iflucmpge' . NoType .  BooleanCompare |  Branch |  TreeTop .  UnsignedCompare .  CompareTrueIfGreater |  CompareTrueIfEqual . { Int64 . Int64 } . iflucmple . iflucmplt . lucmpge . BadILOp }.
	iflucmpgt initializeFrom: { 'iflucmpgt' . NoType .  BooleanCompare |  Branch |  TreeTop .  UnsignedCompare .  CompareTrueIfGreater . { Int64 . Int64 } . iflucmplt . iflucmple . lucmpgt . BadILOp }.
	iflucmple initializeFrom: { 'iflucmple' . NoType .  BooleanCompare |  Branch |  TreeTop .  UnsignedCompare .  CompareTrueIfLess |  CompareTrueIfEqual . { Int64 . Int64 } . iflucmpge . iflucmpgt . lucmple . BadILOp }.
	iffcmpeq initializeFrom: { 'iffcmpeq' . NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfEqual . { Float . Float } . iffcmpeq . iffcmpneu . fcmpeq . BadILOp }.
	iffcmpne initializeFrom: { 'iffcmpne' . NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfLess |  CompareTrueIfGreater . { Float . Float } . iffcmpne . iffcmpequ . fcmpne . BadILOp }.
	iffcmplt initializeFrom: { 'iffcmplt' . NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfLess . { Float . Float } . iffcmpgt . iffcmpgeu . fcmplt . BadILOp }.
	iffcmpge initializeFrom: { 'iffcmpge' . NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfGreater |  CompareTrueIfEqual . { Float . Float } . iffcmple . iffcmpltu . fcmpge . BadILOp }.
	iffcmpgt initializeFrom: { 'iffcmpgt' . NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfGreater . { Float . Float } . iffcmplt . iffcmpleu . fcmpgt . BadILOp }.
	iffcmple initializeFrom: { 'iffcmple' . NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfLess |  CompareTrueIfEqual . { Float . Float } . iffcmpge . iffcmpgtu . fcmple . BadILOp }.
	iffcmpequ initializeFrom: { 'iffcmpequ' . NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfEqual |  CompareTrueIfUnordered . { Float . Float } . iffcmpequ . iffcmpne . fcmpequ . BadILOp }.
	iffcmpneu initializeFrom: { 'iffcmpneu' . NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfLess |  CompareTrueIfGreater |  CompareTrueIfUnordered . { Float . Float } . iffcmpneu . iffcmpeq . fcmpneu . BadILOp }.
	iffcmpltu initializeFrom: { 'iffcmpltu' . NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfLess |  CompareTrueIfUnordered . { Float . Float } . iffcmpgtu . iffcmpge . fcmpltu . BadILOp }.
	iffcmpgeu initializeFrom: { 'iffcmpgeu' . NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfGreater |  CompareTrueIfEqual |  CompareTrueIfUnordered . { Float . Float } . iffcmpleu . iffcmplt . fcmpgeu . BadILOp }.
	iffcmpgtu initializeFrom: { 'iffcmpgtu' . NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfGreater |  CompareTrueIfUnordered . { Float . Float } . iffcmpltu . iffcmple . fcmpgtu . BadILOp }.
	iffcmpleu initializeFrom: { 'iffcmpleu' . NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfLess |  CompareTrueIfEqual |  CompareTrueIfUnordered . { Float . Float } . iffcmpgeu . iffcmpgt . fcmpleu . BadILOp }.
	ifdcmpeq initializeFrom: { 'ifdcmpeq' . NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfEqual . { Double . Double } . ifdcmpeq . ifdcmpneu . dcmpeq . BadILOp }.
	ifdcmpne initializeFrom: { 'ifdcmpne' . NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfLess |  CompareTrueIfGreater . { Double . Double } . ifdcmpne . ifdcmpequ . dcmpne . BadILOp }.
	ifdcmplt initializeFrom: { 'ifdcmplt' . NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfLess . { Double . Double } . ifdcmpgt . ifdcmpgeu . dcmplt . BadILOp }.
	ifdcmpge initializeFrom: { 'ifdcmpge' . NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfGreater |  CompareTrueIfEqual . { Double . Double } . ifdcmple . ifdcmpltu . dcmpge . BadILOp }.
	ifdcmpgt initializeFrom: { 'ifdcmpgt' . NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfGreater . { Double . Double } . ifdcmplt . ifdcmpleu . dcmpgt . BadILOp }.
	ifdcmple initializeFrom: { 'ifdcmple' . NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfLess |  CompareTrueIfEqual . { Double . Double } . ifdcmpge . ifdcmpgtu . dcmple . BadILOp }.
	ifdcmpequ initializeFrom: { 'ifdcmpequ' . NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfEqual |  CompareTrueIfUnordered . { Double . Double } . ifdcmpequ . ifdcmpne . dcmpequ . BadILOp }.
	ifdcmpneu initializeFrom: { 'ifdcmpneu' . NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfLess |  CompareTrueIfGreater |  CompareTrueIfUnordered . { Double . Double } . ifdcmpneu . ifdcmpeq . dcmpneu . BadILOp }.
	ifdcmpltu initializeFrom: { 'ifdcmpltu' . NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfLess |  CompareTrueIfUnordered . { Double . Double } . ifdcmpgtu . ifdcmpge . dcmpltu . BadILOp }.
	ifdcmpgeu initializeFrom: { 'ifdcmpgeu' . NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfGreater |  CompareTrueIfEqual |  CompareTrueIfUnordered . { Double . Double } . ifdcmpleu . ifdcmplt . dcmpgeu . BadILOp }.
	ifdcmpgtu initializeFrom: { 'ifdcmpgtu' . NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfGreater |  CompareTrueIfUnordered . { Double . Double } . ifdcmpltu . ifdcmple . dcmpgtu . BadILOp }.
	ifdcmpleu initializeFrom: { 'ifdcmpleu' . NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfLess |  CompareTrueIfEqual |  CompareTrueIfUnordered . { Double . Double } . ifdcmpgeu . ifdcmpgt . dcmpleu . BadILOp }.
	ifacmpeq initializeFrom: { 'ifacmpeq' . NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfEqual . { Address . Address } . ifacmpeq . ifacmpne . acmpeq . BadILOp }.
	ifacmpne initializeFrom: { 'ifacmpne' . NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfLess |  CompareTrueIfGreater . { Address . Address } . ifacmpne . ifacmpeq . acmpne . BadILOp }.
	ifacmplt initializeFrom: { 'ifacmplt' . NoType .  BooleanCompare |  Branch |  TreeTop .  UnsignedCompare .  CompareTrueIfLess . { Address . Address } . ifacmpgt . ifacmpge . acmplt . BadILOp }.
	ifacmpge initializeFrom: { 'ifacmpge' . NoType .  BooleanCompare |  Branch |  TreeTop .  UnsignedCompare .  CompareTrueIfGreater |  CompareTrueIfEqual . { Address . Address } . ifacmple . ifacmplt . acmpge . BadILOp }.
	ifacmpgt initializeFrom: { 'ifacmpgt' . NoType .  BooleanCompare |  Branch |  TreeTop .  UnsignedCompare .  CompareTrueIfGreater . { Address . Address } . ifacmplt . ifacmple . acmpgt . BadILOp }.
	ifacmple initializeFrom: { 'ifacmple' . NoType .  BooleanCompare |  Branch |  TreeTop .  UnsignedCompare .  CompareTrueIfLess |  CompareTrueIfEqual . { Address . Address } . ifacmpge . ifacmpgt . acmple . BadILOp }.
	ifbcmpeq initializeFrom: { 'ifbcmpeq' . NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfEqual . { Int8 . Int8 } . ifbcmpeq . ifbcmpne . bcmpeq . BadILOp }.
	ifbcmpne initializeFrom: { 'ifbcmpne' . NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfLess |  CompareTrueIfGreater . { Int8 . Int8 } . ifbcmpne . ifbcmpeq . bcmpne . BadILOp }.
	ifbcmplt initializeFrom: { 'ifbcmplt' . NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfLess . { Int8 . Int8 } . ifbcmpgt . ifbcmpge . bcmplt . BadILOp }.
	ifbcmpge initializeFrom: { 'ifbcmpge' . NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfGreater |  CompareTrueIfEqual . { Int8 . Int8 } . ifbcmple . ifbcmplt . bcmpge . BadILOp }.
	ifbcmpgt initializeFrom: { 'ifbcmpgt' . NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfGreater . { Int8 . Int8 } . ifbcmplt . ifbcmple . bcmpgt . BadILOp }.
	ifbcmple initializeFrom: { 'ifbcmple' . NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfLess |  CompareTrueIfEqual . { Int8 . Int8 } . ifbcmpge . ifbcmpgt . bcmple . BadILOp }.
	ifbucmplt initializeFrom: { 'ifbucmplt' . NoType .  BooleanCompare |  Branch |  TreeTop .  UnsignedCompare .  CompareTrueIfLess . { Int8 . Int8 } . ifbucmpgt . ifbucmpge . bucmplt . BadILOp }.
	ifbucmpge initializeFrom: { 'ifbucmpge' . NoType .  BooleanCompare |  Branch |  TreeTop .  UnsignedCompare .  CompareTrueIfGreater |  CompareTrueIfEqual . { Int8 . Int8 } . ifbucmple . ifbucmplt . bucmpge . BadILOp }.
	ifbucmpgt initializeFrom: { 'ifbucmpgt' . NoType .  BooleanCompare |  Branch |  TreeTop .  UnsignedCompare .  CompareTrueIfGreater . { Int8 . Int8 } . ifbucmplt . ifbucmple . bucmpgt . BadILOp }.
	ifbucmple initializeFrom: { 'ifbucmple' . NoType .  BooleanCompare |  Branch |  TreeTop .  UnsignedCompare .  CompareTrueIfLess |  CompareTrueIfEqual . { Int8 . Int8 } . ifbucmpge . ifbucmpgt . bucmple . BadILOp }.
	ifscmpeq initializeFrom: { 'ifscmpeq' . NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfEqual . { Int16 . Int16 } . ifscmpeq . ifscmpne . scmpeq . BadILOp }.
	ifscmpne initializeFrom: { 'ifscmpne' . NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfLess |  CompareTrueIfGreater . { Int16 . Int16 } . ifscmpne . ifscmpeq . scmpne . BadILOp }.
	ifscmplt initializeFrom: { 'ifscmplt' . NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfLess . { Int16 . Int16 } . ifscmpgt . ifscmpge . scmplt . BadILOp }.
	ifscmpge initializeFrom: { 'ifscmpge' . NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfGreater |  CompareTrueIfEqual . { Int16 . Int16 } . ifscmple . ifscmplt . scmpge . BadILOp }.
	ifscmpgt initializeFrom: { 'ifscmpgt' . NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfGreater . { Int16 . Int16 } . ifscmplt . ifscmple . scmpgt . BadILOp }.
	ifscmple initializeFrom: { 'ifscmple' . NoType .  BooleanCompare |  Branch |  TreeTop . 0 .  CompareTrueIfLess |  CompareTrueIfEqual . { Int16 . Int16 } . ifscmpge . ifscmpgt . scmple . BadILOp }.
	ifsucmplt initializeFrom: { 'ifsucmplt' . NoType .  BooleanCompare |  Branch |  TreeTop .  UnsignedCompare .  CompareTrueIfLess . { Int16 . Int16 } . ifsucmpgt . ifsucmpge . sucmplt . BadILOp }.
	ifsucmpge initializeFrom: { 'ifsucmpge' . NoType .  BooleanCompare |  Branch |  TreeTop .  UnsignedCompare .  CompareTrueIfGreater |  CompareTrueIfEqual . { Int16 . Int16 } . ifsucmple . ifsucmplt . sucmpge . BadILOp }.
	ifsucmpgt initializeFrom: { 'ifsucmpgt' . NoType .  BooleanCompare |  Branch |  TreeTop .  UnsignedCompare .  CompareTrueIfGreater . { Int16 . Int16 } . ifsucmplt . ifsucmple . sucmpgt . BadILOp }.
	ifsucmple initializeFrom: { 'ifsucmple' . NoType .  BooleanCompare |  Branch |  TreeTop .  UnsignedCompare .  CompareTrueIfLess |  CompareTrueIfEqual . { Int16 . Int16 } . ifsucmpge . ifsucmpgt . sucmple . BadILOp }.
	loadaddr initializeFrom: { 'loadaddr' . Address .  HasSymbolRef .  ValueNumberShare |  SupportedForPRE|  MayUseSystemStack |  LoadAddress .  LikeUse .  NoChildren  . BadILOp . BadILOp . BadILOp . BadILOp }.
	zerochk initializeFrom: { 'zerochk' . NoType .  TreeTop |  HasSymbolRef .  CanRaiseException |  Check|  MayUseSystemStack . 0 . { Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	iregload initializeFrom: { 'iregload' . Int32 .  LoadReg . 0 . 0 .  NoChildren  . BadILOp . BadILOp . BadILOp . BadILOp }.
	aregload initializeFrom: { 'aregload' . Address .  LoadReg . 0 . 0 .  NoChildren  . BadILOp . BadILOp . BadILOp . BadILOp }.
	lregload initializeFrom: { 'lregload' . Int64 .  LoadReg . 0 . 0 .  NoChildren  . BadILOp . BadILOp . BadILOp . BadILOp }.
	fregload initializeFrom: { 'fregload' . Float .  LoadReg . 0 . 0 .  NoChildren  . BadILOp . BadILOp . BadILOp . BadILOp }.
	dregload initializeFrom: { 'dregload' . Double .  LoadReg . 0 . 0 .  NoChildren  . BadILOp . BadILOp . BadILOp . BadILOp }.
	sregload initializeFrom: { 'sregload' . Int16 .  LoadReg . 0 . 0 .  NoChildren  . BadILOp . BadILOp . BadILOp . BadILOp }.
	bregload initializeFrom: { 'bregload' . Int8 .  LoadReg . 0 . 0 .  NoChildren  . BadILOp . BadILOp . BadILOp . BadILOp }.
	iregstore initializeFrom: { 'iregstore' . Int32 .  StoreReg |  TreeTop . 0 . 0 . { Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	aregstore initializeFrom: { 'aregstore' . Address .  StoreReg |  TreeTop . 0 . 0 . { Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	lregstore initializeFrom: { 'lregstore' . Int64 .  StoreReg |  TreeTop . 0 . 0 . { Int64 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	fregstore initializeFrom: { 'fregstore' . Float .  StoreReg |  TreeTop . 0 . 0 . { Float } . BadILOp . BadILOp . BadILOp . BadILOp }.
	dregstore initializeFrom: { 'dregstore' . Double .  StoreReg |  TreeTop . 0 . 0 . { Double } . BadILOp . BadILOp . BadILOp . BadILOp }.
	sregstore initializeFrom: { 'sregstore' . Int16 .  StoreReg |  TreeTop . 0 . 0 . { Int16 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	bregstore initializeFrom: { 'bregstore' . Int8 .  StoreReg |  TreeTop . 0 . 0 . { Int8 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	glregdeps initializeFrom: { 'glregdeps' . NoType . 0 . 0 . 0 .  Unspecified . BadILOp . BadILOp . BadILOp . BadILOp }.
	iselect initializeFrom: { 'iselect' . Int32 . 0 .  ValueNumberShare |  SupportedForPRE |  Select . 0 . { Int32 . Int32 . Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	lselect initializeFrom: { 'lselect' . Int64 . 0 .  ValueNumberShare |  SupportedForPRE |  Select . 0 . { Int32 . Int64 . Int64 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	bselect initializeFrom: { 'bselect' . Int8 . 0 .  ValueNumberShare |  SupportedForPRE |  Select . 0 . { Int32 . Int8 . Int8 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	sselect initializeFrom: { 'sselect' . Int16 . 0 .  ValueNumberShare |  SupportedForPRE |  Select . 0 . { Int32 . Int16 . Int16 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	aselect initializeFrom: { 'aselect' . Address . 0 .  ValueNumberShare |  SupportedForPRE |  Select . 0 . { Int32 . Address . Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	fselect initializeFrom: { 'fselect' . Float . 0 .  ValueNumberShare |  SupportedForPRE |  Select . 0 . { Int32 . Float . Float } . BadILOp . BadILOp . BadILOp . BadILOp }.
	dselect initializeFrom: { 'dselect' . Double . 0 .  ValueNumberShare |  SupportedForPRE |  Select . 0 . { Int32 . Double . Double } . BadILOp . BadILOp . BadILOp . BadILOp }.
	treetop initializeFrom: { 'treetop' . NoType .  TreeTop . 0 . 0 . {  UnspecifiedChildType } . BadILOp . BadILOp . BadILOp . BadILOp }.
	methodenterhook initializeFrom: { 'methodenterhook' . NoType .  TreeTop |  HasSymbolRef .  MustBeLowered|  MayUseSystemStack . 0 .  NoChildren  . BadILOp . BadILOp . BadILOp . BadILOp }.
	methodexithook initializeFrom: { 'methodexithook' . NoType .  TreeTop |  HasSymbolRef .  MustBeLowered|  MayUseSystemStack . 0 .  NoChildren  . BadILOp . BadILOp . BadILOp . BadILOp }.
	passthrough initializeFrom: { 'passthrough' . NoType . 0 .  ValueNumberShare . 0 . {  UnspecifiedChildType } . BadILOp . BadILOp . BadILOp . BadILOp }.
	compressedrefs initializeFrom: { 'compressedrefs' . Address .  TreeTop . 0 . 0 . {  UnspecifiedChildType . Int64 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	bbstart initializeFrom: { 'bbstart' . NoType .  TreeTop . 0 . 0 .  NoChildren  . BadILOp . BadILOp . BadILOp . BadILOp }.
	bbend initializeFrom: { 'bbend' . NoType .  TreeTop . 0 . 0 .  NoChildren  . BadILOp . BadILOp . BadILOp . BadILOp }.
	f2iu initializeFrom: { 'f2iu' . Int32 .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . { Float } . BadILOp . BadILOp . BadILOp . BadILOp }.
	f2lu initializeFrom: { 'f2lu' . Int64 .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . { Float } . BadILOp . BadILOp . BadILOp . BadILOp }.
	f2bu initializeFrom: { 'f2bu' . Int8 .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . { Float } . BadILOp . BadILOp . BadILOp . BadILOp }.
	f2c initializeFrom: { 'f2c' . Int16 .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . { Float } . BadILOp . BadILOp . BadILOp . BadILOp }.
	d2iu initializeFrom: { 'd2iu' . Int32 .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . { Double } . BadILOp . BadILOp . BadILOp . BadILOp }.
	d2lu initializeFrom: { 'd2lu' . Int64 .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . { Double } . BadILOp . BadILOp . BadILOp . BadILOp }.
	d2bu initializeFrom: { 'd2bu' . Int8 .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . { Double } . BadILOp . BadILOp . BadILOp . BadILOp }.
	d2c initializeFrom: { 'd2c' . Int16 .  Conversion .  ValueNumberShare |  SupportedForPRE . 0 . { Double } . BadILOp . BadILOp . BadILOp . BadILOp }.
	monent initializeFrom: { 'monent' . NoType .  TreeTop |  HasSymbolRef .  CanRaiseException|  MayUseSystemStack .  LikeDef . {  UnspecifiedChildType } . BadILOp . BadILOp . BadILOp . BadILOp }.
	monexit initializeFrom: { 'monexit' . NoType .  TreeTop |  HasSymbolRef .  CanRaiseException|  MayUseSystemStack .  LikeDef . {  UnspecifiedChildType } . BadILOp . BadILOp . BadILOp . BadILOp }.
	monexitfence initializeFrom: { 'monexitfence' . NoType .  TreeTop .  CanRaiseException|  MayUseSystemStack . 0 .  NoChildren  . BadILOp . BadILOp . BadILOp . BadILOp }.
	tstart initializeFrom: { 'tstart' . NoType .  HasSymbolRef |  TreeTop .  JumpWithMultipleTargets .  HasBranchChild . { NoType . NoType . NoType } . BadILOp . BadILOp . BadILOp . BadILOp }.
	tfinish initializeFrom: { 'tfinish' . NoType .  HasSymbolRef |  TreeTop . 0 . 0 .  NoChildren  . BadILOp . BadILOp . BadILOp . BadILOp }.
	tabort initializeFrom: { 'tabort' . NoType .  HasSymbolRef |  TreeTop . 0 . 0 .  NoChildren  . BadILOp . BadILOp . BadILOp . BadILOp }.
	instanceof initializeFrom: { 'instanceof' . Int32 .  HasSymbolRef .  MayUseSystemStack . 0 . { Address . Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	checkcast initializeFrom: { 'checkcast' . Address .  TreeTop |  HasSymbolRef .  CanRaiseException |  Check |  CheckCast|  MayUseSystemStack . 0 . { UnspecifiedChildType . UnspecifiedChildType } . BadILOp . BadILOp . BadILOp . BadILOp }.
	checkcastandnullchk initializeFrom: { 'checkcastandnullchk' . Address .  TreeTop |  HasSymbolRef .  CanRaiseException |  Check |  CheckCast|  MayUseSystemStack . 0 . { UnspecifiedChildType . UnspecifiedChildType } . BadILOp . BadILOp . BadILOp . BadILOp }.
	new initializeFrom: { 'new' . Address .  HasSymbolRef .  CanRaiseException|  MayUseSystemStack |  New .  LikeDef . {  UnspecifiedChildType } . BadILOp . BadILOp . BadILOp . BadILOp }.
	newvalue initializeFrom: { 'newvalue' . Address .  HasSymbolRef .  CanRaiseException|  MayUseSystemStack |  New .  LikeDef .  Unspecified . BadILOp . BadILOp . BadILOp . BadILOp }.
	newarray initializeFrom: { 'newarray' . Address .  HasSymbolRef .  CanRaiseException|  MayUseSystemStack |  New .  LikeDef . { UnspecifiedChildType . UnspecifiedChildType } . BadILOp . BadILOp . BadILOp . BadILOp }.
	anewarray initializeFrom: { 'anewarray' . Address .  HasSymbolRef .  CanRaiseException|  MayUseSystemStack |  New .  LikeDef . { UnspecifiedChildType . UnspecifiedChildType } . BadILOp . BadILOp . BadILOp . BadILOp }.
	variablenew initializeFrom: { 'variablenew' . Address .  HasSymbolRef .  CanRaiseException|  MayUseSystemStack .  LikeDef . {  UnspecifiedChildType } . BadILOp . BadILOp . BadILOp . BadILOp }.
	variablenewarray initializeFrom: { 'variablenewarray' . Address .  HasSymbolRef .  CanRaiseException|  MayUseSystemStack .  LikeDef . {  UnspecifiedChildType } . BadILOp . BadILOp . BadILOp . BadILOp }.
	multianewarray initializeFrom: { 'multianewarray' . Address .  HasSymbolRef .  MustBeLowered |  CanRaiseException|  MayUseSystemStack |  New .  LikeDef . {  UnspecifiedChildType } . BadILOp . BadILOp . BadILOp . BadILOp }.
	arraylength initializeFrom: { 'arraylength' . Int32 . 0 .  MustBeLowered |  ValueNumberShare |  SupportedForPRE .  ArrayLength . {  UnspecifiedChildType } . BadILOp . BadILOp . BadILOp . BadILOp }.
	contigarraylength initializeFrom: { 'contigarraylength' . Int32 . 0 .  MustBeLowered |  ValueNumberShare |  SupportedForPRE .  ArrayLength . {  UnspecifiedChildType } . BadILOp . BadILOp . BadILOp . BadILOp }.
	discontigarraylength initializeFrom: { 'discontigarraylength' . Int32 . 0 .  MustBeLowered |  ValueNumberShare |  SupportedForPRE .  ArrayLength . {  UnspecifiedChildType } . BadILOp . BadILOp . BadILOp . BadILOp }.
	icalli initializeFrom: { 'icalli' . Int32 .  Indirect |  Call |  HasSymbolRef .  CanRaiseException |  SupportedForPRE|  MayUseSystemStack .  LikeUse |  LikeDef .  IndirectCallType . BadILOp . BadILOp . BadILOp . BadILOp }.
	lcalli initializeFrom: { 'lcalli' . Int64 .  Indirect |  Call |  HasSymbolRef .  CanRaiseException |  SupportedForPRE|  MayUseSystemStack .  LikeUse |  LikeDef .  IndirectCallType . BadILOp . BadILOp . BadILOp . BadILOp }.
	fcalli initializeFrom: { 'fcalli' . Float .  Indirect |  Call |  HasSymbolRef .  CanRaiseException |  SupportedForPRE|  MayUseSystemStack .  LikeUse |  LikeDef .  IndirectCallType . BadILOp . BadILOp . BadILOp . BadILOp }.
	dcalli initializeFrom: { 'dcalli' . Double .  Indirect |  Call |  HasSymbolRef .  CanRaiseException |  SupportedForPRE|  MayUseSystemStack .  LikeUse |  LikeDef .  IndirectCallType . BadILOp . BadILOp . BadILOp . BadILOp }.
	acalli initializeFrom: { 'acalli' . Address .  Indirect |  Call |  HasSymbolRef .  CanRaiseException |  SupportedForPRE|  MayUseSystemStack .  LikeUse |  LikeDef .  IndirectCallType . BadILOp . BadILOp . BadILOp . BadILOp }.
	calli initializeFrom: { 'calli' . NoType .  Indirect |  Call |  HasSymbolRef .  CanRaiseException |  SupportedForPRE|  MayUseSystemStack .  LikeUse |  LikeDef .  IndirectCallType . BadILOp . BadILOp . BadILOp . BadILOp }.
	fence initializeFrom: { 'fence' . NoType .  TreeTop |  HasSymbolRef . 0 .  Fence |  LikeUse |  LikeDef .  NoChildren  . BadILOp . BadILOp . BadILOp . BadILOp }.
	luaddh initializeFrom: { 'luaddh' . Int64 .  Commutative |  Associative |  Add .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int64 . Int64 } . luaddh . BadILOp . BadILOp . BadILOp }.
	aiadd initializeFrom: { 'aiadd' . Address .  Commutative |  Associative |  Add .  ValueNumberShare .  LikeUse . { Address . Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	aladd initializeFrom: { 'aladd' . Address .  Commutative |  Associative |  Add .  ValueNumberShare .  LikeUse . { Address . Int64 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	lusubh initializeFrom: { 'lusubh' . Int64 .  Sub .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int64 . Int64 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	imulh initializeFrom: { 'imulh' . Int32 .  Commutative |  Associative |  Mul .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int32 . Int32 } . imulh . BadILOp . BadILOp . BadILOp }.
	iumulh initializeFrom: { 'iumulh' . Int32 .  Commutative |  Associative |  Mul .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int32 . Int32 } . iumulh . BadILOp . BadILOp . BadILOp }.
	lmulh initializeFrom: { 'lmulh' . Int64 .  Commutative |  Associative |  Mul .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int64 . Int64 } . lmulh . BadILOp . BadILOp . BadILOp }.
	lumulh initializeFrom: { 'lumulh' . Int64 .  Commutative |  Associative |  Mul .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int64 . Int64 } . lumulh . BadILOp . BadILOp . BadILOp }.
	ibits2f initializeFrom: { 'ibits2f' . Float . 0 .  ValueNumberShare |  SupportedForPRE . 0 . { Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	fbits2i initializeFrom: { 'fbits2i' . Int32 . 0 .  ValueNumberShare |  SupportedForPRE . 0 . { Float } . BadILOp . BadILOp . BadILOp . BadILOp }.
	lbits2d initializeFrom: { 'lbits2d' . Double . 0 .  ValueNumberShare |  SupportedForPRE . 0 . { Int64 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	dbits2l initializeFrom: { 'dbits2l' . Int64 . 0 .  ValueNumberShare |  SupportedForPRE . 0 . { Double } . BadILOp . BadILOp . BadILOp . BadILOp }.
	lookup initializeFrom: { 'lookup' . NoType .  TreeTop |  Switch .  JumpWithMultipleTargets .  HasBranchChild .  Unspecified . BadILOp . BadILOp . BadILOp . BadILOp }.
	case initializeFrom: { 'case' . NoType .  Branch |  TreeTop . 0 . 0 .  NoChildren  . BadILOp . BadILOp . BadILOp . BadILOp }.
	table initializeFrom: { 'table' . NoType .  TreeTop |  Switch .  JumpWithMultipleTargets .  HasBranchChild .  Unspecified . BadILOp . BadILOp . BadILOp . BadILOp }.
	exceptionrangefence initializeFrom: { 'exceptionrangefence' . NoType .  TreeTop |  HasSymbolRef . 0 .  ExceptionRangeFence .  NoChildren  . BadILOp . BadILOp . BadILOp . BadILOp }.
	nullchk initializeFrom: { 'nullchk' . Address .  TreeTop |  HasSymbolRef .  ValueNumberShare |  CanRaiseException |  Check |  NullCheck|  MayUseSystemStack . 0 . {  UnspecifiedChildType } . BadILOp . BadILOp . BadILOp . BadILOp }.
	resolvechk initializeFrom: { 'resolvechk' . Address .  TreeTop |  HasSymbolRef .  ValueNumberShare |  CanRaiseException |  Check |  ResolveCheck|  MayUseSystemStack .  LikeDef . {  UnspecifiedChildType } . BadILOp . BadILOp . BadILOp . BadILOp }.
	resolveandnullchk initializeFrom: { 'resolveandnullchk' . Address .  TreeTop |  HasSymbolRef .  ValueNumberShare |  CanRaiseException |  Check |  NullCheck |  ResolveCheck|  MayUseSystemStack .  LikeDef . {  UnspecifiedChildType } . BadILOp . BadILOp . BadILOp . BadILOp }.
	divchk initializeFrom: { 'divchk' . NoType .  TreeTop |  HasSymbolRef .  CanRaiseException |  Check|  MayUseSystemStack . 0 . {  UnspecifiedChildType } . BadILOp . BadILOp . BadILOp . BadILOp }.
	overflowchk initializeFrom: { 'overflowchk' . NoType .  TreeTop |  HasSymbolRef .  Check|  MayUseSystemStack |  CanRaiseException . 0 . { UnspecifiedChildType . UnspecifiedChildType . UnspecifiedChildType } . BadILOp . BadILOp . BadILOp . BadILOp }.
	unsignedoverflowchk initializeFrom: { 'unsignedoverflowchk' . NoType .  TreeTop |  HasSymbolRef .  Check|  MayUseSystemStack |  CanRaiseException . 0 . { UnspecifiedChildType . UnspecifiedChildType . UnspecifiedChildType } . BadILOp . BadILOp . BadILOp . BadILOp }.
	bndchk initializeFrom: { 'bndchk' . Int32 .  TreeTop |  HasSymbolRef .  ValueNumberShare |  CanRaiseException |  Check |  BndCheck|  MayUseSystemStack . 0 . { UnspecifiedChildType . UnspecifiedChildType } . BadILOp . BadILOp . BadILOp . BadILOp }.
	arraycopybndchk initializeFrom: { 'arraycopybndchk' . Int32 .  TreeTop |  HasSymbolRef .  ValueNumberShare |  CanRaiseException |  Check |  BndCheck|  MayUseSystemStack . 0 . { UnspecifiedChildType . UnspecifiedChildType } . BadILOp . BadILOp . BadILOp . BadILOp }.
	bndchkwithspinechk initializeFrom: { 'bndchkwithspinechk' . Int32 .  TreeTop |  HasSymbolRef .  ValueNumberShare |  CanRaiseException |  Check |  BndCheck|  MayUseSystemStack .  SpineCheck .  Unspecified . BadILOp . BadILOp . BadILOp . BadILOp }.
	spinechk initializeFrom: { 'spinechk' . Int32 .  TreeTop |  HasSymbolRef .  ValueNumberShare |  Check .  SpineCheck .  Unspecified . BadILOp . BadILOp . BadILOp . BadILOp }.
	arraystorechk initializeFrom: { 'arraystorechk' . Address .  TreeTop |  HasSymbolRef .  ValueNumberShare |  CanRaiseException |  Check|  MayUseSystemStack . 0 . {  UnspecifiedChildType } . BadILOp . BadILOp . BadILOp . BadILOp }.
	arraychk initializeFrom: { 'arraychk' . Address .  TreeTop |  HasSymbolRef .  ValueNumberShare |  CanRaiseException |  Check|  MayUseSystemStack . 0 . { Address . Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	arraycopy initializeFrom: { 'arraycopy' . NoType .  Call |  HasSymbolRef .  MayUseSystemStack |  CanRaiseException | 0 .  LikeUse |  LikeDef |  SkipDynamicLitPoolOnInts .  Unspecified . BadILOp . BadILOp . BadILOp . BadILOp }.
	arrayset initializeFrom: { 'arrayset' . NoType .  Call |  HasSymbolRef . 0 .  LikeUse |  LikeDef |  SkipDynamicLitPoolOnInts .  Unspecified . BadILOp . BadILOp . BadILOp . BadILOp }.
	arraytranslate initializeFrom: { 'arraytranslate' . Int32 .  Call |  HasSymbolRef . 0 .  LikeUse |  LikeDef .  Unspecified . BadILOp . BadILOp . BadILOp . BadILOp }.
	arraytranslateandtest initializeFrom: { 'arraytranslateandtest' . Int32 .  Call |  HasSymbolRef .  CanRaiseException |  BndCheck .  LikeUse |  LikeDef .  Unspecified . BadILOp . BadILOp . BadILOp . BadILOp }.
	long2string initializeFrom: { 'long2string' . NoType .  Call |  HasSymbolRef . 0 .  LikeUse |  LikeDef .  Unspecified . BadILOp . BadILOp . BadILOp . BadILOp }.
	bitopmem initializeFrom: { 'bitopmem' . Int32 .  Call |  HasSymbolRef .  CondCodeComputation .  LikeUse |  LikeDef |  SkipDynamicLitPoolOnInts .  Unspecified . BadILOp . BadILOp . BadILOp . BadILOp }.
	arraycmp initializeFrom: { 'arraycmp' . Int32 .  Call |  HasSymbolRef .  CondCodeComputation .  LikeUse |  LikeDef |  SkipDynamicLitPoolOnInts . { Address . Address . Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	allocationfence initializeFrom: { 'allocationfence' . NoType .  TreeTop . 0 . 0 .  NoChildren  . BadILOp . BadILOp . BadILOp . BadILOp }.
	loadfence initializeFrom: { 'loadfence' . NoType .  TreeTop |  HasSymbolRef . 0 .  LikeUse |  LikeDef .  Unspecified . BadILOp . BadILOp . BadILOp . BadILOp }.
	storefence initializeFrom: { 'storefence' . NoType .  TreeTop |  HasSymbolRef . 0 .  LikeUse |  LikeDef .  Unspecified . BadILOp . BadILOp . BadILOp . BadILOp }.
	fullfence initializeFrom: { 'fullfence' . NoType .  TreeTop |  HasSymbolRef . 0 .  LikeUse |  LikeDef .  Unspecified . BadILOp . BadILOp . BadILOp . BadILOp }.
	computecc initializeFrom: { 'computecc' . Int8 . 0 .  ValueNumberShare |  SupportedForPRE |  CondCodeComputation . 0 .  Unspecified . BadILOp . BadILOp . BadILOp . BadILOp }.
	butest initializeFrom: { 'butest' . Int32 . 0 .  ValueNumberShare |  SupportedForPRE |  CondCodeComputation . 0 .  Unspecified . BadILOp . BadILOp . BadILOp . BadILOp }.
	sutest initializeFrom: { 'sutest' . Int32 . 0 .  ValueNumberShare |  SupportedForPRE |  CondCodeComputation . 0 .  Unspecified . BadILOp . BadILOp . BadILOp . BadILOp }.
	bucmp initializeFrom: { 'bucmp' . Int32 . 0 .  ValueNumberShare |  SupportedForPRE |  UnsignedCompare |  CondCodeComputation .  Signum . { Int8 . Int8 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	bcmp initializeFrom: { 'bcmp' . Int32 . 0 .  ValueNumberShare |  SupportedForPRE |  CondCodeComputation .  Signum . { Int8 . Int8 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	sucmp initializeFrom: { 'sucmp' . Int32 . 0 .  ValueNumberShare |  SupportedForPRE |  UnsignedCompare |  CondCodeComputation .  Signum . { Int16 . Int16 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	scmp initializeFrom: { 'scmp' . Int32 . 0 .  ValueNumberShare |  SupportedForPRE |  CondCodeComputation .  Signum . { Int16 . Int16 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	iucmp initializeFrom: { 'iucmp' . Int32 . 0 .  ValueNumberShare |  SupportedForPRE |  UnsignedCompare |  CondCodeComputation .  Signum . { Int32 . Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	icmp initializeFrom: { 'icmp' . Int32 . 0 .  ValueNumberShare |  SupportedForPRE |  CondCodeComputation .  Signum . { Int32 . Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	lucmp initializeFrom: { 'lucmp' . Int32 . 0 .  ValueNumberShare |  SupportedForPRE |  UnsignedCompare |  CondCodeComputation .  Signum . { Int64 . Int64 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	ificmpo initializeFrom: { 'ificmpo' . NoType .  BooleanCompare |  Branch |  TreeTop .  OverflowCompare . 0 . { Int32 . Int32 } . BadILOp . ificmpno . BadILOp . BadILOp }.
	ificmpno initializeFrom: { 'ificmpno' . NoType .  BooleanCompare |  Branch |  TreeTop .  OverflowCompare . 0 . { Int32 . Int32 } . BadILOp . ificmpo . BadILOp . BadILOp }.
	iflcmpo initializeFrom: { 'iflcmpo' . NoType .  BooleanCompare |  Branch |  TreeTop .  OverflowCompare . 0 . { Int64 . Int64 } . BadILOp . iflcmpno . BadILOp . BadILOp }.
	iflcmpno initializeFrom: { 'iflcmpno' . NoType .  BooleanCompare |  Branch |  TreeTop .  OverflowCompare . 0 . { Int64 . Int64 } . BadILOp . iflcmpo . BadILOp . BadILOp }.
	ificmno initializeFrom: { 'ificmno' . NoType .  BooleanCompare |  Branch |  TreeTop .  OverflowCompare . 0 . { Int32 . Int32 } . BadILOp . ificmnno . BadILOp . BadILOp }.
	ificmnno initializeFrom: { 'ificmnno' . NoType .  BooleanCompare |  Branch |  TreeTop .  OverflowCompare . 0 . { Int32 . Int32 } . BadILOp . ificmno . BadILOp . BadILOp }.
	iflcmno initializeFrom: { 'iflcmno' . NoType .  BooleanCompare |  Branch |  TreeTop .  OverflowCompare . 0 . { Int64 . Int64 } . BadILOp . iflcmnno . BadILOp . BadILOp }.
	iflcmnno initializeFrom: { 'iflcmnno' . NoType .  BooleanCompare |  Branch |  TreeTop .  OverflowCompare . 0 . { Int64 . Int64 } . BadILOp . iflcmno . BadILOp . BadILOp }.
	iuaddc initializeFrom: { 'iuaddc' . Int32 . 0 .  ValueNumberShare |  SupportedForPRE |  SelectAdd . 0 . { Int32 . Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	luaddc initializeFrom: { 'luaddc' . Int64 . 0 .  ValueNumberShare |  SupportedForPRE |  SelectAdd . 0 . { Int64 . Int64 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	iusubb initializeFrom: { 'iusubb' . Int32 . 0 .  ValueNumberShare |  SupportedForPRE |  SelectSub . 0 . { Int32 . Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	lusubb initializeFrom: { 'lusubb' . Int64 . 0 .  ValueNumberShare |  SupportedForPRE |  SelectSub . 0 . { Int64 . Int64 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	icmpset initializeFrom: { 'icmpset' . Int32 .  Call |  HasSymbolRef . 0 .  LikeUse |  LikeDef . { Address . Int32 . Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	lcmpset initializeFrom: { 'lcmpset' . Int32 .  Call |  HasSymbolRef . 0 .  LikeUse |  LikeDef . { Address . Int64 . Int64 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	bztestnset initializeFrom: { 'bztestnset' . Int8 .  Call |  HasSymbolRef . 0 .  LikeUse |  LikeDef . { Address .  UnspecifiedChildType } . BadILOp . BadILOp . BadILOp . BadILOp }.
	ibatomicor initializeFrom: { 'ibatomicor' . NoType .  LoadVar |  Store |  Indirect |  TreeTop |  HasSymbolRef .  ValueNumberShare|  MayUseSystemStack .  LikeUse |  LikeDef . { Address . Int8 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	isatomicor initializeFrom: { 'isatomicor' . NoType .  LoadVar |  Store |  Indirect |  TreeTop |  HasSymbolRef .  ValueNumberShare|  MayUseSystemStack .  LikeUse |  LikeDef . { Address . Int16 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	iiatomicor initializeFrom: { 'iiatomicor' . NoType .  LoadVar |  Store |  Indirect |  TreeTop |  HasSymbolRef .  ValueNumberShare|  MayUseSystemStack .  LikeUse |  LikeDef . { Address . Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	ilatomicor initializeFrom: { 'ilatomicor' . NoType .  LoadVar |  Store |  Indirect |  TreeTop |  HasSymbolRef .  ValueNumberShare|  MayUseSystemStack .  LikeUse |  LikeDef . { Address . Int64 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	branch initializeFrom: { 'branch' . NoType .  Branch |  CompBranchOnly |  TreeTop . 0 . 0 .  NoChildren  . BadILOp . BadILOp . BadILOp . BadILOp }.
	igoto initializeFrom: { 'igoto' . NoType .  TreeTop .  JumpWithMultipleTargets . 0 . { Address } . BadILOp . BadILOp . BadILOp . BadILOp }.
	fsqrt initializeFrom: { 'fsqrt' . Float . 0 .  ValueNumberShare |  SupportedForPRE . 0 . { Float } . BadILOp . BadILOp . BadILOp . BadILOp }.
	dsqrt initializeFrom: { 'dsqrt' . Double . 0 .  ValueNumberShare |  SupportedForPRE . 0 . { Double } . BadILOp . BadILOp . BadILOp . BadILOp }.
	dfloor initializeFrom: { 'dfloor' . Double . 0 .  ValueNumberShare |  SupportedForPRE . 0 . { Double } . BadILOp . BadILOp . BadILOp . BadILOp }.
	ffloor initializeFrom: { 'ffloor' . Float . 0 .  ValueNumberShare |  SupportedForPRE . 0 . { Float } . BadILOp . BadILOp . BadILOp . BadILOp }.
	dceil initializeFrom: { 'dceil' . Double . 0 .  ValueNumberShare |  SupportedForPRE . 0 . { Double } . BadILOp . BadILOp . BadILOp . BadILOp }.
	fceil initializeFrom: { 'fceil' . Float . 0 .  ValueNumberShare |  SupportedForPRE . 0 . { Float } . BadILOp . BadILOp . BadILOp . BadILOp }.
	imax initializeFrom: { 'imax' . Int32 . 0 .  ValueNumberShare |  SupportedForPRE |  Max . 0 . { Int32 . Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	iumax initializeFrom: { 'iumax' . Int32 . 0 .  ValueNumberShare |  SupportedForPRE |  Max . 0 . { Int32 . Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	lmax initializeFrom: { 'lmax' . Int64 . 0 .  ValueNumberShare |  SupportedForPRE |  Max . 0 . { Int64 . Int64 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	lumax initializeFrom: { 'lumax' . Int64 . 0 .  ValueNumberShare |  SupportedForPRE |  Max . 0 . { Int64 . Int64 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	fmax initializeFrom: { 'fmax' . Float . 0 .  ValueNumberShare |  SupportedForPRE |  Max . 0 . { Float . Float } . BadILOp . BadILOp . BadILOp . BadILOp }.
	dmax initializeFrom: { 'dmax' . Double . 0 .  ValueNumberShare |  SupportedForPRE |  Max . 0 . { Double . Double } . BadILOp . BadILOp . BadILOp . BadILOp }.
	imin initializeFrom: { 'imin' . Int32 . 0 .  ValueNumberShare |  SupportedForPRE |  Min . 0 . { Int32 . Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	iumin initializeFrom: { 'iumin' . Int32 . 0 .  ValueNumberShare |  SupportedForPRE |  Min . 0 . { Int32 . Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	lmin initializeFrom: { 'lmin' . Int64 . 0 .  ValueNumberShare |  SupportedForPRE |  Min . 0 . { Int64 . Int64 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	lumin initializeFrom: { 'lumin' . Int64 . 0 .  ValueNumberShare |  SupportedForPRE |  Min . 0 . { Int64 . Int64 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	fmin initializeFrom: { 'fmin' . Float . 0 .  ValueNumberShare |  SupportedForPRE |  Min . 0 . { Float . Float } . BadILOp . BadILOp . BadILOp . BadILOp }.
	dmin initializeFrom: { 'dmin' . Double . 0 .  ValueNumberShare |  SupportedForPRE |  Min . 0 . { Double . Double } . BadILOp . BadILOp . BadILOp . BadILOp }.
	ihbit initializeFrom: { 'ihbit' . Int32 . 0 .  SupportedForPRE . 0 .  Unspecified . BadILOp . BadILOp . BadILOp . BadILOp }.
	ilbit initializeFrom: { 'ilbit' . Int32 . 0 .  SupportedForPRE . 0 .  Unspecified . BadILOp . BadILOp . BadILOp . BadILOp }.
	inolz initializeFrom: { 'inolz' . Int32 . 0 .  SupportedForPRE . 0 .  Unspecified . BadILOp . BadILOp . BadILOp . BadILOp }.
	inotz initializeFrom: { 'inotz' . Int32 . 0 .  SupportedForPRE . 0 .  Unspecified . BadILOp . BadILOp . BadILOp . BadILOp }.
	ipopcnt initializeFrom: { 'ipopcnt' . Int32 . 0 .  SupportedForPRE . 0 .  Unspecified . BadILOp . BadILOp . BadILOp . BadILOp }.
	lhbit initializeFrom: { 'lhbit' . Int64 . 0 .  SupportedForPRE . 0 .  Unspecified . BadILOp . BadILOp . BadILOp . BadILOp }.
	llbit initializeFrom: { 'llbit' . Int64 . 0 .  SupportedForPRE . 0 .  Unspecified . BadILOp . BadILOp . BadILOp . BadILOp }.
	lnolz initializeFrom: { 'lnolz' . Int32 . 0 .  SupportedForPRE . 0 .  Unspecified . BadILOp . BadILOp . BadILOp . BadILOp }.
	lnotz initializeFrom: { 'lnotz' . Int32 . 0 .  SupportedForPRE . 0 .  Unspecified . BadILOp . BadILOp . BadILOp . BadILOp }.
	lpopcnt initializeFrom: { 'lpopcnt' . Int32 . 0 .  SupportedForPRE . 0 .  Unspecified . BadILOp . BadILOp . BadILOp . BadILOp }.
	sbyteswap initializeFrom: { 'sbyteswap' . Int16 . 0 .  ValueNumberShare |  SupportedForPRE |  ByteSwap . 0 . { Int16 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	ibyteswap initializeFrom: { 'ibyteswap' . Int32 . 0 .  ValueNumberShare |  SupportedForPRE |  ByteSwap . 0 . { Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	lbyteswap initializeFrom: { 'lbyteswap' . Int64 . 0 .  ValueNumberShare |  SupportedForPRE |  ByteSwap . 0 . { Int64 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	bbitpermute initializeFrom: { 'bbitpermute' . Int8 . 0 .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int8 . Address . Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	sbitpermute initializeFrom: { 'sbitpermute' . Int16 . 0 .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int16 . Address . Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	ibitpermute initializeFrom: { 'ibitpermute' . Int32 . 0 .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int32 . Address . Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	lbitpermute initializeFrom: { 'lbitpermute' . Int64 . 0 .  ValueNumberShare |  SupportedForPRE .  LikeUse . { Int64 . Address . Int32 } . BadILOp . BadILOp . BadILOp . BadILOp }.
	prefetch initializeFrom: { 'prefetch' . NoType .  TreeTop |  HasSymbolRef . 0 . 0 .  Unspecified . BadILOp . BadILOp . BadILOp . BadILOp }.
]
