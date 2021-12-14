#parallel -j 10 "/programs/augustus-3.2.2/bin/augustus --strand=both --genemodel=complete --AUGUSTUS_CONFIG_PATH=/programs/augustus-3.2.2/config/ --gff3=on --UTR=off --species=BUSCO_Waus_genome_busco_3221505476 {1} > {1}.gff3" ::: *.fa 
#parallel -j 10 "iconv -f utf-8 -t ascii -c {1} > {1}.ascii" ::: split*.gff3
parallel -j 10 "convert_augustus_to_gff3.py -i {1} -o {1}.biocode.gff3" ::: *.ascii
