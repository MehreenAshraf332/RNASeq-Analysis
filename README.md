# RNASeq-Analysis
RNA Sequencing Analysis in Health and Disease

:dna:RNA-seq Analysis Pipeline. This repository provides a beginner friendly complete, modular pipeline for analyzing RNA sequencing (RNA-seq) data using High Performance Computing (HPC),Linux and packages in R. The pipeline uses pre-processed dataset fetched from NCBI website using SRA toolkit and performs indexing of the Reference Human Genome (In this case Chrosomosome 1 was taken as a Reference),b) Read Mapping, Alignment Sorting, Count Generation, Processing of Counts File for further downstream analysis, differential gene expression, and visualization, tailored for exploratory and publication-ready analysis

🔧Requirements R (≥ 4.0) Install dependencies in R: install.packages("DESeq2") install.packages("apeglm") install.packages("clusterProfiler") install.packages("msigdbr") install.packages("pheatmap") install.packages("RColorBrewer") install.packages("msigdbr") install.packages("gridExtra") install.packages("enrichplot") install.packages("ggplot2") install.packages("EnhancedVolcano") install.packages("dplyr") install.packages("tidyverse") Or Linux (Conda env) and HPC settings are required

🚀 Usage Clone the repository cd Load your data

:memo:Run the pipeline step-by-step Execute Bash Scripts in Linux for initial steps and run each R script in order or combine them in an RMarkdown notebook.

📊 Outputs Plots (Heatmap, PCA, Volcano plot) Tables (DESeq2_normalized_counts, Metadata) 
