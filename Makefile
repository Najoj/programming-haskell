all: 
	make pdf MD=README.md

html: $(MD)
	pandoc $(MD) -o markdown.html

pdf: $(MD)
	pandoc  --pdf-engine=xelatex $(MD) -o markdown.pdf
