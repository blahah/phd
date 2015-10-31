all: html pdf

# buld thesis as an HTML document
html:
	pandoc --output thesis.html \
		--include-in-header preamble.tex \
		--standalone \
		--section-divs \
		*/text.md

# build thesis as a PDF
pdf:
	pandoc --output thesis.pdf \
		--include-in-header preamble.tex \
		*/text.md

# (re)make figure images from their input data
figureimg:
	mermaid --outputDir figures figures/*.mermaid
	mmv "figures/*.mermaid.png" "figures/#1.png"
