#!/usr/bin/env bash


# Array of the for the file prefixes that are either pathogenic or non-pathogenic files

file_prefixes = (
    "ERR1955514"
    "ERR1955398"
    "ERR1955482" 
    "ERR1955462"
    "ERR1955504"
    "ERR1955527"
    "ERR1955415"
    "ERR1955531"
    "ERR1955473"

)

# Get the results from running the  file from  the file prefixes.
for prefix in "${file_prefixes}[@]}"; do

# Now we re going to sort out for the BAM files
samtools sort o- "${prefix}_realigned.sorted.bam" "${prefix}_prefix_realigned.bam"


# We re going to index for the sorted BAM file
samtools index o- "${prefix}_realigned.sorted.bam" # creates
        "${prefix}_realigned.sorted.bam.bai"



# Now we re going to run the REViewer to view the SVG files 
REViewer
    --reads "${prefix}_realigned.sorted.bam" \
    --vcf "${prefix}.vcf" \
    --reference ~/public/genomes/GRCh37.fa \
    --catalog ~/public/project1-expansions/variant_catalog/grch37/variant_catalog.json \
    --locus C9ORF72 \
    --output-prefix "${prefix}" 