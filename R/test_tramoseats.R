library(RJDemetra)
library(RJDemetra3)

load("./Data/retail.rda")

spec<-"RSAfull"

t0<-Sys.time()
ts_all<-lapply(retail, function(z){RJDemetra::tramoseats(z,spec)})
t1<-Sys.time()
cat("\nRJD:\n")
cat(t1-t0)

t0<-Sys.time()
ts3_all<-lapply(retail, function(z){RJDemetra3::tramoseats(z,spec)})
t1<-Sys.time()
cat("\nRJD3:\n")
cat(t1-t0)


