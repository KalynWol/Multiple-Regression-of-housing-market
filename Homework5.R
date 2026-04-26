#GEO-411
#Homework 5 
#Kalyn Wolters 

sales<-read.csv("homeSales.csv")
names(sales)

#Estimate base model
base.model <- lm(price ~ bedrooms + bathrooms + sqft_living + yr_built + HS + SC, data = sales)
summary(base.model)

#Diagnostic plots on base.model
plot(base.model)

#Independence - right hand side variables 

ResidualVsXPlots <- function(mod.in){
  var.names <- names(mod.in$coefficients)
  n.x.vars <- length(var.names)
  mod.e <- residuals(mod.in)
  
  for (i in 2:n.x.vars){
    plot (mod.in$model[,var.names[i]], mod.e, xlab = var.names[i], ylab = "residuals")
    lines(lowess(mod.in$model[,var.names[i]],mod.e, f=3/4), col="red")
    locator(1)
  }
}

ResidualVsXPlots(base.model)


#Homoskedasticity - right hand side variables
XScaleLocationPlots <- function(mod.in){
  var.names <- names(mod.in$coefficients)
  n.x.vars <- length(var.names)
  std.residuals <- sqrt(abs(rstandard(mod.in)))
  
  for (i in 2:n.x.vars){
    plot (mod.in$model[,var.names[i]], std.residuals, xlab = var.names[i], 
          ylab = "Square root of Absolute Standardized Residuals")
    lines(lowess(mod.in$model[,var.names[i]], std.residuals, f=3/4), col="red")
    locator(1)
  }
}

XScaleLocationPlots(base.model)

#VIF calculation

#Installing the package

install.packages(c("car"))

#Load the package
library(car)

#Calculate VIF
vif(base.model)
