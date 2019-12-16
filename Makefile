all: bitcoin-snark.pdf

#.ONESHELL:
bitcoin-snark.pdf: src/*
	export TEXINPUTS=.:./src//:; \
	pdflatex -halt-on-error bitcoin-snark.tex; \
	rm -rf bitcoin-snark.aux bitcoin-snark.log bitcoin-snark.out bitcoin-snark.toc bitcoin-snark.lof bitcoin-snark.lot bitcoin-snark.bbl bitcoin-snark.blg

bib: src/*
	export TEXINPUTS=.:./src//:; \
	pdflatex -halt-on-error bitcoin-snark.tex; \
	bibtex bitcoin-snark.aux; \
	pdflatex -halt-on-error bitcoin-snark.tex; \
	pdflatex -halt-on-error bitcoin-snark.tex; \
	rm -rf bitcoin-snark.aux bitcoin-snark.log bitcoin-snark.out bitcoin-snark.toc bitcoin-snark.lof bitcoin-snark.lot bitcoin-snark.bbl bitcoin-snark.blg

clean:
	rm -rf *.aux *.log *.out *.toc *.lof *.lot *.bbl *.blg *.pdf
