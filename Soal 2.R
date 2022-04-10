'2'
'a'
dbinom( x = 4, size = 20, prob = .2)
'b'
library(dplyr)
library(ggplot2)

data.frame(x = 0:5, prob = dbinom( x = 0:5, size = 20, prob = .2)) %>%
  mutate(Pasien = ifelse(x == 4, 4, "lainnya")) %>%
  ggplot(aes(x = factor(x), y = prob, fill = Pasien)) +
  geom_col() +
  geom_text(
    aes(label = round(prob,2), y = prob + 0.01),
    position = position_dodge(0.9),
    size = 5,
    vjust = 0
  ) +
  labs(title = "Probabilitas 4 Pasien Yang Sembuh Dari 20 Pasien Yang Terkena Covid-19",
       x = "Pasien yang sembuh dari Covid-19",
       y = "Probabilitas")
'c'
mu = 20 * 0.2
print(mu)
var = 20 * 0.2 * 0.8
print(var)