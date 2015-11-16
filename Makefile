all: html pdf

# buld thesis as an HTML document
html:
	pandoc --output thesis.html \
	  --filter pandoc-fignos \
	  --template styles/template.html \
		--section-divs \
		--css styles/thesis.css \
		--toc \
		--smart \
		--parse-raw \
		--katex \
		--number-section \
		--filter pandoc-citeproc \
		*/text.md

# build thesis as a PDF
pdf:
	pandoc --output thesis.pdf \
		--template styles/template.tex \
		*/text.md

# (re)make figure images from their input data
figureimg:
	mermaid --outputDir figures figures/*.mermaid
	-mmv "figures/*.mermaid.png" "figures/#1.png"
