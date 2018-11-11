ls *_R1_001.fastq.gz | awk -F "_R1_001.fastq.gz" '{print $1}' >samples.txt


while read line
do
#10-018-D4_S38_R1_001.fastq.gz 

n=$(zcat ${line}_R1_001.fastq.gz | wc -l | awk '{print $1/2}')

echo "$line,$2"

 
done<samples.txt
