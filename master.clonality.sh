. /u/local/Modules/default/init/modules.sh
module load python/2.7
#above line is necessary to avoid compile vs runtime error of different python versions since serghei's python is version 2.7 and default hoffman is 2.6

ls *cdr3 | awk -F ".cdr3" '{print $1}' >samples.txt

while read line
do

echo "/u/home/s/serghei/project/anaconda2/bin/python /u/home/s/serghei/project/code/seeing.beyond.target/tools/imrep/clonality.py ${line}.cdr3 ${line}.clonality" >run.${line}.sh

qsub -cwd -V -N clonality -l h_data=16G,highp,time=24:00:00 run.${line}.sh

done<samples.txt