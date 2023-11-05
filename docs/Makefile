BASE_DIR=..
DOC_ROOT=.

DIST_DIR=$(BASE_DIR)/dist
SRC_IMAGES_DIR=$(IMAGES_DIR)
DST_IMAGES_DIR=$(DIST_DIR)/$(IMAGES_DIR)

include $(DOC_ROOT)/asciidoc.mk

HTML_LIST=\
mkdir_and_copy \
$(DIST_DIR)/net-dns-nsd.html \
$(DIST_DIR)/net-pki-cfssl.html \
$(DIST_DIR)/net-pki-easy-rsa.html \
$(DIST_DIR)/option-parsing-in-bash.html \
$(DIST_DIR)/terminal_emulators.html \
$(DIST_DIR)/ubuntu.html \
$(DIST_DIR)/index.html

.PHONY: adoc mkdir_and_copy

adoc: $(HTML_LIST)

mkdir_and_copy:
	mkdir -p $(DIST_DIR)
	-test ! -d $(SRC_IMAGES_DIR) || mkdir -p $(DST_IMAGES_DIR)
	-test ! -d $(SRC_IMAGES_DIR) || cp $(CP_OPTS) $(SRC_IMAGES_DIR)/* $(DST_IMAGES_DIR)/

$(DIST_DIR)/%.html: %.adoc header.adoc
	asciidoctor --trace $(AD_OPTS_HTML5_ROUGE) -o "$@" "$<"
