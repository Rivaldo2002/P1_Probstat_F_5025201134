'6'
'a'
rnorm(100, mean = 50, sd = 8)
data.normal <- rnorm(100, mean = 50, sd = 8)
mean.dnormal <- mean(data.normal)
X1 <- floor(mean.dnormal)
X2 <- ceiling(mean.dnormal)

plot (data.normal)

'b'
hist(data.normal, breaks = 50, main="5025201134_Rivaldo Panangian Tambunan_F_DNhistogram")

'c'
varian.normal = 8*8
print (varian.normal)