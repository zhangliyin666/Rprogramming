add2 <- function(x,y){
  x + y
}

above10 <- function(x){
  use <- x > 10
  x[use]
}

above <- function(x,n){
  use <- x > n
  x[use]
}
x <- 1:20
above(x,12)

columnmean <- function(y,removeNA = TRUE){
  nc <- ncol(y)
  means <- numeric(nc)
  for (i in 1:nc){means[i] <- mean(y[,i],na.rm = removeNA)
  }
  means
}
columnmean(airquality)

y <- 10 
f <- function(x){#y=2
  y <- 2
  y^2 + g(x)
}
g <- function(x){#y=10
  x*y
}
f(3)#34

