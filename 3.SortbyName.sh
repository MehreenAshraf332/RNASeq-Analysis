#!/bin/bash

#Activate Conda Env
source activate samtools

for types in Cancer Normal;do
 for replicates in 1 2 3;do
  samtools sort \
  -@ 24 \
  -n \
  -O BAM \
  ./Results/Alignments/${types}_${replicates}_Aligned.sortedByCoord.out.bam \
   > ./Results/Alignments/${types}_${replicates}_sorted.bam;
 done
done
