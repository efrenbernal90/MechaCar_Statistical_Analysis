# import library ----------------------------------------------------------
library(dplyr)

# Import mpg csv ----------------------------------------------------------
mpg_df <- read.csv(file='Resources/MechaCar_mpg.csv', check.names = F, stringsAsFactors = F)

# linear regression -------------------------------------------------------
summary(lm(mpg~vehicle_length+vehicle_weight+spoiler_angle+ground_clearance+AWD,mpg_df))

# Import suspension csv ---------------------------------------------------
suspension_coil <- read.csv(file = 'Resources/Suspension_Coil.csv', check.names = F, stringsAsFactors = F)

# Summary Dataframe -------------------------------------------------------
total_summary<-suspension_coil %>% summarize(Mean=mean(PSI), 
                                             Median=median(PSI), 
                                             Varience=var(PSI), 
                                             SD = sd(PSI))

lot_summary <- suspension_coil %>% group_by(Manufacturing_Lot)%>% 
  summarize(Mean=mean(PSI), 
            Median=median(PSI),
            Varience=var(PSI),
            SD = sd(PSI), .groups = "keep")

# perform t-test ----------------------------------------------------------
t.test(suspension_coil$PSI, mu=1500)

# use subset method to perform a t.test on the 3 Lots----------------------
lot1 <- subset(suspension_coil, Manufacturing_Lot=="Lot1")
lot2 <- subset(suspension_coil, Manufacturing_Lot=="Lot2")
lot3 <- subset(suspension_coil, Manufacturing_Lot=="Lot3")

t.test(x=lot1$PSI, mu=1500)

t.test(x=lot2$PSI, mu=1500)

t.test(x=lot3$PSI, mu=1500)
       

