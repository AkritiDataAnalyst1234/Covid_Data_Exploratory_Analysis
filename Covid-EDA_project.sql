      /*****************************
      *  Covid 19 Data Exploration *
      ******************************/

---looking all columns and data stored in them for both tables 

select * from covid_data;

select * from covid_testing_vaccination; 


-- Select Data that we are going to be using

select
	continent,
	location ,
	date,
	total_cases,
	new_cases ,
	total_deaths,
	new_deaths,
	population
from covid_data;
 
 
/*****************************************************************
*  total cases vs total deaths in all countries around the world *
******************************************************************/  


/*
since values in total_cases and total_deaths are cumulative
therefore we used max function
and continents are also given in location column 
so we applied filter to remove continents from location column
*/

/*****************************************************************
*  total cases vs total deaths in all countries around the world *
*  using total_cases and total_deaths column                     *
******************************************************************/ 


select 
	location,
	max(total_cases) total_cases,
	max(total_deaths) total_deaths
from covid_data
where continent is not null
group by location
order by location;



/*****************************************************************
*  total cases vs total deaths in all countries around the world *
*  using new_cases and new_deaths column                         *
******************************************************************/ 

select 
	location,
	sum(new_cases) total_cases,
	sum(new_deaths) total_deaths
from covid_data
where continent is not null
group by location
order by location;




/*****************************************************************
*  top 10 countries having maximum corona cases                  *
******************************************************************/ 


select 
	location,
	max(total_cases) total_cases
from covid_data
where continent is not null
and total_cases is not null
group by location
order by total_cases desc
limit 10 ;



/*********************************************
*    death percentage based on total cases   *
*********************************************/


---using total_cases column

select 
	location,
	max(total_cases) total_cases,
	max(total_deaths) total_deaths,
	(max(total_deaths)/max(total_cases))*100 death_percentage
from covid_data
where continent is not null
group by location
order by location;


---using new_cases column

select 
	location,
	sum(new_cases) total_cases,
	sum(new_deaths) total_deaths,
	(sum(new_deaths)/sum(new_cases))*100 death_percentage
from covid_data
where continent is not null
group by location
order by location;




/**************************************************
*    death percentage based on total population   *
**************************************************/

select 
	location,
	max(population) population,
	max(total_deaths) total_deaths,
	(max(total_deaths)/max(population))*100 death_percentage
from covid_data
where continent is not null
group by location
order by location;



/******************************************
*     covid cases analysis in India       *
******************************************/

SELECT 
	continent,
	location,
	date,
	total_cases,
	new_cases,
	total_deaths,
	new_deaths,
	population
from covid_data
where location='India'
order by date;




---everyday death percentage in India based on total population

SELECT 
	location,
	date,
	total_cases,
	total_deaths,
	population,
	(total_deaths/population)*100 death_percentage
from covid_data
where location='India'
order by date;



---Everyday covid case percentage

select
	location,
	date,
	population,
	total_cases,
	(total_cases /population)*100 covid_case_percentage
from covid_data
where continent is not null
order by location,date;



/********************************************************
*   overall covid case percentage in all countries      *
*   using CTE                                           *
********************************************************/



with percentage as
(select 
 	location,
 	date,
 	population,
 	total_cases,
 	(total_cases/population)*100 covid_case_percentage,
	row_number() over(partition by location order by date desc) rnk
from covid_data)

select 
	location,
	date,
	population,
	total_cases,
	covid_case_percentage
from percentage
where rnk=1
order by covid_case_percentage desc;




/******************************************************
*   overall covid case percentage in all countries    *
*   using group by function                           *
******************************************************/

select 
	location,
	population,
	max(total_cases) total_cases,
	max(total_deaths) total_deaths,
	(max(total_cases)/population)*100 covid_case_percentage
from covid_data
where continent is not null
group by 
	location,
	population
order by covid_case_percentage desc;




/******************************************************
*   country with highest Covid Cases in the World     *
******************************************************/


select continent,location,total_cases
from covid_data
where total_cases=
(select max(total_cases) highest_cases
from covid_data
where continent is not null);



/**************************************************************
*   country with highest Death Cases in the World             *
**************************************************************/

select continent,location,total_deaths
from covid_data
where total_deaths=
(select max(total_deaths) highest_death_count
from covid_data
where continent is not null);




/*****************************************************
*   top 20 countries with highest death counts       *
*   Using CTE and row_number()                       *
*****************************************************/

/* 
here in where clause we used total death not null as we were getting null values at top 
*/


with latest_data as(
select 
	continent,
	location,
	date,
	total_cases,
	total_deaths,
	row_number() over(partition by location order by date desc) rnk
from covid_data)

select 
	continent,
	location,
	date,
	total_cases,
	total_deaths
from latest_data
where rnk=1 
and total_deaths is not null 
and continent is not null
order by total_deaths desc
limit 20;




/**************************************************
*   top 20 countries with highest death counts    *
*   Using group by                                *
**************************************************/

select 
	location,
	max(total_deaths) total_deaths
from covid_data
where total_deaths is not null 
and continent is not null
group by location
order by total_deaths desc
Limit 20;



/**************************************
*   total cases in all continents     *
**************************************/


select distinct continent,location from covid_data
order by continent;


select continent,location,date,total_cases,total_deaths
from covid_data order by continent;

/*
since here total cases is actually cumulative value 
so we firstly find out max cases i.e total cases in every location of continent 
then we summed up that value to find out total cases in every continent
*/

with cte as
(select 
 	continent,
 	location,
 	max(total_cases) total_cases
from covid_data
where continent is not null
group by continent,location
order by continent)


select 
	continent,
	sum(total_cases) total_cases
from cte
group by continent
order by total_cases desc;



/************************************
*   total deaths in all continents  *
************************************/

with cte as
(select 
 	continent,
 	location,
 	max(total_deaths) total_deaths
from covid_data
where continent is not null
group by continent,location
order by continent)


select 
	continent,
	sum(total_deaths) total_deaths
from cte
group by continent
order by total_deaths desc;


select location,date,population,total_deaths,new_deaths,total_cases,new_cases
from covid_data
where continent='Asia'
order by location,date;



/****************************************
*   total cases in all countries        *
****************************************/

select location,sum(new_cases) total_cases
from covid_data
where continent is not null
group by location
order by total_cases desc;



/**************************************
*   total deaths in all countries     *
**************************************/

select location,sum(new_deaths) total_deaths
from covid_data
where continent is not null
group by location
order  by total_deaths desc;



/*********************************************
*   total cases and deaths in all countries  * 
*********************************************/

select location,sum(new_cases) total_cases,sum(new_deaths) total_deaths
from covid_data
where continent is not null
group by location
order  by location;


select 
	location,
	continent,
	date,
	total_tests,
	new_tests,
	total_vaccinations,
	new_vaccinations
from covid_testing_vaccination
order by location,date;



/**************************************
*   checking per day test data        *
**************************************/

select 
	location,
	max(total_tests) total_tests,
	sum(new_tests) total_tests_n
from covid_testing_vaccination
where continent is not null 
group by location;



/*****************************************
*  cases vs vaccination for world        *
*****************************************/


select d.continent,d.location,d.date,new_cases,d.total_cases,new_deaths,d.total_deaths,
v.new_tests,v.total_tests,v.new_vaccinations,v.total_vaccinations
from covid_data d
inner join covid_testing_vaccination v
on d.location=v.location
and d.date=v.date
where d.continent is not null
order by d.continent,d.location,d.date;


/*******************************************************************************
*  total cases,total deaths,total tests,total vaccinations in all countries    *
*******************************************************************************/


select 
	d.continent,
	d.location,
	max(d.total_cases) total_cases,
	max(d.total_deaths) total_deaths,
	max(v.total_tests) total_tests,
	max(v.total_vaccinations) total_vaccinations
from 
	covid_data d inner join covid_testing_vaccination v
on 
	d.location=v.location
and	d.date=v.date
where d.continent is not null
group by d.continent,d.location
order by d.continent,d.location;
	

/***********************************
*  cases vs vaccination in Asia    *
***********************************/

select 
	d.continent,
	d.location,
	d.date,
	d.new_cases,
	d.total_cases,
	d.new_deaths,
	d.total_deaths,
	v.new_tests,
	v.total_tests,
	v.new_vaccinations,
	v.total_vaccinations
from 
covid_data d inner join covid_testing_vaccination v
on 
	d.location=v.location
and d.date=v.date
where d.continent='Asia'
order by
	d.continent,
	d.location,
	d.date;

/*********************************************************
*  total population vs total vaccination across world    *
*********************************************************/

/*
since some data is missing in  new vaccination column
so i used total vaccination column to get the result
*/

select 
	d.continent,
	d.location,
	max(d.population) total_population,
	max(v.total_vaccinations) total_vaccinations
from 
covid_data d inner join covid_testing_vaccination v
on 
	d.location=v.location
and d.date=v.date
where d.continent is not null
group by 
	d.continent,	
	d.location;

/******************************************************
*  total population vs total vaccination across India *
******************************************************/


select 
	d.continent,
	d.location,	
	max(d.population) population,
	max(v.total_vaccinations) total_vaccinations
from 
covid_data d inner join covid_testing_vaccination v
on 
	d.location=v.location
and d.date=v.date
where d.location='India'
group by 
	d.continent,
	d.location;


/****************************************************************************
*   vaccination percentage based on total population across the world       *
****************************************************************************/

select 
	d.continent,
	d.location,
	max(d.population) total_population,
	max(v.total_vaccinations) total_vaccinations,
	(max(v.total_vaccinations)/max(d.population))*100 vaccination_percentage
from 
covid_data d
inner join 
covid_testing_vaccination v
on 
	d.location=v.location
and d.date=v.date
where d.continent is not null
group by d.continent,d.location
order by vaccination_percentage desc;


/****************************************************************************
*   vaccination percentage based on total population across the Asia        *
****************************************************************************/

select 
	d.continent,
	d.location,
	max(d.population) total_population,
	max(v.total_vaccinations) total_vaccinations,
	(max(v.total_vaccinations)/max(d.population))*100 vaccination_percentage
from covid_data d
inner join
covid_testing_vaccination v
on 
	d.location=v.location
and d.date=v.date
where d.continent='Asia'
group by d.continent,d.location
order by d.continent,d.location;
