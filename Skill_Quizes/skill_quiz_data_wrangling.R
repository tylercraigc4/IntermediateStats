library(mosaic)
library(mosaicData)
View(KidsFeet)
?KidsFeet
table(KidsFeet$sex)
table(KidsFeet$biggerfoot)
table(KidsFeet$birthmonth)
table(KidsFeet$domhand, KidsFeet$sex)

foot_length_to_genter <- KidsFeet %>% 
  group_by(sex) %>%
  summarise(
    min = min(length),
    Q1 = quantile(length, 0.25),
    median = median(length),
    Q3 = quantile(length, 0.75),
    max = max(length),
    mean = mean(length),
    sd = sd(length),
    n = n())

airquality <- airquality %>% 
  mutate(MonthName = case_when(
    Month == 5 ~ "May", 
    Month == 6 ~ "June", 
    Month == 7 ~ "July", 
    Month == 8 ~ "August", 
    Month == 9 ~ "September"))

month_name_means <- airquality %>%
  group_by(Month, MonthName) %>%
  summarise("Mean Temperature" = mean(Temp))

median_trunk_circumference <- Orange %>%
  group_by(age) %>%
  summarise(trunk_circumference_mm = median(circumference))

# plot 1
plot(circumference ~ age, data=Orange, ylab="Trunk Circumference (mm)", xlab="Age of Trees (days)", main="Trunk Circumference of Orange Trees", col="ivory3", pch=15)
Orange.m <- median(circumference ~ age, data=Orange)
lines(names(Orange.m), Orange.m, col="ivory3")
legend("topleft", legend="Median Growth", lty=1, col='ivory3', bty='n')

# plot 2
boxplot(circumference ~ age, data=Orange, ylab="Trunk Circumference (mm)", xlab="Age of Trees (days)", main="Trunk Circumference of Orange Trees", col="ivory3")

# plot 3
stripchart(circumference ~ age, data=Orange, ylab="Trunk Circumference (mm)", xlab="Age of Trees (days)", main="Trunk Circumference of Orange Trees", col="ivory3", pch=15, method="stack", vertical=TRUE)

# plot 4
boxplot(Orange, xlab="Age of Tree (days)", main="Trunk Circumference of Orange Trees", col="ivory3")
  
riders_day_totalobserved <- Riders %>%
  group_by(day) %>%
  summarise(total_number_of_riders_observed = sum(riders))

table(mtcars$cyl)

transmission_mean_gas_mileage_4_cyl <- mtcars %>%
  filter(cyl == 4) %>%
  group_by(am) %>%
  summarise(
    mean_gas_milage = mean(mpg)
  )

transmission_mean_q_mile <-  mtcars %>%
  filter(cyl == 8) %>%
  group_by(am) %>%
  summarise(mean_q_mile_time = mean(qsec))

heaviest_6_cyl_car_automatic <-  mtcars %>% 
  filter(cyl == 6, am == 0) %>% 
  summarise(max_weight = max(wt))

heaviest_6_cyl_car_manual  <-  mtcars %>% 
  filter(cyl == 6, am == 1) %>% 
  summarise(max_weight = max(wt))



