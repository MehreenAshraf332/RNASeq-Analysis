getwd()
setwd("/home/mujtaba/R-TEST/Day2-20250826T070613Z-1-001/Day2/PCA")
getwd()
# Read gene expression data
expr_data <- read.csv("DESeq2_normalized_counts.csv", header = TRUE, row.names = 1)
# Read metadata file
meta_data <- read.delim("metadata.tsv", header = TRUE, sep = "\t")

# Ensure metadata column names are correct
colnames(meta_data) <- c("Accession", "Phenotype")  # Rename for clarity

# Transpose expression data (Samples in rows, Genes in columns)
expr_data_t <- as.data.frame(t(expr_data))

# Add sample IDs as a column for merging
expr_data_t$Accession <- rownames(expr_data_t)

# Merge expression data with metadata
merged_data <- merge(meta_data, expr_data_t, by = "Accession")

# Remove Accession column before PCA
expr_matrix <- merged_data[, -c(1,2)]  # Exclude "Accession" & "Phenotype"

# Perform PCA
PCA <- prcomp(expr_matrix, scale. = FALSE)

# Calculate percentage variance
percentVar <- round(100 * PCA$sdev^2 / sum(PCA$sdev^2), 1)

# Calculate aspect ratio for fixed coordinate scaling
sd_ratio <- sqrt(percentVar[2] / percentVar[1])

# Create a dataframe for ggplot
pca_results <- data.frame(Accession = merged_data$Accession,
                          PC1 = PCA$x[,1], PC2 = PCA$x[,2],
                          Phenotype = merged_data$Phenotype)

# Save PCA results as a CSV file for download
write.csv(pca_results, "PCA_results.csv", row.names = FALSE)

# Generate PCA plot with axis outlines
pdf(file= "PCA_plot.pdf", width=12, height=8)
ggplot(pca_results, aes(PC1, PC2)) +
  geom_point(aes(shape = Phenotype, color = Phenotype), size = 3, alpha = 0.7) +
  stat_ellipse(aes(color = Phenotype), type = "norm", linetype = 2, linewidth = 1) +
  ggtitle("PCA plot of Gene Expression Data") +
  xlab(paste0("PC1 (", percentVar[1], "% Variance)")) +
  ylab(paste0("PC2 (", percentVar[2], "% Variance)")) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, size = 16, face = "bold"),
    axis.title = element_text(size = 14, face = "bold"),
    axis.text = element_text(size = 12),
    legend.title = element_text(size = 13, face = "bold"),
    legend.text = element_text(size = 12),
    panel.border = element_rect(color = "black", fill = NA, linewidth = 0.5) # Add X and Y axis outline
  ) +
  coord_fixed(ratio = sd_ratio) +
  scale_shape_manual(values = c(16, 16)) +
  scale_color_manual(values = c("cancer" = "red3", "normal" = "green3")) +  # Custom colors
  theme(legend.position = "right")
dev.off()