ls *bam | awk -F ".bam" '{print $1}' >samples.txt

while read line
do

echo "/u/home/s/serghei/project/anaconda2/bin/python /u/home/s/serghei/project/code/seeing.beyond.target/tools/imrep/imrep.py --extendedOutput --bam  --noOverlapStep --noCast ${line}.bam ${line}.cdr3" >run.${line}.sh

qsub -cwd -V -N imrep -l h_data=16G,highp,time=24:00:00 run.${line}.sh

done<samples.txt