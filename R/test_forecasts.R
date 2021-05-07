suppressPackageStartupMessages(library(rjd3tramoseats))
suppressPackageStartupMessages(library(rjd3sts))

sf<-sts.forecast(retail$UsedCarDealers, model="none", nf=6)
tf<-tramo.forecast(retail$UsedCarDealers, spec="tr0", nf=6)

plot(sf[,1], type="l")
lines(tf[,1], col="red")

plot(sf[,2], type="l")
lines(tf[,2], col="red")