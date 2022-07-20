Class {
	#name : #TRILWalker,
	#superclass : #TRILEvaluator,
	#category : #'Tinyrossa-IL'
}

{ #category : #evaluation }
TRILWalker >> evaluateChildren: node [
	node children do: [:child | 
		self evaluate: child
	].
]

{ #category : #evaluation }
TRILWalker >> evaluate_a2b: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_a2i: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_a2l: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_a2s: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_acall: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_acalli: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_acmpeq: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_acmpge: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_acmpgt: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_acmple: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_acmplt: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_acmpne: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_aconst: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_aiadd: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_aladd: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_allocationfence: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_aload: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_aloadi: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_anewarray: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_ardbar: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_ardbari: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_aregload: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_aregstore: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_areturn: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_arraychk: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_arraycmp: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_arraycopy: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_arraycopybndchk: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_arraylength: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_arrayset: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_arraystorechk: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_arraytranslate: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_arraytranslateandtest: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_aselect: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_astore: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_astorei: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_asub: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_asynccheck: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_athrow: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_awrtbar: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_awrtbari: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_b2a: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_b2d: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_b2f: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_b2i: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_b2l: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_b2s: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_badd: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_band: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_bbend: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_bbitpermute: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_bbstart: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_bcmp: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_bcmpeq: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_bcmpge: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_bcmpgt: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_bcmple: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_bcmplt: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_bcmpne: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_bconst: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_bdiv: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_bitopmem: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_bload: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_bloadi: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_bmul: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_bndchk: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_bndchkwithspinechk: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_bneg: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_bor: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_branch: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_brdbar: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_brdbari: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_bregload: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_bregstore: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_brem: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_bselect: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_bshl: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_bshr: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_bstore: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_bstorei: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_bsub: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_bu2a: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_bu2d: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_bu2f: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_bu2i: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_bu2l: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_bu2s: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_bucmp: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_bucmpge: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_bucmpgt: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_bucmple: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_bucmplt: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_bushr: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_butest: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_bwrtbar: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_bwrtbari: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_bxor: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_bztestnset: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_call: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_calli: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_case: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_checkcast: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_checkcastandnullchk: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_compressedrefs: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_computecc: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_contigarraylength: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_d2b: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_d2bu: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_d2c: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_d2f: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_d2i: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_d2iu: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_d2l: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_d2lu: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_d2s: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_dabs: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_dadd: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_dbits2l: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_dcall: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_dcalli: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_dceil: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_dcmpeq: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_dcmpequ: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_dcmpg: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_dcmpge: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_dcmpgeu: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_dcmpgt: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_dcmpgtu: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_dcmpl: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_dcmple: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_dcmpleu: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_dcmplt: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_dcmpltu: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_dcmpne: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_dcmpneu: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_dconst: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_ddiv: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_dfloor: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_discontigarraylength: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_divchk: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_dload: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_dloadi: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_dmax: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_dmin: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_dmul: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_dneg: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_drdbar: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_drdbari: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_dregload: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_dregstore: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_drem: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_dreturn: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_dselect: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_dsqrt: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_dstore: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_dstorei: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_dsub: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_dwrtbar: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_dwrtbari: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_exceptionrangefence: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_f2b: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_f2bu: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_f2c: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_f2d: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_f2i: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_f2iu: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_f2l: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_f2lu: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_f2s: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_fabs: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_fadd: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_fbits2i: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_fcall: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_fcalli: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_fceil: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_fcmpeq: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_fcmpequ: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_fcmpg: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_fcmpge: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_fcmpgeu: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_fcmpgt: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_fcmpgtu: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_fcmpl: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_fcmple: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_fcmpleu: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_fcmplt: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_fcmpltu: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_fcmpne: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_fcmpneu: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_fconst: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_fdiv: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_fence: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_ffloor: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_fload: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_floadi: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_fmax: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_fmin: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_fmul: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_fneg: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_frdbar: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_frdbari: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_fregload: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_fregstore: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_frem: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_freturn: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_fselect: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_fsqrt: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_fstore: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_fstorei: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_fsub: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_fullfence: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_fwrtbar: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_fwrtbari: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_glregdeps: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_goto: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_i2a: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_i2b: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_i2d: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_i2f: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_i2l: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_i2s: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_iabs: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_iadd: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_iand: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_ibatomicor: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_ibitpermute: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_ibits2f: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_ibyteswap: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_icall: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_icalli: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_icmp: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_icmpeq: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_icmpge: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_icmpgt: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_icmple: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_icmplt: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_icmpne: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_icmpset: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_iconst: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_idiv: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_ifacmpeq: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_ifacmpge: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_ifacmpgt: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_ifacmple: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_ifacmplt: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_ifacmpne: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_ifbcmpeq: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_ifbcmpge: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_ifbcmpgt: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_ifbcmple: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_ifbcmplt: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_ifbcmpne: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_ifbucmpge: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_ifbucmpgt: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_ifbucmple: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_ifbucmplt: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_ifdcmpeq: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_ifdcmpequ: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_ifdcmpge: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_ifdcmpgeu: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_ifdcmpgt: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_ifdcmpgtu: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_ifdcmple: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_ifdcmpleu: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_ifdcmplt: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_ifdcmpltu: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_ifdcmpne: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_ifdcmpneu: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_iffcmpeq: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_iffcmpequ: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_iffcmpge: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_iffcmpgeu: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_iffcmpgt: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_iffcmpgtu: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_iffcmple: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_iffcmpleu: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_iffcmplt: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_iffcmpltu: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_iffcmpne: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_iffcmpneu: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_ificmnno: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_ificmno: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_ificmpeq: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_ificmpge: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_ificmpgt: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_ificmple: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_ificmplt: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_ificmpne: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_ificmpno: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_ificmpo: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_ifiucmpge: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_ifiucmpgt: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_ifiucmple: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_ifiucmplt: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_iflcmnno: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_iflcmno: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_iflcmpeq: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_iflcmpge: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_iflcmpgt: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_iflcmple: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_iflcmplt: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_iflcmpne: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_iflcmpno: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_iflcmpo: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_iflucmpge: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_iflucmpgt: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_iflucmple: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_iflucmplt: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_ifscmpeq: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_ifscmpge: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_ifscmpgt: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_ifscmple: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_ifscmplt: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_ifscmpne: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_ifsucmpge: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_ifsucmpgt: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_ifsucmple: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_ifsucmplt: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_igoto: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_ihbit: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_iiatomicor: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_ilatomicor: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_ilbit: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_iload: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_iloadi: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_imax: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_imin: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_imul: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_imulh: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_ineg: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_inolz: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_inotz: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_instanceof: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_ior: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_ipopcnt: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_irdbar: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_irdbari: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_iregload: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_iregstore: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_irem: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_ireturn: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_irol: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_isatomicor: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_iselect: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_ishl: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_ishr: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_istore: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_istorei: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_isub: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_iu2a: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_iu2d: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_iu2f: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_iu2l: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_iuaddc: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_iucmp: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_iucmpge: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_iucmpgt: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_iucmple: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_iucmplt: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_iudiv: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_iumax: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_iumin: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_iumulh: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_iurem: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_iushr: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_iusubb: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_iwrtbar: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_iwrtbari: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_ixor: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_l2a: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_l2b: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_l2d: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_l2f: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_l2i: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_l2s: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_labs: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_ladd: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_land: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_lbitpermute: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_lbits2d: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_lbyteswap: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_lcall: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_lcalli: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_lcmp: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_lcmpeq: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_lcmpge: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_lcmpgt: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_lcmple: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_lcmplt: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_lcmpne: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_lcmpset: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_lconst: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_ldiv: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_lhbit: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_llbit: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_lload: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_lloadi: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_lmax: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_lmin: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_lmul: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_lmulh: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_lneg: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_lnolz: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_lnotz: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_loadaddr: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_loadfence: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_long2string: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_lookup: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_lor: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_lpopcnt: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_lrdbar: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_lrdbari: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_lregload: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_lregstore: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_lrem: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_lreturn: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_lrol: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_lselect: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_lshl: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_lshr: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_lstore: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_lstorei: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_lsub: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_lu2a: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_lu2d: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_lu2f: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_luaddc: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_luaddh: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_lucmp: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_lucmpge: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_lucmpgt: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_lucmple: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_lucmplt: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_ludiv: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_lumax: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_lumin: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_lumulh: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_lushr: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_lusubb: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_lusubh: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_lwrtbar: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_lwrtbari: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_lxor: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_methodenterhook: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_methodexithook: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_monent: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_monexit: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_monexitfence: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_multianewarray: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_new: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_newarray: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_newvalue: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_nullchk: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_overflowchk: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_passthrough: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_prefetch: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_resolveandnullchk: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_resolvechk: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_return: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_s2a: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_s2b: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_s2d: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_s2f: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_s2i: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_s2l: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_sadd: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_sand: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_sbitpermute: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_sbyteswap: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_scmp: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_scmpeq: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_scmpge: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_scmpgt: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_scmple: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_scmplt: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_scmpne: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_sconst: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_sdiv: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_sload: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_sloadi: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_smul: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_sneg: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_sor: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_spinechk: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_srdbar: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_srdbari: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_sregload: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_sregstore: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_srem: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_sselect: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_sshl: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_sshr: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_sstore: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_sstorei: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_ssub: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_storefence: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_su2a: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_su2d: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_su2f: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_su2i: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_su2l: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_sucmp: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_sucmpge: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_sucmpgt: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_sucmple: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_sucmplt: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_sushr: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_sutest: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_swrtbar: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_swrtbari: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_sxor: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_table: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_tabort: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_tfinish: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_treetop: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_tstart: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_unsignedoverflowchk: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_variablenew: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_variablenewarray: node [
	self evaluateChildren: node.
	^ node
]

{ #category : #evaluation }
TRILWalker >> evaluate_zerochk: node [
	self evaluateChildren: node.
	^ node
]
