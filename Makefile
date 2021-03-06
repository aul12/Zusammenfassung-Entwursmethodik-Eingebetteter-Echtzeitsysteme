RUBBER=rubber
VIEWER=xdg-open
DOT=dot
INKSCAPE=inkscape

all: main.pdf

main.pdf: *.tex sections/*.tex appendix/mindmap.pdf
	$(RUBBER) -d main.tex

%.pdf: %.dot
	$(DOT) -T pdf -o $@ $<

show: all
	screen -dm $(VIEWER) main.pdf

clean:
	rm -f *.toc
	rm -f *.aux
	rm -f *.log
	rm -f *.out
	rm -f *.pdf
