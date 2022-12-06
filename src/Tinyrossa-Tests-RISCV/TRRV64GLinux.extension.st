Extension { #name : #TRRV64GLinux }

{ #category : '*Tinyrossa-Tests-RISCV' }
TRRV64GLinux >> gem5 [
	"Return name of gem5 architecture, i.e.,  RISCV for RISC-V, POWER for PowerPC and so on."

	^ 'RISCV'
]

{ #category : #'*Tinyrossa-Tests-RISCV' }
TRRV64GLinux >> qemu [
	^ 'qemu-riscv64-static'
]
