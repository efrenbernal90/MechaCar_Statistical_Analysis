# MechaCar_Statistical_Analysis

## Overview

AutosRUs’ newest prototype, the MechaCar, is suffering from production troubles that are blocking the manufacturing team’s progress. The production data was reviewed for insights that may help the manufacturing team.
The following analysis were performed: 
- Multiple linear regression analysis to identify which variables in the dataset predict the mpg of MechaCar prototypes
- Collect summary statistics on the pounds per square inch (PSI) of the suspension coils from the manufacturing lots
- Run t-tests to determine if the manufacturing lots are statistically different from the mean population
- Design a statistical study to compare vehicle performance of the MechaCar vehicles against vehicles from other manufacturers

### Resources 

[RStudio 2021.09.2+382, R version 4.1.2](https://docs.rstudio.com/resources/install-r/)
[dplyr library](https://dplyr.tidyverse.org/)

## Linear Regression to Predict MPG 

### Results

After importing our data, we perform a multiple linear regression summary using this code:

``` R
summary(lm(mpg~vehicle_length+vehicle_weight+spoiler_angle+ground_clearance+AWD,mpg_df))
```

![linear_Reg](Resources/linearReg.png)

The resulting p-values are shown under the `Pr(>|t|)` column, representing the probability of the coefficient contributing a random amount of variance to the linear model. 
The row `Signif. codes:` shows recommended levels of significance to the test (i.e. vehicle_weight measured with significance level of 0.05, denoted with `(.)`). If the values are less than the measure of significance, then these variables are statistically unlikely to provide random amounts of variance to the linear model. `vehicle_weigh`, `spoiler_angle`, and `AWD` were removed due to statistical insignificance calculated by the model, to check for stronger correlation with `mpg`. 
 
![linear_Reg2](Resources/linearReg2.png)

### Summary 

This multiple linear regression model showed that `vehicle_length`, `ground_clearance`, and the `intercept` have a significant impact on `mpg`. It is worth noting that the r-value decreased from .7149 to .674, which is still a strong positive correlation.  When an intercept is statistically significant, it means that the intercept term explains a significant amount of variability in the dependent variable when all independent vairables are equal to zero. Depending on our dataset, a significant intercept could mean that the significant features (such as weight and horsepower) may need scaling or transforming to help improve the predictive power of the model. Alternatively, it may mean that there are other variables that can help explain the variability of our dependent variable that have not been included in our model. Depending on the dataset and desired performance of the model, you may want to change your independent variables and/or transform them and then re-evaluate your coefficients and significance.