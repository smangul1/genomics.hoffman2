ls *junc >junc_files.txt

tool=~/code/import/leafcutter/clustering/leafcutter_cluster.py


echo "python $tool -j junc_files.txt -m 50 -o leafcutter_cluster -l 500000">run_leafcutter_cluster.sh
echo "ls>done.txt" >>run_leafcutter_cluster.sh

qsub -cwd -V -N leafcutter -l h_data=12G,highp,time=60:00:00 run_leafcutter_cluster.sh
