#Snakefile with Hard coding

rule align:
	input:
		fastq = 'test1/SRS011623.fsa',
     	reference = 'test1/nr.dmnd'
	output:
 		'test1/s.daa'
 	shell:
 		'test1/diamond blastx --query {input.fastq} --db {input.reference} --daa {output}'

rule view:
 	input:
 		'test1/s.daa'
 	output:
   		'test1/s.m8'
 	shell:
   		'test1/diamond view -a {input} -o {output}'

rule daa2rma:
     input:
           daa = 'test1/t.daa',
           kegg = 'test1/gi2kegg-Feb2015X.bin',
           gi2taxid = 'test1/gi_taxid-March2015X.bin'
     output:
           'test1/t.rma'
     shell:
           'test1/megan/tools/daa2rma -i {input.daa} -o {output} -g2t {input.gi2taxid} -g2kegg {input.kegg}'

#Snakefile without Hard Coding

rule align:
    input:
      fastq = 'test1/SAMPLES/{sample}.fsa',
      reference = 'test1/nr.dmnd'

    output:
      'test1/DAAfiles/{sample}.daa'

    shell:
        'test1/diamond blastx --query {input.fastq} --db {input.reference} --daa {output}'

rule view:
  input:
    'test1/DAAfiles/{sample}.daa'

  output:
     'test1/M8/{sample}.m8'

  shell:
   'test1/diamond view -a {input} -o {output}'

rule daa2rma:
     input:
           daa = 'test1/DAAfiles/{sample}.daa',
           kegg = 'test1/gi2kegg-Feb2015X.bin',
           gi2taxid = 'test1/gi_taxid-March2015X.bin'
     output:
           'test1/RMAfiles/{sample}.rma'
     shell:
           'test1/megan/tools/daa2rma -i {input.daa} -o {output} -g2t {input.gi2taxid} -g2kegg {input.kegg}'
