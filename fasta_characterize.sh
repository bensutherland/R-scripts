#!/bin/bash
# Find the number of records and total length of a fasta file 

## USAGE ##
# fasta_characterize.sh <your_file.fasta>

# User Input
INPUT=$1

echo "Processing $INPUT"

# Number of records
echo "Total number of records in fasta"
grep -c '>' $INPUT

# Length 
echo "Total length of fasta (in bp)"
grep -v '>' $INPUT | wc -c
