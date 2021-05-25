suppressPackageStartupMessages(library(rjd3tramoseats))
suppressPackageStartupMessages(library(rjd3sts))

sf<-sts.forecast(spain$IPI_GEN, model="none", nf=12)
tf<-tramo.forecast(spain$IPI_GEN, spec="tr0", nf=12)

plot(sf[,1], type="l")
lines(tf[,1], col="red")

plot(sf[,2], type="l")
lines(tf[,2], col="red")