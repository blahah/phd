all: pdf html

html:
	pandoc --output thesis.html \
		--include-before-body preamble.tex \
		--standalone \
		--section-divs \
		*/text.md

pdf:
	pandoc --output thesis.pdf \
		--include-in-header preamble.tex \
		*/text.md
