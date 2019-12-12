
if [ $# -lt 2 ]
then
echo "********************************************************************"
echo "SUBMIT QSUB ARRAY ON HOFFMAN2 UCLA "
echo "For questions or suggestions contact:"
echo "Serghei Mangul smangul@ucla.edu"
echo "********************************************************************"
echo ""

echo ""
echo "1 memory"
echo "2 time"
#echo "2 <wdir> - working directory, directory where results from rnaseq anlyses will be saved, for each samples separately directory will be created"
#echo "3 <bowtie2_index - location of bowtie2 index, e.g. for human /u/home/eeskin/serghei/Homo_sapiens/UCSC/hg19/Sequence/Bowtie2Index/genome for Drosophila_melanogaster ~/scratch/Drosophila_melanogaster/UCSC/dm3/Sequence/Bowtie2Index/genome"
#echo "4 tophat options if more then 2 arguments in the \" :::::: e.g. \"-G ~/scratch/Drosophila_melanogaster/UCSC/dm3/Annotation/Genes/genes.gtf\""
#echo "5 - file with the fastq names"
#echo "6 - dir whre all the scripts of sarahSeq are stored"

echo "--------------------------------------"
exit 1
fi



ls run*sh | awk '{i+=1;print "if [ $1 == "i" ];then ./"$1" ;fi"}' > myFunc.sh
cp /u/home/s/serghei/code/miscellaneous.scripts/myFuncFastWrapper.sh ./
chmod 755 *sh
n=$(wc -l myFunc.sh | awk '{print $1}')
qsub -cwd -V -N array -l h_data=${1}G,highp,time=${2}:00:00 -t 1-$n:1 myFuncFastWrapper.sh

