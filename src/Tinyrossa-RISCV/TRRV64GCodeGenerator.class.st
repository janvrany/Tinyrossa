Class {
	#name : #TRRV64GCodeGenerator,
	#superclass : #TRCodeGenerator,
	#instVars : [
		'generate'
	],
	#pools : [
		'TRRV64GRegisters'
	],
	#category : #'Tinyrossa-RISCV-Codegen'
}

{ #category : #registers }
TRRV64GCodeGenerator >> allocatableRegisters [
	"Return a collection of machine registers that can be
	 allocated"

	"FIXME: bogus!"
	^ { t0 . t1 . t2 . t3 . t4 . t5 . t6 . a0 . a1 . a2 }
]

{ #category : #accessing }
TRRV64GCodeGenerator >> codeBuffer [
	^ generate memory
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_a2b: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_a2i: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_a2l: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_a2s: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_acall: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_acalli: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_acmpeq: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_acmpge: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_acmpgt: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_acmple: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_acmplt: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_acmpne: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_aconst: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_aiadd: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_aladd: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_allocationfence: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_aload: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_aloadi: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_anewarray: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_ardbar: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_ardbari: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_aregload: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_aregstore: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_areturn: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_arraychk: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_arraycmp: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_arraycopy: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_arraycopybndchk: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_arraylength: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_arrayset: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_arraystorechk: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_arraytranslate: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_arraytranslateandtest: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_aselect: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_astore: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_astorei: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_asub: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_asynccheck: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_athrow: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_awrtbar: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_awrtbari: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_b2a: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_b2d: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_b2f: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_b2i: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_b2l: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_b2s: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_badd: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_band: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_bbend: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_bbitpermute: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_bbstart: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_bcmp: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_bcmpeq: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_bcmpge: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_bcmpgt: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_bcmple: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_bcmplt: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_bcmpne: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_bconst: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_bdiv: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_bitopmem: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_bload: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_bloadi: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_bmul: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_bndchk: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_bndchkwithspinechk: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_bneg: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_bor: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_branch: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_brdbar: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_brdbari: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_bregload: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_bregstore: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_brem: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_bselect: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_bshl: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_bshr: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_bstore: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_bstorei: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_bsub: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_bu2a: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_bu2d: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_bu2f: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_bu2i: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_bu2l: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_bu2s: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_bucmp: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_bucmpge: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_bucmpgt: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_bucmple: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_bucmplt: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_bushr: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_butest: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_bwrtbar: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_bwrtbari: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_bxor: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_bztestnset: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_call: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_calli: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_case: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_checkcast: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_checkcastandnullchk: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_compressedrefs: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_computecc: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_contigarraylength: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_d2b: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_d2bu: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_d2c: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_d2f: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_d2i: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_d2iu: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_d2l: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_d2lu: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_d2s: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_dabs: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_dadd: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_dbits2l: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_dcall: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_dcalli: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_dceil: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_dcmpeq: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_dcmpequ: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_dcmpg: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_dcmpge: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_dcmpgeu: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_dcmpgt: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_dcmpgtu: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_dcmpl: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_dcmple: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_dcmpleu: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_dcmplt: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_dcmpltu: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_dcmpne: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_dcmpneu: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_dconst: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_ddiv: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_dfloor: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_discontigarraylength: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_divchk: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_dload: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_dloadi: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_dmax: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_dmin: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_dmul: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_dneg: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_drdbar: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_drdbari: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_dregload: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_dregstore: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_drem: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_dreturn: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_dselect: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_dsqrt: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_dstore: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_dstorei: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_dsub: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_dwrtbar: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_dwrtbari: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_exceptionrangefence: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_f2b: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_f2bu: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_f2c: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_f2d: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_f2i: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_f2iu: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_f2l: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_f2lu: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_f2s: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_fabs: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_fadd: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_fbits2i: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_fcall: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_fcalli: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_fceil: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_fcmpeq: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_fcmpequ: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_fcmpg: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_fcmpge: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_fcmpgeu: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_fcmpgt: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_fcmpgtu: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_fcmpl: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_fcmple: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_fcmpleu: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_fcmplt: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_fcmpltu: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_fcmpne: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_fcmpneu: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_fconst: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_fdiv: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_fence: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_ffloor: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_fload: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_floadi: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_fmax: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_fmin: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_fmul: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_fneg: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_frdbar: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_frdbari: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_fregload: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_fregstore: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_frem: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_freturn: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_fselect: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_fsqrt: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_fstore: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_fstorei: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_fsub: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_fullfence: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_fwrtbar: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_fwrtbari: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_glregdeps: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_goto: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_i2a: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_i2b: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_i2d: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_i2f: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_i2l: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_i2s: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_iabs: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_iadd: node [
	| src1Reg src2Reg dstReg |

	src1Reg := self evaluate: node child1.
	src2Reg := self evaluate: node child2.
	dstReg := self allocateRegister.
	generate
		add: dstReg, src1Reg, src2Reg.

	^ dstReg
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_iand: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_ibatomicor: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_ibitpermute: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_ibits2f: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_ibyteswap: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_icall: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_icalli: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_icmp: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_icmpeq: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_icmpge: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_icmpgt: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_icmple: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_icmplt: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_icmpne: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_icmpset: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_iconst: node [
	| dstReg |

	dstReg := self allocateRegister.

	generate 
		addi: dstReg, zero, node constant.

	^ dstReg
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_idiv: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_ifacmpeq: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_ifacmpge: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_ifacmpgt: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_ifacmple: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_ifacmplt: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_ifacmpne: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_ifbcmpeq: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_ifbcmpge: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_ifbcmpgt: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_ifbcmple: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_ifbcmplt: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_ifbcmpne: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_ifbucmpge: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_ifbucmpgt: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_ifbucmple: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_ifbucmplt: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_ifdcmpeq: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_ifdcmpequ: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_ifdcmpge: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_ifdcmpgeu: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_ifdcmpgt: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_ifdcmpgtu: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_ifdcmple: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_ifdcmpleu: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_ifdcmplt: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_ifdcmpltu: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_ifdcmpne: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_ifdcmpneu: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_iffcmpeq: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_iffcmpequ: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_iffcmpge: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_iffcmpgeu: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_iffcmpgt: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_iffcmpgtu: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_iffcmple: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_iffcmpleu: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_iffcmplt: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_iffcmpltu: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_iffcmpne: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_iffcmpneu: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_ificmnno: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_ificmno: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_ificmpeq: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_ificmpge: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_ificmpgt: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_ificmple: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_ificmplt: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_ificmpne: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_ificmpno: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_ificmpo: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_ifiucmpge: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_ifiucmpgt: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_ifiucmple: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_ifiucmplt: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_iflcmnno: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_iflcmno: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_iflcmpeq: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_iflcmpge: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_iflcmpgt: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_iflcmple: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_iflcmplt: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_iflcmpne: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_iflcmpno: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_iflcmpo: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_iflucmpge: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_iflucmpgt: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_iflucmple: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_iflucmplt: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_ifscmpeq: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_ifscmpge: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_ifscmpgt: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_ifscmple: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_ifscmplt: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_ifscmpne: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_ifsucmpge: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_ifsucmpgt: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_ifsucmple: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_ifsucmplt: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_igoto: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_ihbit: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_iiatomicor: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_ilatomicor: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_ilbit: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_iload: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	| location |

	location := node symbol location.
	self assert: location notNil.

	location isTRVirtualRegister ifTrue: [ 
		^ location
	] ifFalse: [ 
		self notYetImplemented
	].
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_iloadi: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_imax: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_imin: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_imul: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_imulh: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_ineg: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_inolz: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_inotz: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_instanceof: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_ior: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_ipopcnt: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_irdbar: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_irdbari: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_iregload: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_iregstore: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_irem: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_ireturn: node [
	| retReg retInsn |

	retReg := self evaluate: node child1.
	retInsn := generate
		jalr: zero, ra, 0.

	retReg constrainTo: a0 atInstruction: retInsn.
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_irol: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_isatomicor: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_iselect: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_ishl: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_ishr: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_istore: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_istorei: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_isub: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_iu2a: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_iu2d: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_iu2f: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_iu2l: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_iuaddc: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_iucmp: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_iucmpge: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_iucmpgt: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_iucmple: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_iucmplt: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_iudiv: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_iumax: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_iumin: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_iumulh: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_iurem: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_iushr: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_iusubb: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_iwrtbar: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_iwrtbari: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_ixor: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_l2a: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_l2b: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_l2d: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_l2f: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_l2i: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_l2s: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_labs: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_ladd: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_land: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_lbitpermute: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_lbits2d: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_lbyteswap: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_lcall: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_lcalli: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_lcmp: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_lcmpeq: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_lcmpge: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_lcmpgt: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_lcmple: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_lcmplt: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_lcmpne: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_lcmpset: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_lconst: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_ldiv: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_lhbit: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_llbit: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_lload: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_lloadi: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_lmax: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_lmin: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_lmul: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_lmulh: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_lneg: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_lnolz: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_lnotz: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_loadaddr: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_loadfence: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_long2string: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_lookup: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_lor: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_lpopcnt: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_lrdbar: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_lrdbari: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_lregload: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_lregstore: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_lrem: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_lreturn: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_lrol: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_lselect: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_lshl: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_lshr: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_lstore: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_lstorei: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_lsub: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_lu2a: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_lu2d: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_lu2f: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_luaddc: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_luaddh: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_lucmp: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_lucmpge: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_lucmpgt: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_lucmple: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_lucmplt: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_ludiv: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_lumax: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_lumin: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_lumulh: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_lushr: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_lusubb: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_lusubh: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_lwrtbar: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_lwrtbari: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_lxor: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_methodenterhook: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_methodexithook: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_monent: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_monexit: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_monexitfence: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_multianewarray: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_new: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_newarray: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_newvalue: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_nullchk: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_overflowchk: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_passthrough: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_prefetch: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_resolveandnullchk: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_resolvechk: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_return: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_s2a: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_s2b: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_s2d: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_s2f: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_s2i: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_s2l: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_sadd: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_sand: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_sbitpermute: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_sbyteswap: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_scmp: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_scmpeq: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_scmpge: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_scmpgt: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_scmple: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_scmplt: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_scmpne: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_sconst: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_sdiv: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_sload: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_sloadi: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_smul: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_sneg: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_sor: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_spinechk: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_srdbar: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_srdbari: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_sregload: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_sregstore: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_srem: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_sselect: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_sshl: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_sshr: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_sstore: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_sstorei: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_ssub: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_storefence: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_su2a: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_su2d: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_su2f: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_su2i: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_su2l: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_sucmp: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_sucmpge: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_sucmpgt: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_sucmple: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_sucmplt: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_sushr: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_sutest: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_swrtbar: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_swrtbari: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_sxor: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_table: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_tabort: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_tfinish: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_treetop: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_tstart: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_unsignedoverflowchk: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_variablenew: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_variablenewarray: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #evaluation }
TRRV64GCodeGenerator >> evaluate_zerochk: node [
	"superclass TRILEvaluator says that I am responsible to implement this method"

	^ self shouldImplement
]

{ #category : #'code generation' }
TRRV64GCodeGenerator >> generateEpilogue: valReg [
	| retReg retInsn |

	retReg := self allocateRegister.

	retInsn := generate
		addi: retReg, valReg, 0; "Move value to ABI return register"
		jalr: zero, ra, 0.       "Return"

	retReg constrainTo: a0 atInstruction: retInsn.
]

{ #category : #'code generation' }
TRRV64GCodeGenerator >> generatePrologue [
	| parameters parameterRegs |

	parameters := compilation symbolManager lookupSymbolsByType: TRParameterSymbol.

	"FIXME: following is bogus, does not follow RISC-V ABI,
	 does not handle floating point, does not handle stack-passed
	 parameters. Bogus!"

	parameterRegs := { a0 . a1 . a2 . a3 . a4 . a5 . a6 . a7 }.
	parameters do: [:parameter | 
		| rReg vReg |

		rReg := parameterRegs at: parameter index.

		vReg := self allocateRegister.
		vReg constrainTo: rReg.

		parameter setLocation: vReg.
	].
]

{ #category : #initialization }
TRRV64GCodeGenerator >> initializeWithCompilation: aTRCompilation [
	super initializeWithCompilation: aTRCompilation.
	generate := AcDSLRV64GAssembler new.
]

{ #category : #accessing }
TRRV64GCodeGenerator >> instructions [
	^ generate memory instructions.
]
