all: 
	make pdf MD=README.md

html: $(MD)
	pandoc $(MD) -o markdown.html

pdf: $(MD)
	pandoc  $(MD) --latex-engine=xelatex -o markdown.pdf
