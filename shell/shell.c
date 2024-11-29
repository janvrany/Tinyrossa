#include <stdint.h>

#define STRINGIFY(x) #x
#define TOSTRING(x) STRINGIFY(x)

#define NZONE_SIZE 1024
#define HEAP_SIZE  4096

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
	".section .entry,\"aw\"			   \n"
	"entry:                            \n"
	".8byte nzone                      \n"
	"                                  \n"
	".section .heap1,\"aw\"			   \n"
	"heap1:                            \n"
	".space " TOSTRING(HEAP_SIZE) "    \n"
	"                                  \n"
	".section .heap2,\"aw\"			   \n"
	"heap2:                            \n"
	".space " TOSTRING(HEAP_SIZE) "    \n"
	"                                  \n"
	".section .nzone1,\"awx\", @progbits\n"
	"nzone:                            \n"
	"nzone1:                           \n"
	ASM_RETURN "                       \n"
	".space " TOSTRING(NZONE_SIZE) "   \n"
	"                                  \n"
	"                                  \n"
	".section .nzone2,\"awx\", @progbits\n"
	"nzone2:                           \n"
	ASM_RETURN "                       \n"
	".space " TOSTRING(NZONE_SIZE) "   \n"
	".section .text                    \n"
);

extern int (*entry)(intptr_t a, intptr_t b);
extern unsigned char nzone1[NZONE_SIZE];
extern unsigned char nzone2[NZONE_SIZE];
extern unsigned char heap1[NZONE_SIZE];
extern unsigned char heap2[NZONE_SIZE];

int main(int argc, char** argv) {
	return entry((intptr_t)argc, (intptr_t)argv);
}
