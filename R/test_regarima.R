library(RJDemetra)
suppressPackageStartupMessages(library(RJDemetra3))


spec<-"RG5"

t0<-Sys.time()
rg<-lapply(retail, function(z){RJDemetra::regarima_x13(z,spec)})
t1<-Sys.time()
cat("\nRJD:\n")
cat(t1-t0, "\n")

t0<-Sys.time()
rg3<-lapply(retail, function(z){fast.regarima(z,spec)})
t1<-Sys.time()
cat("\nRJD3:\n")
cat(t1-t0,"\n")

ll<-sapply(rg, function(z){z$loglik[1]})
ll3<-sapply(rg3, function(z){z$estimation$likelihood$ll})
dll<-cbind(ll, ll3, ll3-ll)

print(dll)
plot(dll[,3])

