# libraries
library(tidyverse)
library(report)
library(lm.beta)
library(apaTables)

# load example data
data(mtcars) 
load(mtcars)

# Regression - reorganize to mtcars
linear_model <- lm(Complexity ~ ageYear, data = di_raven)
linear_model2 <- lm(Complexity ~ ageYear + raw_scores_ravew, data = di_raven)

linear_model %>% summary() 
coef(linear_model)
lm.beta(linear_model)

par(mfrow=c(2,2))
plot(linear_model)
#par(mfrow=c(1,1))

AIC(linear_model)
BIC(linear_model)

# report
report(linear_model)

apa.reg.table(linear_model, linear_model2, filename = "linear_model_complex.doc")

# t stat and p value
modelSummary <- summary(linear_model)  # capture model summary as an object
modelCoeffs <- modelSummary$coefficients  # model coefficients
beta.estimate <- modelCoeffs["ageYear", "Estimate"]  # get beta estimate for ageYear
std.error <- modelCoeffs["ageYear", "Std. Error"]  # get std.error for speed
t_value <- beta.estimate/std.error  # calc t statistic
p_value <- 2*pt(-abs(t_value), df=nrow(cars)-ncol(cars))  # calc p Value
f_statistic <- linear_model$fstatistic[1]  # fstatistic
f <- summary(linear_model)$fstatistic  # parameters for model p-value calc
model_p <- pf(f[1], f[2], f[3], lower=FALSE)


# R-Squared and Adj R-Squared
