# 📊 Income Analysis Project in R

## 🎯 Project Title  
**Analyzing the Role of Education, Gender, and Drinking Habit on Income using R**

---

## 📌 Objective  
To examine how **education level**, **gender**, and **drinking habits** impact **income**, using statistical methods and visualizations in R on a synthetic dataset of 500 individuals.

---

## 🛠️ Tools & Libraries Used  
- **Language:** R  
- **Packages:**  
  - `readxl` for data import  
  - Base R functions for statistical analysis  
- **Methods Applied:**  
  - Descriptive Statistics (Mean, Median, Percentiles)  
  - Skewness & Kurtosis (Custom functions)  
  - Shapiro-Wilk Test for normality  
  - Kolmogorov-Smirnov Test  
  - Outlier Detection using IQR  
  - Independent Sample t-tests  
  - 95% Confidence Intervals  
  - Trimmed Means  
  - Boxplots for group-wise comparison  

---

## 📂 Dataset  
This project uses a **synthetic dataset** with 500 entries containing the following variables:
- `Gender`  
- `Education` (High School, Graduate, PhD)  
- `DrinkingHabit` (Non-Drinker, Social Drinker, Heavy Drinker)  
- `Income` (numeric)

---

## ✅ Key Analysis Tasks  

1. Loaded and cleaned the dataset  
2. Fixed measurement scales (ordered factor for education)  
3. Compared mean, median, and 50th percentile of income  
4. Checked for normality (Shapiro-Wilk, KS tests)  
5. Visualized income distribution  
6. Detected and removed outliers using IQR  
7. Re-tested normality on cleaned data  
8. Counted social drinkers by gender and education level  
9. Performed t-tests for social vs non-drinkers  
10. Compared trimmed means for male vs female heavy drinkers  
11. Created boxplots to visualize income by education  
12. Drew statistical conclusions from all analyses  

---

## 🔍 Key Insights (Selected)

- **PhD holders earn the most**, on average.  
- **Social drinkers** earn more than **non-drinkers**.  
- **Income is skewed** and non-normal, even after outlier removal.  
- **Males who are heavy drinkers** earn more than females in the same group.  
- **Education** shows the **strongest positive correlation** with income.

> Full list of 15 key insights is included in the PDF report (see `/report` folder if uploaded).

---

## 📈 Visual Outputs  
- Histograms & Density plots  
- Boxplots for education level  
- Confidence intervals via t-tests

---

## 📎 How to Run

1. Clone this repo  
2. Open `income_analysis.R` in RStudio  
3. Make sure `readxl` is installed  
4. Replace the dataset path if needed  
5. Run all code chunks in sequence

---

## 📄 License  
This project is for **educational purposes only**. You’re welcome to fork or reference with attribution.

---

## 🙋‍♂️ Author  
**Sanika Palaw**  
[LinkedIn Profile](www.linkedin.com/in/sanika-palaw-7583a3289) 

---

