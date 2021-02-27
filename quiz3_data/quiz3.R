library(datasets)
data(iris)
virginica <- iris[101:150,]
sapply(virginica[,1:4],mean)
colMeans(iris)
apply(iris[,1:4],2,mean)
apply(iris[,1:4],1,mean)
apply(iris,1,mean)
rowMeans(iris[,1:4])


library(datasets)
data(mtcars)
sapply(split(mtcars$mpg,mtcars$cyl),mean)
with(mtcars,tapply(mpg,cyl,mean))
tapply(mtcars$mpg,mtcars$cyl,mean)
sapply(mtcars,cyl,mean)
lapply(mtcars,mean)
tapply(mtcars$cyl,mtcars$mpg,mean)
split(mtcars,mtcars$cyl)
mean(mtcars$mpg,mtcars$cyl)
apply(mtcars,2,mean)
mean(mtcars[mtcars$cyl==4,]$hp)-mean(mtcars[mtcars$cyl==8,]$hp)


debug(ls)
ls
