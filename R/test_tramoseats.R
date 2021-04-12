library(RJDemetra)
suppressPackageStartupMessages(library(RJDemetra3))

DATA<-retail
spec<-"RSAfull"

dspec<-tramoseats_spec(spec, estimate.tol = 1e-9)
t0<-Sys.time()
ts_all<-lapply(DATA, function(z){RJDemetra::tramoseats(z,dspec)})
t1<-Sys.time()
cat("\nRJD:\n")
cat(t1-t0)

s3<-RJDemetra3::spec_tramoseats_default(spec)
s3$tramo$estimate$tol<-1e-9

t0<-Sys.time()
#ts3_all<-lapply(DATA, function(z){RJDemetra3::fast.tramoseats(z,spec)})
ts3_all<-lapply(DATA, function(z){RJDemetra3::fast.tramoseats(z,s3)})
t1<-Sys.time()
cat("\nRJD3:\n")
cat(t1-t0)


sa<-lapply(ts_all, function(z){z$final$series[,"sa"]})
sa3<-lapply(ts3_all, function(z){z$final$sa$data})

del<-lapply(1:length(ts_all), function(i){summary(abs(sa[[i]]-sa3[[i]])/sa[[i]])})
plot(sapply(del, function(x){log10(x[5])}))

q<-t(sapply(ts3_all, function(z){return (as.array(z$diagnostics$vardecomposition))}))
plot(unlist(q[,1]), unlist(q[,2]) )
plot(unlist(q[,4]), type='h' )
