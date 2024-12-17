k1<-c(0, 0.1,0.2,0.3,0.4, 0.5,0.6,0.7,0.8,0.9)
q1<-rjd3toolkit::periodic_splines(1,1,k1, seq(0,1,0.01))
a1<-c(1,2,4,5,5,2,3,1,10,15)
z1<-q1%*%a1

k2<-c(0, 0.1,0.2,0.3,0.5,0.6,0.7,0.8,0.9)
q2<-rjd3toolkit::periodic_splines(1,1,k2, seq(0,1,0.01))
a2<-c(1,2,4,5,2,3,1,10,15)
z2<-q2%*%a2

print(summary(z2-z1))

q1<-rjd3toolkit::periodic_splines(2,1,k1, seq(0,1,0.01))
a1<-c(1,2,4,4.5,5,2,3,1,10,15)
z1<-q1%*%a1

k2<-c(0,0.1,0.2,0.4,0.5,0.6,0.7,0.8,0.9)
q2<-rjd3toolkit::periodic_splines(2,1,k2, seq(0,1,0.01))
a2<-c(1,2,4,5,2,3,1,10,15)
z2<-q2%*%a2

print(summary(z2-z1))
matplot(cbind(z1, z2), type='l')

q1<-rjd3toolkit::periodic_splines(3,1,k1, seq(0,1,0.01))
a1<-c(1,2,2.5,3.5,5,2,3,1,10,15)
z1<-q1%*%a1

k2<-c(0,0.1,0.3,0.4, 0.5,0.6,0.7,0.8,0.9)
q2<-rjd3toolkit::periodic_splines(3,1,k2, seq(0,1,0.01))
a2<-c(1,2,3.5, 5, 2,3,1,10,15)
z2<-q2%*%a2

print(summary(z2-z1))
matplot(cbind(z1, z2), type='l')