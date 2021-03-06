source('lib.R')

###

 if (!requireNamespace("BiocManager", quietly = TRUE))
   install.packages("BiocManager")
 BiocManager::install("TxDb.Hsapiens.UCSC.hg19.knownGene")
 BiocManager::install('ChIPseeker')
 BiocManager::install('clusterProfiler')
 #BiocManager::install('EnsDb.Hsapiens.v75')
 BiocManager::install('ChIPpeakAnno')
 BiocManager::install("org.Hs.eg.db")
# BiocManager::install("TxDb.Mmusculus.UCSC.mm10.knownGene")


#vignette("ChIPseeker", "ChIPseeker") 
#source("https://bioconductor.org/biocLite.R")
#biocLite("ChIPseeker")
#install.packages('biocLite("ChIPseeker")') 
#install.packages('ChIPseeker', lib = "C:/Users/admin/Documents/R/win-library/4.1/")
#install.packages('TxDb.Hsapiens.UCSC.hg19.knownGene', lib = "C:/Users/admin/Documents/R/win-library/4.1/")
#install.packages('clusterProfiler', lib = "C:/Users/admin/Documents/R/win-library/4.1/")


library(ChIPseeker)
library(TxDb.Hsapiens.UCSC.hg19.knownGene)
#library(TxDb.Mmusculus.UCSC.mm10.knownGene)
library(clusterProfiler)
library(org.Hs.eg.db)

###

#NAME <- 'H3K27me3_K562.ENCFF801AHF.hg19.filtered'
#NAME <- 'H3K27me3_K562.ENCFF881ONN.hg19.filtered'
NAME <- 'G4_seq_Li_KPDS_merged'

BED_FN <- paste0(DATA_DIR, NAME, '.bed')

###

txdb <- TxDb.Hsapiens.UCSC.hg19.knownGene

#library(EnsDb.Hsapiens.v75)
#edb <- EnsDb.Hsapiens.v75
#seqlevelsStyle(edb) <- "UCSC"

peakAnno <- annotatePeak(BED_FN, tssRegion=c(-3000, 3000), TxDb=txdb, annoDb="org.Hs.eg.db")

#pdf(paste0(OUT_DIR, 'chip_seeker.', NAME, '.plotAnnoPie.pdf'))
png(paste0(OUT_DIR, 'chip_seeker.', NAME, '.plotAnnoPie.png'))
plotAnnoPie(peakAnno)
dev.off()

# peak <- readPeakFile(BED_FN)
# pdf(paste0(OUT_DIR, 'chip_seeker.', NAME, '.covplot.pdf'))
# covplot(peak, weightCol="V5")
# dev.off()
# 