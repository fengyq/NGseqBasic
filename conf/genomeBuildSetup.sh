#!/bin/bash

##########################################################################
# Copyright 2016, Jelena Telenius (jelena.telenius@imm.ox.ac.uk)         #
#                                                                        #
# This file is part of NGseqBasic .                                      #
#                                                                        #
# NGseqBasic is free software: you can redistribute it and/or modify     #
# it under the terms of the MIT license.
#
#
#                                                                        #
# NGseqBasic is distributed in the hope that it will be useful,          #
# but WITHOUT ANY WARRANTY; without even the implied warranty of         #
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the          #
# MIT license for more details.
#                                                                        #
# You should have received a copy of the MIT license
# along with NGseqBasic.  
##########################################################################

setGenomeLocations(){

# #############################################################################

# This is the CONFIGURATION FILE to set up your BOWTIE GENOME INDICES ( conf/genomeBuildSetup.sh )

# Fill the locations of :

# - bowtie indices (bowtie 1/2 )
# - ucsc chromosome size files (genomes mm9,mm10,hg18,hg19,hg38,danRer7,danRer10,galGal4,dm3 already supported)
# - blacklisted regions bed files (genomes mm9,mm10,hg18,hg19 already provided)

# As given in below examples

# #############################################################################
# SUPPORTED GENOMES 
# #############################################################################

# Add and remove genomes via this list.
# If user tries to use another genome (not listed here), the run is aborted with "genome not supported" message.

supportedGenomes[0]="mm9"
supportedGenomes[1]="mm10"
supportedGenomes[2]="hg18"
supportedGenomes[3]="hg19"
supportedGenomes[4]="hg38"
supportedGenomes[5]="danRer7"
supportedGenomes[6]="danRer10"
supportedGenomes[7]="galGal4"
supportedGenomes[8]="dm3"
supportedGenomes[9]="dm6"
supportedGenomes[10]="mm10balb"
supportedGenomes[11]="sacCer3"

supportedGenomes[12]="RSmm9CTCFinsFwd"
supportedGenomes[13]="RSmm9CTCFinsRev"
supportedGenomes[14]="RSmm9CTCFinsWT"

# The above genomes should have :
# 1) bowtie1 indices
# 2) bowtie2 indices
# 3) UCSC genome sizes
# 4) List of blacklisted regions (optional)

# Fill these below !


# #############################################################################
# BOWTIE 1 INDICES
# #############################################################################

# These are the bowtie1 indices, built with an UCSC genome fasta (not ENSEMBLE coordinates)
# These need to correspond to the UCSC chromosome sizes files (below)

# You can build these indices with 'bowtie-build' tool of the bowtie package :
# http://bowtie-bio.sourceforge.net/manual.shtml#the-bowtie-build-indexer

# These can be symbolic links to the central copies of the indices.
# By default these are 

BOWTIE1[0]="/databank/igenomes/Mus_musculus/UCSC/mm9/Sequence/BowtieIndex/genome"
# ls -lht /databank/igenomes/Mus_musculus/UCSC/mm9/Sequence/BowtieIndex/      
# -rw-rw-r-- 1 manager staff 2.6G Mar 16  2012 genome.fa
# -rw-rw-r-- 1 manager staff 611M Mar 16  2012 genome.4.ebwt
# -rw-rw-r-- 1 manager staff 702M Mar 16  2012 genome.rev.1.ebwt
# -rw-rw-r-- 1 manager staff 702M Mar 16  2012 genome.1.ebwt
# -rw-rw-r-- 1 manager staff 5.8K Mar 16  2012 genome.3.ebwt
# -rw-rw-r-- 1 manager staff 306M Mar 16  2012 genome.rev.2.ebwt
# -rw-rw-r-- 1 manager staff 306M Mar 16  2012 genome.2.ebwt

BOWTIE1[1]="/databank/igenomes/Mus_musculus/UCSC/mm10/Sequence/BowtieIndex/genome"
BOWTIE1[2]="/databank/igenomes/Homo_sapiens/UCSC/hg18/Sequence/BowtieIndex/genome"
BOWTIE1[3]="/databank/igenomes/Homo_sapiens/UCSC/hg19/Sequence/BowtieIndex/genome"
BOWTIE1[4]="/databank/igenomes/Homo_sapiens/UCSC/hg38/Sequence/BowtieIndex/genome"
BOWTIE1[5]="/databank/igenomes/Danio_rerio/UCSC/danRer7/Sequence/BowtieIndex/genome"
BOWTIE1[6]="/databank/igenomes/Danio_rerio/UCSC/danRer10/Sequence/BowtieIndex/genome"
BOWTIE1[7]="/databank/igenomes/Gallus_gallus/UCSC/galGal4/Sequence/BowtieIndex/genome"
BOWTIE1[8]="/databank/igenomes/Drosophila_melanogaster/UCSC/dm3/Sequence/BowtieIndex/genome"
BOWTIE1[9]="/databank/igenomes/Drosophila_melanogaster/UCSC/dm6/Sequence/BowtieIndex/genome"
BOWTIE1[10]="/t1-data/user/rbeagrie/genomes/balbc/mm10_BALB-cJ_snpsonly/bowtie1-indexes/mm10_BALB-cJ"
BOWTIE1[11]="/databank/igenomes/Saccharomyces_cerevisiae/UCSC/sacCer3/Sequence/BowtieIndex/genome"

BOWTIE1[12]="/t1-data/user/hugheslab/telenius/GENOMES/rosaCTCFmm9_280818/fwd_whole_genome/bowtie1_indices_fwd/Fwdins_whole_genome"
BOWTIE1[13]="/t1-data/user/hugheslab/telenius/GENOMES/rosaCTCFmm9_280818/rev_whole_genome/bowtie1_indices_rev/revins_whole_genome"
BOWTIE1[14]="/t1-data/user/hugheslab/telenius/GENOMES/rosaCTCFmm9_280818/wt_whole_genome/bowtie1_indices_wt/mm9_complete"

# The indices in the BOWTIE1 array refer to genome names in supportedGenomes array (top of page).

# Not all of them need to exist : only the ones you will be using.
# The pipeline checks that at least one index file exists, before proceeding with the analysis.

# When adding new genomes : remember to update the "supportedGenomes" list above as well !


# #############################################################################
# BOWTIE 2 INDICES
# #############################################################################

# These are the bowtie2 indices, built with an UCSC genome fasta (not ENSEMBLE coordinates)
# These need to correspond to the UCSC chromosome sizes files (below)

# You can build these indices with 'bowtie-build' tool of the bowtie2 package :
# http://bowtie-bio.sourceforge.net/bowtie2/manual.shtml#the-bowtie2-build-indexer

# These can be symbolic links to the central copies of the indices.
# By default these are 

BOWTIE2[0]="/databank/igenomes/Mus_musculus/UCSC/mm9/Sequence/Bowtie2Index/genome"

# ls -lht /databank/igenomes/Mus_musculus/UCSC/mm9/Sequence/Bowtie2Index
# -rw-rw-r-- 1 manager staff 2.6G Mar 16  2012 genome.fa
# -rw-rw-r-- 1 manager staff 611M Apr 10  2012 genome.2.bt2
# -rw-rw-r-- 1 manager staff 611M Apr 10  2012 genome.4.bt2
# -rw-rw-r-- 1 manager staff 818M Apr 10  2012 genome.rev.1.bt2
# -rw-rw-r-- 1 manager staff 611M Apr 10  2012 genome.rev.2.bt2
# -rw-rw-r-- 1 manager staff 818M Apr 10  2012 genome.1.bt2
# -rw-rw-r-- 1 manager staff 5.8K Apr 10  2012 genome.3.bt2

BOWTIE2[1]="/databank/igenomes/Mus_musculus/UCSC/mm10/Sequence/Bowtie2Index/genome"
BOWTIE2[2]="/databank/igenomes/Homo_sapiens/UCSC/hg18/Sequence/Bowtie2Index/genome"
BOWTIE2[3]="/databank/igenomes/Homo_sapiens/UCSC/hg19/Sequence/Bowtie2Index/genome"
BOWTIE2[4]="/databank/igenomes/Homo_sapiens/UCSC/hg38/Sequence/Bowtie2Index/genome"
BOWTIE2[5]="/databank/igenomes/Danio_rerio/UCSC/danRer7/Sequence/Bowtie2Index/genome"
BOWTIE2[6]="/databank/igenomes/Danio_rerio/UCSC/danRer10/Sequence/Bowtie2Index/genome"
BOWTIE2[7]="/databank/igenomes/Gallus_gallus/UCSC/galGal4/Sequence/Bowtie2Index/genome"
BOWTIE2[8]="/databank/igenomes/Drosophila_melanogaster/UCSC/dm3/Sequence/Bowtie2Index/genome"
BOWTIE2[9]="/databank/igenomes/Drosophila_melanogaster/UCSC/dm6/Sequence/Bowtie2Index/genome"
BOWTIE2[10]="/t1-data/user/rbeagrie/genomes/balbc/mm10_BALB-cJ_snpsonly/bowtie2-indexes/mm10_BALB-cJ"
BOWTIE2[11]="/databank/igenomes/Saccharomyces_cerevisiae/UCSC/sacCer3/Sequence/Bowtie2Index/genome"

BOWTIE2[12]="/t1-data/user/hugheslab/telenius/GENOMES/rosaCTCFmm9_280818/fwd_whole_genome/bowtie2_indices_fwd/fwdins_whole_genome"
BOWTIE2[13]="/t1-data/user/hugheslab/telenius/GENOMES/rosaCTCFmm9_280818/rev_whole_genome/bowtie2_indices_rev/revins_whole_genome"
BOWTIE2[14]="/t1-data/user/hugheslab/telenius/GENOMES/rosaCTCFmm9_280818/wt_whole_genome/bowtie2_indices_wt/wt_complete"

# The indices in the BOWTIE2 array refer to genome names in supportedGenomes array (top of page).

# Not all of them need to exist : only the ones you will be using.
# The pipeline checks that at least one index file exists, before proceeding with the analysis.

# When adding new genomes : remember to update the "supportedGenomes" list above (top of this file) as well !


# #############################################################################
# UCSC GENOME SIZES
# #############################################################################

# The UCSC genome sizes, for ucsctools .
# By default these are located in the 'conf/UCSCgenomeSizes' folder (relative to location of NGseqBasic.sh main script) .
# All these are already there - they come with the NGseqBasic codes.

# Change the files / paths below, if you want to use your own versions of these files. 

# These can be fetched with ucsctools :
# module load ucsctools
# fetchChromSizes mm9 > mm9.chrom.sizes

UCSC[0]="${confFolder}/UCSCgenomeSizes/mm9.chrom.sizes"
UCSC[1]="${confFolder}/UCSCgenomeSizes/mm10.chrom.sizes"
UCSC[2]="${confFolder}/UCSCgenomeSizes/hg18.chrom.sizes"
UCSC[3]="${confFolder}/UCSCgenomeSizes/hg19.chrom.sizes"
UCSC[4]="${confFolder}/UCSCgenomeSizes/hg38.chrom.sizes"
UCSC[5]="${confFolder}/UCSCgenomeSizes/danRer7.chrom.sizes"
UCSC[6]="${confFolder}/UCSCgenomeSizes/danRer10.chrom.sizes"
UCSC[7]="${confFolder}/UCSCgenomeSizes/galGal4.chrom.sizes"
UCSC[8]="${confFolder}/UCSCgenomeSizes/dm3.chrom.sizes"
UCSC[9]="${confFolder}/UCSCgenomeSizes/dm6.chrom.sizes"
UCSC[10]="${confFolder}/UCSCgenomeSizes/mm10.chrom.sizes"
UCSC[11]="${confFolder}/UCSCgenomeSizes/sacCer3.chrom.sizes"

UCSC[12]="${confFolder}/UCSCgenomeSizes/RSmm9CTCFins.chrom.sizes"
UCSC[13]="${confFolder}/UCSCgenomeSizes/RSmm9CTCFins.chrom.sizes"
UCSC[14]="${confFolder}/UCSCgenomeSizes/RSmm9CTCFwt.chrom.sizes"

# The indices in the UCSC array refer to genome names in supportedGenomes array (top of page).

# Not all of them need to exist : only the ones you will be using.
# The pipeline checks that at least one index file exists, before proceeding with the analysis

# When adding new genomes : remember to update the "supportedGenomes" list above (top of this file) as well !


# #############################################################################
# BLACKLISTED REGIONS FILES
# #############################################################################

# The blacklisted regions, for final filtering of the output files.
# These regions are the high peaks due to collapsed repeats in the genome builds,
# as well as some artifactual regions in the genome builds.
#
# The tracks given with the pipeline are :
#
# ----------------------------------------------
#
# mm9 = intra-house peak call (Jim Hughes research group) of these regions in sonication (control) sample data.
# mm10 = lift-over of the mm9 track
#
# Note that ATAC data usually needs further filtering (some artifactual peaks seem to be ATAC-specific)
#
# ----------------------------------------------
#
# hg18 = duke blacklisted regions wgEncodeDukeRegionsExcluded.bed6.gz http://genome.ucsc.edu/cgi-bin/hgFileUi?db=hg18&g=wgEncodeMapability
#      Principal Investigator on grant 1       Lab producing data 2    View - Peaks or Signals 3       ENCODE Data Freeze 4    Table name at UCSC 5    Size    File Type       Additional Details
#      Crawford        Crawford - Duke University      Excludable      ENCODE Nov 2008 Freeze  wgEncodeDukeRegionsExcluded      19 KB  bed6    subId=104; labVersion=satellite_rna_chrM_500.bed.20080925;
# hg19 = duke blacklisted regions wgEncodeDukeMapabilityRegionsExcludable.bed.gz http://genome.ucsc.edu/cgi-bin/hgFileUi?db=hg19&g=wgEncodeMapability
#      PI1     Lab2    View3   Window size4    UCSC Accession5 Size    File Type       Additional Details
#      Crawford        Crawford - Duke University      Excludable              wgEncodeEH000322         17 KB  bed     dataVersion=ENCODE Mar 2012 Freeze; dateSubmitted=2011-03-28; subId=3840; labVersion=satellite_rna_chrM_500.bed.20080925; 
#
# Duke blacklisted regions are "too stringent" - they tend to filter too much, so even some good data gets filtered at times.
#
# -----------------------------------------------


# By default these are located in the 'conf/blackListedRegions' folder (relative to location of NGseqBasic.sh main script) .
# All these are already there - they come with the NGseqBasic codes.

# Change the files / paths below, if you want to use your own versions of these files.

genomesWhichHaveBlacklist[0]="mm9"
genomesWhichHaveBlacklist[1]="mm10"
genomesWhichHaveBlacklist[2]="hg18"
genomesWhichHaveBlacklist[3]="hg19"
genomesWhichHaveBlacklist[4]="mm10balb"
# The following is not exactly correct, but correct enough.
genomesWhichHaveBlacklist[5]="RSmm9CTCFinsFwd"
genomesWhichHaveBlacklist[6]="RSmm9CTCFinsRev"
genomesWhichHaveBlacklist[7]="RSmm9CTCFinsWT"

# - i.e. : not all genomes have to have a blacklist.
# If the genome is not listed here, blacklist filtering is NOT conducted within the pipeline (turned off automatically).
# It is HIGHLY RECOMMENDED to generate intra-house peak call for ALL GENOMES - from a control (sonication etc) data , however !

BLACKLIST[0]="${confFolder}/BLACKLIST/mm9.bed"
BLACKLIST[1]="${confFolder}/BLACKLIST/mm10.bed"
BLACKLIST[2]="${confFolder}/BLACKLIST/hg18.bed"
BLACKLIST[3]="${confFolder}/BLACKLIST/hg19.bed"
BLACKLIST[4]="${confFolder}/BLACKLIST/mm10.bed"
# The following is not exactly correct, but correct enough.
BLACKLIST[5]="${confFolder}/BLACKLIST/mm9.bed"
BLACKLIST[6]="${confFolder}/BLACKLIST/mm9.bed"
BLACKLIST[7]="${confFolder}/BLACKLIST/mm9.bed"

# The indices in the BLACKLIST array refer to genome names in genomesWhichHaveBlacklist array.

}

