#!/bin/python3

import pandas as pd
import sys, os

phen = sys.argv[1]
print(phen)

phenotype_lookup_df = pd.read_csv("description_lookup.csv", header=None)

if phen in phenotype_lookup_df[0].values:
	phecode = phen
else:
	phecode = phenotype_lookup_df.loc[phenotype_lookup_df[1] == phen].iloc[0][0]

print(phecode)

sex = sys.argv[2]

if sex == "f":
	print("female")
	#os.system("wget https://broad-ukb-sumstats-us-east-1.s3.amazonaws.com/round2/additive-tsvs/" + phecode + ".gwas.imputed_v3.female.tsv.bgz -O " + phecode + ".gwas.imputed_v3.female.tsv.bgz")
	file_name = f"{phecode}.gwas.imputed_v3.female.tsv"
if sex == "m":
	print("male")
	#os.system("wget https://broad-ukb-sumstats-us-east-1.s3.amazonaws.com/round2/additive-tsvs/" + phecode + ".gwas.imputed_v3.male.tsv.bgz -O " + phecode + ".gwas.imputed_v3.male.tsv.bgz")
	file_name = f"{phecode}.gwas.imputed_v3.male.tsv"
if sex == "b":
	print("both")
	#os.system("wget https://broad-ukb-sumstats-us-east-1.s3.amazonaws.com/round2/additive-tsvs/" + phecode + ".gwas.imputed_v3.both_sexes.tsv.bgz -O " + phecode + ".gwas.imputed_v3.both_sexes.tsv.bgz")
	file_name = f"{phecode}.gwas.imputed_v3.both_sexes.tsv"

#os.system("gunzip -c " + file_name + ".bgz >" + file_name)

#os.system('''awk '{FS="\t|:"; if(($4=="A" || $4=="G" || $4=="C" || $4=="T")&&($3=="A" || $3=="G" || $3=="C" || $3=="T")){print $0}} ' ''' + file_name + ''' >> cleaned.tsv''')

#os.system('''awk '{FS="\t"; if($12 != "NaN"){print $0}}' cleaned.tsv >> newcleaned.tsv''')


