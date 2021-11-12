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
group by location,population
order by 2 desc
