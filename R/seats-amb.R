
airline_decomposition<-function(period, th, bth){
  sarima<-rjd3toolkit::sarima_model("m", period, NULL, 1, th, NULL, 1, bth)
  return (rjd3tramoseats::seats_decompose(sarima))
}

airline.variances<-function(period, th, bth){
  ucm<-airline_decomposition(period, th, bth)
  if (is.null(ucm)) return (c(NA, NA, NA)) else return (c(ucm$components[[1]]$var, 
                                                          ucm$components[[2]]$var, 
                                                          ucm$components[[3]]$var))
}

# Gets the variances of the canonical decomposition for airline models with different parameters
vars<-sapply(seq(.3, -.99, -.01), function(bth){return (airline.variances(12,-.5, bth))})

# trend
matplot(t(vars), type = 'b', pch=18)

ucm1<-airline_decomposition(23,-.8,-.7)

twk1<-rjd3toolkit::ucarima_wk(ucm1, 1)
plot(twk1$gain2, type='l')

ucm2<-airline_decomposition(23,.2,-.7)

twk2<-rjd3toolkit::ucarima_wk(ucm2, 1, T, 1200)
lines(twk2$gain2, col="blue")
