#!/bin/bash

source $(dirname $0)/argparse.bash || exit 1
argparse "$@" <<EOF || exit 1
parser.add_argument('in_fastq')
parser.add_argument('out_dir')
EOF

prefix=$(basename "$IN_FASTQ" .bam)
OUT=$OUT_DIR"/"$prefix

mkdir $OUT_DIR
cd $OUT_DIR

DIRECTORY=/u/home/s/serghei/code/sbt_tool/


. /u/local/Modules/default/init/modules.sh
module load samtools
module load bowtie2
module load bcftools

bam_mtDNA=${OUT}.mtDNA.sort.bam
header=${OUT}.header.txt
bam_mtDNA_unique=${OUT}.mtDNA.sort.unique.bam
cov=${OUT}.mtDNA.cov
bcf=${OUT}.mtDNA.bcf

rm -fr $OUT_DIR
mkdir $OUT_DIR


bowtie2  -x ${DIRECTORY}/db/mtDNA/mtDNA --end-to-end $IN_FASTQ | samtools view -F 4 -bh - | samtools sort - >$bam_mtDNA




samtools index $bam_mtDNA

samtools view -H $bam_mtDNA >$header
samtools view -F 12  $bam_mtDNA | grep -v "XS:" | cat $header - | samtools view -b - > $bam_mtDNA_unique
samtools depth $bam_mtDNA_unique >$cov



#diversity
samtools mpileup -uf ${DIRECTORY}/db/mtDNA/mtDNA.fasta $bam_mtDNA_unique | bcftools  call -mv -Oz >$bcf


cov=$(awk '{print $3}' $cov | awk '{s+=$1} END {print s/16569}')


echo "sample,name,mtDNA_ID,dosage" >${OUT_DIR}/summary_rDNA.csv
echo "$prefix,mtDNA,MT,$cov" >>${OUT_DIR}/summary_rDNA.csv




rm -fr $bam_mtDNA
rm -fr ${bam_mtDNA}.bai
rm -fr $header
rm -fr $bam_mtDNA_unique
rm -fr $IN_FASTQ


