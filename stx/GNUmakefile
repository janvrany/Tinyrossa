PROJECT=Tinyrossa

all: build

../makefiles/%.gmk:
	git submodule update --init --recursive $(dir $@)

-include GNUmakefile.local
include ../makefiles/stx.gmk
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

ifndef LIBGDBS_DIR
LIBGDBS_DIR    := ../3rdparty/jv/libgdbs
LIBGDBS_URL    ?= https://swing.fit.cvut.cz/hg/jv-libgdbs
LIBGDBS_BRANCH ?= default
$(eval $(call mercurial-clone-local,LIBGDBS_DIR,$(LIBGDBS_URL),$(LIBGDBS_BRANCH)))
endif


build: prereq shells
	@echo "To run Smalltalk/X with $(PROJECT) loaded, run:"
	@echo ""
	@echo "    make run"
	@echo ""


run: build
	ARCHC_PDL_DIR=$(ARCHC_PDL_DIR)/ $(STX) \
		--quick \
		--package-path $(MACHINEARITHMETIC_DIR) \
		--package-path $(ARCHC_DIR) \
		--package-path $(LIBGDBS_DIR)/../.. \
		--package-path ../src \
		--load BaselineOf$(PROJECT) \
		#--execute 'Tools::NewSystemBrowser openInClass: TRCompilationExamples selector: #example01_meaningOfLife'

test: build
	ARCHC_PDL_DIR=$(ARCHC_PDL_DIR)/ $(STX) \
		--package-path $(MACHINEARITHMETIC_DIR) \
		--package-path $(ARCHC_DIR) \
		--package-path $(LIBGDBS_DIR)/../.. \
		--package-path ../src \
		--load BaselineOf$(PROJECT) \
		--run Builder::ReportRunner -r Builder::TestReport --fail-on-failure \
			-p $(PROJECT) \
			-p $(PROJECT)-Tests \
			-p $(PROJECT)-Tests-RISCV \
			-p $(PROJECT)-Tests-POWER

shells:
	make -C ../shell

clean::

mrproper:: clean

.PHONY: all build run test shells clean mrproper
