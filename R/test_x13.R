library(RJDemetra)

spec<-"RSA5"

dspec<-x13_spec(spec, estimate.tol = 1e-9)
t0<-Sys.time()
x13_all<-lapply(rjd3toolkit::retail, function(z){RJDemetra::x13(z,dspec)})
t1<-Sys.time()
cat("\nRJD:\n")
cat(t1-t0)

s3<-rjd3x13::x13_spec(spec)
s3$regarima$estimate$tol<-1e-9

t0<-Sys.time()
x133_all<-lapply(rjd3toolkit::retail, function(z){rjd3x13::x13_fast(z,s3)})
t1<-Sys.time()
cat("\nRJD3:\n")
cat(t1-t0)

t0<-Sys.time()
x11_all<-lapply(rjd3toolkit::retail, function(z){rjd3x13::x11(z, rjd3x13::x11_spec())})
t1<-Sys.time()
cat("\nX11:\n")
cat(t1-t0)

sa<-lapply(x13_all, function(z){z$final$series[,"sa"]})
sa3<-lapply(x133_all, function(z){z$final$d11final})

del<-lapply(1:length(x13_all), function(i){summary(abs(sa[[i]]-sa3[[i]])/sa[[i]])})
plot(sapply(del, function(x){log10(x[5])}))
