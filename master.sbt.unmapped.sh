
ls *bam | awk -F ".bam" '{print $1}' >samples.txt

while read line
do




echo "/u/home/s/serghei/code/sbt_tool/sbt_unmapped.sh $PWD/${line}.bam $PWD/${line}_sbt_unmapped/">run.${line}.sh



done<samples.txt




/u/home/s/serghei/code/miscellaneous.scripts/submit_QSUB_array.sh  8 5

