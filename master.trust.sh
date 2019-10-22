ls *.sort.bam | awk -F "_R1_001.fastq.sort.bam" '{print $1}' > samples.txt

while read line
do

pwd=$(pwd)

echo "/u/home/a/akarlsbe/trust/bin/trust -f ${pwd}/${line}_R1_001.fastq.sort.bam -g hg19" > run.trust.on.${line}.sh
qsub -cwd -V -N trust -l h_data=16G,highp,time=24:00:00 run.trust.on.${line}.sh

done<samples.txt