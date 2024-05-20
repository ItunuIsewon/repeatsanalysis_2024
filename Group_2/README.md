# DSI_Project_Group_2
The Identification of pathogenic disease-associated short tandem repeats(STRs) in clinical samples



# Project1: Expansion Hunter Workflow

This project involves the analysis of repeat expansions in genome sequences using ExpansionHunter, Samtools, and REViewer. Below are the step-by-step instructions to run the tools and the expected outcomes for the samples analyzed.

## Tools Directory

The following tools are located in `/home/dsi-student4/bin`:

- ExpansionHunter
- Samtools
- REViewer

## Workflow Steps - Manually running the workflow

### 1. Run ExpansionHunter

Run ExpansionHunter on each sample to detect repeat expansions. The output will include VCF, JSON, and BAM files with read realignments at repeat regions.

```bash
/home/dsi-student4/bin/ExpansionHunter \
  --reads ~/public/project1-expansions/ERR1955415.bam \
  --reference ~/public/genomes/GRCh37.fa \
  --variant-catalog ~/public/project1-expansions/variant_catalog/grch37/variant_catalog.json \
  --output-prefix ERR1955415

```
## Step 2: Sort BAM File
## Sort the realigned BAM file using SAMtools.

```sh
/home/dsi-student4/bin/samtools sort -o ERR1955415_realigned.sorted.bam ERR1955415_realigned.bam
```
## Step 3: Index BAM File
# Index the sorted BAM file using SAMtools.

```sh
/home/dsi-student4/bin/samtools index ERR1955415_realigned.sorted.bam
```

## Step 4: Run REViewer
# Use REViewer to generate visualizations for the specified locus.

```sh
/home/dsi-student4/bin/REViewer \
  --reads ERR1955415_realigned.sorted.bam \
  --vcf ERR1955415.vcf \
  --reference ~/public/genomes/GRCh37.fa \
  --catalog ~/public/project1-expansions/variant_catalog/grch37/variant_catalog.json \
  --locus C9ORF72 \
  --output-prefix ERR1955415
  ```


## Dataset Information

# Normal Samples
- ERR1955514.bam - Not Pathogenic
- ERR1955398.bam - Not Pathogenic
- ERR1955482 - Not Pathogenic (Processed)
- ERR1955424 - Not Pathogenic (Processed)
# Pathogenic Samples
- ERR1955462 - Pathogenic (Processed)
```Details: STR26, STR75, PASS, END=71652202, REF=25, RL=25, RU=A, VARID=FXN_A```
# Pending Samples
- ERR1955504
- ERR1955527
- ERR1955415
- ERR1955531
- ERR1955473
## Getting Started

# Install the necessary tools: ```ExpansionHunter, SAMtools, and REViewer.```
Ensure the reference genome and variant catalog are available in the specified paths.
Follow the pipeline steps to process each sample.


# How to Run the  the script or Pipeline ---- Easy way to run the script

## Instructions to Use the Script
# Save the script as pipeline_script.sh

## Make the script executable:
``` sh
chmod +x pipeline_script.sh
```
# Run the Pipeline script
```sh
 ./pipeline_script.sh
  ```

# Contributors

- ```Justice Ohene Amofa```
- ```Comfort Ojedapo```


# License
This project is licensed under the [License](http://www.apache.org/licenses/) License - see the LICENSE file for details.

## Acknowledgments

``` ```