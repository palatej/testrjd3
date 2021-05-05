suppressPackageStartupMessages(library(rjd3modelling))


belgiumCalendar<-newCalendar()
addFixedDayToCalendar(belgiumCalendar, 7, 21)
addPrespecifiedHolidayToCalendar(belgiumCalendar, "NEWYEAR")
addPrespecifiedHolidayToCalendar(belgiumCalendar, "CHRISTMAS")
addPrespecifiedHolidayToCalendar(belgiumCalendar, "MAYDAY")
addPrespecifiedHolidayToCalendar(belgiumCalendar, "EASTERMONDAY")
addPrespecifiedHolidayToCalendar(belgiumCalendar, "WHITMONDAY")
addPrespecifiedHolidayToCalendar(belgiumCalendar, "ASSUMPTION")
addPrespecifiedHolidayToCalendar(belgiumCalendar, "ALLSAINTDAY")
addPrespecifiedHolidayToCalendar(belgiumCalendar, "ARMISTICE")

M<-td(12, c(1980,1), 120, c(1,1,1,1,2,3,0), contrasts = F)

H<-htd(belgiumCalendar, 12, c(1980,1), 120, c(1,1,1,1,1,2,0), contrasts =F)

MC<-td(4, c(1980,1), 120, c(1,1,1,1,1,2,0), contrasts = T)
HC<-htd(belgiumCalendar, 4, c(1980,1), 120, c(1,1,1,1,1,2,0), contrasts = T)

C12<-longTermMean(belgiumCalendar, 12)
C4<-longTermMean(belgiumCalendar, 4)

C12bis<-longTermMean(belgiumCalendar, 12, c(1,1,1,1,1,2,0))
C4bis<-longTermMean(belgiumCalendar, 4, c(1,1,1,1,1,2,0))

print(C12)
print( C12bis)