. /u/local/Modules/default/init/modules.sh
module load python/2.7
#above line is necessary to avoid compile vs runtime error of different python versions since serghei's python is version 2.7 and default hoffman is 2.6

ls *bam | awk -F ".bam" '{print $1}' >samples.txt

while read line
do

echo "/u/home/s/serghei/project/anaconda2/bin/python /u/home/s/serghei/project/code/seeing.beyond.target/tools/imrep/imrep.py --bam  --noOverlapStep --noCast ${line}.bam ${line}.cdr3" >run.${line}.sh

qsub -cwd -V -N imrep -l h_data=16G,highp,time=24:00:00 run.${line}.sh

done<samples.txt
