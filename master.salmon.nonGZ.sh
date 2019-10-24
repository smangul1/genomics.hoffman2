ls *_R1.fastq | awk -F "_R1.fastq" '{print $1}' >samples.txt


while read line
do

echo "/u/home/s/serghei/project/anaconda2/bin/salmon quant -i /u/home/s/serghei/project/salmon.db/gencode.v27.transcripts -l A -1 ${line}_R1.fastq -2 ${line}_R2.fastq -p 8 -o ${line}">run.${line}.sh

qsub -cwd -V -N salmon -l h_data=16G,highp,time=24:00:00 run.${line}.sh

done<samples.txt
