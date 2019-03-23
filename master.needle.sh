ls *_R1_001.fastq_unmapped.fastq | awk -F "_R1_001.fastq_unmapped.fastq" '{print $1}' >samples.txt


while read line
do

echo "~/project/code/needle/needle.sh -fastq ${line}_R1_001.fastq_unmapped.fastq ${line}">run.${line}.sh
qsub -cwd -V -N salmon -l h_data=16G,highp,time=24:00:00 run.${line}.sh

done<samples.txt
