# Command for latexmk
LTX = latexmk -pdf -quiet -file-line-error -interaction=nonstopmode -halt-on-error -output-directory=build

# Change only the variable below to the name of the main tex file.
PROJNAME = main
OUTNAME = ITH-Skript-SoSe-2022

# Tell make targets aren't files
.PHONY: all build clean

# The first rule in a Makefile is the one executed by default ("make"). It
# should always be the "all" rule, so that "make" and "make all" are identical.
all: build clean 

build: clean
	@echo "build script..."
	@mkdir -p build
	@mkdir -p build/vorlesungen
	@$(LTX) $(PROJNAME).tex
	@cp build/$(PROJNAME).pdf $(OUTNAME).pdf

# In case you didn't know, '$@' is a variable holding the name of the target,
# and '$<' is a variable holding the (first) dependency of a rule.

clean:
	@echo "cleaning up.."
	@rm -rf build