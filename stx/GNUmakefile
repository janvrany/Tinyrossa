PROJECT=Tinyrossa

include GNUmakefile.local

ifndef MACHINEARITHMETIC_DIR
MACHINEARITHMETIC_DIR  = ../3rdparty/MachineArithmetic
MACHINEARITHMETIC_URL ?= https://github.com/shingarov/MachineArithmetic

$(MACHINEARITHMETIC_DIR):
	mkdir -p $(shell dirname $@)
	git clone $(MACHINEARITHMETIC_URL) $@
endif

ifndef ARCHC_DIR
ARCHC_DIR  = ../3rdparty/ArchC
ARCHC_URL ?= https://github.com/janvrany/Pharo-ArchC

$(ARCHC_DIR):
	mkdir -p $(shell dirname $@)
	git clone -b jv/devel $(ARCHC_URL) $@
endif

ifndef ARCHC_PDL_DIR
ARCHC_PDL_DIR=$(ARCHC_DIR)/pdl

$(ARCHC_PDL_DIR): $(ARCHC_DIR)
	(cd $(ARCHC_DIR) && ./get-pdls.sh)
endif

all: build

include ../stx.gmk

build: $(STX) $(MACHINEARITHMETIC_DIR) $(ARCHC_DIR) $(ARCHC_PDL_DIR)
	@echo "To run Smalltalk/X with $(PROJECT) loaded, run:"
	@echo ""
	@echo "    make run"
	@echo ""


run: $(STX) $(MACHINEARITHMETIC_DIR) $(ARCHC_DIR) $(ARCHC_PDL_DIR)
	ARCHC_PDL_DIR=$(ARCHC_PDL_DIR)/ $(STX) \
		--quick \
		--package-path $(MACHINEARITHMETIC_DIR) \
		--package-path $(ARCHC_DIR) \
		--package-path .. \
		--load BaselineOf$(PROJECT) \
		# --execute 'Tools::NewSystemBrowser openInClass: TRCompilationExampled selector: #example01_meaningOfLife'

test: $(STX) $(MACHINEARITHMETIC_DIR) $(ARCHC_DIR) $(ARCHC_PDL_DIR)
	ARCHC_PDL_DIR=$(ARCHC_PDL_DIR)/ $(STX) \
		--package-path $(MACHINEARITHMETIC_DIR) \
		--package-path $(ARCHC_DIR) \
		--package-path .. \
		--load BaselineOf$(PROJECT) \
		--run Builder::ReportRunner -r Builder::TestReport --fail-on-failure \
			-p $(PROJECT)-Tests

clean:
	rm -rf *Test.xml package-cache

mrproper:: clean

GNUmakefile.local::
	@echo "# Local tunables. There's no need to change anything," >> $@
	@echo "# suitable defaults are provided." >> $@
	@echo "" >> $@
	@echo "# To load MachineArithmetic from local directory, set MACHINEARITHMETIC_DIR" >> $@
	@echo "# variable to directory where MachineArithmetic is cloned. If unset (default)" >> $@
	@echo "# it will be fetched from upstream repository." >> $@
	@echo "# MACHINEARITHMETIC_DIR=../../MachineArithmetic" >> $@
	@echo "" >> $@
	@echo "# To load ArchC from local directory, set ARCHC_DIR" >> $@
	@echo "# variable to directory where ArchC is cloned. If unset (default)" >> $@
	@echo "# it will be fetched from upstream repository." >> $@
	@echo "# ARCHC_DIR=../../ArchC" >> $@
	@echo "" >> $@
	@echo "# To specify custom directory with PDLs, set ARCHC_PDL_DIR" >> $@
	@echo "# variable to directory with PDLs. If unset (default)" >> $@
	@echo "# it will be fetched by 'get-pdls.sh' script." >> $@
	@echo "# ARCHC_PDL_DIR=$$\(ARCHC_DIR\)/pdl" >> $@
	@echo "" >> $@

