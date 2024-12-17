q<-rjd3x13::x13(rjd3toolkit::ABS$X0.2.20.10.M,"rsa5", userdefined = c('regression.details.type', 'regression.details.description', 'regression.td-ftest', 'quality.summary'))

print(q$user_defined$regression.details.description)
print(q$user_defined$regression.details.type)
print(q$user_defined$`regression.td-ftest`)
print(q$user_defined$quality.summary)