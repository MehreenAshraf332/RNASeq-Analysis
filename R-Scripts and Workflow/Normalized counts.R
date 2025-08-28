getwd()
setwd("home/mujtaba/R-TEST")
metadata <- read.delim("metadata.tsv")
setwd("D:/Day2/getting normalized matrix")
metadata <- read.delim("~/R-TEST/Day2-20250826T070613Z-1-001/Day2/getting normalized matrix/metadata.tsv")
counts <- read.delim("~/R-TEST/Day2-20250826T070613Z-1-001/Day2/getting normalized matrix/counts.tsv")
dds = DESeqDataSetFromMatrix(counts,metadata,~Phenotype)
#Perform DESeq analysis
#Re-level to make "normal" appear first in the data

dds$Phenotype <- relevel(dds$Phenotype, "normal")

#Run DESeq2
dds <- DESeq(dds)

#Extract normalized counts
norm_counts <- counts(dds, normalized = TRUE)


# Put into a data frame with SYMBOL as first column
norm_counts_df <- data.frame(SYMBOL = rownames(norm_counts),
                             norm_counts,
                             check.names = FALSE)

# Save as CSV
write.csv(norm_counts_df,
          file = "DESeq2_normalized_counts.csv",
          row.names = FALSE,
          quote = FALSE)

