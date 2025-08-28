#!/bin/bash

#Activate Conda Env
source activate star

#Create a subdirectory (in Results) for storing alignments
mkdir -p Results/Alignments

#Map reads to the indexed genome

for types in Cancer Normal;do
 for replicates in 1 2 3;do

  STAR \
   --runMode alignReads \
   --runThreadN 24 \
   --readFilesIn ./Data/${types}_${replicates}.fastq \
   --genomeDir /NGS/RNASeq/GenomeIndex \
   --outFileNamePrefix ./Results/Alignments/${types}_${replicates}_ \
   --outSAMtype BAM SortedByCoordinate \
   --outSAMunmapped Within \
   --outSAMattributes Standard;
 done
done
