PROJECT=Tinyrossa

all: build

include GNUmakefile.local
include ../3rdparty.gmk
include ../stx.gmk

build: $(STX) $(MACHINEARITHMETIC_DIR) $(ARCHC_DIR) $(ARCHC_PDL_DIR) $(LIBGDBS_DIR) shells
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
			-p $(PROJECT)-Tests-RISCV

shells:
	make -C ../shell

clean::
	rm -rf *Test.xml package-cache

mrproper:: clean

.PHONY: all build run test shells clean mrproper
