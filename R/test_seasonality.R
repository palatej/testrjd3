
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

test_ch<-function(n=100, freq=12, type="Trigonometric"){
  x<-rnorm(n)
  q<-rjd3toolkit::seasonality_canovahansen(x, freq, lag1=FALSE, type=type)
  return(q$details)
}

mc_ch<-function(n=100, freq=12, type="Trigonometric", rep=100000){
  w<-sapply(rep(n, rep), function(z)test_ch(z, freq, type))
  return(w)
}

w12<-mc_ch(n=80, freq=12, type="Trigonometric", rep=100000)
hist(w12, n=100)
