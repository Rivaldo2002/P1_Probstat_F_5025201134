# P1_Probstat_F_5025201134
## Laporan Praktikum Modul 1 
**Nama  : Rivaldo Panangian Tambunan**

**NRP   : 5025201134**

**Kelas : F**

***
## **Soal 1**
Seorang penyurvei secara acak memilih orang-orang di jalan sampai dia bertemu dengan seseorang yang menghadiri acara vaksinasi sebelumnya.

### A.
Berapa peluang penyurvei bertemu x = 3 orang yang tidak menghadiri acara vaksinasi sebelum keberhasilan pertama ketika p = 0,20 dari populasi menghadiri acara vaksinasi ? (distribusi Geometrik).

``` 
# A
dgeom ( x = 3, prob = .2)
## Hasil = 0.1024
```
![Picture1](https://user-images.githubusercontent.com/71111983/162616085-7ae3c6f4-3d7f-4fea-bbeb-fb361c6ada4a.png)

### B.
mean Distribusi Geometrik dengan 10000 data random , prob = 0,20 dimana distribusi geometrik acak tersebut X = 3 ( distribusi geometrik acak () == 3 ).
``` 
# B
data <- rgeom ( n = 10000, prob = .2)
mean(data == 3)
## Hasil = 0.0977
```
![Picture2](https://user-images.githubusercontent.com/71111983/162616277-78863f5f-5838-42d3-a740-b940b77b1e0a.png)

### C.
Bandingkan Hasil poin a dan b , apa kesimpulan yang bisa didapatkan?
``` 
# C
Kesimpulannya yang di dapat dari hasil poin a dan b adalah peluang distribusi geomteri yang di dapat pada poin a akan mendekati dengan poin b
```

### D.
mean Distribusi Geometrik dengan 10000 data random , prob = 0,20 dimana distribusi geometrik acak tersebut X = 3 ( distribusi geometrik acak () == 3 ).
``` 
# D
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
```
Berikut adalah Histogram untuk 10000 data random , prob = 0,20 dimana distribusi geometrik acak tersebut X = 3

![Picture3](https://user-images.githubusercontent.com/71111983/162616409-dcb139c2-57cd-4858-a954-0d4aa8173602.png)

### E.
Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Geometrik.
``` 
# E
mean(data)
var(data)
## Hasil = 
mean = 4.0259
varian = 20.14184
```
![Picture4](https://user-images.githubusercontent.com/71111983/162616708-ad339ae1-ffea-4e5f-812c-f698948d0adf.png)

***
## **Soal 2**
Terdapat 20 pasien menderita Covid19 dengan peluang sembuh sebesar 0.2. Tentukan :

### A.
Peluang terdapat 4 pasien yang sembuh
``` 
# A
dbinom( x = 4, size = 20, prob = .2)
## Hasil = 0.2181994
```
![Picture5](https://user-images.githubusercontent.com/71111983/162616833-cc0b84b9-2d63-438a-8569-a2e6989095fb.png)

``` 
### B.
Gambarkan grafik histogram berdasarkan kasus tersebut.
# B
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
```
Berikut adalah histogram untuk Peluang terdapat 4 pasien yang sembuh dari 20 pasien menderita Covid19 dengan peluang sembuh sebesar 0.2

![Picture6](https://user-images.githubusercontent.com/71111983/162616904-6a0c5052-3aa7-4869-8e99-7e3bd20ba2d2.png)

### C.
Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Binomial.
``` 
# C
mu = 20 * 0.2
var = 20 * 0.2 * 0.8
## Hasil = 
mu = 4
var = 3.2
```
Dalam distribusi binomial kita mencari rataan dengan cara mengkali n (banyak pasien) dengan p(peluang sembuh) dan untuk varian kita mengkali kan dengan n (banyak pasien) , p(peluang sembuh), dan q(1-p).

![Picture7](https://user-images.githubusercontent.com/71111983/162617251-4b9bf52f-3f49-4e2c-bb76-0db9c9d74995.png)

***
## **Soal 3**
Diketahui data dari  sebuah tempat bersalin di rumah sakit tertentu menunjukkan rata-rata historis 4,5 bayi lahir di rumah sakit ini setiap hari. (gunakan Distribusi Poisson)

### A.
Berapa peluang bahwa 6 bayi akan lahir di rumah sakit ini besok?
``` 
# A
dpois(x = 6, lambda = 4.5)
## Hasil = 0.1281201
```
![Picture8](https://user-images.githubusercontent.com/71111983/162617356-552d7830-746c-4730-9ee1-6128d012d694.png)

### B.
simulasikan dan buatlah histogram kelahiran 6 bayi akan lahir di rumah sakit ini  selama setahun (n = 365)
``` 
# B
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
```
Berikut adalah histogram untuk Peluang kelahiran 6 bayi di rumah sakit selama satu tahun
![Picture9](https://user-images.githubusercontent.com/71111983/162617556-e18dbe98-ef0d-4daa-873e-63381d9f6442.png)

### C.
dan bandingkan hasil poin a dan b , Apa kesimpulan yang bisa didapatkan
``` 
# C
pada poin a kita mendapatkan bahwa peluang untuk mendapatkan kelahiran 6 anak menggunakan peluang distribusi poison adalah sebesar 0.1281201. dan untuk poin b kita mendapatkan 0.1205479. dari situ dapat kita simpulkan bahwa mendapatkan peluang menggunakan dpois hasilnya akan mendekati dengan menggunakan percobaan yang didapatkan dari sebuah data acak sebanyak 365
```

### D.
Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Poisson
``` 
# D
Rataan (μ) = 4.5
Varian (σ²) = 4.5
Dikarenakan pada distribusi poisson lamda yang diberitahukan pada soal sama dengan rataan dan juga varian. maka rataa = 4.5 dan varian = 4.5
```
***
## **Soal 4**
Diketahui data dari  sebuah tempat bersalin di rumah sakit tertentu menunjukkan rata-rata historis 4,5 bayi lahir di rumah sakit ini setiap hari. (gunakan Distribusi Poisson)
### A.
Diketahui nilai x = 2 dan v = 10. Tentukan:
``` 
# A
dchisq(2, df = 10)
## Hasil = 0.007664155
```
![Picture10](https://user-images.githubusercontent.com/71111983/162617846-4c27c7e7-39a0-44c8-bf00-9ea37da1d38f.png)

### B.
Histogram dari Distribusi Chi-Square dengan 100 data random.
``` 
# B
hist(rchisq (100, 10))
```
Berikut adalah Histogram dari Distribusi Chi-Square dengan 100 data random.

![Picture19](https://user-images.githubusercontent.com/71111983/162619760-95139d20-59fe-4026-96f5-e8a53d87d527.png)

### C.
Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Chi-Square.
``` 
# C
Rataan = 10
print(Rataan)
Varian = 2 * 10
print(Varian)
## Hasil = 
Rataan = 10
Varian = 20
```
![Picture12](https://user-images.githubusercontent.com/71111983/162618404-be70c617-69a1-4172-a5ca-437f4f684f1d.png)

## **Soal 5**
Diketahui bilangan acak (random variable) berdistribusi exponential (λ = 3). Tentukan
### A.
Fungsi Probabilitas dari Distribusi Exponensial
``` 
# A
dexp(3)
## Hasil = 0.04978707
```
![Picture13](https://user-images.githubusercontent.com/71111983/162618472-d149ffc0-5ac8-47c6-b126-59dde85e4ded.png)
### B.
Histogram dari Distribusi Exponensial untuk 10, 100, 1000 dan 10000 bilangan random
``` 
# B
'10 data acak'
set.seed(1)
hist(rexp(10))

'100 data acak'
set.seed(1)
hist(rexp(100))

'1000 data acak'
set.seed(1)
hist(rexp(1000))

'10000 data acak'
set.seed(1)
hist(rexp(10000))
```
![Picture14](https://user-images.githubusercontent.com/71111983/162618913-a868284a-bd0d-4a95-8ff6-92527cb2a8c3.png)
![Picture15](https://user-images.githubusercontent.com/71111983/162618921-3a4a9d95-1871-4548-8c41-b8a6c3d6fef6.png)
![Picture16](https://user-images.githubusercontent.com/71111983/162618925-a656001a-b930-4086-a31e-3e6c49f7c9f2.png)
![Picture17](https://user-images.githubusercontent.com/71111983/162618927-239c7075-fc7c-4dc2-9b8f-3983dd00ae30.png)

### C.
Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Exponensial untuk n = 100 dan λ = 3 Petunjuk: Gunakan set.seed(1) ,Gunakan fungsi bawaan R
``` 
# C
Rataan.exp = 3
print(Rataan.exp)
varian.exp = 3 * 3
print(varian.exp)
## Hasil = 
Rataan = 3
Varian = 9
```
![Picture18](https://user-images.githubusercontent.com/71111983/162619286-edfca90f-a156-4c41-a46b-bbbbdd4369e4.png)

## **Soal 6**
Diketahui generate random nilai sebanyak 100 data, mean = 50, sd = 8. Tentukan
### A.
Fungsi Probabilitas dari Distribusi Normal P(X1 ≤ x ≤ X2), hitung Z-Score Nya dan plot data generate randomnya dalam bentuk grafik. Petunjuk(gunakan fungsi plot()).
Keterangan : 
X1 = Dibawah rata-rata 
X2 = Diatas rata-rata
Contoh data :
1,2,4,2,6,3,10,11,5,3,6,8
rata-rata = 5.083333
X1 = 5
X2 = 6
``` 
# A
rnorm(100, mean = 50, sd = 8)
data.normal <- rnorm(100, mean = 50, sd = 8)
plot (data.normal)
```
Berikut adalah data acak dari sebuah distribusi normal dan juga plot dari data acak tersebut
![Picture20](https://user-images.githubusercontent.com/71111983/162620410-2fe084e7-2996-4f0a-84f9-a83d529918cf.png)

![Picture21](https://user-images.githubusercontent.com/71111983/162620413-97e0e6a1-81e7-408d-b37f-e76bcb634ce2.png)

### B.

``` 
# B
hist(data.normal, breaks = 50, main="5025201134_Rivaldo Panangian Tambunan_F_DNhistogram")
```
Berikut adalah histogram dari  generate random nilai sebanyak 100 data, mean = 50, sd = 8 menggunakan distribusi normal
![Picture22](https://user-images.githubusercontent.com/71111983/162620725-5bdbae24-012d-497e-a75b-879a827365ce.png)

``` 
# C
varian.normal = 8*8
print (varian.normal)
## Hasil = 
Varian = 64
```
![Picture23](https://user-images.githubusercontent.com/71111983/162620941-85d0ecfe-7c31-418e-8d76-90c7ee37042b.png)

### Referensi
https://www.statology.org/dgeom-pgeom-qgeom-rgeom-r/ = distribusi geometrik
https://www.statology.org/dnorm-pnorm-rnorm-qnorm-in-r/ =  distribusi normal
https://www.statology.org/dpois-ppois-qpois-rpois-r/ =  distribusi poisson
https://www.statology.org/dbinom-pbinom-qbinom-rbinom-in-r/ =  distribusi binomial
https://www.statology.org/chi-square-distribution-in-r-dchisq-pchisq-qchisq-rchisq/ = distribusi Chi-Square
https://www.statology.org/plot-exponential-distribution-in-r/ =  distribusi exponensial
https://bookdown.org/gabriel_butler/ECON41Labs/tutorial-5-the-poisson-distribution.html#predicting-the-number-of-babies-born-in-a-hospital
https://rpubs.com/mpfoley73/458721



