:<<'END_COMMENT'
#!/bin/bash

source activate star

#Create STAR index for the human genome

mkdir -p GenomeIndex

STAR \
 --runThreadN 24 \
 --runMode genomeGenerate \
 --genomeDir GenomeIndex/ \
 --genomeFastaFiles ./ReferenceData/chr12.fa \
 --sjdbGTFfile ./ReferenceData/chr1-hg19_genes.gtf \
 --sjdbOverhang 99
END_COMMENT
