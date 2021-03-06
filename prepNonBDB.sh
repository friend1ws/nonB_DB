#! /bin/bash

rm -rf human_hg19.tsv.tar.gz

wget https://isp.ncifcrf.gov/isp/nonb_dwnld/human_hg19/human_hg19.tsv.tar.gz
tar zxvf human_hg19.tsv.tar.gz

echo "python merge_nonBDB.py > nonB_DB.bed.temp"
python merge_nonBDB.py > nonB_DB.bed.temp

echo "sort -k1,1 -k2,2n -k3,3n nonB_DB.bed.temp > nonB_DB.bed"
sort -k1,1 -k2,2n -k3,3n nonB_DB.bed.temp > nonB_DB.bed

echo "bgzip -f nonB_DB.bed"
bgzip -f nonB_DB.bed

echo "tabix -f -p bed nonB_DB.bed.gz"
tabix -f -p bed nonB_DB.bed.gz


