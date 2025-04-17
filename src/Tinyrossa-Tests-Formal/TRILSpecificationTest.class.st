Class {
	#name : #TRILSpecificationTest,
	#superclass : #SpriteLangTest,
	#category : #'Tinyrossa-Tests-Formal'
}

{ #category : #doodles }
TRILSpecificationTest >> test_doodle_01 [
	self proveSafe:  '
type trvalue =
  | Int32 (i:int)
  | Void (i:int)
  ;

type trnode =
  | N_iconst (v:trvalue)
  ;

/*@ val trvalue2int : trvalue => int */
let     trvalue2int = (v) => {
	switch (v) {
		| Int32(i) => i
	}
};

/*@ val commonConst : trnode => trvalue */
let rec commonConst = (n) => {
	switch (n) {
		| N_iconst(v) => let r = trvalue2int(v);
								   Int32(r)
	}
};

/*@ val eval_iconst : trnode => trvalue */
let rec eval_iconst = (n) => {
	commonConst(n)
};


'.

"

"
]
