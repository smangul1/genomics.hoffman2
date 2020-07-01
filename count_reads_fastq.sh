
ls *fastq.gz | awk -F ".fastq.gz" '{print $1}' >samples.txt

touch num_reads.csv
echo "SAMPLE,num_reads" >> num_reads.csv

while read line
do

file_name="${line}.fastq.gz," 
line_count=$(zcat ${line}.fastq.gz | wc -l) 
Num_Reads=$(((line_count + 1)/4))


combined="$file_name,$Num_Reads"
echo "$combined" >> num_reads.csv

done<samples.txt

echo "done"


# qsub -cwd -V -N count_lines -l h_data=12G,highp,time=6:00:00 count_lines.sh