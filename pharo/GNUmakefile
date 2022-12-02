PROJECT=Tinyrossa

all: build

../makefiles/%.gmk:
	git submodule update --init --recursive $(dir $@)

-include GNUmakefile.local
include ../makefiles/pharo.gmk
include ../makefiles/git.gmk
include ../makefiles/mercurial.gmk

ifndef MACHINEARITHMETIC_DIR
MACHINEARITHMETIC_DIR    := ../3rdparty/MachineArithmetic
MACHINEARITHMETIC_URL    ?= https://github.com/shingarov/MachineArithmetic
MACHINEARITHMETIC_BRANCH ?= pure-z3
$(eval $(call git-clone-local,MACHINEARITHMETIC_DIR,$(MACHINEARITHMETIC_URL),$(MACHINEARITHMETIC_BRANCH)))
endif

ifndef ARCHC_DIR
ARCHC_DIR    := ../3rdparty/ArchC
ARCHC_URL    ?= https://github.com/shingarov/Pharo-ArchC
ARCHC_BRANCH ?= pure-z3
$(eval $(call git-clone-local,ARCHC_DIR,$(ARCHC_URL),$(ARCHC_BRANCH)))
endif

ifndef ARCHC_PDL_DIR
ARCHC_PDL_DIR    := ../3rdparty/ArchC/pdl
ARCHC_PDL_URL    ?= https://github.com/janvrany/Pharo-ArchC-PDL.git
ARCHC_PDL_BRANCH ?= master
$(eval $(call git-clone-local,ARCHC_PDL_DIR,$(ARCHC_PDL_URL),$(ARCHC_PDL_BRANCH)))
endif

ifndef SMALLRSP_DIR
SMALLRSP_DIR    := ../3rdparty/SmallRSP
SMALLRSP_URL    ?= https://github.com/shingarov/SmallRSP
SMALLRSP_BRANCH ?= master
$(eval $(call git-clone-local,SMALLRSP_DIR,$(SMALLRSP_URL),$(SMALLRSP_BRANCH)))
endif

ifndef PHARO_HACKS_DIR
PHARO_HACKS_DIR    := ../3rdparty/pharo-hacks
PHARO_HACKS_URL    ?= https://github.com/janvrany/pharo-hacks
PHARO_HACKS_BRANCH ?= master
$(eval $(call git-clone-local,PHARO_HACKS_DIR,$(PHARO_HACKS_URL),$(PHARO_HACKS_BRANCH)))
endif

ifndef PTERM_DIR
PTERM_DIR    := ../3rdparty/PTerm
PTERM_URL    ?= https://github.com/janvrany/PTerm
PTERM_BRANCH ?= master
$(eval $(call git-clone-local,PTERM_DIR,$(PTERM_URL),$(PTERM_BRANCH)))
endif

ifndef LIBGDBS_DIR
LIBGDBS_DIR    := ../3rdparty/jv/libgdbs
LIBGDBS_URL    ?= https://jan.vrany.io/hg/jv-libgdbs
LIBGDBS_BRANCH ?= default
$(eval $(call mercurial-clone-local,LIBGDBS_DIR,$(LIBGDBS_URL),$(LIBGDBS_BRANCH)))
endif

build: prereq $(PROJECT).image shells
	@echo ""
	@echo "To open Pharo $(PROJECT) image run:"
	@echo ""
	@echo "    make run"
	@echo ""

prereq::
	$(MAKE) -C $(LIBGDBS_DIR)/ports/pharo source

$(PROJECT).image: ../src/*/*.st
	$(call pharo-copy-image, $(PHARO_IMAGE), $@)
	$(call pharo-load-local, $@, MachineArithmetic,$(MACHINEARITHMETIC_DIR)/src)
	$(call pharo-load-local, $@, ArchC,            $(ARCHC_DIR)/src)
	$(call pharo-load-local, $@, SmallRSP,         $(SMALLRSP_DIR)/src)
	$(call pharo-load-local, $@, LibUnix,          $(PHARO_HACKS_DIR)/src)
	$(call pharo-load-local, $@, LibCompat,        $(PHARO_HACKS_DIR)/src)
	$(call pharo-load-local, $@, LibCompat,        $(PHARO_HACKS_DIR)/src)
	$(call pharo-load-local, $@, SUnitParametrized,$(PHARO_HACKS_DIR)/src)
	$(call pharo-load-local, $@, PTerm,            $(PTERM_DIR))
	$(call pharo-load-local, $@, LibGDBs,          $(LIBGDBS_DIR)/ports/pharo/src-generated)
	$(call pharo-load-local, $@, AsmJit,           ../src)
	$(call pharo-load-local, $@, Tinyrossa,        ../src)

run: build
	ARCHC_PDL_DIR=$(ARCHC_PDL_DIR)/ $(PHARO_VM) $(PROJECT).image

test: build
	ARCHC_PDL_DIR=$(ARCHC_PDL_DIR)/ $(PHARO_VM_HEADLESS) $(PROJECT).image test --fail-on-failure \
		$(PROJECT) \
		$(PROJECT)-Tests \
		$(PROJECT)-Tests-RISCV \
		$(PROJECT)-Tests-POWER

shells:
	make -C ../shell

clean::
	rm -f $(PROJECT).image $(PROJECT).changes

mrproper:: clean

.PHONY: all build run test shells clean mrproper
