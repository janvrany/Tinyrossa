Extension { #name : #TBvSize }

{ #category : #'*Tinyrossa-Formal' }
TBvSize class >> length: length [
	"Return an instance of TBvSize for given known bit-length."
	
	^TBvSize basicNew
		ftycon: (FTyconBitVecSize length: length);
		ts: #();
		ars: #();
		r: Reft new known;
		yourself 
]
