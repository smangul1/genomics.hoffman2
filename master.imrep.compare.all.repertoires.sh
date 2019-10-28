#Run this in directory containing the output directories of clonality. It will create a pairwise comparison between all combinations of directory outputs from clonality.

. /u/local/Modules/default/init/modules.sh
module load python/2.7
#above line is necessary to avoid compile vs runtime error of different python versions since serghei's python is version 2.7 and default hoffman is 2.6

echo "only works if current directory contains only the output directories of clonality.py. Current dir can have other files but no other directories."

echo "/u/home/s/serghei/project/anaconda2/bin/python /u/home/m/maxmellb/imrep_USC_fork/imrep/run.compare.repertoires.py $PWD/ ../imrep.pairwise.comparison/" > run.compare.ALL.repertoires.sh
qsub -cwd -V -N compare_ALL_repertoires -l h_data=16G,highp,time=24:00:00 run.compare.ALL.repertoires.sh