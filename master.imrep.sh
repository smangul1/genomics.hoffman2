. /u/local/Modules/default/init/modules.sh
module load python/2.7

ls *_R1_001.fastq_unmapped.fastq | awk -F "_R1_001.fastq_unmapped.fastq" '{print $1}' >samples.txt

while read line
do

echo "/u/home/s/serghei/project/anaconda2/bin/python /u/home/s/serghei/project/code/seeing.beyond.target/tools/imrep/imrep.py --fastq  --noOverlapStep --noCast ${line}_R1_001.fastq_unmapped.fastq ${line}" >run.${line}.sh

qsub -cwd -V -N imrep -l h_data=16G,highp,time=24:00:00 run.${line}.sh

done<samples.txt