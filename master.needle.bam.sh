ls *.bam | awk -F ".bam" '{print $1}' >samples.txt


while read line
do

echo "/u/home/s/serghei/project/code/needle/needle.sh $PWD/${line}.bam $PWD/${line}">run.${line}.sh
#qsub -cwd -V -N needle -l h_data=16G,highp,time=24:00:00 run.${line}.sh

done<samples.txt

/u/home/s/serghei/code/miscellaneous.scripts/submit_QSUB_array.sh  16 24
