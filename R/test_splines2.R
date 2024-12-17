k<-0.05+c(0, 0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9)
x<-seq(0,0.999,0.001)
q<-rjd3toolkit::periodic_bsplines(4,1,k, x)
a<-c(2.5,3.5,5,7,2,1,5,10,6, 2)
z<-q%*%a

dq1<-rjd3toolkit::periodic_bsplines(3,1,k, x)
da1<--a[c(1,2,3,4,5,6,7,8,9,10)]+a[c(2,3,4,5,6,7,8,9,10,1)]
dz1<-dq1%*%da1

dz<-(z-c(z[1000], z[-1000]))*100

#matplot(cbind(z, dz1, dz), type='l')

dq2<-rjd3toolkit::periodic_bsplines(2,1,k, x)
da2<--da1[c(1,2,3,4,5,6,7,8,9,10)]+da1[c(2,3,4,5,6,7,8,9,10,1)]
dz2<-dq2%*%da2

ddz<-(dz-c(dz[1000], dz[-1000]))*100

#matplot(cbind(z, dz2, ddz), type='l')

dq3<-rjd3toolkit::periodic_bsplines(1,1,k, x)
da3<--da2[c(1,2,3,4,5,6,7,8,9,10)]+da2[c(2,3,4,5,6,7,8,9,10,1)]
dz3<-dq3%*%da3

dddz<-(ddz-c(ddz[1000], ddz[-1000]))*100

#matplot(cbind(z, dz3, dddz), type='l')

dz3[c(0,101,201,301, 401, 501, 601, 701, 801, 901)]

w<--c(1)
K<-k[w]
Q<-rjd3toolkit::periodic_bsplines(4,1,K, x)
A<-a[w]
Z<-Q%*%A

b<-rjd3toolkit::periodic_bsplines(4,1,k, k)
atilde<-b%*%a
c<-rjd3toolkit::periodic_csplines(c(k,1.05), x)
h<-c%*%atilde

B<-rjd3toolkit::periodic_bsplines(4,1,K, K)
Atilde<-atilde[w]
C<-rjd3toolkit::periodic_csplines(c(K, 1.15), x)
H<-C%*%Atilde
print(summary(h-H))
#matplot(cbind(z,Z), type='l')
matplot(cbind(h,H), type='l')
