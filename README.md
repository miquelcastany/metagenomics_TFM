# metagenomics_TFM
Master's Final thesis in metagenomics (gut micorbiome)

The present study will commence by utilizing 16S rRNA metagenomic sequencing data obtained from fecal samples of patients diagnosed with or without ulcerative colitis (UC), sourced from various previously published studies. These studies will be categorized into two cohorts: a discovery cohort and a validation cohort. The taxonomic classification of each sample will be performed using specialized software designed for such tasks. Specifically, the mothur software (Schloss et al., 2009) will be employed when working with 16S rRNA data, along with taxonomic classification databases like Greengenes or SILVA (DeSantis et al., 2006; Quast et al., 2013).

Following the acquisition of taxonomic classification data, statistical analysis will be conducted using Rstudio and specific packages such as "phyloseq", "microbiome" or "Vegan". The objective is to identify and extract a common dysbiosis pattern among the samples comprising the discovery cohort. Subsequently, these findings will be attempted to be extrapolated to the validation cohort, which consists of UC and healthy patient samples obtained from other studies.

Afterwards, we will focus on predicting clinical outcomes using the relative abundances of different taxa as differentiating features. Machine Learning (ML) techniques (Serrano-Gómez et al., 2021) prove highly valuable in this predictive analysis, although alternative approaches based on generalized linear models (GLMs) or multiple regressions (Rivera-Pinto et al., 2018) also exist.
