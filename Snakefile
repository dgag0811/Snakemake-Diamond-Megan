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
           'test1/DAAfiles/{sample}.daa'
     output:
           'test1/RMAfiles/{sample}.rma'
     shell:
           'test1/megan/tools/daa2rma --in {input} --out {output} --acc2taxa test1/prot_acc2tax-Mar2018X1.abin --acc2eggnog test1/acc2eggnog-Oct2016X.abin --acc2seed test1/acc2seed-May2015XX.abin --acc2interpro2go test1/acc2interpro-Nov2016XX.abin'

rule rma2info:
    input:
        'test1/RMAfiles/{sample}.rma'
    output:
        'test1/InfoFiles/{sample}.txt'
    shell:
        'test1/megan/tools/rma2info --in {input} --class2count Taxonomy --paths --majorRanksOnly --names > {output}'
        

