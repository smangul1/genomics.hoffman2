. /u/local/Modules/default/init/modules.sh
module load python/anaconda3

ls gene_matrices/*gene_matrix.csv >samples.txt

var=$(cat samples.txt | tr '\n' ' ' )
echo "python merge_gene_matrices.py ${var}" >run.merge.sh
chmod u+x run.merge.sh

qsub -cwd -V -N merge_matrices -l h_data=16G,highp,time=24:00:00 run.merge.sh


# After running master.generate.gene.matrix.sh, run this script in the same location to merge the csv files into one complete gene matrix.
# The final merged csv file gene matrix will be located inside of gene_matrices and called merged_gene_matrix.csv