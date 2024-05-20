Extension { #name : #TRPPCRegister }

{ #category : #'*Tinyrossa-Tests-POWER' }
TRPPCRegister >> nameInGDB [
	kind == GPR ifTrue: [
		"See https://sourceware.org/git/?p=binutils-gdb.git;a=blob_plain;f=gdb/features/rs6000/power-core.xml;hb=HEAD"
		^ 'r' , value name
	].
	kind == FPR ifTrue: [
		"See https://sourceware.org/git/?p=binutils-gdb.git;a=blob_plain;f=gdb/features/rs6000/power-fpu.xml;hb=HEAD"
		^ 'f' , value name
	].
	kind == CCR ifTrue: [
		"See https://sourceware.org/git/?p=binutils-gdb.git;a=blob_plain;f=gdb/features/rs6000/power-core.xml;hb=HEAD
		 and https://github.com/janvrany/Pharo-ArchC-PDL/blob/master/powerpc/powerpc_isa.ac"
		^ value name
	].
	^ super nameInGDB
]
