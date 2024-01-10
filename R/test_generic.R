
sa<-rjd3tramoseats::tramoseats_fast(rjd3toolkit::retail$BookStores)
decomp<-rjd3toolkit::sa_decomposition(sa)
ts.plot(ts.union(decomp$series, decomp$sa, decomp$t), col=c("gray", "blue", "red"))

sax<-rjd3x13::x13_fast(rjd3toolkit::retail$BookStores)
decomp<-rjd3toolkit::sa_decomposition(sax)
ts.plot(ts.union(decomp$series, decomp$sa, decomp$t), col=c("gray", "blue", "red"))

