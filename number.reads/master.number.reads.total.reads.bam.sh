
ls *bam | awk -F ".bam" '{print $1}' >samples.txt

while read line
do

echo "echo 'total_reads' >> ${line}.txt" > run.total_reads.${line}.sh
echo "samtools view -c ${line}.bam >> ${line}.txt" >> run.total_reads.${line}.sh

#qsub -cwd -V -N  nr -l h_data=8G,highp,time=10:00:00 run.${line}.sh

done<samples.txt


/u/home/s/serghei/code/miscellaneous.scripts/submit_QSUB_array.sh  4 10



