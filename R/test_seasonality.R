library(rjd3sa)

Imports<-rjd3toolkit::Imports
s<-Imports$Latvia

plot(s)
st<-rjd3modelling::do.stationary(log(s), 12)

qs<-seasonality.qs(st$ddata, 12)
print(qs)

f<-seasonality.f(log(s), 12, model = "AR")
print(f)

kw<-seasonality.kruskalwallis(st$ddata, 12)
print(kw)

fr<-seasonality.friedman(st$ddata, 12)
print(fr)


w<-lapply(Imports, function(z){st<-rjd3modelling::do.stationary(z, 12); 
return (seasonality.kruskalwallis(st$ddata, period=12)$pvalue)})
print(w[w>0.05])

z<-rjd3tramoseats::tramoseats(log(s))
cs<-seasonality.combined(z$result$decomposition$stochastics$i$data, period=12, mul = F)

print(cs)



