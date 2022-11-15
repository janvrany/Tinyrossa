Class {
	#name : #TRRV64GLinux,
	#superclass : #TRCompilationTarget,
	#category : #'Tinyrossa-RISCV-Compile'
}

{ #category : #accessing }
TRRV64GLinux >> codeGeneratorClass [
	^ TRRV64GCodeGenerator
]

{ #category : #accessing }
TRRV64GLinux >> name [
	^ 'riscv64-linux'
]

{ #category : #accessing }
TRRV64GLinux >> systemLinkageClass [
	^ TRRV64GPSABILinkage
]
