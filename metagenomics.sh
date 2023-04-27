#! /bin/sh
# metagenomics_TFM
Master's Final thesis in metagenomics (gut micorbiome)


## UPSTREAM ANALYSIS

### SRA-TOOLKIT

#### pulling sra-toolkit from pegi3s:
docker pull pegi3s/sratoolkit:latest

#### Prefetch
docker run --rm -v /home/miquel/Descargas:/home/miquel/Descargas -v /home/miquel/sra:/home/miquel/sra pegi3s/sratoolkit prefetch --option-file /home/miquel/Descargas/SRR_Acc_List.txt --output-directory /home/miquel/sra

#### fasterq-dump
docker run --rm -v /home/miquel/sra:/home/miquel/sra -v /home/miquel/fastq:/home/miquel/fastq pegi3s/sratoolkit fasterq-dump /home/miquel/sra/* --outdir /home/miquel/fastq


### MOTHUR

#### pulling mothur image from biocontainers:
docker pull biocontainers/mothur:v1.41.21-1-deb_cv1

#### make.file()
docker run -it -v /home/miquel/mothur:/home/miquel/mothur biocontainers/mothur:v1.41.21-1-deb_cv1 mothur "#make.file(inputdir=/home/miquel/mothur, type=fastq, prefix=discovery)"

#### make.contigs()
docker run -it -v /home/miquel/mothur:/home/miquel/mothur biocontainers/mothur:v1.41.21-1-deb_cv1 mothur "#make.contigs(inputdir=/home/miquel/mothur, file=discovery.files)"

#### summary.seqs()
docker run -it -v /home/miquel/mothur:/home/miquel/mothur biocontainers/mothur:v1.41.21-1-deb_cv1 mothur "#summary.seqs(inputdir=/home/miquel/mothur, fasta=discovery.trim.contigs.fasta)"

#### screen.seqs()
docker run -it -v /home/miquel/mothur:/home/miquel/mothur biocontainers/mothur:v1.41.21-1-deb_cv1 mothur "#screen.seqs(inputdir=/home/miquel/mothur, fasta=discovery.trim.contigs.fasta, maxambig=0, maxlength=297, maxhomop=8)" 

#### unique.seqs()
docker run -it -v /home/miquel/mothur:/home/miquel/mothur biocontainers/mothur:v1.41.21-1-deb_cv1 mothur "#unique.seqs(inputdir=/home/miquel/mothur, fasta=discovery.trim.contigs.good.fasta)"

#### summary.seqs(unique.fasta)
docker run -it -v /home/miquel/mothur:/home/miquel/mothur biocontainers/mothur:v1.41.21-1-deb_cv1 mothur "#summary.seqs(inputdir=/home/miquel/mothur, fasta=discovery.trim.contigs.good.unique.fasta)"

#### count.seqs()
docker run -it -v /home/miquel/mothur:/home/miquel/mothur biocontainers/mothur:v1.41.21-1-deb_cv1 mothur "#count.seqs(inputdir=/home/miquel/mothur, name=discovery.trim.contigs.good.names, group=discovery.contigs.groups)"

#### pcr.seqs(silva/oligos)
docker run -it -v /home/miquel/mothur:/home/miquel/mothur biocontainers/mothur:v1.41.21-1-deb_cv1 mothur "#pcr.seqs(inputdir=/home/miquel/mothur, fasta=silva.bacteria.fasta, oligos=oligos)"

#### summary.seqs(pcr.fasta)
docker run -it -v /home/miquel/mothur:/home/miquel/mothur biocontainers/mothur:v1.41.21-1-deb_cv1 mothur "#summary.seqs(inputdir=/home/miquel/mothur, fasta=silva.bacteria.pcr.fasta)"

#### align.seqs()
docker run -it -v /home/miquel/mothur:/home/miquel/mothur biocontainers/mothur:v1.41.21-1-deb_cv1 mothur "#align.seqs(inputdir=/home/miquel/mothur, fasta=discovery.trim.contigs.good.unique.fasta, reference=silva.bacteria.pcr.fasta)"

#### summary.seqs(align/count)
docker run -it -v /home/miquel/mothur:/home/miquel/mothur biocontainers/mothur:v1.41.21-1-deb_cv1 mothur "#summary.seqs(inputdir=/home/miquel/mothur, fasta=discovery.trim.contigs.good.unique.align)"

#### screen.seqs(align/count)
docker run -it -v /home/miquel/mothur:/home/miquel/mothur biocontainers/mothur:v1.41.21-1-deb_cv1 mothur "#screen.seqs(inputdir=/home/miquel/mothur, fasta=discovery.trim.contigs.good.unique.align, count= discovery.trim.contigs.good.count_table, start=2, end=13423)"

#### filter.seqs()
docker run -it -v /home/miquel/mothur:/home/miquel/mothur biocontainers/mothur:v1.41.21-1-deb_cv1 mothur "#filter.seqs(inputdir=/home/miquel/mothur, fasta=discovery.trim.contigs.good.unique.good.align, vertical=T, trump=.)"

#### unique.seqs(filter)
docker run -it -v /home/miquel/mothur:/home/miquel/mothur biocontainers/mothur:v1.41.21-1-deb_cv1 mothur "#unique.seqs(inputdir=/home/miquel/mothur, fasta=discovery.trim.contigs.good.unique.good.filter.fasta, count=discovery.trim.contigs.good.good.count_table)"

#### pre.cluster()
docker run -it -v /home/miquel/mothur:/home/miquel/mothur biocontainers/mothur:v1.41.21-1-deb_cv1 mothur "#pre.cluster(inputdir=/home/miquel/mothur, fasta=discovery.trim.contigs.good.unique.good.filter.unique.fasta, count=discovery.trim.contigs.good.unique.good.filter.count_table)"

#### classify.seqs()
docker run -it -v /home/miquel/mothur:/home/miquel/mothur biocontainers/mothur:v1.41.21-1-deb_cv1 mothur "#classify.seqs(inputdir=/home/miquel/mothur, fasta=discovery.trim.contigs.good.unique.good.filter.unique.precluster.fasta, count=discovery.trim.contigs.good.unique.good.filter.unique.precluster.count_table, reference=trainset9_032012.pds.fasta, taxonomy=trainset9_032012.pds.tax)"

#### remove.lineage()
docker run -it -v /home/miquel/mothur:/home/miquel/mothur biocontainers/mothur:v1.41.21-1-deb_cv1 mothur "#remove.lineage(inputdir=/home/miquel/mothur, fasta=discovery.trim.contigs.good.unique.good.filter.unique.precluster.fasta, count=discovery.trim.contigs.good.unique.good.filter.unique.precluster.count_table, taxonomy=discovery.trim.contigs.good.unique.good.filter.unique.precluster.pds.wang.taxonomy, taxon=Chloroplast-Mitochondria-unknown-Archaea-Eukaryota)"
