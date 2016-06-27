#!/bin/bash
# Set environment variable 
INPUT="/bensuth2/07_platanus/50Go_kmer42/safo_50go__contig.fa"
LENGTH="500"

# Do not change
TRIMMED_INPUT="$INPUT"_minlength500.fa


# Run summarization for the full file
echo "Working on full file "$INPUT""

echo "n50 calculation for $INPUT"
~/01_scripts/fasta_n50.py $INPUT

echo "Number records in $INPUT"
grep -c '>' $INPUT

echo "Full length of $INPUT"
grep -v '>' $INPUT | wc -c


# Prepare min length file
echo "Limiting fasta to only those records > $LENGTH"
~/01_scripts/fasta_minlength.pl $LENGTH $INPUT > $TRIMMED_INPUT

# Run summarization for trimmed file
echo "n50 calculation for $TRIMMED_INPUT"
~/01_scripts/fasta_n50.py $TRIMMED_INPUT

echo "Number records in $TRIMMED_INPUT"
grep -c '>' $TRIMMED_INPUT

echo "Full length of $TRIMMED_INPUT"
grep -v '>' $TRIMMED_INPUT | wc -c
