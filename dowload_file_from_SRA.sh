#!/bin/bash

# Set PATH to include SRA Toolkit
export PATH=/doctorai/chiarba/envs/sratoolkit/bin:$PATH

# Define working dir
WORKDIR="/doctorai/chiarba/bcr_from_raw/HC"
OUTDIR="$WORKDIR/fastq_download"
ACC_LIST="$WORKDIR/SRR_Acc_List_HC.txt"

# Create output directory
mkdir -p "$OUTDIR"

# Download FASTQ files with fasterq-dump
while read accession; do
    echo "Processing $accession..."
    fasterq-dump "$accession" -O "$OUTDIR" -e 8
done < "$ACC_LIST"

echo "Download completed!"
