suppressPackageStartupMessages(library(RJDemetra3))

sa<-fast.tramoseats(retail$BookStores)
decomp<-sa.decomposition(sa)
ts.plot(ts.union(decomp$series, decomp$sa, decomp$t), col=c("gray", "blue", "red"))

sax<-fast.x13(retail$BookStores)
decomp<-sa.decomposition(sax)
ts.plot(ts.union(decomp$series, decomp$sa, decomp$t), col=c("gray", "blue", "red"))

