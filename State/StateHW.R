---
title: "R Notebook"
author: "Annop.t"
output:
  pdf_document: default
  html_notebook: default
---
#**Install Packages**

```{r}
#install.packages("titanic")
#install.packages("tidyverse")

library(tidyverse)
library(titanic)


```

##**Drop NA (Missing Values)**

```{r}
titanic_train <- na.omit(titanic_train)

nrow(titanic_train)
```

```{r}
glimpse(titanic_train)
```


## **Convert Sex to factor**
```{r}
titanic_train$Sex = as.factor(titanic_train$Sex)
str(titanic_train)


```


## **Split Data**

```{r}
set.seed(42)
n <- nrow(titanic_train)
id <- sample(1:n,size = n*0.7) ## 70% train 30% test
train_data <- titanic_train[id, ]
test_data <- titanic_train[-id, ]


```

## **Train Model**


```{r}
model_train <- glm(Survived ~ Pclass + Age +Sex, data=train_data, family = "binomial")
summary(model_train)

```

##**Predict and Evaluate Model**

```{r}
train_data$prob_survived <- predict(model_train, type="response")
train_data$pred_survived <- ifelse(train_data$prob_survived >= 0.5, 1, 0)


```

## **Confusion Matrix**

```{r}
conM_train <- table(train_data$pred_survived,train_data$Survived,
                      dnn=c("Predicted","Actual"))

```

## **Model_train Evalution**
```{r}
Acc_train <- (conM_train[1,1] + conM_train[2,2]) /sum(conM_train)
Pre_train <- (conM_train[2,2])/(conM_train[2,1]+conM_train[2,2])
Re_train <- (conM_train[2,2])/(conM_train[1,2]+conM_train[2,2])

F1_train <- 2*(Pre_train*Re_train)/(Pre_train+Re_train)

cat("Accuracy:",Acc_train,"\nPrecision:",Pre_train,"\nRecall:",Re_train,
    "\nF1:",F1_train)
```


## **Test Model**

```{r}
  model_test <- glm(Survived ~ Pclass + Age + Sex,data = test_data ,
                  family="binomial")
  summary(model_test)
```

## **Predict and Evaluate Model**

```{r}
test_data$prob_survived <- predict(model_test,type="response")
test_data$pred_survived <- ifelse(test_data$prob_survived >= 0.5,1,0)

```

## **Confusion matrix**

```{r}
conM_test <- table(test_data$pred_survived,test_data$Survived,
                   dnn=c("Predicted","Actual"))
```


## **Model_train Evaluation**

```{r}
Acc_test <- (conM_test[1,1] + conM_test[2,2]) /sum(conM_test)
Pre_test <- (conM_test[2,2])/(conM_test[2,1]+conM_test[2,2])
Re_test <- (conM_test[2,2])/(conM_test[1,2]+conM_test[2,2])

F1_test <- 2*(Pre_test*Re_test)/(Pre_test+Re_test)

cat("Accuracy:",Acc_test,"\nPrecision:",Pre_test,"\nRecall:",Re_test,
    "\nF1:",F1_test)

```

