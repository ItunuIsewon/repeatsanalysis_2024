#!/usr/bin/sh

# initialise tools

export PATH=$HOME/bin:$HOME/joseim/bin:$HOME/joseim/bwa:$PATH

export STRIPY=$HOME/joseim/bin/stripy-pipeline/stri.py

export BATCH=$HOME/joseim/bin/stripy-pipeline/batch.py

export DATA=$HOME/public/project1-expansions


# running ExpansionHunter for estimatong the repeat regions
# input:
# bam file
# references fasta file (GRCh37)
# a variant catalog file in json format
# output:
# realigned bam file
# a vcf file of repeat regions
# a json file that contains the information json format

for file in $DATA/ERR*.bam
do
    echo -e "$(basename ${file} .bam)\n"\
    ExpansionHunter --reads ${file}\
    --reference ~/public/genomes/GRCh37.fa\
    --variant-catalog $DATA/variant_catalog/grch37/variant_catalog.json\
    --output-prefix $(basename ${file} .bam)
done

echo -e "\n\n"

# samtools used to sort the realigned bam file (output of step 1)

for file in ./*_realigned.bam
do
    echo -e "$(basename ${file} _realigned.bam)\n"
    samtools sort ${file} \
    -o $(basename ${file} _realigned.bam)_realigned_sorted.bam
done

echo -e "\n\n"

# samtools used to index the realigned bam file (output of step 1)

for file in ./*_realigned_sorted.bam;
do
    echo -e "$(basename ${file} _realigned_sorted.bam)\n"\
    samtools index ${file}
done

echo -e "\n\n"


# REViewer to visualise the C9ORF72 and  gene
# input:
# vcf file from ExpansionHunter output
# reference fasta file
# variant catalog file
# locus to visualise
# output:
# svg file of STR alleles

for file in ./*_realigned_sorted.bam
do
for gene in C9ORF72  ATXN2
do
    echo -e "$(basename ${file} _realigned_sorted.bam)\n"
    REViewer --reads ${file}
    --vcf $(basename ${file} _realigned_sorted.bam).vcf
    --reference ~/public/genomes/GRCh37.fa
    --catalog ${DATA}/variant_catalog/grch37/variant_catalog.json
    --locus ${gene}
    --output-prefix ${file}
done
done

# the stripy database excautable batch file to compare the calls in the samples to the stripy database.
# input:
# genome to use (hg19)
# reference fasta
# bam files from sequence mapping
# locus to compare
# output:
# html file

$BATCH 
-g hg19 \ 
-r ~/public/genomes/GRCh37.fa \
-o $PWD \
-l ABCD3,AFF2,AR,ARX_1,ARX_2,ATN1,ATXN1,ATXN2,ATXN3,ATXN7,ATXN10,ATXN80S,C9ORF72,CACNA1A,CBL,CNBP,CSTB,DIP2B,HTT,PHOX2B \
-i $DATA/*.bam