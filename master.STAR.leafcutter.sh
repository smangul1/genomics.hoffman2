. /u/local/Modules/default/init/modules.sh
module load python/2.7

ls *_R1_001.fastq.gz | awk -F "_R1_001.fastq.gz" '{print $1}'>samples.txt


while read line
do

pwd=$(pwd)

echo "/u/home/s/serghei/code/genomics.hoffman2/run.STAR.leafcutter.sh ${pwd}/${line}_R1_001.fastq.gz ${pwd}/${line}_R2_001.fastq.gz ${line}.STAR.BAM">run.star.leafcutter.${line}.sh
qsub -cwd -V -N map -l h_data=16G,highp,time=24:00:00 run.star.leafcutter.${line}.sh


done<samples.txt
