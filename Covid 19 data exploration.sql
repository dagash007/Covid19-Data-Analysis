select * 
from PortfolioProject..CovidDeaths
order by 3,4

--select * 
--from PortfolioProject..CovidVaccinations
--order by 3,4

--selecting data to be used

select location,date,total_cases,new_cases,total_deaths,population 
from PortfolioProject..CovidDeaths
order by 1,2

-- comparing total covid cases vs total deaths
--as of june 2021, there's a 1.2% probability of dying if a person contracts covid in nigeria
select location,date,total_cases,total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
from PortfolioProject..CovidDeaths
where location like '%nigeria%'
order by 1,2

-- comparing total covid cases vs population
--as of june 2021, the percentage of covid cases in nigeria is .0806%
select location,date,population,total_cases, (total_cases/population)*100 as PercentagePopulationInfected
from PortfolioProject..CovidDeaths
where location like '%nigeria%'
order by 2

--Countries with highest infection rate
select location,population,MAX(total_cases) as HighestInfectionCount, 
MAX((total_cases/population))*100 as MaxPercentagePopulationInfected
from PortfolioProject..CovidDeaths
where continent is not null
Group by location, population
order by MaxPercentagePopulationInfected desc

--Countries with highest mortality rate per population
select location,max (cast(total_deaths as int)) as MaxMortalityRate
from PortfolioProject..CovidDeaths
where continent is not null
group by location
order by 2 desc

--Continents with highest mortality rate per population
select continent,max(cast(total_deaths as int)) as NoOfMortalityPerContitnent
from PortfolioProject..CovidDeaths
where continent is not null
group by continent
order by NoOfMortalityPerContitnent desc


--Daily death percentage across the world
select date,sum(total_cases) as TotalCases,sum(cast(total_deaths as int)) as TotalDeaths,
(sum(cast(total_deaths as int))/sum(total_cases))*100 as DailyWorldDeathPercentage
from PortfolioProject..CovidDeaths
where total_cases is not null
group by date
order by 1

--Total death percentage across the world
select sum(new_cases) as TotalCases,sum(cast(new_deaths as int)) as TotalDeaths,
(sum(cast(new_deaths as int))/sum(new_cases))*100 as WorldDeathPercentage
from PortfolioProject..CovidDeaths
where continent is not null
order by 1