$(MAKEMAGIC_DIR)makemagic/installers.proc: $(MAKEMAGIC_DIR)makemagic/installers.raw
	@cat $< \
	| python -c 'EXISTS_FN = "CMD_EXISTS"; import re; import sys; filecont = sys.stdin.read(); filecont = re.sub("^command: (.*) name: (.*)", "ifeq ($$(call %s,\\1),1)\\n\\2 = \\2.$(OS)\\nendif" % EXISTS_FN, filecont, flags=re.MULTILINE); filecont = re.sub("^command: (.*)", "ifeq ($$(call %s,\\1),1)\\n\\1 = \\1.$(OS)\\nendif" % EXISTS_FN, filecont, flags=re.MULTILINE); print(filecont)' \
	| python -c 'EXISTS_FN = "PYMODULE_EXISTS"; import re; import sys; filecont = sys.stdin.read(); filecont = re.sub("^pymodule: (.*) name: (.*)", "ifeq ($$(call %s,\\1),1)\\n\\2 = \\2.$(OS)\\nendif" % EXISTS_FN, filecont, flags=re.MULTILINE); filecont = re.sub("^pymodule: (.*)", "ifeq ($$(call %s,\\1),1)\\n\\1 = \\1.$(OS)\\nendif" % EXISTS_FN, filecont, flags=re.MULTILINE); print(filecont)' \
	| python -c 'EXISTS_FN = "LIBRARY_EXISTS"; import re; import sys; filecont = sys.stdin.read(); filecont = re.sub("^lib: (.*) name: (.*)", "ifeq ($$(call %s,\\1),1)\\n\\2 = \\2.$(OS)\\nendif" % EXISTS_FN, filecont, flags=re.MULTILINE); filecont = re.sub("^lib: (.*)", "ifeq ($$(call %s\\1),1)\\n\\1 = \\1.$(OS)\\nendif" % EXISTS_FN, filecont, flags=re.MULTILINE); print(filecont)' \
	> $@

include $(MAKEMAGIC_DIR)makemagic/installers.proc