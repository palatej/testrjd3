
tr4<-rjd3tramoseats::tramo_spec("tr4")
tr4$estimate$tol<-1e-9

out1<-rjd3toolkit::add_outlier(tr4, "AO", "2000-12-31", name="out1")
out2<-rjd3toolkit::add_outlier(tr4, "LS", "2008-08-01", name="out2")

s<-window(rjd3toolkit::retail$RetailSalesTotal, end=2009)

qfast<-rjd3tramoseats::tramo_fast(s, tr4)
qfull<-rjd3tramoseats::tramo(s, tr4)

# define a "Frozen" domain
tr4new<-rjd3tramoseats::tramo_refresh(qfull$result_spec, policy="Outliers", end="2009-12-31")
qfastnew<-rjd3tramoseats::tramo_fast(rjd3toolkit::retail$RetailSalesTotal, tr4new)

# Re-estimate all outliers
tr4new2<-rjd3tramoseats::tramo_refresh(qfull$result_spec, policy="Outliers")
qfastnew2<-rjd3tramoseats::tramo_fast(rjd3toolkit::retail$RetailSalesTotal, tr4new2)


sa<-rjd3tramoseats::tramoseats_fast(rjd3toolkit::retail$BookStores)
decomp<-rjd3toolkit::sa_decomposition(sa)

ts.plot(ts.union(decomp$series, decomp$sa, decomp$t), col=c("gray", "blue", "red"))

sax<-rjd3x13::x13_fast(rjd3toolkit::retail$BookStores)
decompx<-rjd3toolkit::sa_decomposition(sax)

ts.plot(ts.union(decompx$series, decompx$sa, decompx$t), col=c("gray", "blue", "red"))
