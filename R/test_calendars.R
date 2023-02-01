

BE <-  rjd3toolkit::national_calendar(list(
  rjd3toolkit::fixed_day(7,21),
  rjd3toolkit::special_day('NEWYEAR'),
  rjd3toolkit::special_day('CHRISTMAS'),
  rjd3toolkit::special_day('MAYDAY'),
  rjd3toolkit::special_day('EASTERMONDAY'),
  rjd3toolkit::special_day('ASCENSION'),
  rjd3toolkit::special_day('WHITMONDAY'),
  rjd3toolkit::special_day('ASSUMPTION'),
  rjd3toolkit::special_day('ALLSAINTSDAY'),
  rjd3toolkit::special_day('ARMISTICE'),
  rjd3toolkit::single_day('1980-05-08')))

M<-rjd3toolkit::td(12, c(1980,1), 120, c(1,1,1,1,2,3,0), contrasts = F)

H<- rjd3toolkit::calendar_td(BE, 12, c(1980,1), 120, c(1,1,1,1,1,2,0), contrasts =F)

MC<-rjd3toolkit::td(4, c(1980,1), 120, c(1,1,1,1,1,2,0), contrasts = T)
HC<- rjd3toolkit::calendar_td(BE, 4, c(1980,1), 120, c(1,1,1,1,1,2,0), contrasts = T)

C12<-rjd3toolkit::long_term_mean(BE, 12)
C4<- rjd3toolkit::long_term_mean(BE, 4)

C12bis<-rjd3toolkit::long_term_mean(BE, 12, c(1,1,1,1,1,2,0))
C4bis<-rjd3toolkit::long_term_mean(BE, 4, c(1,1,1,1,1,2,0))

print(C12)
print( C12bis)