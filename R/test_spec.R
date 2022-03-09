library(rjd3tramoseats)
library(rjd3modelling)
library(rjd3x13)
library(rjd3sa)

tr4<-spec_tramo_default("tr4")
tr4$estimate$tol<-1e-9

out1<-rjd3modelling::createOutlier("AO", "2000-12-31", name="out1")
out2<-rjd3modelling::createOutlier("LS", "2008-08-01", name="out2")

tr4$regression$outliers<-list(out1, out2)

s<-window(rjd3toolkit::retail$RetailSalesTotal, end=2009)

qfast<-fast.tramo(s, tr4)
qfull<-tramo(s, tr4)

# define a "Frozen" domain
tr4new<-tramo.refresh(qfull$result_spec, policy="Outliers", end="2009-12-31")
qfastnew<-fast.tramo(rjd3toolkit::retail$RetailSalesTotal, tr4new)

# Re-estimate all outliers
tr4new2<-tramo.refresh(qfull$result_spec, policy="Outliers")
qfastnew2<-fast.tramo(rjd3toolkit::retail$RetailSalesTotal, tr4new2)


sa<-fast.tramoseats(rjd3toolkit::retail$BookStores)
decomp<-sa.decomposition(sa)

ts.plot(ts.union(decomp$series, decomp$sa, decomp$t), col=c("gray", "blue", "red"))

sax<-fast.x13(rjd3toolkit::retail$BookStores)
decompx<-sa.decomposition(sax)

ts.plot(ts.union(decompx$series, decompx$sa, decompx$t), col=c("gray", "blue", "red"))
