Class {
	#name : #TRAMD64Linux,
	#superclass : #TRCompilationTarget,
	#category : #'Tinyrossa-AMD64-Compile'
}

{ #category : #accessing }
TRAMD64Linux >> codeGeneratorClass [
	^ TRAMD64CodeGenerator
]

{ #category : #accessing }
TRAMD64Linux >> name [
	^ 'x86_64-linux'
]

{ #category : #accessing }
TRAMD64Linux >> systemLinkageClass [
	^ TRAMD64SysVLinkage
]
