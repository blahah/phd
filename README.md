## PhD thesis

This is my PhD thesis.

### Installing pre-requisites

You'll need:

- `pandoc`
- `pandoc-fignos`
- `pandoc-eqnos`
- a LaTeX distribution

e.g. on OSX:

First install MacTeX from: https://www.tug.org/mactex/

Then with homebrew:

```bash
brew install pandoc
pip install pandoc-fignos pandoc-eqnos
```

### Making the thesis

```bash
make html
# OR
make pdf
# OR
make # for both PDF and HTML
```
