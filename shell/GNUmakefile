ifndef ARCH

all:
	$(MAKE) ARCH=riscv64
	$(MAKE) ARCH=x86_64
	$(MAKE) ARCH=powerpc64le

else

# Cross-compiler toolchain prefix
CROSS?=$(ARCH)-linux-gnu-

all: shell-$(ARCH)

shell-$(ARCH): shell.c shell.link
	$(CROSS)gcc -ggdb2 -O2 -static -T shell.link -o $@ $<

endif

clean:
	rm -f shell-*




