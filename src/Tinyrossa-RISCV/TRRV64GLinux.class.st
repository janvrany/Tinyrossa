Class {
	#name : #TRRV64GLinux,
	#superclass : #TRTarget,
	#category : #'Tinyrossa-RISCV-Target'
}

{ #category : #'accessing - config - compilation' }
TRRV64GLinux >> codeGeneratorClass [
	^ TRRV64GCodeGenerator
]

{ #category : #accessing }
TRRV64GLinux >> name [
	^ 'riscv64-linux'
]

{ #category : #'accessing - config - compilation' }
TRRV64GLinux >> systemLinkageClass [
	^ TRRV64GPSABILinkage
]
