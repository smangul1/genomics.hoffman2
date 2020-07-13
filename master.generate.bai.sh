ls *bam | awk -F ".bam" '{print $1}' >samples.txt

while read line
do

echo "samtools index ${line}.bam ${line}.bam.bai" >run.${line}.sh

qsub -cwd -V -N bai -l h_data=16G,highp,time=8:00:00 run.${line}.sh

done<samples.txt