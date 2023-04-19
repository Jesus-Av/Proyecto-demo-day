getwd()
setwd("C:/Users/DELL/Documents/Curso ADD/Proyecto final")
cierre21<- read.csv("Cierre_agr_mun_2021.csv")
cierre20<- read.csv("Cierre_agricola_mun_2020.csv")
cierre19<- read.csv("Cierre_agricola_mun_2019.csv")
cierre18<- read.csv("Cierre_agricola_mun_2018.csv")
cierre17<- read.csv("Cierre_agricola_mun_2017.csv")
cierre16<- read.csv("Cierre_agricola_mun_2016.csv")
cierre15<- read.csv("Cierre_agricola_mun_2015.csv")
car<- read.csv("car data.csv")
View(cierre20)


cierres<- rbind(cierre21,cierre20, cierre19,cierre18,cierre17,cierre16,cierre15)
View(cierres)
str(cierres)
cierres$Nomestado<- iconv(cierres$Nomestado, to = "ASCII//TRANSLIT")

#Encontrando modalidad de riego
mod<- table(cierres$Nommodalidad)
pmod<- prop.table(mod)
pie(pmod)
#Estado por producción
edo<-table(cierres$Nomestado)
prop<-data.frame(prop.table(edo))
barplot(prop, names.arg = row.names(prop), col=terrain.colors(32))
#Estado y Modalidad de riego
medo<-table(cierres$Nomestado, cierres$Nommodalidad)
pmedo<-prop.table(medo)
barplot(pmedo, main = "Tipo de modalidad por estado", beside= T,legend.text = T,
        col = terrain.colors(32))
#Estado y cantidad Sembrada
str(cierres)
df<-data.frame(cierres[ ,c(3,18,19,20)])
#

df_g<- df%>% group_by(Nomestado)%>% summarise(siniestrada= sum(Siniestrada),
                                              cosechada= sum(Cosechada))
View(df_g)


hist(df_g$cosechada,)
boxplot(df_g$cosechada)

hist(df_g$siniestrada)
boxplot(df_g$siniestrada)

ndf<-data.frame(cierres[ ,c(3,11,13,17,18,19,20,21,22,23,24)])
View(ndf)
write.csv(ndf, file = "Cierres_resumido")
