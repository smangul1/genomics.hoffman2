#Specify two directories containing the outputs of clonality.

. /u/local/Modules/default/init/modules.sh
module load python/2.7
#above line is necessary to avoid compile vs runtime error of different python versions since serghei's python is version 2.7 and default hoffman is 2.6


if [ $# -lt 2 ]
    then
    echo "********************************************************************"
    echo "This script was written by Aaron Karlsberg"
    echo "********************************************************************"
    echo ""
    echo "1 <input1>  - clonality_output_directory_1"
    echo "2 <input2>  - clonality_output_directory_2"
    echo "--------------------------------------"
    exit 1
    fi



input1=$1
input2=$2



echo "/u/home/s/serghei/project/anaconda2/bin/python /u/home/m/maxmellb/imrep_USC_fork/imrep/compare.repertoires.py $PWD/${input1} $PWD/${input2} ../imrep.pairwise.comparison/${input1}_vs_${input2}/" > run.compare.two.repertoires.sh
qsub -cwd -V -N compare_two_repertoires -l h_data=16G,highp,time=24:00:00 run.compare.two.repertoires.sh