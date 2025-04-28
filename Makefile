# Define the main LaTeX file and output directory
MAIN_FILE = resume.tex
MAIN_FILE_NO_EXT = $(basename $(MAIN_FILE))
MAIN_DEPENDENCIES = $(wildcard *.bib)
PDF_TARGET = $(MAIN_FILE:.tex=.pdf)

# LaTeX compilation options
LATEXMK = latexmk
LATEXMK_XELATEX= -xelatex
LATEXMK_FLAGS = -synctex=1  -latexoption="-interaction=nonstopmode"

# Makefile rules
.PHONY: all deepclean

all: $(PDF_TARGET)

$(PDF_TARGET): $(MAIN_FILE) $(MAIN_DEPENDENCIES)
	$(LATEXMK) $(LATEXMK_XELATEX) $(LATEXMK_FLAGS) $<

deepclean:
	$(LATEXMK) -C
