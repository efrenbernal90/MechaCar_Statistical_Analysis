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

#### Data

[MechaCar_mpg.csv](Resources/MechaCar_mpg.csv)

[Suspension_Coil.csv](Resources/Suspension_Coil.csv)

## Linear Regression to Predict MPG 

### Results

The `MechaCar_mpg.csv` dataset contains mpg test results for 50 prototype MechaCars. The MechaCar prototypes were produced using multiple design specifications to identify ideal vehicle performance. Multiple metrics, such as `vehicle length`, `vehicle weight`, `spoiler angle`, `drivetrain`, and `ground clearance`, were collected for each vehicle. A linear model was designed to predicts the `mpg` of MechaCar prototypes using several variables from the `MechaCar_mpg.csv` file.

After importing our data, a multiple linear regression model is performed using this code:

``` R
lm(mpg~vehicle_length+vehicle_weight+spoiler_angle+ground_clearance+AWD,mpg_df)
```

![linear_Reg](Resources/linearReg2.png)
 
A summary of the regression model:
 
![linear_Reg2](Resources/linearReg.png)

The resulting probabilities are shown under the `Pr(>|t|)` column, representing the probability of the coefficient contributing a random amount of variance to the linear model. 
The row `Signif. codes:` shows recommended levels of significance to the test (i.e. vehicle_weight measured with significance level of 0.05, denoted with `(.)`). If the values are less than the measure of significance, then these variables are statistically unlikely to provide random amounts of variance to the linear model. 

### Summary 

This multiple linear regression model showed that `vehicle_length`, `ground_clearance`, and the `intercept` have a significant impact on `mpg`. When an intercept is statistically significant, it means that the intercept term explains a significant amount of variability in the dependent variable when all independent vairables are equal to zero. Depending on our dataset, a significant intercept could mean that the significant features (such as lenght and ground clearance) may need scaling or transforming to help improve the predictive power of the model. Alternatively, it may mean that there are other variables that can help explain the variability of our dependent variable that have not been included in our model. Depending on the dataset and desired performance of the model, you may want to change your independent variables and/or transform them and then re-evaluate your coefficients and significance. 
It is worth noting that the `r-value=.7149` is a strong positive correlation, or slope. Furthermore, the `p-value = 3.637E-12` suggests using the `vehicle_length`, `ground_clearance`, and the `intercept` coefficients of this model could fair well in predicting the `mpg` of MechaCar prototypes.    

## Summary Statistics on Suspension Coils

### Results

The lot summary was imported and grouped by Manufacturing Lot:
```R
total_summary<-suspension_coil %>% summarize(Mean=mean(PSI), 
                                             Median=median(PSI), 
                                             Varience=var(PSI), 
                                             SD = sd(PSI))
```

```R
lot_summary <- suspension_coil %>% group_by(Manufacturing_Lot)%>% 
  summarize(Mean=mean(PSI), 
            Median=median(PSI),
            Varience=var(PSI),
            SD = sd(PSI), .groups = "keep")
```

Total Summary Statistics for Suspension Coils:

![total_summary](Resources/total_summary.png)

Summary Statistics for Suspension Coils grouped by lots:

![summary_stats](Resources/lot_summary.png)

### Summary

The design specifications for the MechaCar suspension coils dictate that the **variance** of the suspension coils must not exceed 100 pounds per square inch. While the total variance falls within the design specifications (**62.29**), further analysis shows disproportionate variance by lot number. `Lot 1 and 2` have a variance of **0.98** and **7.47** respectively, but `Lot 3` had a variance of **170.29**, which far exceeds the design specifications, and ought to be recalled.

## T-Tests on Suspension Coils

### Results

`t-tests` performed to determine if all manufacturing lots and each lot individually are statistically different from the population mean (mu, μ) of 1,500 pounds per square inch.

t-test on the mean PSI of Suspension Coils for all lots compared to the population mean (mu, μ)

![ttest1](Resources/ttest_PSI.png)


t-test on the mean PSI of Suspension Coils from Lot 1 compared to population mean (mu, μ)

![ttest2](Resources/ttest_PSI_lot1.png)


t-test on the mean PSI of Suspension Coils from Lot 2 compared to population mean (mu, μ)

![ttest3](Resources/ttest_PSI_lot2.png)

t-test on the mean PSI of Suspension Coils from Lot 3 compared to population mean (mu, μ)

![ttest4](Resources/ttest_PSI_lot3.png)

### Summary 

The t-test for the mean PSI for all suspension coils and population mean of 1500 has a `p-value=0.06`.  With a confidence interval of 95%, this test does not provide sufficient evidence to show that the mean PSI of suspension coils from `all lots` is statistically different from the population mean. 

The t-test for the mean PSI for suspension coils from `lot1` and population mean of 1500 has a `p-value=1`.  With a confidence interval of 95%, this test does not provide sufficient evidence to show that the mean PSI of suspension coils from `lot1` is statistically different from the population mean. 

The t-test for the mean PSI for suspension coils from `lot2` and population mean of 1500 has a `p-value=0.6072`.  With a confidence interval of 95%, this test does not provide sufficient evidence to show that the mean PSI of suspension coils from `lot2` is statistically different from the population mean. 

The t-test for the mean PSI for suspension coils from `lot3` and population mean of 1500 has a `p-value=0.04168`.  With a confidence interval of 95%, this test does provide sufficient evidence to show that the mean PSI of suspension coils from `lot3` is statistically different from the population mean.   

## Study Design: MechaCar vs Competition

### Overview

Design a study to check for mean `maintenance costs` for MechaCars compared to the competition:

### Hypothesis testing

If the `safety rating` is related to `maintenance cost`, then 3.5* or higher rated cars will have an effect on mean `maintenance cost`.

Null Hypothesis:

If the `safety rating` is not related to `maintenance cost`, then 3.5* or higher rated cars will not have a lower mean `maintenance cost`.

Alternative Hypothesis:

If the `safety rating` is related to `maintenance cost`, then 3.5* or higher rated cars will have a lower mean `maintenance cost`.

Although current data is not sufficient, collecting data on various other metrics can help design a one-sample t-test to check for averages between samples. Examples include, `horsepower`, `safety rating`, `vehicle weight`, `gearshaft`,`interior design`,`engine placement`, `number of cylinders`, etc.

