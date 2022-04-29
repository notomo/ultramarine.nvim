PLUGIN_NAME:=$(basename $(notdir $(abspath .)))
SPEC_DIR:=./spec/lua/${PLUGIN_NAME}

test:
	vusted --shuffle ${SPEC_DIR}
.PHONY: test
