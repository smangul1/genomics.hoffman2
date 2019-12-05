. /u/local/Modules/default/init/modules.sh
module load python/2.7
#above line is necessary to avoid compile vs runtime error of different python versions since serghei's python is version 2.7 and default hoffman is 2.6

ls *cdr3 | awk -F ".cdr3" '{print $1}' >samples.txt

while read line
do

echo "/u/home/s/serghei/project/anaconda2/bin/python /u/home/m/maxmellb/imrep_USC_fork/imrep/clonality.py ${line}.cdr3 ${line}.clonality" >run.${line}.sh

qsub -cwd -V -N clonality -l h_data=16G,highp,time=24:00:00 run.${line}.sh

done<samples.txt



#command to combine the summary.cdr3.txt files into one csv for all clonality samples.
#echo "SAMPLE,nIGH,nIGK,nIGL,nTCRA,nTCRB,nTCRD,nTCRG,loadIGH,loadIGK,loadIGL,loadTCRA,loadTCRB,loadTCRD,loadTCRG,alphaIGH,alphaIGK,alphaIGL,alphaTCRA,alphaTCRB,alphaTCRD,alphaTCRG" > combined_clonality.csv
#tail -n +2 -q */*summary.cdr3.txt >> combined_clonality.csv

