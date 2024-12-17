
a<-rjd3toolkit::random_t (50, 1000)

print(rjd3toolkit::bowmanshenton(a) )
print(rjd3toolkit::doornikhansen(a) )
print(rjd3toolkit::ljungbox(a, k=36) )
print(rjd3toolkit::autocorrelations(a) )
print(rjd3toolkit::autocorrelations_inverse(a) )
print(rjd3toolkit::autocorrelations_partial(a) )