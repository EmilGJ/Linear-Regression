library(ggplot2)
library(caTools)
library(plotly)

dataset=read.csv("C:\\Users\\Emil\\Desktop\\The Sparks\\student_scores.csv")
View(dataset)
summary(dataset)
attach(dataset)

plot(dataset)

ggplot(dataset, aes(x= Hours, y= Scores) ) + 
  geom_point()+
  stat_smooth()
cor(dataset)

s <- sample.split(dataset,SplitRatio = 2/3)
set.seed(2)
train <- subset(dataset,s=="TRUE")
test <- subset(dataset,s=="FALSE")

model <- lm(Scores ~(Hours) ,data=dataset)
summary(model)

pred= predict(model,test)
head(pred)
res=residuals(model)

result=cbind(pred,test$Scores)
head(result)

colnames(result)<-c('predicted','real')
result=as.data.frame(result)
head(result)

# what is the Score of students if he studies for 9.25 hours
y=mx+c
9.7758*9.25+2.4837
#Answer: 92.90985 is the predicted Score
