#!/usr/bin/env bash

pjdir="/nas/homes/benyang/Sestrins"
R1="$pjdir/fastq/*-R1.fastq.gz"
outdir="$pjdir/trim_fastq"
trimdir="$HOME/tools/Trimmomatic-0.38"

for i in `ls -1 *R1.fastq.gz | sed 's/-R1.fastq.gz//'`
do
java -XX:ParallelGCThreads=32 -jar $trimdir/trimmomatic-0.38.jar PE -threads 32 \
-trimlog $outdir/trimlog.txt \
$i-R1.fastq.gz \
$i-R2.fastq.gz \
$outdir/$i-R1_paired_trimmed.fq.gz \
$outdir/$i-unpaired.fq.gz \
$outdir/$i-R2_paired_trimmed.fq.gz \
$outdir/$i-R2_unpaired.fq.gz \
ILLUMINACLIP:$trimdir/adapters/NexteraPE-PE.fa:2:30:10:2:keepBothReads \
LEADING:3 TRAILING:3 MINLEN:36

java -XX:ParallelGCThreads=32 -jar $trimdir/trimmomatic-0.38.jar SE \
-threads 32 -phred33 \
$i.fq.gz \
$i.trimmed.fq.gz \
ILLUMINACLIP:$trimdir/adapters/NexteraPE-PE.fa:2:30:10:2:keepBothReads \
LEADING:3 TRAILING:3 MINLEN:36

done