PROJECT=Tinyrossa

all: build

include GNUmakefile.local

# Pharo version to use. Currently, only 8.0 is supported,
# Pharo 9.0 and later is known to crash when using Z3.
PHARO_VERSION ?= 80

include ../3rdparty.gmk
include ../pharo.gmk

build: $(PROJECT).image
	@echo ""
	@echo "To open Pharo $(PROJECT) image run:"
	@echo ""
	@echo "    make run"
	@echo ""

$(PROJECT).image: $(PHARO_VM) $(PHARO_IMAGE) ../src/*/*.st $(MACHINEARITHMETIC_DIR) $(ARCHC_DIR) $(ARCHC_PDL_DIR)
	$(PHARO_VM_HEADLESS) $(PHARO_IMAGE) save $(shell pwd)/$(PROJECT)
	# Load MachineArithmetic
	$(PHARO_VM_HEADLESS) $@ eval --save "(IceRepositoryCreator new location: '$(MACHINEARITHMETIC_DIR)/' asFileReference; createRepository) register" || rm $@
	$(PHARO_VM_HEADLESS) $@ metacello install tonel://$(MACHINEARITHMETIC_DIR)/ BaselineOfMachineArithmetic || rm $@
	# Load ArchC
	$(PHARO_VM_HEADLESS) $@ eval --save "(IceRepositoryCreator new location: '$(ARCHC_DIR)/' asFileReference; createRepository) register" || rm $@
	$(PHARO_VM_HEADLESS) $@ eval --save "Metacello new baseline: 'ArchC'; repository: 'tonel://$(ARCHC_DIR)/src'; onConflictUseLoaded; load." || rm $@
	# Load Tinyrossa
	$(PHARO_VM_HEADLESS) $@ eval --save "(IceRepositoryCreator new location: '..' asFileReference; createRepository) register" || rm $@
	$(PHARO_VM_HEADLESS) $@ eval --save "Metacello new baseline: '$(PROJECT)'; repository: 'tonel://../src'; onConflictUseLoaded; load." || rm $@

run: build
	ARCHC_PDL_DIR=$(ARCHC_PDL_DIR)/ $(PHARO_VM) $(PROJECT).image

test: build
	ARCHC_PDL_DIR=$(ARCHC_PDL_DIR)/ $(PHARO_VM_HEADLESS) $(PROJECT).image test --fail-on-failure \
		"$(PROJECT)"

clean::
	rm -f $(PROJECT).image $(PROJECT).changes *Test.xml *.fuel
	rm -fr pharo-local

mrproper:: clean

.PHONY: all build run test clean mrproper
