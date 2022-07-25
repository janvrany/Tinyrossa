#!/bin/bash

set -e

OMR_DIR=$1

if [ -z "$OMR_DIR" ]; then
    echo "usage: $0 /path/to/omr/source"
    exit 1
fi
if [ ! -d "$OMR_DIR" ]; then
    echo "ERROR: no such directory: $OMR_DIR"
    exit 2
fi
if [ ! -f "$OMR_DIR/compiler/il/OMROpcodes.enum" ]; then
    echo "ERROR: OMROpcodes.enum found in $OMR_DIR"
    exit 3
fi

sed -e 's#\(   /\* \.description          = \)   #\1*/ "#g' \
    -e 's#= \*/ \\$#= \*/ "undocumented" \\#g' \
    -e 's# \*/ \\$#" \\#g' \
    -e 's#),$#) ,#g' \
    -e 's#NoChildren,#NoChildren ,#g' \
    -e 's#TR::\([A-Za-z]\)#\1#g' \
    -e 's#\([A-Za-z0-9]\)::\([A-Za-z]\)#\1 \2#g' \
    -e 's#branch targets"#branch targets)"#g' \
    -e 's#case nodes"#case nodes)"#g' \
	"${OMR_DIR}/compiler/il/OMROpcodes.enum" \
	| cpp | sed -e 's/^#.*$//g'
