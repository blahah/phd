# Assemblotron chapter: figure/table list

This document is used for planning the structure of the chapter, based around major points to be made and the figures that will be used.

## Workflow overview

reads -> subsampling (2 possible paths) -> optimisation -> assemble with best parameters -> merge best -> final score

TODO: make the diagram

## How assembly quality varies with changing assemblies and parameters

Key questions:

- does assembly quality vary with assembler, parameters, species?
- is the best performing assembler the same for each dataset?
- for a given assembler, is the optimal set of parameters the same across species?
- how do the optimal parameters compare to the defaults for each assembler?

- Several species (TODO: choose the species)
- Several assemblers (TODO: choose the assemblers)
- Parameter sweep
- transrate score each assembly
- figure out how best to plot this (TODO)

TODO: code the sweep and transrate, commit code

## Resources required for assembly

- same dataset as above, but show the time (cpu hours) and memory used

TODO: ensure these metrics are captured for the sweep in previous seciton

## Subsampling strategies

### Explain strategies

TODO: diagram showing how each method works, highlighting the differences

### Evaluate and compare

Key questions:

- How representative is score distribution of subsetted reads vs full reads?
- Which is better, read sampling or partition sampling?
- What is the optimal sampling rate (i.e. that maximises speed whilst minimising the error rate)?

TODO: code a sweep for each sampling method, with sampling at various rates, commit code
TODO: design plot that shows how each method performs

## Optimisation strategies

### Explain strategies

TODO: diagram showing how each method works, highlighting the differences

### Evaluate and compare

Key questions:

- How reliably does each method reach the true optimum?
- How rapidly?
- Does performance of each method vary between assemblers, or read datasets?

TODO: run assemblotron with each method on a variety of datasets and assemblers

## Assemblotron performance

- Is assemblotron better than naive assembly?
- Does it find the true optimal parameters?
