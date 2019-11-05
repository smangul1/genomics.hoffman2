ls *fastq | awk -F ".fastq" '{print $1}' >samples.txt

while read line
do

echo "/u/home/s/serghei/code/sbt_tool/sbt_microbiome.sh ${line}.fastq ${line}" >run.${line}.sh

qsub -cwd -V -N microbiome -l h_data=16G,highp,time=24:00:00 run.${line}.sh

done<samples.txt