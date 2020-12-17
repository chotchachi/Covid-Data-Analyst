install.packages("psych")
install.packages("gmodels")
install.packages("dplyr")

setwd("/Users/foxcode/Covid-Data-Analyst")
getwd()
covid_raw_data <- read.csv("covid-case.csv")
#View(covid_raw_data)

summary(covid_raw_data) 
na.omit(covid_raw_data)
summary(covid_raw_data)

library(psych)
describe(covid_raw_data)

attach(covid_raw_data)
describeBy(covid_raw_data, Confirmed)

library(gmodels)
CrossTable(Confirmed)

covid_raw_data[,]
covid_raw_data[1,]
covid_raw_data[1:2,]
covid_raw_data[ c(1,3), ]
covid_raw_data[1, 2:3]
covid_raw_data[1:2, 2:3]

tibble::as_tibble(covid_raw_data)

con <- table(Confirmed)
barplot(tail(covid_raw_data, 15)$Confirmed, names.arg = tail(covid_raw_data, 15)$Date, main = "Số ca nhiễm COVID-19 15 ngày gần đây nhất")

confirmed <- tail(covid_raw_data, 1)[,2:4][,1]
recovered <- tail(covid_raw_data, 1)[,2:4][,2]
deaths <- tail(covid_raw_data, 1)[,2:4][,3]

x <- c(confirmed, recovered, deaths)
labels <- c("Confirmed", "Recovered", "Deaths")
piepercent<- round(100*x/sum(x), 1)

pie(x, labels = piepercent, main = "Số ca mắc, bình phục, chết do COVID-19 vào ngày hôm qua",col = rainbow(length(x)))
legend("topright", c("Confirmed", "Recovered", "Deaths"), cex = 0.8, fill = rainbow(length(x)))