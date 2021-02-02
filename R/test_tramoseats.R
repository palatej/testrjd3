library(RJDemetra)
suppressPackageStartupMessages(library(RJDemetra3))

load("./Data/retail.rda")

spec<-"RSA0"

t0<-Sys.time()
ts_all<-lapply(retail, function(z){RJDemetra::tramoseats(z,spec)})
t1<-Sys.time()
cat("\nRJD:\n")
cat(t1-t0)

#s3<-RJDemetra3::spec_tramoseats_default(spec)
#s3$tramo$estimate$tol<-1e-7

t0<-Sys.time()
ts3_all<-lapply(retail, function(z){RJDemetra3::tramoseats(z,spec)})
#ts3_all<-lapply(retail, function(z){RJDemetra3::tramoseats(z,s3)})
t1<-Sys.time()
cat("\nRJD3:\n")
cat(t1-t0)


sa<-lapply(ts_all, function(z){z$final$series[,"sa"]})
sa3<-lapply(ts3_all, function(z){z$final$components[[2]]$data})

del<-lapply(1:length(ts_all), function(i){summary(abs(sa[[i]]-sa3[[i]])/sa[[i]])})
plot(sapply(del, function(x){log10(x[5])}))