#Hannah Gordon
#Exercise 10
#due November 6, 2020

#set working directory
setwd("/Users/Public/Documents/Biocomputing2020_Tutorial12")

#Problem 1
#Find some data on two variables that you would expect to be related to each other. These data can come
#from your own research, your daily life, or the internet. Enter those data into a text file or Excel and then
#save a text file, and write a script that loads this text file and produces a scatter plot of those two variables
#that includes a trend line

#load ggplot
library(ggplot2)

#I am using MLB pitching data for 2020 from https://www.mlb.com/stats/pitching/regular-season
#This is only the data from the top 25 pitchers
#I am looking at strikeouts and ERA, hypothesizing that the more strikeouts the pitcher has, the lower their ERA

#load in data
mlbPitchingData<-read.table(file='mlbPitchingData2020.csv',sep=',',header=TRUE,stringsAsFactors = FALSE)

#create a plot with a trendline
ggplot(data = mlbPitchingData, 
       aes(x = ERA, y =SO)) + 
  geom_point() +
  xlab("Earned Run Average") + 
  ylab("Strikeouts") +
  stat_smooth(method="lm") +
  theme_classic()

#problem 2
# Given the data in "data.txt". Write a script that generates two figures that sumamrize the data. First, show
#a barplot of the means of the four populations. Second, show a scatter plot of all of the observations. You may
#want to "jitter" the points (geom_jitter()) to make it easier to see all of the observations within a population
#in your scatter plot. Alternatively, you could also try setting the alpha argument in geom_scatterplot()
#to 0.1.

#load in data
data<-read.table(file='data.txt',sep=',',header=TRUE,stringsAsFactors = FALSE)

#create bar plot
ggplot(data=data, aes(x=region, y=observations))+
  stat_summary(fun.y=mean, geom='bar')+
  labs(y='Average observations')

#create a scatterplot
ggplot(data=data, aes(x=region, y=observations))+
  geom_jitter()

#do the bar and scatter plots tell you different stories? Why?
#Yes, the barplot is useful is all yiou care about is the average of the data
#However, it cannot show you the distribution of the data
#For example, the north region would have a very small SD as the data is clustered around the mean
#The south on the other hand would have a very high SD because the data points are in
      #two clusters that are not close to the mean
#so despite the averages all being very similar, the data distribution is very different between regions