# Wybierz dokument do testów:
BOOK1=wzmgr
BOOK2=mgr-main

MKIDX=plmindex
LATEX=pdflatex
PDFLATEX=pdflatex
#DVIPS=dvips -j0

.PHONY: ps pdf eps2pdf 

test1: pdf1
test2: pdf2

pdf1:
	$(PDFLATEX) $(BOOK1) && $(MKIDX) $(BOOK1) && $(PDFLATEX) $(BOOK1)

pdf2:
	$(PDFLATEX) $(BOOK2) && $(MKIDX) $(BOOK2) && bibtex $(BOOK2) && $(PDFLATEX) $(BOOK2)

eps2pdf: 
	epstopdf fo-structure.eps
	epstopdf schemat.eps
	
clean: 
	rm -rf *.{dvi,ps,log,aux,out,lot,lof,ilg,toc,blg,brf} *~

xclean: clean
	rm -rf *.{ind,idx} 