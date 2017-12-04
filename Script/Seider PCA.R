#Load Packages
library(pls)
library(glmnet)
library(ggplot2)

#Read Data
Universities <- read.csv("C:/Users/Ab/Documents/MSBIA/Applied Data Mining/HW 3/Data/Universities.csv")
Universities <- na.omit(Universities)
lapply(Universities, class)
Universities <- Universities[,-c(1:2)]

#PCA
PCA <- prcomp(Universities)
summary(PCA)

pcs.variance.explained <-(PCA$sdev^2 / sum(PCA$sdev^2))*100
barplot(pcs.variance.explained, las=2, xlab="Principal Component", ylab="% Variance Explained", main="Principal Components versus Percent of Variance Explained")
PCA$rotation

PCA<-prcomp(Universities, scale. = T) #use scale option to z-normalize data set. 
summary(PCA)
pcs.variance.explained <-(PCA$sdev^2 / sum(PCA$sdev^2))*100
barplot(pcs.variance.explained, las=2, xlab="Principal Component", ylab="% Variance Explained", main="Principal Components versus Percent of Variance Explained")
PCA$rotation

screeplot(PCA, type="line")

