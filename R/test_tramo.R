library(RJDemetra)
suppressPackageStartupMessages(library(RJDemetra3))

load("./Data/retail.rda")

spec<-"TRfull"

t0<-Sys.time()
tramo<-lapply(retail, function(z){RJDemetra::regarima_tramoseats(z,spec)})
t1<-Sys.time()
cat("\nRJD:\n")
cat(t1-t0)

t0<-Sys.time()
tramo3<-lapply(retail, function(z){RJDemetra3::tramo(z,spec)})
t1<-Sys.time()
cat("\nRJD3:\n")
cat(t1-t0)

ll<-sapply(tramo, function(z){z$loglik[1]})
ll3<-sapply(tramo3, function(z){z$likelihood$ll})
dll<-cbind(ll, ll3, ll3-ll)

print(dll)
plot(dll[,3])

