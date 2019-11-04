ls *bam | awk -F ".bam" '{print $1}' >samples.txt

samtools=/u/home/s/serghei/project/anaconda2/bin/samtools

while read line
do
echo "$samtools index ${line}.bam">run.${line}.sh
#qsub -cwd -V -N index_${line} -l h_data=12G,highp,time=3:00:00 run.${line}.sh
done<samples.txt

/u/home/s/serghei/code/miscellaneous.scripts/submit_QSUB_array.sh  10 3
