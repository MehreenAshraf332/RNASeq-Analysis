## 1. Project Structure
The project contains the following directories:

- `Data/` : Contains input FASTQ files.
- `Scripts/` : Contains shell scripts (.sh) and R scripts (.R) for processing.
- `Results/` : Contains output files, plots, and tables generated after analysis.

## 2. Data Source
The FASTQ files were already present on the HPC system and copied to the project directory.
The Data/ folder contains:
Cancer_1.fastq, Cancer_2.fastq, Cancer_3.fastq
Normal_1.fastq, Normal_2.fastq, Normal_3.fastq

Note: These files were pre-processed and downloaded from the NCBI SRA database in real-time HPC sessions.
Next Steps performed are:

bash ./Scripts/1_index.sh

bash ./Scripts/2_mapping.sh

bash ./Scripts/3_sortBAM.sh

bash ./Scripts/4_featcounts.sh
