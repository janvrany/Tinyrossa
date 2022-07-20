OMR_DIR ?= ../../../J9/omr

all: opcodes.st

opcodes.m4: preprocess.sh $(OMR_DIR)
	bash preprocess.sh $(OMR_DIR) > $@

opcodes.st: opcodes.m4 opcodesgen.m4
	m4 opcodesgen.m4 > $@