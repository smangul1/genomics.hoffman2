ls *_R1_001.fastq.gz | awk -F "_R1_001.fastq.gz" '{print $1}' >samples.txt


while read line
do

echo "~/project/anaconda2/bin/salmon -i ~/project/salmon.db/isoforms_GRCh38_Ensembl -l A -1 ${line}_R1_001.fastq.gz -2 ${line}_R2_001.fastq.gz ${line}">run.${line}.sh

qsub -cwd -V -N salmon -l h_data=16G,time=24:00:00 run.${line}.sh

done<samples.txt
