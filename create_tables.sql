-- Create Covid Death Table
CREATE TABLE coviddeaths 
(
    iso_code	VARCHAR(512),
    continent	VARCHAR(512),
    location	VARCHAR(512),
    date	VARCHAR(512),
    population	BIGINT,
    total_cases	INT,
    new_cases	INT,
    new_cases_smoothed	DOUBLE PRECISION,
    total_deaths	INT,
    new_deaths	INT,
    new_deaths_smoothed	DOUBLE PRECISION,
    total_cases_per_million	DOUBLE PRECISION,
    new_cases_per_million	DOUBLE PRECISION,
    new_cases_smoothed_per_million	DOUBLE PRECISION,
    total_deaths_per_million	DOUBLE PRECISION,
    new_deaths_per_million	DOUBLE PRECISION,
    new_deaths_smoothed_per_million	DOUBLE PRECISION,
    reproduction_rate	DOUBLE PRECISION,
    icu_patients	VARCHAR(512),
    icu_patients_per_million	VARCHAR(512),
    hosp_patients	VARCHAR(512),
    hosp_patients_per_million	VARCHAR(512),
    weekly_icu_admissions	VARCHAR(512),
    weekly_icu_admissions_per_million	VARCHAR(512),
    weekly_hosp_admissions	VARCHAR(512),
    weekly_hosp_admissions_per_million	VARCHAR(512)
);

-- Create Covid Vaccinations Table
CREATE TABLE covidvaccinations
( 
	iso_code	VARCHAR(512),
    continent	VARCHAR(512),
    location	VARCHAR(512),
    date	VARCHAR(512),
	new_tests INT,
	total_tests INT,
	total_tests_per_thousand DOUBLE PRECISION,
	new_tests_per_thousand DOUBLE PRECISION,
	new_tests_smoothed INT,
	new_tests_smoothed_per_thousand DOUBLE PRECISION,
	positive_rate DOUBLE PRECISION,
	tests_per_case DOUBLE PRECISION,
	tests_units VARCHAR(512),
	total_vaccinations INT,
	people_vaccinated INT,
	people_fully_vaccinated INT,
	new_vaccinations INT,
	new_vaccinations_smoothed INT,
	total_vaccinations_per_hundred DOUBLE PRECISION,
	people_vaccinated_per_hundred DOUBLE PRECISION,
	people_fully_vaccinated_per_hundred DOUBLE PRECISION,
	new_vaccinations_smoothed_per_million INT,
	stringency_index DOUBLE PRECISION,
	population_density DOUBLE PRECISION,
	median_age DOUBLE PRECISION,
	aged_65_older DOUBLE PRECISION,
	aged_70_older DOUBLE PRECISION,
	gdp_per_capita DOUBLE PRECISION,
	extreme_poverty DOUBLE PRECISION,
	cardiovasc_death_rate DOUBLE PRECISION,
	diabetes_prevalence DOUBLE PRECISION,
	female_smokers DOUBLE PRECISION,
	male_smokers DOUBLE PRECISION,
	handwashing_facilities DOUBLE PRECISION,
	hospital_beds_per_thousand DOUBLE PRECISION,
	life_expectancy DOUBLE PRECISION,
	human_development_index DOUBLE PRECISION
);

-- Visualize tables
SELECT *FROM coviddeaths;
SELECT *FROM covidvaccinations;