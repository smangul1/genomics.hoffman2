#!/usr/bin/python
import sys
import pandas as pd
from functools import reduce


print(len(sys.argv[1:]))

data_frames = []

for csv_file in sys.argv[1:]:
	df = pd.read_csv(csv_file)
	data_frames.append(df)

df_merged = reduce(lambda  left,right: pd.merge(left,right,on=['gene_name'],
                                            how='outer'), data_frames)

# print(df_merged.head(10))

filename = "merged_gene_matrix.csv"
df_merged.to_csv(filename, index = False)

print("\ndone\n")