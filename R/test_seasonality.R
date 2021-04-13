suppressPackageStartupMessages(library(rjd3modelling))
suppressPackageStartupMessages(library(rjd3sa))

s<-Imports$Latvia

plot(s)
st<-do.stationary(log(s), 12)

qs<-seasonality.qs(st$ddata, 12)
print(qs)

f<-seasonality.f(log(s), 12, model = "AR")
print(f)

kw<-seasonality.kruskalwallis(st$ddata, 12)
print(kw)

fr<-seasonality.friedman(st$ddata, 12)
print(fr)

lapply(Exports, function(z){st<-do.stationary(log(z), 12); return (seasonality.combined(st$ddata, 12, 1+st$differences[2,1], mul = F)$seasonality)})


z<-tramoseats(log(s))
cs<-seasonality.combined(z$result$decomposition$stochastics$i$data, period=12, mul = F)

print(cs)



