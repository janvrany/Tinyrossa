#include <stdio.h>
#include <stdlib.h>
#include <errno.h>

#define STRINGIFY(x) #x
#define TOSTRING(x) STRINGIFY(x)

#define NZONE_SIZE 512

#if defined(__x86_64)
#  define ASM_RETURN "mov %rdi, %rax\nret"
#elif defined(__riscv)
#  define ASM_RETURN "ret"
#elif defined(__powerpc64__)
#  define ASM_RETURN "blr"
#else
#  error "Not (yet) supported architecture"
#endif

__asm__(
	"                                  \n"
	".section .nzone,\"awx\", @progbits\n"
	"nzone:                            \n"
	ASM_RETURN "                       \n"
	".space " TOSTRING(NZONE_SIZE) "   \n"
	"                                  \n"
	".section .text                    \n"
);

extern unsigned char nzone[NZONE_SIZE];

typedef int (*entry_func)(int a);
static entry_func entry = (entry_func)(&nzone);

static int __attribute__ ((noinline)) trampoline(int a) {
	return entry(a);
}

int main(int argc, char** argv) {
	int x = 0;
	switch (argc) {
		case 1:
			x = 42;
			break;
		case 2:
			x = strtol(argv[1], NULL, 10);
			if (errno) return 127;
			break;
		default:
			 return 127;
			 break;
	}
	return trampoline(x);
}
