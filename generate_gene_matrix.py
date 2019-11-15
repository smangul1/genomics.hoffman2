#!/usr/bin/python
import sys
import pandas as pd


filepath = sys.argv[1]
sample = sys.argv[2]

df1 = pd.read_csv(filepath, "\t")

del df1['Length']
del df1['EffectiveLength']
del df1['TPM']

df1.rename(columns={"Name": "gene_name"}, inplace = True)

df1["gene_name"] = df1["gene_name"].str.split("|")

for index, row in df1.iterrows():
    df1.loc[index, "gene_name"] = row.gene_name[5]

gene_names = []
for index, row in df1.iterrows():
    gene_names.append(row.gene_name)
gene_names = set(gene_names)
# print(gene_names)


df_sum_1 = pd.DataFrame(index=gene_names, columns = [sample]) 

df_sum_1[sample] = 0
for gene in gene_names:
    total = df1.loc[df1['gene_name'] == gene, 'NumReads'].sum()
    df_sum_1.loc[gene, sample] = total

df_sum_1.index.name = "gene_name"
df_sum_1.reset_index(inplace=True)
filename = 'gene_matrices/' + sample + "_gene_matrix.csv"

df_sum_1.to_csv(filename, index = False)
print("\ndone\n")