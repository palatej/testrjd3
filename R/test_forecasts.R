load("./Data/spain.rda")


sf<-rjd3sts::sts.forecast(spain$IPI_GEN, model="none", nf=12)
tf<-rjd3tramoseats::tramo.forecast(spain$IPI_GEN, spec="tr0", nf=12)

plot(sf[,1], type="l")
lines(tf[,1], col="red")

plot(sf[,2], type="l")
lines(tf[,2], col="red")