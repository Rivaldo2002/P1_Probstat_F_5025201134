'1' 
'a'
dgeom ( x = 3, prob = .2)
'b'
data <- rgeom ( n = 10000, prob = .2)
mean(data == 3)
'c'
library(dplyr)
library(ggplot2)

data.frame(x = 0:5, prob = dgeom(x = 0:5, prob = .2)) %>%
  mutate(Kegagalan = ifelse(x == 3, 3, "lainnya")) %>%
  ggplot(aes(x = factor(x), y = prob, fill = Kegagalan)) +
  geom_col() +
  geom_text(
    aes(label = round(prob,2), y = prob + 0.01),
    position = position_dodge(0.9),
    size = 5,
    vjust = 0
  ) +
  labs(title = "Probabilitas Penyurvei Bertemu x = 3 Orang Yang Tidak Menghadiri Acara Vaksinasi Sebelum keberhasilan Pertama",
       x = "Penyurvei bertemu orang yang tidak menghadiri vaksinansi",
       y = "Probabilitas")
'e'
mean(data)
var(data)

