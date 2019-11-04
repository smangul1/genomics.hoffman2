
if [ $# -lt 2 ]
    then
    echo "********************************************************************"
    echo "This script was written by Serghei Mangul"
    echo "********************************************************************"
    echo ""
    echo "1 <input1>   - bam file"
    echo "2 <outdir>  - out junc file"
    echo "--------------------------------------"
    exit 1
    fi


tool='/u/home/s/serghei/code/import/leafcutter/scripts/bam2junc.sh' # channge it if location where leafcutter is installed is different 


bam=$1
junc=$2

$tool $bam $junc
 

