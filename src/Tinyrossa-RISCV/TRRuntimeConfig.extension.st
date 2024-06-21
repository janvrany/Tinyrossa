Extension { #name : #TRRuntimeConfig }

{ #category : #'*Tinyrossa-RISCV' }
TRRuntimeConfig class >> forRV64GLinux [
	^ self forTarget: TRRV64GLinux default
]
