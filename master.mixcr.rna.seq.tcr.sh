ls *_R1_001.fastq.gz | awk -F "_R1_001.fastq.gz" '{print $1}'>samples.txt


while read line
do


pwd=$(pwd)


echo ". /u/local/Modules/default/init/modules.sh" > run.mixcr.rna_seq.${line}.sh
echo "module load java/1.8.0_77" >> run.mixcr.rna_seq.${line}.sh

echo "java -jar /u/home/a/akarlsbe/mixcr-3.0.10/mixcr.jar align -p rna-seq -s hsa -OallowPartialAlignments=true ${pwd}/${line}_R1_001.fastq.gz ${pwd}/${line}_R2_001.fastq.gz ${line}_alignments.vdjca" >> run.mixcr.rna_seq.${line}.sh
echo "java -jar /u/home/a/akarlsbe/mixcr-3.0.10/mixcr.jar assemblePartial ${line}_alignments.vdjca ${line}_alignments_rescued_1.vdjca" >> run.mixcr.rna_seq.${line}.sh
echo "java -jar /u/home/a/akarlsbe/mixcr-3.0.10/mixcr.jar assemblePartial ${line}_alignments_rescued_1.vdjca ${line}_alignments_rescued_2.vdjca" >> run.mixcr.rna_seq.${line}.sh
echo "java -jar /u/home/a/akarlsbe/mixcr-3.0.10/mixcr.jar assemble ${line}_alignments_rescued_2.vdjca ${line}_clones.clns" >> run.mixcr.rna_seq.${line}.sh
echo "java -jar /u/home/a/akarlsbe/mixcr-3.0.10/mixcr.jar exportClones ${line}_clones.clns ${line}_clones.txt" >> run.mixcr.rna_seq.${line}.sh

qsub -cwd -V -N mixcr -l h_data=16G,highp,time=24:00:00 run.mixcr.rna_seq.${line}.sh

done<samples.txt


java -jar /u/home/a/akarlsbe/mixcr-3.0.10/mixcr.jar align -p rna-seq -s hsa -OallowPartialAlignments=true CMT-baseline1C_CAGATC_combinedLanes_R1_001.fastq.gz CMT-baseline1C_CAGATC_combinedLanes_R2_001.fastq.gz CMT-baseline1C_CAGATC_combinedLanes_alignments.vdjca