ts <- rjd3toolkit::ABS$X0.2.09.10.M
dir = tempdir()
xvar = rjd3modelling::td(12, start=start(ts),length = length(ts+24),groups = c(1,1,1,1,1,2,0))
myspec1 <- RJDemetra::tramoseats_spec(spec = "RSA3",
                           usrdef.varEnabled = TRUE,
                           usrdef.var = xvar)
myreg1 <- RJDemetra::tramoseats(ts, myspec1)

wk <- RJDemetra::new_workspace()
RJDemetra::new_multiprocessing(wk, "sa1")
RJDemetra::add_sa_item(wk, "sa1", myreg1, "ts")
RJDemetra::save_workspace(wk, file.path(dir, "workspace.xml"))

ws3 <- RJDemetra3::load_workspace(file.path(dir, "workspace.xml"))

#for (v in ws3$context$variables$r){print(v); cat("\n")}

ft1<-rjd3tramoseats::tramo(ts, rjd3tramoseats::spec_tramo_default(name = "tr3") |> 
             rjd3modelling::add_usrdefvar("r.group_1"),
           context = ws3$context) # ok

ft2<-rjd3tramoseats::tramo(ts, rjd3tramoseats::spec_tramo_default(name = "tr3") |> 
                                  rjd3modelling::add_usrdefvar("r.group_1", coef = 0.003),
                                context = ws3$context) # ok


ts <- rjd3toolkit::ABS$X0.2.09.10.M
xvar = rjd3modelling::td(12, start=start(ts),length = length(ts),groups = c(1,1,1,1,1,0,0))
context<-rjd3modelling::modelling_context(variables=list(a=xvar))
sp <- rjd3x13::spec_regarima_default(name = "rg3") |>
  rjd3modelling::add_usrdefvar(id = "r.a")
rg<-rjd3x13::regarima(window(ts, start=1985, end=2013),sp,context = context) # ok

sp <- rjd3tramoseats::spec_tramo_default(name = "tr3") |>
  rjd3modelling::add_usrdefvar(id = "r.a", coef = NULL)
tramo<-rjd3tramoseats::tramo(ts,sp,context = context) # ok

