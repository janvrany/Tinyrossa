#include <stdio.h>
#include <stdlib.h>

#define STRINGIFY(x) #x
#define TOSTRING(x) STRINGIFY(x)

#define NZONE_SIZE 512

__asm__(
	"                                  \n"
	".section .nzone,\"awx\", @progbits\n"
	"nzone:                            \n"
	".space " TOSTRING(NZONE_SIZE) "   \n"
	"                                  \n"
	".section .text                    \n"
);

extern unsigned char nzone[NZONE_SIZE];

typedef int (*entry_func)();
static entry_func entry = (entry_func)(&nzone);

int main() {
	return entry();
}
