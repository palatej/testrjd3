
load("./Data/spain.rda")

s<-spain$IPI_GEN

dspec<-rjd3tramoseats::spec_tramoseats_default("rsa0")
dspec$tramo$regression$mean<-NULL

#dspec<-rjd3tramoseats::spec_tramoseats_default("rsafull")

q<-rjd3tramoseats::tramoseats(s, dspec)
spec<-q$result_spec
fspec<-rjd3tramoseats::tramoseats.refresh(spec, dspec, policy = "Fixed")

plot(as.numeric(q$result$final$t$data), type='l')

for (i in 1:10){
  nspec<-fspec
  nspec$tramo$arima$theta[1,1]$value<-nspec$tramo$arima$theta[1,1]$value+i*.03
  p<-rjd3tramoseats::fast.tramoseats(s,spec= nspec)
  lines(as.numeric(p$final$t$data), col="gray")
  nspec<-fspec
  nspec$tramo$arima$theta[1,1]$value<-nspec$tramo$arima$theta[1,1]$value-i*.03
  p<-rjd3tramoseats::fast.tramoseats(s,spec= nspec)
  lines(as.numeric(p$final$t$data), col="gray")
}

lines(as.numeric(q$result$final$t$data), col="red")

plot(as.numeric(q$result$final$sa$data), type='l')

for (i in 1:10){
  nspec<-fspec
  nspec$tramo$arima$theta[1,1]$value<-nspec$tramo$arima$theta[1,1]$value+i*.03
  p<-rjd3tramoseats::fast.tramoseats(s,spec= nspec)
  lines(as.numeric(p$final$sa$data), col="gray")
  nspec<-fspec
  nspec$tramo$arima$theta[1,1]$value<-nspec$tramo$arima$theta[1,1]$value-i*.03
  p<-rjd3tramoseats::fast.tramoseats(s,spec= nspec)
  lines(as.numeric(p$final$sa$data), col="gray")
}

lines(as.numeric(q$result$final$sa$data), col="blue")

plot(as.numeric(q$result$final$t$data), type='l')

for (i in 1:10){
  nspec<-fspec
  nspec$tramo$arima$btheta[1,1]$value<-nspec$tramo$arima$btheta[1,1]$value+i*.03
  p<-rjd3tramoseats::fast.tramoseats(s,spec= nspec)
  lines(as.numeric(p$final$t$data), col="gray")
  nspec<-fspec
  nspec$tramo$arima$btheta[1,1]$value<-nspec$tramo$arima$btheta[1,1]$value-i*.03
  p<-rjd3tramoseats::fast.tramoseats(s,spec= nspec)
  lines(as.numeric(p$final$t$data), col="gray")
}

lines(as.numeric(q$result$final$t$data), col="red")

plot(as.numeric(q$result$final$sa$data), type='l')

for (i in 1:10){
  nspec<-fspec
  nspec$tramo$arima$btheta[1,1]$value<-nspec$tramo$arima$btheta[1,1]$value+i*.03
  p<-rjd3tramoseats::fast.tramoseats(s,spec= nspec)
  lines(as.numeric(p$final$sa$data), col="gray")
  nspec<-fspec
  nspec$tramo$arima$btheta[1,1]$value<-nspec$tramo$arima$btheta[1,1]$value-i*.03
  p<-rjd3tramoseats::fast.tramoseats(s,spec= nspec)
  lines(as.numeric(p$final$sa$data), col="gray")
}

lines(as.numeric(q$result$final$sa$data), col="blue")

