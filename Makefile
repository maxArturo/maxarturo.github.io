OUTPUT_DIR := docs
SRC_DIR := site

SOURCES := $(wildcard $(shell find $(SRC_DIR) -name "*.md"))
STYLES :=  $(wildcard css/*.css)
TARGETS := $(patsubst $(SRC_DIR)%, $(OUTPUT_DIR)%, $(SOURCES:.md=.html))

.PHONY: all
all: clean $(TARGETS)

# Debugging target
debug:
	$(info SOURCES: $(SOURCES))
	$(info TARGETS: $(TARGETS))

## Generalized rule: how to build a .html file from each .md
$(OUTPUT_DIR)/%.html: $(SRC_DIR)/%.md
	mkdir -p $(@D) 
	pandoc \
		--katex \
		--section-divs \
		--from markdown+tex_math_single_backslash \
		--filter pandoc-sidenote \
		--highlight-style breezedark \
		--to html5+smart \
		--template=tufte \
		$(foreach style,$(STYLES),--css $(style)) \
		-s \
		--embed-resource \
		--output $@ \
		$<

.PHONY: clean
clean:
	rm -f $(TARGETS)
