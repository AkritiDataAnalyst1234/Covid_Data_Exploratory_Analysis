# COVID-19 Global Impact Analysis

This project provides a comprehensive analysis of global and regional COVID-19 trends using SQL and Python. The data was explored to uncover critical insights related to infection rates, death rates, testing, and vaccination coverage across countries and continents.

<br>

**📌 Objectives**
-	Understand the spread and impact of COVID-19 globally and regionally.
-	Identify the most affected countries in terms of cases and deaths.
-	Analyze tests and vaccination trends.


**🛠 Tools & Technologies Used**
<br>
**SQL (PostgreSQL):** Data querying and transformation

**Python (Pandas, Matplotlib, Seaborn):** Data visualization

**Jupyter Notebook:** Analysis execution and presentation

<br>
**📊 SQL-Based Analysis**
Key queries performed using -
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


<br><br>


**	🌍 Global Analysis:**
-	Total COVID Cases vs Total Deaths and Total Cases vs Total Population
 -	Across the World
 -  Across Asia
 -	In India
 -	Across Continents

-	Top 10 Countries with Maximum COVID Cases/Deaths/Tests/Vaccinations
-	Death Percentage based on:
 -	Total Cases
 -	Total Population
-	Countries with Highest:
 -	COVID Cases
 -	Death Cases
 -	Tests
 -	Vaccinations
-	Total COVID Cases vs Total Vaccinations and Total Vaccinations vs Total Population
 -	Across the World
 -	Across Asia
 -	In India
 -	Across Continents


📈 Python-Based Visualizations
Developed visualizations using Matplotlib, Seaborn, and Plotly:

Top 20 Countries (Worldwide):

Maximum Cases, Deaths, Tests, Vaccinations (Bar Charts & Pie Charts)

Continent-Level Comparisons:

Cases, Deaths, Tests, Vaccinations per Continent

Asia-Focused Analysis:

Top 20 Countries in Asia: Cases, Deaths, Tests, Vaccinations

Time-Series Line Charts:

Monthly Trends of Cases and Deaths in Asia and India

✅ Key Insights
Identified countries with the highest risk and fatality rates.

Correlated vaccination coverage with case trends.

Provided visual context to facilitate strategic decision-making.
