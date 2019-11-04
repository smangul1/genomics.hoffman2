
ls *bam | awk -F ".bam" '{print $1}' >samples.txt

while read line
do

echo "/u/home/s/serghei/code/sbt_tool/sbt.sh $PWD/${line}.bam $PWD/${line}_sbt/">run.${line}.sh



done<samples.txt


~/code/miscellaneous.scripts/submit_QSUB_array.sh  16 24

