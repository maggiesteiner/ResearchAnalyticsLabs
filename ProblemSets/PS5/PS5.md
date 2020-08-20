# Problem Set 5: Predictive Models 

## Instructions
Load the `covid19_outcomes_data.csv` file (available in the ProblemSet5/PS5 folder on GitHub).  This is a cleaned up version of the data from [the Open COVID-19 Data Working Group](https://github.com/beoutbreakprepared/nCoV2019).

After loading the CSV file, remove the 6th column and convert the "age" variable to a numeric variable. Then, use the `createDataPartition()` function of the `caret` package to split the data into training and test sets, as shown below:
```r
library(caret)
train_idx<-createDataPartition(data$country,times=1,p=0.8) 
data_train<-data[train_idx$Resample1,]
data_test<-data[-train_idx$Resample1,]
```

For simplicity, do not worry about scaling the independent variables. Use two different predictive modeling methods to create a classifier with the training data and then determine how well they do in predicting diabetes in the test data set.

1. Use logistic regression + stepwise variable selection (`stepAIC` function in the MASS package) to **find the "best” model**.

2. Your choice: choose one method among decision trees, neural networks, or random forests.

For the logistic regression analysis, **report the independent variables included and excluded in the "best" model.** For each method/model you fit, **report the three most important predictive variables** (they may not be the same across methods).

Note:  If you use neural networks with the `nnet` package, the `olden` function from the "NeuralNetTools" packages can be used to assess relative importance of the variables in the model.  You can get variable importance from a decision tree with `mod$variable.importance` for the decision tree or from the summary function. 

For the each method/model fit, **report the training data area under the curve (AUC) and the test data AUC.**

### Answer the following questions

* For each method/model fit, is the training AUC better or worse than the test AUC? 
* In comparing the predictive ability of the two models with each other, is better to compare the AUC from the training data or from the test data? Why?	
* In general, is the test AUC expected to be larger or smaller than the test AUC? Why? Is this always the case?
* Which of the two methods/models fits/performs better?

#### Data Source

Xu B, Kraemer MUG, Open COVID-19 Data Working Group. Open access epidemiological data from the COVID-19 outbreak. Lancet Infect Dis. 20(5):534 (2020).

## The report

Develop a report (I recommend a Word (or other text editor) document) for your problem set that includes answers to all of the questions posed above, showing plots where appropriate.

Save your report as a PDF file and submit your report through the course 2GW site. Clean up your code and submit it as a supplementary file, along with your main report.

## Due date

Day 7, Week 10


