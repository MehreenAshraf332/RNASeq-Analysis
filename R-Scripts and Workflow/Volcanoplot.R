getwd()
setwd("/home/mujtaba/R-TEST/Day2-20250826T070613Z-1-001/Day2/Volcano plot")
getwd()
#Read Metadata
metadata <- read.delim("metadata.tsv")
# Import the gene raw counts
counts <- read.delim("counts.tsv")
#Create DESeq2 Object
dds = DESeqDataSetFromMatrix(counts,metadata,~Phenotype)
#Perform DESeq analysis
#Relevel to make "normal" appear first in the data

dds$type <- relevel(dds$Phenotype, "normal")


#Run DESeq2
dds <- DESeq(dds)

#Build results table
res <- results(dds)

# Convert DESeq2 results to data frame
res_df <- as.data.frame(res)

# Add gene IDs as first column (SYMBOL or Ensembl IDs depending on your data)
res_df <- data.frame(SYMBOL = rownames(res_df), res_df, check.names = FALSE)

# Save results table for volcano plot
write.csv(res_df,
          file = "DESeq2_results.csv",
          row.names = FALSE,
          quote = FALSE)

#Create publication grade volcano plot with marked genes of interest
BiocManager::install(EnhancedVolcano)
library(EnhancedVolcano)
pdf(file = "volcano_plot.pdf", width=14, height=8)
EnhancedVolcano(res,
                lab = rownames(counts),
                x = 'log2FoldChange',
                y = 'pvalue',
                pCutoff = 10e-5,
                FCcutoff = 1.333,
                xlim = c(-5.7, 5.7),
                ylim = c(0, -log10(10.2e-12)),
                pointSize = 1.3,
                labSize = 2.6,
                title = 'The results',
                subtitle = 'Differential expression analysis',
                caption = 'log2fc cutoff=1.333; p value cutof=10e-5',
                legendPosition = "right",
                legendLabSize = 14,
                col = c('lightblue', 'orange', 'blue', 'red2'),
                colAlpha = 0.6,
                drawConnectors = TRUE,
                hline = c(10e-8),
                widthConnectors = 0.5)
dev.off()

