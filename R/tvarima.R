#linear params, from a to b (for testing only)
tvparam<-function(n, a=0, b=.99){
  step<-(b-a)/(n-1)
  return (seq(a, b, step ))
}

s<-log(rjd3toolkit::retail$RetailSalesTotal)
# regular ma params
th<-tvparam(length(s))
# seasonal ma params
bth<-tvparam(length(s), .99, .7)

# creates an airline model
airline<-function(period, th, bth){
  sarima<-rjd3toolkit::sarima_model("m", period, NULL, 1, th, NULL, 1, bth)
  return (sarima)
}

# time varying decomposition at point idx (we apply canonical decomposition and Kalman filter estimates
#  (WK estimates could be used)
.tvdecomp<-function(s, idx, period=12, th, bth){
  m<-airline(period, -th, -bth)
  ucm<-rjd3tramoseats::seats_decompose(m)
  q<-rjd3toolkit::ucarima_estimate(s, ucm, stdev = FALSE)
  
  return (q[idx,])
}

# time varying decomposition (non-optimized)
tvdecomp<-function(s, period=12, ths, bths){
  sapply(1:length(s), function(idx){.tvdecomp(s,idx,period,ths[idx], bths[idx])})  
}

w<-t(tvdecomp(s, 12, th, bth))

#ts.plot(cbind(s, w[,1], s-w[,2]), type='l')
matplot(w[,c(2,3)], type='l')

decomp<-function(s, period=12, th, bth){
  m<-airline(period, -th, -bth)
  ucm<-rjd3tramoseats::seats_decompose(m)
  q<-rjd3toolkit::ucarima_estimate(s, ucm, stdev = FALSE)
  
  return (q)
}

q<-decomp(s, 12, .6, .6)

#ts.plot(cbind(s, q[,1], s-q[,2]), type='l')
matplot(q[,c(2,3)], type='l')

