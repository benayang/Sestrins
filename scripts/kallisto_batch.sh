#!/usr/bin/env bash

pjdir="/nas/homes/benyang/Sestrins"
fastqdir="$pjdir/trim_fastq"
idx="$pjdir/ref/mm38.p6.idx"
outdir="$pjdir/kallisto_out/mm38"

cd $pjdir/trim_fastq/

for i in `ls -1 *-trimmed.fastq.gz | sed 's/-trimmed.fastq.gz//'`
do
echo @@@@@@ Processing "$i"

kallisto quant \
-b 100 \
--single \
-l 300 \
-s 30 \
-i $idx \
-t 45 \
-o $outdir/$i/ \
$fastqdir/$i-trimmed.fastq.gz

echo @@@@@@@ Saved to "$outdir/$i" 
done