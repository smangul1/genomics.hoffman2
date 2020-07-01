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



# info on individual sequences.

# echo "SAMPLE,VJ,count,relative.frequency" > all_samples_TCRA.VJ.FREQ.csv
# grep -v "relative.frequency" */*TCRA.VJ.FREQ..csv >> all_samples_TCRA.VJ.FREQ.csv


# echo "SAMPLE,CDR3,count,relative.frequency" > all_samples_TCRA.cdr3.FREQ.csv
# grep -v "relative.frequency" */*TCRA.cdr3.FREQ..csv >> all_samples_TCRA.cdr3.FREQ.csv


# echo "SAMPLE,VJ,count,relative.frequency" > all_samples_IGH.VJ.FREQ.csv
# grep -v "relative.frequency" */*IGH.VJ.FREQ..csv >> all_samples_IGH.VJ.FREQ.csv


# echo "SAMPLE,CDR3,count,relative.frequency" > all_samples_IGH.cdr3.FREQ.csv
# grep -v "relative.frequency" */*IGH.cdr3.FREQ..csv >> all_samples_IGH.cdr3.FREQ.csv


# echo "SAMPLE,VJ,count,relative.frequency" > all_samples_IGK.VJ.FREQ.csv
# grep -v "relative.frequency" */*IGK.VJ.FREQ..csv >> all_samples_IGK.VJ.FREQ.csv


# echo "SAMPLE,CDR3,count,relative.frequency" > all_samples_IGK.cdr3.FREQ.csv
# grep -v "relative.frequency" */*IGK.cdr3.FREQ..csv >> all_samples_IGK.cdr3.FREQ.csv


# echo "SAMPLE,VJ,count,relative.frequency" > all_samples_IGL.VJ.FREQ.csv
# grep -v "relative.frequency" */*IGL.VJ.FREQ..csv >> all_samples_IGL.VJ.FREQ.csv


# echo "SAMPLE,CDR3,count,relative.frequency" > all_samples_IGL.cdr3.FREQ.csv
# grep -v "relative.frequency" */*IGL.cdr3.FREQ..csv >> all_samples_IGL.cdr3.FREQ.csv

