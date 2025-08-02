# A researcher is interested in observing the role of education, gender, 
# and drinking habit on income. Help him address the following questions 
# from the obtained data:

# ------------------------------------------------------------------
# 1. Install and load the necessary package
# ------------------------------------------------------------------

install.packages("readxl")
library(readxl)

# ------------------------------------------------------------------
# 2. Load and view the data
# ------------------------------------------------------------------

data <- read_excel("C:/Users/Sanika/Downloads/Synthetic_Drinking_Dataset_500.xlsx")

head(data)
summary(data)
str(data)

# ------------------------------------------------------------------
# 3. Which variable has not been assigned the right measurement scale?
# ------------------------------------------------------------------

# Fixing Education as an ordered factor
data$Education <- factor(data$Education, levels = c("High School", "Graduate", "PhD"), ordered = TRUE)
data$Education
# ------------------------------------------------------------------
# 4. What is the median salary of people studied in sample? 
#    Is it different from the average salary? 
#    Is it same as 50th percentile?
# ------------------------------------------------------------------

mean_income <- mean(data$Income)
median_income <- median(data$Income)
percentile_50 <- quantile(data$Income, 0.50)

cat("Mean Income: ", mean_income, "\n")
cat("Median Income: ", median_income, "\n")
cat("50th Percentile: ", percentile_50, "\n")

# ------------------------------------------------------------------
# 5. Is income a normally distributed variable? 
#    Also test normality for PhDs vs High School.

# ------------------------------------------------------------------

# Histogram & Density Plot
# Histogram & Density
hist(data$Income, probability = TRUE, col = "lightblue", main = "Histogram of Income")
lines(density(data$Income), col = "red", lwd = 2)

# Skewness and Kurtosis
skewness_fn <- function(x) {
  m3 <- mean((x - mean(x))^3)
  s3 <- sd(x)^3
  m3 / s3
}

kurtosis_fn <- function(x) {
  m4 <- mean((x - mean(x))^4)
  s4 <- sd(x)^4
  m4 / s4
}

cat("Skewness:", skewness_fn(data$Income), "\n")
cat("Kurtosis:", kurtosis_fn(data$Income), "\n")

# Normality Tests
shapiro.test(data$Income)

# By education
phd_income <- data$Income[data$Education == "PhD"]
hs_income <- data$Income[data$Education == "High School"]

shapiro.test(phd_income)
shapiro.test(hs_income)

ks.test(phd_income, "pnorm", mean(phd_income), sd(phd_income))
ks.test(hs_income, "pnorm", mean(hs_income), sd(hs_income))


# ------------------------------------------------------------------
# 6. Find and eliminate outliers from income variable, then retest normality
# ------------------------------------------------------------------

Q1 <- quantile(data$Income, 0.25)
Q3 <- quantile(data$Income, 0.75)
IQR_val <- Q3 - Q1
lower_bound <- Q1 - 1.5 * IQR_val
upper_bound <- Q3 + 1.5 * IQR_val

# Remove outliers
data_clean <- subset(data, Income >= lower_bound & Income <= upper_bound)

# Retest normality
shapiro.test(data_clean$Income)

hist(data_clean$Income, probability = TRUE, col = "lightgreen", main = "Cleaned Income Distribution")
lines(density(data_clean$Income), col = "red", lwd = 2)

# ------------------------------------------------------------------
# 7. Number of males and females who are graduates and social drinkers
# ------------------------------------------------------------------

a <- as.data.frame(data)
a <- a[a$Education == "Graduate" & a$DrinkingHabit == "Social Drinker", ]
table(data$Gender)
nrow(data)

# ------------------------------------------------------------------
# 8. 95% Confidence Interval of Mean Income for Social Drinkers and Non-Drinkers
# ------------------------------------------------------------------

# For Social Drinkers
t.test(data$Income[data$DrinkingHabit == "Social Drinker"])

# For Non-Drinkers
t.test(data$Income[data$DrinkingHabit == "Non-Drinker"])

# Comparison between Social Drinkers and Non-Drinkers
t.test(Income ~ DrinkingHabit, data = subset(data, DrinkingHabit %in% c("Social Drinker", "Non-Drinker")))



# ------------------------------------------------------------------
# 9. 95% Trimmed Mean for Males and Females who are Heavy Drinkers
# ------------------------------------------------------------------

mean(data$Income[data$Gender == "Male" & data$DrinkingHabit == "Heavy Drinker"], trim = 0.05)
mean(data$Income[data$Gender == "Female" & data$DrinkingHabit == "Heavy Drinker"], trim = 0.05)

# ------------------------------------------------------------------
# 10. Boxplot to compare income by education level
# ------------------------------------------------------------------

boxplot(Income ~ Education, 
        data = data, 
        main = "Income by Education Level", 
        xlab = "Education Level", s
        ylab = "Income", 
        col = "lightblue", 
        border = "darkblue")

