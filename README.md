# RNASeq-Analysis
RNA Sequencing Analysis in Health and Disease

:dna: This repository provides a beginner friendly complete, modular pipeline for practicing RNA sequencing (RNA-seq) Analysis using High Performance Computing (HPC),Linux (shell scripts) and packages in R (R scripts). The pipeline uses pre-processed dataset from NCBI website using SRA toolkit and performs indexing of the Reference Human Genome (In this case Chrosomosome 1 was taken as a Reference), Read Mapping, Alignment Sorting, Count Generation, Processing of Counts File for further downstream analysis, differential gene expression, and visualization, tailored for exploratory and publication-ready analysis

🔧 Requirements R (≥ 4.0) Install dependencies in R: 


##Install BiocManager if not installed

if(!requireNamespace("BiocManager", quietly = TRUE))
install.packages("BiocManager")

##Bioconductor packages

BiocManager::install("DESeq2")
BiocManager::install("apeglm")
BiocManager::install("clusterProfiler")
BiocManager::install("msigdbr")
BiocManager::install("enrichplot")
BiocManager::install("org.Hs.eg.db")

##CRAN packages

install.packages("ggplot2")
install.packages("EnhancedVolcano")
install.packages("pheatmap")
install.packages("RColorBrewer")
install.packages("gridExtra")
install.packages("dplyr")
install.packages("tidyverse")
install.packages("magrittr")

🐧 Linux / HPC
Linux environment (with Conda optional)
HPC settings to run scripts efficiently

🚀 Usage Clone this repository cd RNASeq-Analysis

:memo: Run the pipeline step-by-step Execute Bash Scripts in Linux for initial steps and run each R script in order or combine them in an RMarkdown notebook.

📊 Outputs Plots (Heatmap, PCA, Volcano plot) Tables (DESeq2_normalized_counts, Metadata) 
