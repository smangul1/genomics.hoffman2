
ls *bam | awk -F ".bam" '{print $1}' >samples.txt

while read line
do

echo "/u/home/s/serghei/project/anaconda2/bin/python /u/home/s/serghei/project/code/seeing.beyond.target/tools/imrep/imrep.py --bam  --noOverlapStep --noCast --chrFormat2 ${line}.bam ${line}.cdr3" >run.${line}.sh

#qsub -cwd -V -N imrep -l h_data=16G,highp,time=24:00:00 run.${line}.sh

done<samples.txt

~/code/miscellaneous.scripts/submit_QSUB_array.sh  16 24
