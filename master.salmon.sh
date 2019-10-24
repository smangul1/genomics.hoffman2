ls *_R1_001.fastq.gz | awk -F "_R1_001.fastq.gz" '{print $1}' >samples.txt

while read line
do

echo "/u/home/s/serghei/project/anaconda2/bin/salmon quant -i /u/home/s/serghei/project/salmon.db/gencode.v27.transcripts -l A -1 ${line}_R1_001.fastq.gz -2 ${line}_R2_001.fastq.gz -p 8 -o ${line}">run.${line}.sh

qsub -cwd -V -N salmon -l h_data=16G,highp,time=24:00:00 run.${line}.sh

done<samples.txt