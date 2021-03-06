suppressPackageStartupMessages(library(rjd3modelling))


belgiumCalendar<-calendar.new()
calendar.fixedday(belgiumCalendar, 7, 21)
calendar.holiday(belgiumCalendar, "NEWYEAR")
calendar.holiday(belgiumCalendar, "CHRISTMAS")
calendar.holiday(belgiumCalendar, "MAYDAY")
calendar.holiday(belgiumCalendar, "EASTERMONDAY")
calendar.holiday(belgiumCalendar, "WHITMONDAY")
calendar.holiday(belgiumCalendar, "ASSUMPTION")
calendar.holiday(belgiumCalendar, "ALLSAINTDAY")
calendar.holiday(belgiumCalendar, "ARMISTICE")

M<-rjd3modelling::td(12, c(1980,1), 120, c(1,1,1,1,2,3,0), contrasts = F)

H<-htd(belgiumCalendar, 12, c(1980,1), 120, c(1,1,1,1,1,2,0), contrasts =F)

MC<-rjd3modelling::td(4, c(1980,1), 120, c(1,1,1,1,1,2,0), contrasts = T)
HC<-htd(belgiumCalendar, 4, c(1980,1), 120, c(1,1,1,1,1,2,0), contrasts = T)

C12<-longTermMean(belgiumCalendar, 12)
C4<-longTermMean(belgiumCalendar, 4)

C12bis<-longTermMean(belgiumCalendar, 12, c(1,1,1,1,1,2,0))
C4bis<-longTermMean(belgiumCalendar, 4, c(1,1,1,1,1,2,0))

print(C12)
print( C12bis)