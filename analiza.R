#zaladowanie danych z pliku shootings.csv
shootings<-read.csv('C:/Users/Julian/Desktop/shootings.csv')
#usuniecie danych z roku 2020
library(DescTools)
shootings$year<-Year(shootings$date)
shootings<-shootings[!shootings$year==2020,]
#sprawdzenie, ile mezczyzn jest odpowiedzialnych za strzelaniny, a ile kobiet wraz z utworzeniem wykresu kolowego
table(shootings$gender)
pie(table(shootings$gender))
#sprawdzenie strzelanin w danym roku
table(shootings$year)
plot(table(shootings$year))
#sprawdzenie strzelanin w danym dniu
shootings2<-shootings[, c('date')]
table(shootings2)
plot(table(shootings2))
#sprawdzenie rodzaju broni
table(shootings$armed)
plot(table(shootings$armed))
#sprawdzenie rasy
table(shootings$race)
plot(table(shootings$race))
#zapisanie liczby strzelanin w danym dniu do pliku .csv
shootings2_df<-as.data.frame(table(shootings2))
newNames<-c('date','number of shootings')
names(shootings2_df)<-c('date','number of shootings')
write.csv2(shootings2_df,file="C:/Users/Julian/Desktop/numberOfShootings.csv")
