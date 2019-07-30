ls *.bam | awk -F ".bam" '{print $1}' >samples.txt


while read line
do

echo "/u/home/s/serghei/code/genomics.hoffman2/run.leafcutter.bam2junc.sh ${line}.bam ${line}.junc" >run.${line}.sh

qsub -cwd -V -N leafcutter -l h_data=8G,highp,time=04:00:00 run.${line}.sh

done<samples.txt
