## In pursuit of the optimal transcriptome assembly

The goal of transcriptome assembly is to reproduce the sequences of all transcripts present in a sequenced sample. Although considerable progress towards this goal has been made, current methods fall far short of perfection. A typical transcriptome assembly program has many tunable parameters that control aspects of the algorithm. However, a single set of parameters is usually chosen to produce the assembly that is used for downstream analysis. Often the choice is made implicitly, by using the default settings of the software, rather than by systematically selecting the best values. Simply by ignoring the range of behaviours offered by the assembly tool, current practices exclude possible well-assembled transcript sequences from the results. More rarely, multiple assemblies are produced and merged together. It is notable that none of the de-novo transcriptome assembly merging pipelines to date account for the unique features of transcriptome data, so the merging process is error-prone.

In this chapter I will explore how a transcriptome assembly might be optimised and improved algorithmically. This will build on the work in the previous chapter that established a method for reference-free quality assessment of contigs and whole *de-novo* transcriptome assemblies. The implicit assumptions of current standard practice will be explored and tested. Motivated by these results, I will explain new methods for the automated optimisation of transcriptome assembly and their implementation in the `Assemblotron` software.

### Background

...

### Assembly quality varies with algorithm and parameterisation

<!-- Code and data for the plot below are in the assemblotron-paper repo at /figures/yeast_fulldata_soap_sweep_Kde.R and data/yeast/yeast_stream_100pc_*.csv -->

![Assembly quality (as measured by Transrate score) for 180 assemblies performed with SOAPdenovoTrans, varying parameters K (TODO: what is it, what values?), d (TODO: what is it, what values?), and e (TODO: what is it, what values?).](figures/yeast_fulldata_soap_sweep_Kde.png) {#fig:sweep}

### Assembly is computationally expensive, making exhaustive optimisation impossible

<!-- Data from table 4 in khmer diginorm paper http://arxiv.org/pdf/1203.4802v2.pdf -->

Table: Time taken to assemble *de-novo* transcriptomes of Yeast and Mouse from 100 million paired-end RNA-seq reads, using either Oases or Trinity (TODO: cite diginorm paper).

| Assembly        | N reads | Time (min) |
|:----------------|:--------|:-----------|
| Yeast (Oases)   | 100m    | 181        |
| Yeast (Trinity) | 100m    | 887        |
| Mouse (Oases)   | 100m    | 761        |
| Mouse (Trinity) | 100m    | 2297       |

### Read sampling gives a speedup while preserving quality distribution

![Two strategies for sampling RNA-Seq read pairs. (A) Reservoir sampling produces a uniform random sample of the input read pairs in a single pass through the input files. This method samples reads uniformly. (B) Partition sampling builds a de-Brujn graph from the reads and samples connected partitions of the graph before outputting the reads from the sampled partitions. This method samples transcripts/genes uniformly.](figures/reservoir_vs_partition.png)

### Finding the optimal parameters without exhaustive searching

<!-- Code and data for the plot below are in the assemblotron-paper repo at /figures/yeast_fulldata_optimisation_sim.R and data/yeast/yeast_stream_100pc_*.csv -->

![Performance of the Tabu Search optimisation algorithm in a simulation. Data from the full parameter sweep of soap-denovotrans on yeast data were used to simulate the optimisation process. 100 runs of the optimisation were carried out. (A) The best transrate score achieved to date. (B) The transrate score of each run. Points represent the mean across all runs and threads, with line ranges +/- standard error.](figures/tabu_optimisation_sim.png)

### Assemblotron

#### Algorithm and workflow

![The assemblotron workflow: (a) Paired-end \rnaseq reads are input. (b) Reads are digitally normalised to a median coverage of 20. (c) Normalised reads are sampled in triplicate using one of several sampling algorithms. (d) Each sample is assembled initally using a range of parameter values for each assembler. The assemblies are scored with \transrate (e) One of several optimisation strategies is used to explore the parameter space for each assembler and identify high-scoring areas. (f) The high-scoring parameters are used to generate assemblies from the full normalised read set. (g) All assemblies from the full reads are merged to preserve the unique information in each.](figures/assemblotron_workflow.png)

#### Performance
