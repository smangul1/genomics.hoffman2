. /u/local/Modules/default/init/modules.sh
module load samtools

mkdir ../unmapped_bam_bai

ls *bam | awk -F ".bam" '{print $1}' >samples.txt


while read line
do

echo "samtools view -b -f 4 ${line}.bam > ../unmapped_bam_bai/unmapped.${line}.bam" > run.${line}.sh
echo "samtools index ../unmapped_bam_bai/unmapped.${line}.bam ../unmapped_bam_bai/unmapped.${line}.bam.bai" >> run.${line}.sh

# qsub -cwd -V -N extract_unmapped -l h_data=12G,highp,time=4:00:00 run.${line}.sh
done<samples.txt


/u/home/s/serghei/code/miscellaneous.scripts/submit_QSUB_array.sh  16 24
