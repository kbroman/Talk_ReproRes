STEM = repro_research

$(STEM).pdf: $(STEM).tex header.tex
	xelatex $<

notes: $(STEM)_withnotes.pdf
all: $(STEM).pdf notes web

$(STEM)_withnotes.pdf: $(STEM)_withnotes.tex header.tex
	xelatex $(STEM)_withnotes
	pdfnup $(STEM)_withnotes.pdf --nup 1x2 --no-landscape --paper letterpaper --frame true --scale 0.9
	mv $(STEM)_withnotes-nup.pdf $(STEM)_withnotes.pdf

$(STEM)_withnotes.tex: $(STEM).tex Ruby/createVersionWithNotes.rb
	Ruby/createVersionWithNotes.rb $(STEM).tex $(STEM)_withnotes.tex

web: $(STEM).pdf $(STEM)_withnotes.pdf
	scp $(STEM).pdf broman-10.biostat.wisc.edu:Website/presentations/$(STEM)_ComBEE2016.pdf
	scp $(STEM)_withnotes.pdf broman-10.biostat.wisc.edu:Website/presentations/$(STEM)_ComBEE2016_withnotes.pdf
