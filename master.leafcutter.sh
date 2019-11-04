. /u/local/Modules/default/init/modules.sh
module load samtools

ls *.bam | awk -F ".bam" '{print $1}' >samples.txt


while read line
do

echo "/u/home/s/serghei/code/genomics.hoffman2/run.leafcutter.bam2junc.sh ${line}.bam ${line}.junc" >run.${line}.sh

#qsub -cwd -V -N leafcutter -l h_data=8G,highp,time=24:00:00 run.${line}.sh

done<samples.txt

/u/home/s/serghei/code/miscellaneous.scripts/submit_QSUB_array.sh  16 24 


