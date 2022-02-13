
#               |￣￣￣￣￣￣￣￣￣￣￣￣￣|
#                 Psychometrics tutorial, 
#                 by Eiko Fried, Jan 2022
#               |＿＿＿＿＿＿＿＿＿＿＿＿＿| 
#                      (\__/)  ||
#                      (•ㅅ•)  ||
#                      /  　  づ



### ---------------------------------------------------------
### -------------- 1. Packages ------------------------------
### ---------------------------------------------------------

library("summarytools")
library("readr")
library("dplyr")
library("psych")
library("qgraph")
library("bootnet")
library("OpenMx")
library("EGAnet")
library("lavaan")



### ---------------------------------------------------------
### -------------- 2. Load & prepare data -------------------
### ---------------------------------------------------------

df <- read_csv("data.csv")

### A. Subset consecutive data(x:y)
start <- which(names(df)=='ItemName1'); start # enter the first questionnaire item
end <- which(names(df)=='ItemName20');  end   # enter the last questionnaire item

df_small <- na.omit(select(df, start:end))

### B. Subset data that aren't consecutive
selection <- c(
  which(names(df)=='ItemName1'),
  which(names(df)=='ItemName14'),
  which(names(df)=='ItemName27'),
  which(names(df)=='ItemName31'),
  which(names(df)=='ItemName55'),
  which(names(df)=='ItemName102'))
df_small <- na.omit(select(df, c=selection))

### C. Create sum score if needed
df_small <- df %>%
  rowwise() %>%
  mutate(new_sumscore=sum(ItemName1,ItemName2,ItemName3))



### ---------------------------------------------------------
### -------------- 3. Psychometrics--------------------------
### ---------------------------------------------------------

### A. Descriptives and correlation
view(dfSummary(data))

cor_mat <- cor(df_small)
summary(vechs(cor_mat))
means_cor <- mean(vechs(cor_mat))

qgraph(cor_mat, cut=0, layout="spring", 
       title=paste("Correlation matrix, mean correlation = ",  round(means_cor, digits=2), sep=" "))

### B. Eigenvalue decomposition
ev <- plot(eigen(cor(df_small))$values, type="b",
           ylab="Value", xlab="Number of Eigenvalues")

### C. Number of components and factors
fac_comp <- fa.parallel(df_small)

### D. Network and communities
nw_ega <- EGA(df_small)
summary(nw_ega)

### E. CFA
alpha_scale <- psych::alpha(df_small); alpha_scale$total$std.alpha

cfa_scale <- 'factor1  =~ ItemName1+ItemName6+ItemName11+ItemName4
              factor2  =~ ItemName2+ItemName7+ItemName12+ItemName8
              factor3  =~ ItemName3+ItemName8+ItemName13+ItemName12
              factor4  =~ ItemName4+ItemName9+ItemName14+ItemName16
              factor5  =~ ItemName5+ItemName10+ItemName15+ItemName20'

fit <- cfa(cfa_scale, data = df_small, std.lv=TRUE)
summary(fit, fit.measures = TRUE)




