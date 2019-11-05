ls *fastq | awk -F ".sort_extended_unmapped.fastq" '{print $1}' >samples.txt

while read line
do

echo "/u/home/s/serghei/code/sbt_tool/sbt_microbiome.sh ${line}.sort_extended_unmapped.fastq ${line}.sort_extended_unmapped" >run.${line}.sh

qsub -cwd -V -N microbiome -l h_data=16G,highp,time=24:00:00 run.${line}.sh

done<samples.txt