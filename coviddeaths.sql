SELECT *FROM coviddeaths
WHERE continent is not null;

SELECT location, date, total_cases, new_cases, total_deaths, population 
FROM coviddeaths
ORDER BY 1,2;

-- Compare Total Cases and Total Deaths Number 
-- Find the percentage of death per location
SELECT location, date, total_cases, total_deaths, (total_deaths/CAST(total_cases AS float))*100 as death_percentage
FROM coviddeaths
WHERE location = 'Lebanon'
and continent is not null
ORDER BY 1,2;

-- Total Cases vs Population
-- Find the percentage of population infected with Covid
SELECT location, date, total_cases, population , (total_cases /CAST(population AS float))*100 as percent_population_infected
FROM coviddeaths
WHERE location = 'Lebanon'
ORDER BY 1,2;


-- Find Countries with highest infection rate
SELECT location, population, MAX(total_cases) as highest_infection_count, MAX(total_cases/CAST(population AS float)*100) as percent_population_infected
FROM coviddeaths
GROUP BY location, population 
ORDER BY percent_population_infected desc;

-- Find Countries with highest death count per population rate
SELECT location, MAX(total_deaths) as highest_death_count
FROM coviddeaths
WHERE continent is not null
GROUP BY location 
ORDER BY highest_death_count desc;

-- Total Death Count by Location
SELECT location, MAX(total_deaths) as total_death_count
FROM coviddeaths
WHERE continent is null
GROUP BY location 
ORDER BY total_death_count desc;

-- Break down things by continents 
-- Showing continents with the highest death count per population 
SELECT continent, MAX(total_deaths) as total_death_count
FROM coviddeaths
WHERE continent is not null
GROUP BY continent 
ORDER BY total_death_count desc;

-- GLOBAL NUMBERS
-- Global death rate
Select SUM(new_cases) as total_cases, SUM(new_deaths) as total_deaths, (SUM(new_deaths)/SUM(CAST(New_Cases AS float))*100) as death_percentage
From coviddeaths
where continent is not null 
order by 1,2;

-- Join both tables 
-- DROP VIEW PercentPopulationVaccinated CASCADE;
-- DROP TABLE PercentPopulationVaccinated CASCADE;

Select dea.continent, 
       dea.location, 
	   dea.date, dea.population, 
	   vac.new_vaccinations, 
	   SUM(vac.new_vaccinations) OVER (Partition by dea.Location Order by dea.location, dea.Date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
INTO PercentPopulationVaccinated
From coviddeaths AS dea
Join covidvaccinations AS vac
On dea.location = vac.location
--AND dea.date = vac.date
WHERE dea.continent is not null 
order by 2,3

Select *, (RollingPeopleVaccinated/Population)*100
From PercentPopulationVaccinated

-- Creating View to store data for later visualizations
Create View PercentPopulationVaccinated as
Select dea.continent, 
       dea.location, 
	   dea.date, dea.population, 
	   vac.new_vaccinations, 
	   SUM(vac.new_vaccinations) OVER (Partition by dea.Location Order by dea.location, dea.Date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
From coviddeaths AS dea
Join covidvaccinations AS vac
On dea.location = vac.location
--AND dea.date = vac.date
WHERE dea.continent is not null 
order by 2,3

SELECT * FROM PercentPopulationVaccinated;

COUNT