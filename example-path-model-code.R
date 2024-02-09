## Path analysis code


### Read in data
#setting the working directory to locate the CSV file
setwd("C:/Users/racha/Desktop/SEM") 
#creating variable for CSV file data
data = read.csv('ss-practices-outcomes-renamed.csv')


### Correlation matrix
library(psych) #need to run 'install.packages("psych")' if not already in library
#creating correlation matrix
corr = corr.test(data[6:19])
#viewing corr matrix
corr


### Writing the path model
#need to 'install.packages("lavaan")' if not already in library

library(lavaan)
path1 = '
#regressions
AVG_WE ~ DM + ID + TA + PM
' #note: "AVG_WE" is the outcome. The '~' is equivalent to an = sign. The DM,ID,TA,PM are the individual IVs (and each path)



### Generating fit statistics
fit_path1 = sem(path1, data = data) #specifying model
summary(fit_path1, fit.measures = TRUE, standardized = TRUE) #fit stats

