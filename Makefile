STEM = repro_research
R_OPTS=--no-save --no-restore --no-init-file --no-site-file

$(STEM).pdf: $(STEM).tex header.tex Figs/data_dict.pdf Figs/spreadsheet_g_v_mg.pdf
	xelatex $<

notes: $(STEM)_withnotes.pdf
all: $(STEM).pdf notes docs

Figs/data_dict.pdf: R/spreadsheets.R
	cd $(<D);R $(R_OPTS) -e "source('$(<F)')"

Figs/spreadsheet_g_v_mg.pdf: R/spreadsheets_scripts.R
	cd $(<D);R $(R_OPTS) -e "source('$(<F)')"

$(STEM)_withnotes.pdf: $(STEM)_withnotes.tex header.tex Figs/data_dict.pdf Figs/spreadsheet_g_v_mg.pdf
	xelatex $(STEM)_withnotes
	pdfnup $(STEM)_withnotes.pdf --nup 1x2 --paper letterpaper --no-landscape --frame true --scale 0.9
	mv $(STEM)_withnotes-nup.pdf $(STEM)_withnotes.pdf

$(STEM)_withnotes.tex: $(STEM).tex Ruby/createVersionWithNotes.rb
	Ruby/createVersionWithNotes.rb $(STEM).tex $(STEM)_withnotes.tex

docs: $(STEM).pdf $(STEM)_withnotes.pdf
	cp $(STEM).pdf docs/$(STEM).pdf
	cp $(STEM)_withnotes.pdf docs/$(STEM)_withnotes.pdf
