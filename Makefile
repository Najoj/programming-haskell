all: 
	make pdf MD=README.md

pdf: $(MD)
	pandoc $(MD) -o markdown.pdf
