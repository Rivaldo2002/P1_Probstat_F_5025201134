'3'
'a'
dpois(x = 6, lambda = 4.5)
'b'
data.kelahiran <- rpois( n = 365, lambda = 4.5)
print(data.kelahiran)
mean(data.kelahiran == 6)

library(dplyr)
library(ggplot2)
data.anak <- data.frame('kelahiran' = data.kelahiran)

data.anak %>% ggplot() +
  geom_histogram(aes(x = kelahiran,
                     y = stat(count / sum(count)),
                     fill = kelahiran == 6),
                 binwidth = 1,
                 color = 'black',) +
  scale_x_continuous(breaks = 0:10) + 
  labs( title = 'Probabilitas Kelahiran 6 Bayi Akan Lahir Di Rumah Sakit Ini  Selama Setahun',
        x = 'Kelahiran anak',
        y = 'Probabilitas',) +
  theme_bw()
'd'
rataan.poisson = 4.5
print(rataan.poisson)
varian.poisson = 4.5
print(varian.poisson)