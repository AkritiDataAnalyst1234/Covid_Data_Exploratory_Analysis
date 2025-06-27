# COVID-19 Worldwide Data Analysis using SQL

**Column values**
new_cases ->  total cases on that day
 .i.e. cases on the Date given in the corresponding column.

new_deaths -> total deaths on that day
 .i.e. death on the Date given in the corresponding column.

total_cases -> cumulative sum of cases till that day 
.i.e. cumulative sum of cases till the Date given in the corresponding column.

total_deaths -> cumulative sum of deaths till that day 
.i.e. cumulative sum of deaths till the Date given in the corresponding column.

Location – In location column country name is given 
But in some records continent name is given in location column so we used filter (condition in where clause) to exclude continents from location column.
