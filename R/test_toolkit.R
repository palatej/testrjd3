suppressPackageStartupMessages(library(RJDemetra3))


a<-rjd3toolkit::randomsT(50, 1000)

print(rjd3toolkit::bowmanshenton(a) )
print(rjd3toolkit::doornikhansen(a) )
print(rjd3toolkit::ljungbox(a, k=36) )
print(rjd3toolkit::autocorrelations(a) )
print(rjd3toolkit::autocorrelations.inverse(a) )
print(rjd3toolkit::autocorrelations.partial(a) )