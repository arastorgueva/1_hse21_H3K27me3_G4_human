source('lib.R')

###

 if (!requireNamespace("BiocManager", quietly = TRUE))
   install.packages("BiocManager")
 BiocManager::install("TxDb.Hsapiens.UCSC.hg19.knownGene")
# BiocManager::install("TxDb.Mmusculus.UCSC.mm10.knownGene")

install.packages('ChIPseeker', lib = "C:/Users/admin/Documents/R/win-library/4.1/")
install.packages('TxDb.Hsapiens.UCSC.hg19.knownGene', lib = "C:/Users/admin/Documents/R/win-library/4.1/")
install.packages('clusterProfiler', lib = "C:/Users/admin/Documents/R/win-library/4.1/")

require("ChIPseeker", lib.loc="C:/Users/admin/Documents/R/win-library/4.1/")
require(TxDb.Hsapiens.UCSC.hg19.knownGene)
#txdb <- TxDb.Hsapiens.UCSC.hg19.knownGene
#library(TxDb.Mmusculus.UCSC.mm10.knownGene)
require(clusterProfiler)

###

#NAME <- 'H3K27me3_K562.intersect_with_G4'
#NAME <- 'G4'
#NAME <- 'H3K27me3_K562.intersect_with_G4'
NAME <- 'H3K27me3_K562.ENCFF801AHF.hg19.filtered'
#NAME <- 'H3K27me3_K562.ENCFF881ONN.hg19.filtered'
BED_FN <- paste0(DATA_DIR, NAME, '.bed')

###

txdb <- TxDb.Hsapiens.UCSC.hg19.knownGene

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