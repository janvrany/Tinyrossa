Extension { #name : #TRAMD64Linux }

{ #category : #'*Tinyrossa-Tests-AMD64' }
TRAMD64Linux >> qemu [
	"Return name of QEMU suitable for running programs for this target."

	^ 'qemu-x86_64-static'
]
