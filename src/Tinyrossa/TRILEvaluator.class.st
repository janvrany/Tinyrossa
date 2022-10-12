Class {
	#name : #TRILEvaluator,
	#superclass : #Object,
	#classVars : [
		'EvaluatorTable'
	],
	#pools : [
		'TRILOpcodes'
	],
	#category : #'Tinyrossa-IL'
}

{ #category : #initialization }
TRILEvaluator class >> initialize [

	"Sigh, we have to make sure TRILOpcodes are initialized
	 here because Pharo makes no guarantees this is called
	 after `TRILOpcodes class >> #initialize`.
	 This is recurring problem yet nobody seem to be bother 
	 to solve it :-("
	TRILOpcodes initialize.
	EvaluatorTable := IdentityDictionary new: 550.
	TRILOpcodes bindingsDo: [:binding | 
		EvaluatorTable at: binding value put: ('evaluate_', binding value name, ':') asSymbol.
	].
]

{ #category : #evaluation }
TRILEvaluator >> evaluate: node [
	| evaluator |

	evaluator := EvaluatorTable at: node opcode.
	^ self perform: evaluator with: node.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_a2b: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_a2i: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_a2l: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_a2s: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_acall: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_acalli: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_acmpeq: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_acmpge: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_acmpgt: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_acmple: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_acmplt: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_acmpne: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_aconst: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_aiadd: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_aladd: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_allocationfence: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_aload: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_aloadi: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_anewarray: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_ardbar: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_ardbari: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_aregload: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_aregstore: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_areturn: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_arraychk: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_arraycmp: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_arraycopy: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_arraycopybndchk: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_arraylength: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_arrayset: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_arraystorechk: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_arraytranslate: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_arraytranslateandtest: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_aselect: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_astore: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_astorei: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_asub: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_asynccheck: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_athrow: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_awrtbar: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_awrtbari: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_b2a: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_b2d: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_b2f: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_b2i: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_b2l: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_b2s: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_badd: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_band: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_bbend: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_bbitpermute: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_bbstart: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_bcmp: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_bcmpeq: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_bcmpge: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_bcmpgt: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_bcmple: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_bcmplt: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_bcmpne: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_bconst: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_bdiv: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_bitopmem: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_bload: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_bloadi: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_bmul: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_bndchk: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_bndchkwithspinechk: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_bneg: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_bor: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_branch: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_brdbar: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_brdbari: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_bregload: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_bregstore: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_brem: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_bselect: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_bshl: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_bshr: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_bstore: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_bstorei: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_bsub: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_bu2a: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_bu2d: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_bu2f: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_bu2i: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_bu2l: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_bu2s: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_bucmp: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_bucmpge: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_bucmpgt: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_bucmple: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_bucmplt: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_bushr: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_butest: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_bwrtbar: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_bwrtbari: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_bxor: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_bztestnset: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_call: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_calli: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_case: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_checkcast: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_checkcastandnullchk: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_compressedrefs: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_computecc: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_contigarraylength: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_d2b: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_d2bu: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_d2c: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_d2f: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_d2i: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_d2iu: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_d2l: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_d2lu: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_d2s: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_dabs: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_dadd: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_dbits2l: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_dcall: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_dcalli: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_dceil: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_dcmpeq: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_dcmpequ: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_dcmpg: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_dcmpge: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_dcmpgeu: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_dcmpgt: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_dcmpgtu: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_dcmpl: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_dcmple: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_dcmpleu: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_dcmplt: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_dcmpltu: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_dcmpne: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_dcmpneu: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_dconst: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_ddiv: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_dfloor: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_discontigarraylength: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_divchk: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_dload: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_dloadi: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_dmax: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_dmin: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_dmul: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_dneg: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_drdbar: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_drdbari: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_dregload: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_dregstore: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_drem: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_dreturn: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_dselect: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_dsqrt: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_dstore: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_dstorei: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_dsub: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_dwrtbar: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_dwrtbari: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_exceptionrangefence: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_f2b: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_f2bu: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_f2c: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_f2d: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_f2i: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_f2iu: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_f2l: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_f2lu: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_f2s: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_fabs: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_fadd: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_fbits2i: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_fcall: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_fcalli: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_fceil: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_fcmpeq: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_fcmpequ: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_fcmpg: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_fcmpge: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_fcmpgeu: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_fcmpgt: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_fcmpgtu: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_fcmpl: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_fcmple: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_fcmpleu: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_fcmplt: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_fcmpltu: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_fcmpne: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_fcmpneu: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_fconst: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_fdiv: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_fence: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_ffloor: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_fload: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_floadi: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_fmax: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_fmin: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_fmul: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_fneg: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_frdbar: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_frdbari: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_fregload: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_fregstore: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_frem: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_freturn: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_fselect: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_fsqrt: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_fstore: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_fstorei: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_fsub: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_fullfence: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_fwrtbar: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_fwrtbari: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_glregdeps: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_goto: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_i2a: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_i2b: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_i2d: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_i2f: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_i2l: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_i2s: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_iabs: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_iadd: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_iand: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_ibatomicor: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_ibitpermute: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_ibits2f: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_ibyteswap: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_icall: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_icalli: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_icmp: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_icmpeq: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_icmpge: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_icmpgt: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_icmple: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_icmplt: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_icmpne: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_icmpset: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_iconst: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_idiv: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_ifacmpeq: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_ifacmpge: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_ifacmpgt: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_ifacmple: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_ifacmplt: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_ifacmpne: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_ifbcmpeq: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_ifbcmpge: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_ifbcmpgt: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_ifbcmple: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_ifbcmplt: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_ifbcmpne: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_ifbucmpge: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_ifbucmpgt: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_ifbucmple: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_ifbucmplt: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_ifdcmpeq: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_ifdcmpequ: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_ifdcmpge: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_ifdcmpgeu: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_ifdcmpgt: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_ifdcmpgtu: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_ifdcmple: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_ifdcmpleu: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_ifdcmplt: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_ifdcmpltu: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_ifdcmpne: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_ifdcmpneu: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_iffcmpeq: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_iffcmpequ: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_iffcmpge: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_iffcmpgeu: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_iffcmpgt: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_iffcmpgtu: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_iffcmple: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_iffcmpleu: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_iffcmplt: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_iffcmpltu: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_iffcmpne: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_iffcmpneu: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_ificmnno: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_ificmno: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_ificmpeq: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_ificmpge: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_ificmpgt: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_ificmple: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_ificmplt: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_ificmpne: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_ificmpno: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_ificmpo: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_ifiucmpge: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_ifiucmpgt: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_ifiucmple: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_ifiucmplt: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_iflcmnno: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_iflcmno: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_iflcmpeq: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_iflcmpge: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_iflcmpgt: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_iflcmple: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_iflcmplt: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_iflcmpne: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_iflcmpno: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_iflcmpo: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_iflucmpge: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_iflucmpgt: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_iflucmple: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_iflucmplt: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_ifscmpeq: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_ifscmpge: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_ifscmpgt: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_ifscmple: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_ifscmplt: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_ifscmpne: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_ifsucmpge: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_ifsucmpgt: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_ifsucmple: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_ifsucmplt: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_igoto: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_ihbit: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_iiatomicor: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_ilatomicor: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_ilbit: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_iload: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_iloadi: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_imax: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_imin: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_imul: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_imulh: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_ineg: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_inolz: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_inotz: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_instanceof: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_ior: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_ipopcnt: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_irdbar: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_irdbari: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_iregload: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_iregstore: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_irem: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_ireturn: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_irol: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_isatomicor: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_iselect: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_ishl: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_ishr: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_istore: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_istorei: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_isub: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_iu2a: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_iu2d: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_iu2f: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_iu2l: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_iuaddc: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_iucmp: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_iucmpge: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_iucmpgt: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_iucmple: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_iucmplt: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_iudiv: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_iumax: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_iumin: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_iumulh: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_iurem: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_iushr: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_iusubb: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_iwrtbar: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_iwrtbari: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_ixor: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_l2a: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_l2b: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_l2d: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_l2f: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_l2i: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_l2s: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_labs: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_ladd: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_land: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_lbitpermute: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_lbits2d: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_lbyteswap: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_lcall: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_lcalli: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_lcmp: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_lcmpeq: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_lcmpge: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_lcmpgt: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_lcmple: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_lcmplt: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_lcmpne: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_lcmpset: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_lconst: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_ldiv: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_lhbit: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_llbit: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_lload: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_lloadi: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_lmax: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_lmin: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_lmul: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_lmulh: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_lneg: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_lnolz: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_lnotz: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_loadaddr: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_loadfence: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_long2string: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_lookup: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_lor: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_lpopcnt: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_lrdbar: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_lrdbari: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_lregload: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_lregstore: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_lrem: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_lreturn: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_lrol: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_lselect: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_lshl: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_lshr: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_lstore: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_lstorei: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_lsub: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_lu2a: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_lu2d: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_lu2f: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_luaddc: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_luaddh: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_lucmp: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_lucmpge: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_lucmpgt: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_lucmple: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_lucmplt: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_ludiv: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_lumax: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_lumin: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_lumulh: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_lushr: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_lusubb: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_lusubh: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_lwrtbar: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_lwrtbari: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_lxor: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_methodenterhook: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_methodexithook: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_monent: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_monexit: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_monexitfence: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_multianewarray: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_new: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_newarray: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_newvalue: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_nullchk: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_overflowchk: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_passthrough: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_prefetch: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_resolveandnullchk: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_resolvechk: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_return: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_s2a: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_s2b: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_s2d: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_s2f: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_s2i: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_s2l: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_sadd: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_sand: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_sbitpermute: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_sbyteswap: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_scmp: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_scmpeq: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_scmpge: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_scmpgt: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_scmple: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_scmplt: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_scmpne: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_sconst: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_sdiv: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_sload: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_sloadi: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_smul: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_sneg: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_sor: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_spinechk: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_srdbar: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_srdbari: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_sregload: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_sregstore: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_srem: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_sselect: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_sshl: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_sshr: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_sstore: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_sstorei: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_ssub: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_storefence: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_su2a: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_su2d: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_su2f: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_su2i: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_su2l: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_sucmp: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_sucmpge: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_sucmpgt: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_sucmple: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_sucmplt: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_sushr: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_sutest: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_swrtbar: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_swrtbari: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_sxor: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_table: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_tabort: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_tfinish: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_treetop: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_tstart: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_unsignedoverflowchk: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_variablenew: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_variablenewarray: node [
	self subclassResponsibility.
]

{ #category : #evaluation }
TRILEvaluator >> evaluate_zerochk: node [
	self subclassResponsibility.
]
