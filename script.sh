DATA=./data/luscinia_vars.vcf.gz
< $DATA zcat | grep -v '^#' | grep -e 'chr1\s' -e 'chrZ\s' | cut -f1-6 > six_columns.txt
< $DATA zcat | grep -v '^#' | grep -e 'chr1\s' -e 'chrZ\s' | egrep -o 'DP=[^;]*' | sed 's/DP=//'  > DP.txt
< $DATA zcat | grep -v '^#' | grep -e 'chr1\s' -e 'chrZ\s' | awk '{if($0 ~ /INDEL/) print "INDEL"; else print "SNP"}' > indels.txt

paste six_columns.txt ./DP.txt ./indels.txt > results.txt

rm six_columns.txt ./DP.txt ./indels.txt
