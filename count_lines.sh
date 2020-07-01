
ls *fastq.gz | awk -F ".fastq.gz" '{print $1}' >samples.txt

touch line_counts.csv
echo "SAMPLE,line_counts" >> line_counts.csv

while read line
do

file_name="${line}.fastq.gz," 
line_count=$(zcat ${line}.fastq.gz | wc -l) 


combined="$file_name$line_count"
echo "$combined" >> line_counts.csv

done<samples.txt

echo "done"


# qsub -cwd -V -N count_lines -l h_data=12G,highp,time=6:00:00 count_lines.sh