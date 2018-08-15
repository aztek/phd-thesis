.PHONY: all thesis insert clean

all: thesis insert

thesis: main.tex
	latexmk -pdf -use-make main.tex

main.tex: graphics/ChalmersU_black.pdf graphics/AVANCEZ_black.pdf

graphics/%.pdf: graphics/%.eps
	epstopdf --compress --embed --autorotate=None --outfile=$@ $<

insert: insert.tex
	latexmk -pdf -use-make insert.tex

insert.tex: graphics/ChalmersU_black.pdf graphics/AVANCEZ_black.pdf

clean:
	latexmk -CA
	rm -f *.brf *.bbl
	rm graphics/*.pdf
