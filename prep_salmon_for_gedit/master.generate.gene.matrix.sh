. /u/local/Modules/default/init/modules.sh
module load python/anaconda3

ls */quant.sf | awk -F "/quant.sf" '{print $1}' >samples.txt

mkdir gene_matrices

while read line
do

echo "python salmon_to_gene_matrix.py ${line}/quant.sf ${line}" >run.generate.gene.matrix.${line}.sh

chmod u+x run.generate.gene.matrix.${line}.sh

qsub -cwd -V -N generate_gene_matrix -l h_data=16G,highp,time=24:00:00 run.generate.gene.matrix.${line}.sh

done<samples.txt

# run this file in same level as salmon output directories. It will go inside each directory and generate a gene matrix csv for each quant file.
# Then run the master.merge.gene.matrices.sh script to merge the csv files into one complete gene matrix.