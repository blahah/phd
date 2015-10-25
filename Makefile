all: pdf html

html:
	pandoc --output thesis.html \
		--standalone \
		--section-divs */text.md

pdf:
	pandoc --output thesis.pdf */text.md
