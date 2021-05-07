library(RJDemetra)
suppressPackageStartupMessages(library(RJDemetra3))

DATA<-retail

spec<-"TRfull"
dspec<-regarima_spec_tramoseats(spec, estimate.tol = 1e-9)
t0<-Sys.time()
tramo<-lapply(DATA, function(z){RJDemetra::regarima(z, dspec)})
t1<-Sys.time()
cat("\nRJD:\n")
cat(t1-t0)

s3<-spec_tramo_default(spec)
s3$estimate$tol<-1e-9
t0<-Sys.time()
tramo3<-lapply(DATA, function(z){tramo(z,s3)})
t1<-Sys.time()
cat("\nRJD3:\n")
cat(t1-t0)

ll<-sapply(tramo, function(z){z$loglik[1]})
ll3<-sapply(tramo3, function(z){z$result$estimation$likelihood$ll})
dll<-cbind(ll, ll3, ll3-ll)

print(dll)
plot(dll[,3])

