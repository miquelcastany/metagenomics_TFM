# metagenomics Master's Final Thesis
Master's Final thesis in metagenomics (gut micorbiome)

The work is based on metagenomic sequencing data of 16S rRNA from fecal samples of patients with ulcerative colitis (UC) and healthy controls (HC) from different previously published studies. The different studies have been divided into two cohorts: a discovery cohort (CD) and a validation cohort (CV). The relevant taxonomic classifications of each sample have been performed using specialized software for these tasks. In our case, we have used the software known as Mothur (Schloss et al., 2009) and a taxonomic classification database for 16S rRNA sequences such as SILVA (Quast et al., 2013).

Once the taxonomic classification data has been obtained, statistical analysis has been carried out using Rstudio to determine and extract a dysbiosis pattern that is common to the samples of patients composing the discovery cohort. Subsequently, these results have been attempted to be extrapolated to the validation cohort, which consisted of UC patient samples from another study.

Subsequently, a task dedicated to the prediction of clinical outcomes has been carried out using the relative abundances of different taxa as differentiating features. Machine learning techniques (ML) (Serrano-Gómez et al., 2021) have been used for this purpose, but other approaches based on generalized linear models (GLMs) or multiple regressions like selbal and coda4microbiome have also been employed (Rivera-Pinto et al., 2018; Calle et al., 2023).

