x <- list(2, "a", "b", TRUE)
x[[2]]

x <- 1:4
y <- 2:3
class(x+y)

data <- read.csv("hw1_data.csv",header = T)
is.na(data)
table(is.na(data$Ozone))
good <- complete.cases(data$Ozone)
data_good <- data[good,]
mean(data_good$Ozone)

subset1 <- data$Ozone>31 & data$Temp>90
subdata1 <- data[subset1,]
mean(subdata1$Solar.R)
good <- complete.cases(subdata1$Solar.R)
subdata1_good <- subdata1[good,]
mean(subdata1_good$Solar.R)

subset2 <- data$Month == 6
subdata2 <- data[subset2,]
mean(subdata2$Temp)

subset3 <- data$Month == 5
subdata3 <- data[subset3,]
