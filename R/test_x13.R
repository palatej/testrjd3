library(RJDemetra)
suppressPackageStartupMessages(library(RJDemetra3))

load("./Data/retail.rda")

spec<-"RSA5"

t0<-Sys.time()
x13_all<-lapply(retail, function(z){RJDemetra::x13(z,spec)})
t1<-Sys.time()
cat("\nRJD:\n")
cat(t1-t0)

s3<-RJDemetra3::spec_x13_default(spec)
s3$tramo$estimate$tol<-1e-9

t0<-Sys.time()
x133_all<-lapply(retail, function(z){RJDemetra3::x13(z,spec)})
#x133_all<-lapply(retail, function(z){RJDemetra3::x13(z,s3)})
t1<-Sys.time()
cat("\nRJD3:\n")
cat(t1-t0)

t0<-Sys.time()
x11_all<-lapply(retail, function(z){RJDemetra3::x11(z, RJDemetra3::spec_x11_default())})
#ts3_all<-lapply(retail, function(z){RJDemetra3::tramoseats(z,s3)})
t1<-Sys.time()
cat("\nX11:\n")
cat(t1-t0)

