. /u/local/Modules/default/init/modules.sh
module load python/anaconda3

ls gene_matrices/*gene_matrix.csv >samples.txt

var=$(cat samples.txt | tr '\n' ' ' )
echo "python merge_gene_matrices.py ${var}" >run.merge.sh
chmod u+x run.merge.sh

qsub -cwd -V -N merge_matrices -l h_data=16G,highp,time=24:00:00 run.merge.sh


# run this file inside of the gene_matrices directory. Should be located in same level as salmon output directories
# you should see all the csv files generated from generage gene matrix.