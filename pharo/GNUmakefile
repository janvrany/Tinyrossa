PROJECT=Tinyrossa

all: build

../makefiles/%.gmk:
	git submodule update --init --recursive $(dir $@)

-include GNUmakefile.local
include ../makefiles/pharo.gmk
include ../makefiles/git.gmk

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

build: prereq $(PROJECT).image shells
	@echo ""
	@echo "To open Pharo $(PROJECT) image run:"
	@echo ""
	@echo "    make run"
	@echo ""

$(PROJECT).image: ../src/*/*.st
	$(call pharo-copy-image, $(PHARO_IMAGE), $@)
	$(call pharo-load-local, $@, MachineArithmetic,$(MACHINEARITHMETIC_DIR))
	$(call pharo-load-local, $@, ArchC,            $(ARCHC_DIR)/src)
	$(call pharo-load-local, $@, Tinyrossa,        ../src)

run: build
	ARCHC_PDL_DIR=$(ARCHC_PDL_DIR)/ $(PHARO_VM) $(PROJECT).image

test: build
	ARCHC_PDL_DIR=$(ARCHC_PDL_DIR)/ $(PHARO_VM_HEADLESS) $(PROJECT).image test --fail-on-failure \
		"$(PROJECT)"

shells:
	make -C ../shell

clean::
	rm -f $(PROJECT).image $(PROJECT).changes

mrproper:: clean

.PHONY: all build run test shells clean mrproper
