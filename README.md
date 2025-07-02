# COVID-19 Global Impact Analysis

This project focuses on analyzing data related to the COVID-19 pandemic using SQL queries.Executed complex SQL queries to analyze trends in testing, vaccination,  infection rates and deaths across countries and continents.
Sql functions used to get insights-
-	CTE,
-	windows function,
-	subqueries,
-	Joins
-	Group by
-	limit

<br>

**Findings or Insights**

On analysing the data we get to know many new_tests and new_vaccinations entries are null, but total_tests and total_vaccinations entries are complete and can be used for analysing the trends.

**Dataset Structure**

- **new_cases ->**  new cases on that particular day
 .i.e. cases on the Date given in the corresponding column.

- **new_deaths ->** new death cases on that day
 .i.e. death on the Date given in the corresponding column.

- **total_cases ->** **cumulative sum of cases** till that day 
.i.e. cumulative sum of cases till the Date given in the corresponding column.

- **total_deaths ->** **cumulative sum of deaths** till that day 
.i.e. cumulative sum of deaths till the Date given in the corresponding column.

- **new_tests ->**  total tests  done on that day
 .i.e. tests done on the Date given in the corresponding column.

- **new_vaccinations ->** total vaccinations done on that day
 .i.e. vaccinations done on the Date given in the corresponding column.

- **total_tests ->** **cumulative sum of tests** done till that day 
.i.e. cumulative sum of tests till the Date given in the corresponding column.

- **total_vaccinations ->** **cumulative sum of vaccinations** done till that day 
.i.e. cumulative sum of vaccinations done till the Date given in the corresponding column.

- **Location –>** In location column country name is given 
But in some records continent name is given in location column so we used filter (condition in where clause) to exclude continents from location column.


<br>

**Top 10 countries having maximum Corona Cases**
1.	United States
2.	India
3.	Brazil
4.	France
5.	Turkey
6.	Russia
7.	United Kingdom
8.	Italy
9.	Spain
10.	Germany


<br>

**Top 10 countries having maximum deaths** 
1.	United States
2.	Brazil
3.	Mexico
4.	India
5.	United Kingdom
6.	Italy
7.	Russia
8.	France
9.	Germany
10.	Spain


<br>

**Continent wise Corona Cases**


Europe            ---->      44863478

Asia	             ---->       39526308

North America	    ---->       37529488

South America	    ---->       24878216

Africa	          ---->        4557699

Oceania	         ----->        43570




<br>

**Continent wise total Deaths**

Europe	        ---->      1016750

North America  ---->      847942

South America	  ---->     672415

Asia	           ---->     520286

Africa	         ---->     121784

Oceania	       ---->      1046



<br>

**Summary**
-	Country with highest Covid Cases in the World with counts 32346971-- US 
-	Country with highest  Death Cases in the World with counts 576232 -- US 
-	Continent with highest Covid Cases with counts 44863478-- Europe
-	Continent with lowest Covid Cases with counts 43570 -- Oceania 
-	Continent with highest Death Cases with counts 1016750-- Europe
-	Continent with lowest Death Cases with counts 1046 – Oceania
-	"Andorra" is the country with highest covid case percentage based on population
with percentage of 17.12%
-	Top 3 countries with highest vaccinations are China followed by US followed by India.

