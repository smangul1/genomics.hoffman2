ls *_R1_001.fastq.gz | awk -F "_R1_001.fastq.gz" '{print $1}'>samples.txt


while read line
do


pwd=$(pwd)


echo "module load java/1.8.0_77" > run.mixcr.align.on.${line}.sh
echo "java -jar /u/home/a/akarlsbe/mixcr-3.0.10/mixcr.jar align -s hs -OvParameters.geneFeatureToAlign=VTranscript \
  --report ${line}_analysis.report ${pwd}/${line}_R1_001.fastq.gz ${pwd}/${line}_R2_001.fastq.gz ${line}_analysis.vdjca" >> run.mixcr.align.on.${line}.sh
qsub -cwd -V -N mixcr_align -l h_data=16G,highp,time=24:00:00 run.mixcr.align.on.${line}.sh

done<samples.txt