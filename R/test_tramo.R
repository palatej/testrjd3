library(RJDemetra)

DATA<-rjd3toolkit::retail

spec<-"TRfull"
dspec<-regarima_spec_tramoseats(spec)
t0<-Sys.time()
tramo<-lapply(DATA, function(z){RJDemetra::regarima(z, dspec)})
t1<-Sys.time()
cat("\nRJD:\n")
cat(t1-t0)

s3<-rjd3tramoseats::spec_tramo(spec)
s3$estimate$tol<-1e-9
t0<-Sys.time()
tramo3<-lapply(DATA, function(z){rjd3tramoseats::fast_tramo(z, spec)})
t1<-Sys.time()
cat("\nRJD3:\n")
cat(t1-t0)

ll<-sapply(tramo, function(z){z$loglik[1]})
ll3<-sapply(tramo3, function(z){z$estimation$likelihood$ll})
dll<-cbind(ll, ll3, ll3-ll)

print(dll)
plot(dll[,3])

