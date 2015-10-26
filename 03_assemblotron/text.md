# In pursuit of the optimal transcriptome assembly

## Background

## Assembly quality varies with algorithm and parameterisation

## Assembly is computationally expensive, making exhaustive optimisation impossible

## Read sampling strategies

## Optimisation strategies

## Assemblotron

### Algorithm and workflow

![The assemblotron workflow: (a) Paired-end RNA-seq reads are input. (b) Reads are digitally normalised to a median coverage of 20. (c) Normalised reads are sampled in triplicate using one of several sampling algorithms. (d) Each sample is assembled initally using a range of parameter values for each assembler. The assemblies are scored with \transrate (e) One of several optimisation strategies is used to explore the parameter space for each assembler and identify high-scoring areas. (f) The high-scoring parameters are used to generate assemblies from the full normalised read set. (g) All assemblies from the full reads are merged to preserve the unique information in each.](figures/workflow.png)

### Performance
