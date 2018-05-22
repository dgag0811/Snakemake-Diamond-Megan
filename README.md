# Snakemake-Diamond-Megan

Reference research papers: 

1.“Fast and sensitive protein alignment using DIAMOND”, Benjamin Buchfink et al, Nature, 2015.

2.“Functional Analysis in Metagenomics Using MEGAN 6”, S. Beier et al, Springer Nature, 2017.

3.“Snakemake—a scalable bioinformatics workflow engine”, J. Koster & S. Rahmann, Bioinformatics, 2012.

4."QIIME allows analysis of high-throughput community sequencing data", J.G. Caporaso et al, Nature, 2010




~First Pipeline : snakemake-megan-diamond
	
Reference : https://gitlab.com/hjruscheweyh/megan_snakemake/blob/master/daa2rma/howto
•	metagenome_analysis/data/analysis1-> install snakemake and snakemake-tutorial folder
•	metagenome_analysis/data/analysis1/snakemake-tutorial -> install diamond binary file, Megan.sh binary file and megan folder

1.Install Snakemake
	
	a.Reference : http://snakemake.readthedocs.io/en/stable/getting_started/installation.html
	
	b.To install snakemake first install Miniconda and then install snakemake using that: 
		$ cd metagenome_analysis/data/analysis1
		$ conda install -c bioconda snakemake
	
	c.Download the .yaml file needed for installation using the tutorial: 
		$ wget https://bitbucket.org/snakemake/snakemake-tutorial/get/v3.11.0.tar.bz2
		$ tar -xf v3.11.0.tar.bz2 --strip 1
		(You just need the .yaml file)
	
	d.You need a configuration file which is a .yaml file for creating an environment:  
		$ conda env create --name snakemake1 --file environment.yaml     
	
	e.Activate the environment: $ source activate snakemake1

2.Setup of DIAMOND environment through Snakemake workflow
	
	a. Reference : https://github.com/bbuchfink/diamond
	
	b.$cd metagenome_analysis/data/analysis1/snakemake-tutorial/test1
	Install Diamond binary file (just binary file is enough in case of diamond)
	
	c.Create the nr.dmnd reference file after following all the instructions of github
	
	d.Install ATOM editor for creating ‘Snakefile’ through which the program is executed.
	
	e.Inside the Snakefile ( no other name will be recognized by Snakemake) the actual 'rules' i.e. the code will be written, Snakefile will be in the folder where environment.yaml is there.

3.Setup of Megan environment
(We need this for daa2rma tool)
	
	a.Download the lastest megan.sh file in the working directory from http://ab.inf.uni-tuebingen.de/data/software/megan6/download/welcome.html
	
	b.Use the following command to convert the file into binary file
		$chmod +x MEGAN.sh(change the name accordingly to the file you downloaded)
	
	c.Use the following command to download the tools in the megan directory
		$./MEGAN.sh
		install the megan folder in the metagenome_analysis/data/analysis1/snakemake-tutorial/test1 folder
	
	d. Go to the megan directory and use the tool daa2rma
	
	$cd metagenome_analysis/data/analysis1/snakemake-tutorial 
	$snakemake {sample file}.rma
	
#To use the Snakemake workflow, use the command snakemake (output file name). In case of more than one file use snakemake {A,B}.rma file. 
(Reference : https://snakemake.readthedocs.io/en/stable/tutorial/basics.html)



~Second Pipeline QIIME2

Setup of QIIME2 environment 

	a.	Reference : https://docs.qiime2.org/2018.4/

	b.	To download the .yaml file: 
		$wget https://data.qiime2.org/distro/core/qiime2-2018.2-py35-linux-conda.yml
		
	c.	To create an environment :
		$conda env create -n qiime2 --file qiime2-2018.2-py35-linux-conda.yml
		
	d.	Sample data:
		$ftp://ftp.microbio.me/pub/qiime-files/qiime_overview_tutorial.zip


