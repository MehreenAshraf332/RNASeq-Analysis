getwd()
setwd("/home/mujtaba/R-TEST/Day2-20250826T070613Z-1-001/Day2/Heatmap")
getwd()
# Read gene expression data
expr_data <- read.csv("DESeq2_normalized_counts.csv", header = TRUE, row.names = 1)
# Read metadata file
meta_data <- read.delim("metadata.tsv", header = TRUE, sep = "\t")
# Ensure metadata column names are correct
colnames(meta_data) <- c("Accession", "Phenotype")  
# Transpose expression data so samples are rows
expr_data_t <- as.data.frame(t(expr_data))
# Add sample IDs as a column for merging
expr_data_t$Accession <- rownames(expr_data_t)
# Merge with metadata
merged_data <- merge(expr_data_t, meta_data, by = "Accession")

# Remove Accession column (not needed for distance matrix)
expr_matrix <- merged_data[, -c(1, ncol(merged_data))]  # Exclude Accession & Phenotype columns

# Compute Manhattan distances
dists <- as.matrix(dist(expr_matrix, method = "manhattan"))

# Set row and column names to Accession IDs
rownames(dists) <- colnames(dists) <- merged_data$Accession

# Save distance matrix to CSV
write.csv(dists, "heatmap.csv")

# Prepare annotations for heatmap
annotation_for_heatmap <- data.frame(Disease = factor(merged_data$Phenotype, levels = c("cancer", "normal")))
row.names(annotation_for_heatmap) <- merged_data$Accession  # Match row names

# Define an enhanced color palette
hmcol <- colorRampPalette(brewer.pal(9, "Spectral"))(100)

# Set diagonal to NA to avoid self-comparison
diag(dists) <- NA

# Define colors for annotations
ann_colors <- list(Disease = c("cancer" = "lightpink", "normal" = "lightgreen"))

# Generate the heatmap
pdf(file= "Heatmap.pdf", width=14, height=8)
pheatmap(dists,
         color = hmcol,
         annotation_row = annotation_for_heatmap,
         annotation_colors = ann_colors,
         legend = TRUE,
         treeheight_row = 0,
         treeheight_col = 50,
         legend_breaks = seq(min(dists, na.rm = TRUE), max(dists, na.rm = TRUE), length.out = 3),
         legend_labels = c("Small", "Medium", "Large"),
         main = "Clustering Heatmap",
         fontsize = 12,
         fontsize_row = 10,
         show_colnames = FALSE,
         border_color = "grey50",
         cellwidth = 20,
         cellheight = 10,
         show_rownames = FALSE,
         legend_text_size = 12,
         legend_position = "right",
         legend_width = 2.5)  
dev.off()