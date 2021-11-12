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