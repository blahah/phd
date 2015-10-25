# Assemblotron chapter: plan and figure/table list

This document is used for planning the structure of the chapter, based around major points to be made and the figures that will be used.

In summary, I will show that:

- Different assemblers, and different parameter combinations for a given assembler, produce vastly different assemblies. Not only that, but those assemblies vary in which transcripts they contain, and how well they are reconstructed. It would therefore be ideal to take the best from many assemblies.
- One approach to this would be to assemble with all, or many, different parameters for each assembler, then merge the results. However, assembly takes too long and requires too many computational resources to be able to do this.
- The next logical approach is to take only a few parameter combinations, and merge assemblies from those. The problem then becomes how to decide which parameters to choose. The obvious way to do this would be to have a small set of parameter combinations that work well for all species. However, I will show that the properties of different species' transcriptomes lead to the ideal parameters differing between species.
- Another solution is to take a small sample of the input data, so that assembly is fast, and to try many parameters to see which ones perform well. The ones that perform well could be used to assemble the full data. How should the sampling work in this approach? I will show that sampling works, that very small samples can produce representative results, and that optimisations can be made to the sampling to improve their representativeness at small sizes.
- With the ability to take small samples, the ideal approach would be to assemble with all possible combinations and choose the best to merge. However, I will show that because of the vast parameter spaces this is not practical. Instead, I will demonstrate that lessons from discrete optimisation can be applied to tailor an algorithm that can rapidly select the best settings while only exploring a vary small subset of the possible parameters.
- Finally, I will show that the assemblotron strategy is able to produce assemblies that are superior to those achieved naively or using alternative strategies.


## Workflow overview

reads -> subsampling (2 possible paths) -> optimisation -> assemble with best parameters -> merge best -> final score

TODO: make the diagram

## How assembly quality varies with changing assemblies and parameters

Key questions:

- does assembly quality vary with assembler, parameters, species?
- is the best performing assembler the same for each dataset?
- for a given assembler, is the optimal set of parameters the same across species?
- how do the optimal parameters compare to the defaults for each assembler?

Plan:

- Choose several species
- Find good datasets to use for those species - want high quality recent paired-end reads, full metadata, but a small dataset so it can be analysed fast
- Choose several assemblers
- Parameter sweep
- transrate score each assembly
- figure out how best to plot this

NOTES:

- currently the analysis is being run in `/home/rds45/code/assemblotron/dryrun`, in branch `dryrun` on the plantsci cluster. this should be changed to assemblotron-paper with the assemblotron code submoduled in


DONE:
- chose datasets for yeast and arabidopsis
- chose soap-denovotrans and IDBA assemblers, coded them into assemblotron
- coded full sweep with transrate score into assemblotron
- ran sweep for yeast and arabidopsis with soap (actually the data are incomplete - rerun)
- setup CLI for the paper
- move all ad-hoc code into the paper CLI
  - done for data downloading and unpacking
  - need to add in running assemblotron for samples (part done)

TODO:
- rerun the sweep
  - set running for ath @2015-10-09T13:37:34+01:00
    - some failed:
      - sweep 1pc_1, 1pc_2, 5pc_1, 5pc_2, 5pc_3 (now rerunning) @2015-10-10T13:31:45+01:00
      - check that all the data are present for both sweep and graph
      - no just missing graph samples 20% rep 1 and 2 - set running @2015-10-11T18:22:28+01:00
  - next run for yeast (currently running on all data! 2015-10-23T03:46:30+01:00)
  - then copy all data back to my machine
- make a draft figure with a plot of the existing results
- choose two more species (a mammal and an insect maybe?)
- find good datasets for those extra species
- create the full figure

## Resources required for assembly

Key questions:

- is it practical to run a full sweep for every dataset?
- what time, cpu and memory resources are needed for assembly?
- how does this scale with

Plan:

- same dataset as above, but show the time (cpu hours) and memory used
- also find some bigger datasets and run a handful of parameter combinations
- do subsets in a range of sizes from a larger dataset and show growth of resource use with increasing dataset size

TODO:
  - ensure these metrics are captured for the sweep in previous seciton
  - re-run the sweep (~48h)
  - find a good large dataset
  - do the sample range

## Subsampling strategies



The obvious way is to take random samples from the reads, but because RNAseq will sample highly-expressed transcripts much more often, this will create a subsample that focuses on these transcripts. It will also lead to low coverage on most transcripts, so the assembly will always be fragmented and probably not representative. Ideally the subsample will sample random transcripts, taking all the reads from the sampled transripts. This section should evaluate whether these concerns are valid for the naive sampling, and if so explain alternative strategies.

### Explain strategies

TODO: diagram showing how each method works, highlighting the differences

### Evaluate and compare

Key questions:

- How representative is score distribution of subsetted reads vs full reads?
- Which is better, read sampling or partition sampling?
- What is the optimal sampling rate (i.e. that maximises speed whilst minimising the error rate)?

DONE:
  - code a sweep for each sampling method, with sampling at various rates, commit code
  - run the sweep on yeast data

TODO:
  - design plot that shows how each method performs
  - run the sweep on arabidopsis data

## Optimisation strategies

### Explain strategies

TODO: diagram showing how each method works, highlighting the differences

### Evaluate and compare

Key questions:

- How reliably does each method reach the true optimum?
- How rapidly?
- Does performance of each method vary between assemblers, or read datasets?

TODO:
  - run assemblotron with each method on a variety of datasets and assemblers
  - make a figure

## Assemblotron performance

- Is an assembly after assemblotron better than naive assembly (i.e. with default parameters)?
- Does it find the true optimal parameters?
