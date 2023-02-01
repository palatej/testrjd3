
sa<-rjd3tramoseats::fast_tramoseats(rjd3toolkit::retail$BookStores)
decomp<-rjd3toolkit::sa.decomposition(sa)
ts.plot(ts.union(decomp$series, decomp$sa, decomp$t), col=c("gray", "blue", "red"))

sax<-rjd3x13::fast_x13(rjd3toolkit::retail$BookStores)
decomp<-rjd3toolkit::sa.decomposition(sax)
ts.plot(ts.union(decomp$series, decomp$sa, decomp$t), col=c("gray", "blue", "red"))

