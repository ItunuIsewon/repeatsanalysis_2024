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



# Directories and File Paths that is used ....
reads_base_directory ="home.dsi-students4/public/project1-expansions"
variant_catalog_directory ="home.dsi-students4/public/project1-expansions/variant-catalog/grch37/variant_catalog.json"
reference_directory_file ="home.dsi-students4/public/genomes/GRCh37.fa"


# Loop through all the files prefixes and the files of tha calibre  and make them available to be run for the expansionhunter