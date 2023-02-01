
Imports<-rjd3toolkit::Imports
s<-Imports$Latvia

plot(s)
st<-rjd3toolkit::do_stationary(log(s), 12)

qs<-rjd3toolkit::seasonality_qs(st$ddata, 12)
print(qs)

f<-rjd3toolkit::seasonality_f(log(s), 12, model = "AR")
print(f)

kw<-rjd3toolkit::seasonality_kruskalwallis(st$ddata, 12)
print(kw)

fr<-rjd3toolkit::seasonality_friedman(st$ddata, 12)
print(fr)


w<-lapply(Imports, function(z){st<-rjd3toolkit::do_stationary(z, 12); 
return (rjd3toolkit::seasonality_kruskalwallis(st$ddata, period=12)$pvalue)})
print(w[w>0.05])

z<-rjd3tramoseats::tramoseats(log(s))
cs<-rjd3toolkit::seasonality_combined(z$result$decomposition$stochastics$i$data, period=12, mul = F)

print(cs)



