
ls *_R1_001.fastq.gz | awk -F "_R1_001.fastq.gz" '{print $1}'>samples.txt

 


while read line
do


echo "/u/home/s/serghei/code/RNASeq.hoffman2/run.hisat2.tuned.sh ${line}_R1_001.fastq.gz ${line}_R2_001.fastq.gz ${line}">run.${line}.sh
qsub -cwd -V -N map -l h_data=12G,time=24:00:00 run.${line}.sh


done<samples.txt
