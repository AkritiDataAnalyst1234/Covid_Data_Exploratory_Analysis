# COVID-19 Worldwide Data Analysis using SQL

**Findings or Insights**
On analysing the data we get to know new_cases column and new_deaths column lot of data is missing so we are using total_cases column and total_deaths column for analysing purpose.

**Column values**
- **new_cases -->**  **total cases** on that day
 .i.e. cases on the Date given in the corresponding column.

- **new_deaths -->**  **total deaths** on that day
 .i.e. death on the Date given in the corresponding column.

- **total_cases -->** **cumulative sum** of cases till that day 
.i.e. cumulative sum of cases till the Date given in the corresponding column.

- **total_deaths -->** **cumulative sum** of deaths till that day 
.i.e. cumulative sum of deaths till the Date given in the corresponding column.

- **Location -–>** In location column **country** name is given 
But in some records continent name is given in location column so we used filter (condition in where clause) to exclude continents from location column.
