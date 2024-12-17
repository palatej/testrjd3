q<-rjd3tramoseats::tramoseats(rjd3toolkit::ABS$X0.2.02.10.M, userdefined = c('regression.details.type', 'regression.details.description', 'quality.summary'))

print(q$user_defined$regression.details.description)
print(q$user_defined$regression.details.type)
print(q$user_defined$quality.summary)