all: html pdf

html:
	pandoc --output thesis.html \
		--include-in-header preamble.tex \
		--standalone \
		--section-divs \
		*/text.md

pdf:
	pandoc --output thesis.pdf \
		--include-in-header preamble.tex \
		*/text.md
