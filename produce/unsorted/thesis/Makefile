thesis:
	latex thesis
	bibtex thesis
	latex thesis
	latex thesis
#	dvips -t a4 thesis.dvi -Ppdf -o thesis.ps

error:
	latex -interaction nonstopmode thesis
	bibtex thesis
	latex -interaction nonstopmode thesis
	latex -interaction nonstopmode thesis
#	dvips -t a4 thesis.dvi -Ppdf -o thesis.ps


norefs:
	latex thesis
	latex thesis

ps:
	dvips -t a4 thesis.dvi -Ppdf -o thesis.ps

pdf:
	dvips -t a4 thesis.dvi -Ppdf -o thesis.ps
	ps2pdf -sPAPERSIZE=a4 thesis.ps thesis.pdf

clean:
	rm -f *.aux
	rm -f */*.aux
	rm -f *.toc
	rm -f *.lof
	rm -f *.lot
	rm -f *.bbl
	rm -f *.log
	rm -f *.blg
	rm -f *~
	rm -f */*~

emacsclean:
	rm -f *~
	rm -f */*~

outputclean:
	rm -f thesis.dvi
	rm -f thesis.ps
	rm -f thesis.pdf

dist:   thesis.tar.gz

thesis.tar.gz:  thesis.tar
	gzip thesis.tar

thesis.tar:
	tar -cvf thesis.tar \
		../thesis/*.tex \
		../thesis/*/*.tex \
		../thesis/*/*.eps \
		../thesis/refs/thesis.bib \
		../thesis/refs/*.bst \
		../thesis/Makefile \
		../thesis/openfiles \
