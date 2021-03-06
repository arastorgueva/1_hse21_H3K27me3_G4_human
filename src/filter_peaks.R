getwd()
setwd('C:/Users/admin/Desktop/3-4_module/bioinf_epigen/GitHub/1_hse21_H3K27me3_G4_human/src/')

source('lib.R')

#NAME <- "H3K27me3_K562.ENCFF801AHF.hg19"
NAME <- "H3K27me3_K562.ENCFF881ONN.hg19"

###

bed_df <- read.delim(paste0(DATA_DIR, NAME, '.bed'), as.is = TRUE, header = FALSE)
colnames(bed_df) <- c('chrom', 'start', 'end', 'name', 'score')
bed_df$len <- bed_df$end - bed_df$start
head(bed_df)

ggplot(bed_df) +
  aes(x = len) +
  geom_histogram() +
  ggtitle(NAME, subtitle = sprintf('Number of peaks = %s', nrow(bed_df))) +
  theme_bw()
#ggsave(paste0('filter_peaks.', NAME, '.init.hist.pdf'), path = OUT_DIR)

# Remove long peaks
bed_df <- bed_df %>%
  arrange(-len) %>%
  filter(len < 5000)

ggplot(bed_df) +
  aes(x = len) +
  geom_histogram() +
  ggtitle(NAME, subtitle = sprintf('Number of peaks = %s', nrow(bed_df))) +
  theme_bw()
ggsave(paste0('filter_peaks.', NAME, '.filtered.hist.pdf'), path = OUT_DIR)

bed_df %>%
  select(-len) %>%
  write.table(file=paste0(DATA_DIR, NAME ,'.filtered.bed'),
              col.names = FALSE, row.names = FALSE, sep = '\t', quote = FALSE)