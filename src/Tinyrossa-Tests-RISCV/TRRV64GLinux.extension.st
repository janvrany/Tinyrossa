Extension { #name : #TRRV64GLinux }

{ #category : #'*Tinyrossa-Tests-RISCV' }
TRRV64GLinux >> gem5 [
	^ 'RISCV'
]

{ #category : #'*Tinyrossa-Tests-RISCV' }
TRRV64GLinux >> qemu [
	"Sigh, on newer Debian 14 there's no 'qemu-riscv64-static',
	 just (static) 'qemu-riscv64'. To make this work, try to
	 autodetect (and fall back to 'qemu-riscv64-static')."
	#('qemu-riscv64-static' 'qemu-riscv64') do: [:name |
		| qemu |

		qemu := '/usr/bin' asFileReference / name.
		qemu exists ifTrue: [
			^ qemu pathString
		].
	].
	^ 'qemu-riscv64-static'

	"
	TRRV64GLinux default qemu
	"
]
