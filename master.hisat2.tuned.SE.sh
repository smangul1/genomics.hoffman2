ls *_R*_001.fastq.gz | awk -F "_R1_001.fastq.gz" '{print $1}'>samples.txt

 


while read line
do


echo "/u/home/s/serghei/code/genomics.hoffman2/run.hisat2.tuned.SE.sh ${line}_R1_001.fastq.gz ${line}">run.${line}.sh
qsub -cwd -V -N map -l h_data=12G,highp,time=24:00:00 run.${line}.sh


done<samples.txt


	