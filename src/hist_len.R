getwd()
setwd('C:/Users/admin/Desktop/3-4_module/bioinf_epigen/GitHub/1_hse21_H3K27me3_G4_human/src/')

source('lib.R')

#NAME <- "H3K27me3_K562.ENCFF801AHF.hg19"
#NAME <- "H3K27me3_K562.ENCFF801AHF.hg38"
#NAME <- "H3K27me3_K562.ENCFF881ONN.hg19"
#NAME <- "H3K27me3_K562.ENCFF881ONN.hg38"

#NAME <- 'G4_seq_Li_KPDS_merged'
#NAME <- 'H3K27me3_K562.intersect_with_G4_seq_Li_KPDS'


bed_df <- read.delim(paste0(DATA_DIR, NAME, '.bed'), as.is = TRUE, header = FALSE)
colnames(bed_df) <- c('chrom', 'start', 'end')
bed_df$len <- bed_df$end - bed_df$start
head(bed_df)


ggplot(bed_df) +
  aes(x = len) +
  geom_histogram() +
  ggtitle(NAME, subtitle = sprintf('Number of peaks = %s', nrow(bed_df))) +
  theme_bw()
ggsave(paste0('len_hist.', NAME, '.pdf'), path = OUT_DIR)
