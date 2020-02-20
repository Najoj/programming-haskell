all: pdf

pdf: README.md
	pandoc README.md -o ~/tmp.pdf
