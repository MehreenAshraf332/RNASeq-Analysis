#!/bin/bash

#Activate Conda Env
source activate featurecounts

#Create a subdirectory (in Results) for storing alignments
mkdir -p Results/Counts

#Generate Counts Using FeatureCounts
#Requires BAM Files sorted by Name 

featureCounts \
 -T 4 \
 -s 2 \
 -a /NGS/RNASeq/ReferenceData/chr1-hg19_genes.gtf \
 -o ./Results/Counts/FeatureCounts.txt \
 Results/Alignments/*_sorted.bam;

#Process the FeatureCounts Matrix to keep only the Columns neededin downstream analysis
cut -f1,7,8,9,10,11,12 ./Results/Counts/FeatureCounts.txt > ./Results/Counts/FeatureCounts_Mod.txt

#In addition, remove the first line, path, and _sorted.bam from the file to make simple column names
#You can do this in VIM or NANO or in Notepad++
