#!/usr/bin/env bash

pjdir="/nas/homes/benyang/Sestrins"
fastqdir="$pjdir/fastq"
outdir="$pjdir/trim_fastq"

for i in `ls -1 $fastqdir | sed 's/.fastq.gz//'`
do
echo @@@@@@@@@@@@@ Processing $i
flexbar -r ./fastq/$i.fastq.gz \
-t $outdir/$i-trimmed \
--adapter-preset Nextera \
-n 32 \
-m 36 \
--adapter-trim-end RIGHT \
--adapter-min-overlap 7 \
--min-read-length 60 \
--zip-output GZ
done