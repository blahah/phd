all: pdf html

html:
	pandoc --output thesis.html \
		--include-before-body preamble.tex \
		--standalone \
		--section-divs \
		*/text.md

pdf:
	pandoc --output thesis.pdf \
		--include-before-body preamble.tex \
		*/text.md
