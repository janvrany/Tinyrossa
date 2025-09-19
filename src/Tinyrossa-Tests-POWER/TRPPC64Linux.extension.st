Extension { #name : #TRPPC64Linux }

{ #category : #'*Tinyrossa-Tests-POWER' }
TRPPC64Linux >> gem5 [
	^ 'POWER'
]

{ #category : #'*Tinyrossa-Tests-POWER' }
TRPPC64Linux >> qemu [
	"Sigh, on newer Debian 14 there's no 'qemu-riscv64-static',
	 just (static) 'qemu-riscv64'. To make this work, try to
	 autodetect (and fall back to 'qemu-ppc64le-static')."
	#('qemu-ppc64le-static' 'qemu-ppc64le') do: [:name |
		| qemu |

		qemu := '/usr/bin' asFileReference / name.
		qemu exists ifTrue: [
			^ qemu pathString
		].
	].
	^ 'qemu-ppc64le-static'

	"
	TRPPC64Linux default qemu
	"
]
