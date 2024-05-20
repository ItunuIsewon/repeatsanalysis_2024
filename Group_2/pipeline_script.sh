#!/bin/bash

# Set the necessary paths
TOOLS_DIR="/home/dsi-student4/bin"
READS_DIR="~/public/project1-expansions"
REFERENCE="~/public/genomes/GRCh37.fa"
VARIANT_CATALOG="~/public/project1-expansions/variant_catalog/grch37/variant_catalog.json"
LOCUS="C9ORF72"

# List of BAM files to process
BAM_FILES=(
    "ERR1955514.bam"
    "ERR1955398.bam"
    "ERR1955482.bam"
    "ERR1955462.bam"
    "ERR1955424.bam"
    "ERR1955504.bam"
    "ERR1955527.bam"
    "ERR1955415.bam"
    "ERR1955531.bam"
    "ERR1955473.bam"
)

# Iterate over each BAM file
for BAM_FILE in "${BAM_FILES[@]}"; do
    # Extract the base name (without .bam extension)
    BASE_NAME=$(basename "$BAM_FILE" .bam)

    echo "Processing $BASE_NAME"

    # Step 1: Run ExpansionHunter
    $TOOLS_DIR/ExpansionHunter \
        --reads $READS_DIR/$BAM_FILE \
        --reference $REFERENCE \
        --variant-catalog $VARIANT_CATALOG \
        --output-prefix $BASE_NAME

    # Step 2: Sort BAM file
    $TOOLS_DIR/samtools sort -o ${BASE_NAME}_realigned.sorted.bam ${BASE_NAME}_realigned.bam

    # Step 3: Index sorted BAM file
    $TOOLS_DIR/samtools index ${BASE_NAME}_realigned.sorted.bam

    # Step 4: Run REViewer
    $TOOLS_DIR/REViewer \
        --reads ${BASE_NAME}_realigned.sorted.bam \
        --vcf ${BASE_NAME}.vcf \
        --reference $REFERENCE \
        --catalog $VARIANT_CATALOG \
        --locus $LOCUS \
        --output-prefix $BASE_NAME
done

echo "Pipeline processing complete."
