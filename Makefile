PACKAGE = emplab

.PHONY: all sty doc
all: sty doc
sty: $(PACKAGE).sty
doc: $(PACKAGE).pdf

%.sty: %.dtx %.ins
	latex $*.ins

%.glo %.idx: %.dtx
	latex $<

%.gls: %.glo
	makeindex -s gglo.ist -o $@ $<

%.ind: %.idx
	makeindex -s gind.ist -o $@ $<

%.pdf: %.dtx %.gls %.ind
	latex $*.dtx
	dvipdf $*.dvi $@
