library(corrplot)
library(reshape2)

#Import data and display data nature and summary
data<-read.csv("https://raw.githubusercontent.com/FahroziFahrozi/Google-Code-In-Task/master/Consumer%20dataset.csv")
str(data)
summary(data)

#Calculate the total of each column
data<-melt(data,id=c("brand"))
data<-dcast(data,brand~variable,sum)
data

#Standardize the data
data<-scale(data[,2:10])

#The correlation coefficient of variables is calculated by cor function and visualized by corrplot使用cor函数计算变量相关系数，用corrplot进行可视化
data<-cor(data)
corrplot(corr=data)