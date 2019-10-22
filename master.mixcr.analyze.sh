ls *_R1_001.fastq.gz | awk -F "_R1_001.fastq.gz" '{print $1}'>samples.txt


while read line
do


pwd=$(pwd)


echo "module load java/1.8.0_77" > run.mixcr.analyze.human.rna.on.${line}.sh


echo "java -jar /u/home/a/akarlsbe/mixcr-3.0.10/mixcr.jar analyze amplicon \
        --species hs \
        --starting-material rna \
        --5-end v-primers \
        --3-end j-primers \
        --adapters adapters-present \
        --receptor-type BCR \
        --region-of-interest VDJRegion \
        --only-productive \
        --report '${line}_analysis.report' \
        --align '-OreadsLayout=Collinear' \
        --assemble '-OseparateByC=true' \
        --assemble '-OqualityAggregationType=Average' \
        --assemble '-OclusteringFilter.specificMutationProbability=1E-5' \
        --assemble '-OmaxBadPointsPercent=0' \
        ${pwd}/${line}_R1_001.fastq.gz ${pwd}/${line}_R2_001.fastq.gz ${line}_analysis" >> run.mixcr.analyze.human.rna.on.${line}.sh


qsub -cwd -V -N mixcr_analyze -l h_data=16G,highp,time=24:00:00 run.mixcr.analyze.human.rna.on.${line}.sh

done<samples.txt